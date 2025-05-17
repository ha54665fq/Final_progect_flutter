import 'package:flutter/material.dart';
import 'package:testprogect/core/theme/app_theme.dart';
import 'package:testprogect/features/jobs/data/models/job_model.dart';

class JobCard extends StatelessWidget {
  final JobModel job;
  final VoidCallback onTap;
  final VoidCallback onBookmarkTap;

  const JobCard({
    super.key,
    required this.job,
    required this.onTap,
    required this.onBookmarkTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.access_time, size: 16, color: AppTheme.textSecondary),
                  const SizedBox(width: 4),
                  Text('30 min', style: AppTheme.bodyText2),
                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      job.isFavorite ? Icons.bookmark : Icons.bookmark_outline,
                      color: job.isFavorite ? AppTheme.primary : AppTheme.textSecondary,
                    ),
                    onPressed: onBookmarkTap,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(job.title, style: AppTheme.headline2),
              const SizedBox(height: 4),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 12,
                    backgroundColor: AppTheme.cardBackground,
                    child: Icon(Icons.business, size: 16, color: AppTheme.textSecondary),
                  ),
                  const SizedBox(width: 8),
                  Text(job.company, style: AppTheme.bodyText2),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Engineering',
                      style: AppTheme.bodyText2.copyWith(color: AppTheme.primary),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      job.location,
                      style: AppTheme.bodyText2.copyWith(color: AppTheme.primary),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 16, color: AppTheme.textSecondary),
                  const SizedBox(width: 4),
                  Text('3 days ago', style: AppTheme.bodyText2),
                  const SizedBox(width: 16),
                  const Icon(Icons.attach_money, size: 16, color: AppTheme.textSecondary),
                  const SizedBox(width: 4),
                  Text(job.salary, style: AppTheme.bodyText2),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
} 