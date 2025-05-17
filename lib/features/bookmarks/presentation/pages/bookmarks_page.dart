import 'package:flutter/material.dart';
import 'package:testprogect/core/localization/app_localizations.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.translate('bookmarks')),
      ),
      body: Center(
        child: Text(localizations.translate('no_bookmarks')),
      ),
    );
  }
} 