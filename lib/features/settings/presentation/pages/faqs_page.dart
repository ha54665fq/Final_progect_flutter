import 'package:flutter/material.dart';
import 'package:testprogect/core/theme/app_theme.dart';

class FaqsPage extends StatelessWidget {
  const FaqsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQs'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          FaqItem(
            question: 'How do I apply for a job?',
            answer: 'To apply for a job, click on the job listing you\'re interested in and press the "Apply" button at the bottom of the job details page.',
          ),
          FaqItem(
            question: 'How can I save jobs for later?',
            answer: 'You can bookmark any job by clicking the bookmark icon on the job card or job details page. Access your saved jobs in the Bookmarks tab.',
          ),
          FaqItem(
            question: 'Can I change my location preferences?',
            answer: 'Yes, you can change your location preferences in the Settings page under "Country Preferences".',
          ),
        ],
      ),
    );
  }
}

class FaqItem extends StatelessWidget {
  final String question;
  final String answer;

  const FaqItem({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ExpansionTile(
        title: Text(
          question,
          style: AppTheme.bodyText1.copyWith(fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(answer, style: AppTheme.bodyText1),
          ),
        ],
      ),
    );
  }
} 