import 'package:flutter/material.dart';
import 'package:testprogect/core/theme/app_theme.dart';

class CountryPreferencePage extends StatefulWidget {
  const CountryPreferencePage({super.key});

  @override
  State<CountryPreferencePage> createState() => _CountryPreferencePageState();
}

class _CountryPreferencePageState extends State<CountryPreferencePage> {
  String selectedCountry = 'Kuwait';

  final List<String> countries = [
    'Kuwait',
    'UAE',
    'Saudi Arabia',
    'Qatar',
    'Bahrain',
    'Oman',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country Preference'),
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          final country = countries[index];
          return RadioListTile<String>(
            title: Text(country, style: AppTheme.bodyText1),
            value: country,
            groupValue: selectedCountry,
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  selectedCountry = value;
                });
              }
            },
            activeColor: AppTheme.primary,
          );
        },
      ),
    );
  }
} 