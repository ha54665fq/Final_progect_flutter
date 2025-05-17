import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testprogect/core/providers/locale_provider.dart';
import 'package:testprogect/core/theme/app_theme.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language'),
      ),
      body: Consumer<LocaleProvider>(
        builder: (context, localeProvider, child) {
          return ListView(
            children: [
              RadioListTile<String>(
                title: const Text('English'),
                value: 'en',
                groupValue: localeProvider.locale.languageCode,
                onChanged: (value) {
                  if (value != null) {
                    localeProvider.setLocale(Locale(value));
                  }
                },
                activeColor: AppTheme.primary,
              ),
              RadioListTile<String>(
                title: const Text('العربية'),
                value: 'ar',
                groupValue: localeProvider.locale.languageCode,
                onChanged: (value) {
                  if (value != null) {
                    localeProvider.setLocale(Locale(value));
                  }
                },
                activeColor: AppTheme.primary,
              ),
            ],
          );
        },
      ),
    );
  }
} 