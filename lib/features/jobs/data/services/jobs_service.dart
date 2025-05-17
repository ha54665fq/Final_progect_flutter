import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:testprogect/core/config/api_config.dart';
import 'package:testprogect/features/jobs/domain/models/job.dart';

class JobsService {
  late final Dio _dio;

  JobsService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: '${ApiConfig.baseUrl}/${ApiConfig.defaultLang}/${ApiConfig.apiVersion}',
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${ApiConfig.defaultToken}',
        },
      ),
    );

    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
    ));
  }

  Future<List<Job>> getAllJobs({
    String? fromDate,
    String? toDate,
    int? countryOfGraduation,
    int? countryOfResidence,
    int? workFieldId,
    String? title,
    String? workPlace,
    String? genderPreference,
    int? educationLevelId,
    int? workExperience,
    int? businessManId,
  }) async {
    final response = await _dio.get(
      ApiConfig.allJobs,
      queryParameters: {
        if (fromDate != null) 'from_date': fromDate,
        if (toDate != null) 'to_date': toDate,
        if (countryOfGraduation != null) 'country_of_graduation': countryOfGraduation,
        if (countryOfResidence != null) 'country_of_residence': countryOfResidence,
        if (workFieldId != null) 'work_field_id': workFieldId,
        if (title != null) 'title': title,
        if (workPlace != null) 'work_place': workPlace,
        if (genderPreference != null) 'gender_perfrence': genderPreference,
        if (educationLevelId != null) 'education_level_id': educationLevelId,
        if (workExperience != null) 'work_experience': workExperience,
        if (businessManId != null) 'business_man_id': businessManId,
      },
    );

    final List<dynamic> jobsJson = response.data['data'] ?? [];
    return jobsJson.map((json) => Job.fromJson(json)).toList();
  }

  Future<Job> getJobDetails(int jobId) async {
    final response = await _dio.get('${ApiConfig.jobDetails}/$jobId');
    return Job.fromJson(response.data['data']);
  }

  Future<void> markJobAsFavorite(int jobId) async {
    await _dio.post(ApiConfig.markFavorite.replaceAll('{id}', jobId.toString()));
  }

  Future<List<Job>> getFavoriteJobs() async {
    final response = await _dio.get(ApiConfig.favoriteJobs);
    final List<dynamic> jobsJson = response.data['data'] ?? [];
    return jobsJson.map((json) => Job.fromJson(json)).toList();
  }

  Future<void> applyForJob(int jobId, String videoPath) async {
    final formData = FormData.fromMap({
      'video': await MultipartFile.fromFile(videoPath),
      'job_id': jobId.toString(),
    });

    await _dio.post(
      ApiConfig.applyJob,
      data: formData,
    );
  }
} 