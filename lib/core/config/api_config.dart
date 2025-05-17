class ApiConfig {
  static const String baseUrl = 'https://fursaty.kicklance.com';
  static const String apiVersion = 'api';
  static const String defaultLang = 'ar';

  // Endpoints
  static const String allJobs = '/job-seeker/all-jobs';
  static const String jobDetails = '/job-seeker/job-details';
  static const String markFavorite = '/job-seeker/jobs/{id}/mark-favorite';
  static const String favoriteJobs = '/job-seeker/favorite-jobs';
  static const String applyJob = '/job-seeker/jobs/applied';
  static const String companies = '/all-companies';
  static const String faqs = '/faqs';
  static const String policies = '/policies';

  // Auth token
  static const String defaultToken = '146|NmNVeKL3hmU9GJGrSf3rzFYDlUAGSM3FOIrJc3pr';
} 