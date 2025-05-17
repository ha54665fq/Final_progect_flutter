import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testprogect/core/localization/app_localizations.dart';
import 'package:testprogect/features/jobs/domain/models/job.dart';
import 'package:testprogect/features/jobs/presentation/providers/jobs_provider.dart';
import 'package:testprogect/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Fetch jobs when the page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<JobsProvider>().fetchJobs();
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(localizations.translate('app_name')),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search
            },
          ),
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LanguagePage()),
              );
            },
          ),
        ],
      ),
      body: Consumer<JobsProvider>(
        builder: (context, jobsProvider, child) {
          if (jobsProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (jobsProvider.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(jobsProvider.error!),
                  ElevatedButton(
                    onPressed: () => jobsProvider.fetchJobs(),
                    child: Text(localizations.translate('retry')),
                  ),
                ],
              ),
            );
          }

          if (jobsProvider.jobs.isEmpty) {
            return Center(
              child: Text(localizations.translate('no_jobs_found')),
            );
          }

          return RefreshIndicator(
            onRefresh: () => jobsProvider.fetchJobs(),
            child: ListView.builder(
              itemCount: jobsProvider.jobs.length,
              itemBuilder: (context, index) {
                final job = jobsProvider.jobs[index];
                return JobCard(job: job);
              },
            ),
          );
        },
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final Job job;

  const JobCard({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              job.title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 16),
                    const SizedBox(width: 4),
                    Text(job.workPlace),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.work_outline, size: 16),
                    const SizedBox(width: 4),
                    Text(job.employmentType),
                  ],
                ),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    job.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: job.isFavorite ? Colors.red : null,
                  ),
                  onPressed: () {
                    context.read<JobsProvider>().toggleFavorite(job.id);
                  },
                ),
                if (job.isApplied)
                  const Icon(Icons.check_circle, color: Colors.green, size: 16),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  job.summary,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    if (job.salary != null) ...[
                      Icon(Icons.attach_money, size: 16, color: theme.colorScheme.primary),
                      const SizedBox(width: 4),
                      Text(
                        job.salary!,
                        style: TextStyle(color: theme.colorScheme.primary),
                      ),
                      const SizedBox(width: 16),
                    ],
                    Icon(Icons.access_time, size: 16, color: theme.colorScheme.secondary),
                    const SizedBox(width: 4),
                    Text(
                      job.createTime,
                      style: TextStyle(color: theme.colorScheme.secondary),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 