import 'package:flutter/material.dart';
import 'package:testprogect/core/localization/app_localizations.dart';
import 'package:testprogect/features/settings/presentation/pages/country_preference_page.dart';
import 'package:testprogect/features/settings/presentation/pages/faqs_page.dart';
import 'package:testprogect/features/settings/presentation/pages/feedback_page.dart';
import 'package:testprogect/features/settings/presentation/pages/language_page.dart';
import 'package:testprogect/features/settings/presentation/pages/notifications_page.dart';
import 'package:testprogect/features/settings/presentation/pages/privacy_policy_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.translate('settings')),
      ),
      body: ListView(
        children: [
          _SettingsTile(
            icon: Icons.language,
            title: localizations.translate('language'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const LanguagePage()),
            ),
          ),
          _SettingsTile(
            icon: Icons.location_on,
            title: localizations.translate('country_preference'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CountryPreferencePage()),
            ),
          ),
          _SettingsTile(
            icon: Icons.question_answer,
            title: localizations.translate('faqs'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const FaqsPage()),
            ),
          ),
          _SettingsTile(
            icon: Icons.help,
            title: localizations.translate('help_feedback'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const FeedbackPage()),
            ),
          ),
          _SettingsTile(
            icon: Icons.privacy_tip,
            title: localizations.translate('privacy_policy'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PrivacyPolicyPage()),
            ),
          ),
          _SettingsTile(
            icon: Icons.notifications,
            title: localizations.translate('notifications'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const NotificationsPage()),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
 