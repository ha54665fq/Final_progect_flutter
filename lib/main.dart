import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testprogect/core/localization/app_localizations.dart';
import 'package:testprogect/core/providers/locale_provider.dart';
import 'package:testprogect/features/jobs/data/services/jobs_service.dart';
import 'package:testprogect/features/jobs/presentation/providers/jobs_provider.dart';
import 'package:testprogect/features/main/presentation/pages/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  
  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleProvider(prefs)),
        Provider(create: (_) => JobsService()),
        ChangeNotifierProxyProvider<JobsService, JobsProvider>(
          create: (context) => JobsProvider(context.read<JobsService>()),
          update: (context, jobsService, previous) => 
            previous ?? JobsProvider(jobsService),
        ),
      ],
      child: Consumer<LocaleProvider>(
        builder: (context, localeProvider, child) {
          return MaterialApp(
            title: 'Job App',
            locale: localeProvider.locale,
            supportedLocales: const [
              Locale('ar'),
              Locale('en'),
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const MainPage(),
          );
        },
      ),
    );
  }
}

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Language Settings'),
      ),
      body: Consumer<LocaleProvider>(
        builder: (context, localeProvider, child) {
          return ListView(
            children: [
              ListTile(
                title: const Text('English'),
                trailing: localeProvider.locale.languageCode == 'en'
                    ? const Icon(Icons.check)
                    : null,
                onTap: () {
                  localeProvider.setLocale(const Locale('en'));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('العربية'),
                trailing: localeProvider.locale.languageCode == 'ar'
                    ? const Icon(Icons.check)
                    : null,
                onTap: () {
                  localeProvider.setLocale(const Locale('ar'));
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
