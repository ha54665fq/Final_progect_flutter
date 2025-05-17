import 'package:flutter/material.dart';
import 'package:testprogect/core/localization/app_localizations.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.translate('profile')),
      ),
      body: const Center(
        child: CircleAvatar(
          radius: 50,
          child: Icon(Icons.person, size: 50),
        ),
      ),
    );
  }
} 