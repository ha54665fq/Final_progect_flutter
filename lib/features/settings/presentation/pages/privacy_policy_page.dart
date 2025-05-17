import 'package:flutter/material.dart';
import 'package:testprogect/core/theme/app_theme.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text(
            'Privacy Policy',
            style: AppTheme.headline1,
          ),
          SizedBox(height: 16),
          Text(
            'Last updated: March 2024',
            style: AppTheme.bodyText2,
          ),
          SizedBox(height: 24),
          PolicySection(
            title: '1. Information We Collect',
            content: 'We collect information that you provide directly to us, including but not limited to your name, email address, phone number, and resume when you create an account or apply for jobs.',
          ),
          PolicySection(
            title: '2. How We Use Your Information',
            content: 'We use the information we collect to provide and improve our services, process your job applications, and communicate with you about opportunities that match your preferences.',
          ),
          PolicySection(
            title: '3. Information Sharing',
            content: 'We may share your information with potential employers when you apply for jobs through our platform. We do not sell your personal information to third parties.',
          ),
          PolicySection(
            title: '4. Data Security',
            content: 'We implement appropriate technical and organizational measures to protect your personal information against unauthorized access or disclosure.',
          ),
        ],
      ),
    );
  }
}

class PolicySection extends StatelessWidget {
  final String title;
  final String content;

  const PolicySection({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTheme.headline2,
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: AppTheme.bodyText1,
          ),
        ],
      ),
    );
  }
} 