import 'package:flutter/material.dart';
import 'package:testprogect/core/theme/app_theme.dart';
import 'package:testprogect/features/jobs/data/models/job_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:testprogect/features/jobs/presentation/pages/job_application_page.dart';

class JobDetailsPage extends StatelessWidget {
  final JobModel job;

  const JobDetailsPage({
    super.key,
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back'),
        actions: [
          IconButton(
            icon: Icon(
              job.isFavorite ? Icons.bookmark : Icons.bookmark_outline,
              color: Colors.white,
            ),
            onPressed: () {
              // TODO: Toggle bookmark
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              _showShareOptions(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildDetails(),
            _buildSkills(),
            _buildDescription(),
            _buildRequirements(),
            const SizedBox(height: 100), // Space for the bottom button
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => JobApplicationPage(job: job),
              ),
            );
          },
          child: const Text('Apply'),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundColor: AppTheme.cardBackground,
                child: Icon(Icons.business, color: AppTheme.textSecondary),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(job.company, style: AppTheme.headline2),
                    const SizedBox(height: 4),
                    Text(job.location, style: AppTheme.bodyText2),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetails() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Details', style: AppTheme.headline2),
          const SizedBox(height: 16),
          _buildDetailRow('Job Type', '${job.location} - 2025'),
          _buildDetailRow('Work Field', 'Information Technology'),
          _buildDetailRow('Country of Employment', job.location),
          _buildDetailRow('Salary / Wage', job.salary),
          _buildDetailRow('Required Experience', '2 - 5 Years'),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(label, style: AppTheme.bodyText2),
          ),
          Expanded(
            flex: 3,
            child: Text(value, style: AppTheme.bodyText1),
          ),
        ],
      ),
    );
  }

  Widget _buildSkills() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Skills', style: AppTheme.headline2),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildSkillChip('Java'),
              _buildSkillChip('JavaScript'),
              _buildSkillChip('Bootstrap'),
              _buildSkillChip('PHP Development'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        skill,
        style: AppTheme.bodyText2.copyWith(color: AppTheme.primary),
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Job Description', style: AppTheme.headline2),
          const SizedBox(height: 16),
          Text(job.description, style: AppTheme.bodyText1),
        ],
      ),
    );
  }

  Widget _buildRequirements() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Candidate Requirements', style: AppTheme.headline2),
          const SizedBox(height: 16),
          _buildRequirementRow('Nationality', 'Kuwait, Palestine, Egypt'),
          _buildRequirementRow('Gender', 'All'),
        ],
      ),
    );
  }

  Widget _buildRequirementRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(label, style: AppTheme.bodyText2),
          ),
          Expanded(
            child: Text(value, style: AppTheme.bodyText1),
          ),
        ],
      ),
    );
  }

  void _showShareOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Share via', style: AppTheme.headline2),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildShareOption(
                    context,
                    'Gmail',
                    Icons.mail,
                    Colors.red,
                    () => _launchUrl('mailto:?subject=${job.title}'),
                  ),
                  _buildShareOption(
                    context,
                    'Facebook',
                    Icons.facebook,
                    Colors.blue,
                    () => _launchUrl('https://facebook.com'),
                  ),
                  _buildShareOption(
                    context,
                    'WhatsApp',
                    Icons.whatsapp,
                    Colors.green,
                    () => _launchUrl('https://wa.me/?text=${job.title}'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildShareOption(
    BuildContext context,
    String label,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: color,
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(label, style: AppTheme.bodyText2),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
} 