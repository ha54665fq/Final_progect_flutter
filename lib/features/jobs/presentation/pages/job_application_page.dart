import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testprogect/core/localization/app_localizations.dart';
import 'package:testprogect/features/jobs/domain/models/job.dart';
import 'package:testprogect/features/jobs/presentation/providers/jobs_provider.dart';

class JobApplicationPage extends StatefulWidget {
  final Job job;

  const JobApplicationPage({
    super.key,
    required this.job,
  });

  @override
  State<JobApplicationPage> createState() => _JobApplicationPageState();
}

class _JobApplicationPageState extends State<JobApplicationPage> {
  XFile? _selectedVideo;
  bool _isSubmitting = false;

  Future<void> _pickVideo() async {
    final typeGroup = XTypeGroup(
      label: 'Videos',
      extensions: ['mp4', 'mov', 'avi'],
      mimeTypes: ['video/mp4', 'video/quicktime', 'video/x-msvideo'],
    );

    try {
      final file = await openFile(
        acceptedTypeGroups: [typeGroup],
      );

      if (file != null) {
        setState(() {
          _selectedVideo = file;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error picking video: $e')),
        );
      }
    }
  }

  Future<void> _submitApplication() async {
    if (_selectedVideo == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a video first')),
      );
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      await context.read<JobsProvider>().applyForJob(
        widget.job.id,
        _selectedVideo!.path,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Application submitted successfully')),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error submitting application: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Apply for ${widget.job.title}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Job Application Requirements',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            if (widget.job.question != null) ...[
              Text(
                'Question:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(widget.job.question!),
              const SizedBox(height: 24),
            ],
            Text(
              'Video Introduction',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            const Text(
              'Please record a short video introducing yourself and explaining why you are interested in this position.',
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: _isSubmitting ? null : _pickVideo,
              icon: const Icon(Icons.video_library),
              label: Text(_selectedVideo?.name ?? 'Select Video'),
            ),
            if (_selectedVideo != null) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.green),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _selectedVideo!.name,
                      style: const TextStyle(color: Colors.green),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: _isSubmitting
                        ? null
                        : () {
                            setState(() {
                              _selectedVideo = null;
                            });
                          },
                  ),
                ],
              ),
            ],
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isSubmitting ? null : _submitApplication,
                child: _isSubmitting
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Submit Application'),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 