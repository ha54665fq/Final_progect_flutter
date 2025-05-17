import 'package:flutter/material.dart';
import 'package:testprogect/core/localization/app_localizations.dart';
import 'package:testprogect/core/theme/app_theme.dart';
import 'package:testprogect/features/jobs/data/models/job_model.dart';
import 'package:testprogect/features/jobs/presentation/widgets/job_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    // TODO: Replace with actual data from API
    final jobs = [
      JobModel(
        id: 1,
        title: 'Web and Mobile Development',
        company: 'PURE for IT Solutions',
        location: 'Kuwait',
        description: 'Lorem ipsum dolor sit amet...',
        salary: '2.5k - 5k KWD / Month',
        postedAt: DateTime.now(),
      ),
      // Add more sample jobs
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.translate('home')),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // TODO: Implement filters
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: AppTheme.primary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style: AppTheme.headline2.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  'Mr/Mam Visitor',
                  style: AppTheme.bodyText1.copyWith(color: Colors.white70),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                final job = jobs[index];
                return JobCard(
                  job: job,
                  onTap: () {
               
                  },
                  onBookmarkTap: () {
                  
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
} 