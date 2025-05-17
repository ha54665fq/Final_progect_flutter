import 'package:flutter/material.dart';
import 'package:testprogect/core/theme/app_theme.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool newJobsNotifications = true;
  bool applicationUpdates = true;
  bool recommendedJobs = true;
  bool marketingEmails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView(
        children: [
          _buildNotificationSection(
            'Job Notifications',
            [
              _buildSwitchTile(
                'New Jobs',
                'Get notified when new jobs matching your preferences are posted',
                newJobsNotifications,
                (value) => setState(() => newJobsNotifications = value),
              ),
              _buildSwitchTile(
                'Application Updates',
                'Receive updates about your job applications',
                applicationUpdates,
                (value) => setState(() => applicationUpdates = value),
              ),
              _buildSwitchTile(
                'Recommended Jobs',
                'Get personalized job recommendations',
                recommendedJobs,
                (value) => setState(() => recommendedJobs = value),
              ),
            ],
          ),
          _buildNotificationSection(
            'Email Preferences',
            [
              _buildSwitchTile(
                'Marketing Emails',
                'Receive news and special offers',
                marketingEmails,
                (value) => setState(() => marketingEmails = value),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: AppTheme.headline2,
          ),
        ),
        ...children,
      ],
    );
  }

  Widget _buildSwitchTile(
    String title,
    String subtitle,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return SwitchListTile(
      title: Text(title, style: AppTheme.bodyText1),
      subtitle: Text(subtitle, style: AppTheme.bodyText2),
      value: value,
      onChanged: onChanged,
      activeColor: AppTheme.primary,
    );
  }
} 