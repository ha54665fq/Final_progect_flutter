import 'dart:io';
import 'package:dio/dio.dart';
import 'package:testprogect/core/constants/api_constants.dart';
import 'package:testprogect/core/error/api_error.dart';
import 'package:testprogect/features/jobs/data/models/job_model.dart';

class JobApiService {
  final Dio _dio;

  JobApiService() : _dio = Dio() {
    _dio.options.baseUrl = ApiConstants.baseUrl;
    _dio.options.headers = ApiConstants.headers;
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      error: true,
    ));
  }

  // Get all jobs with optional filters
  Future<List<JobModel>> getAllJobs({
    String? query,
    String? location,
    String? company,
  }) async {
    try {
      final response = await _dio.get(
        ApiConstants.jobs,
        queryParameters: {
          if (query != null) 'q': query,
          if (location != null) 'location': location,
          if (company != null) 'company': company,
        },
      );

      final List<dynamic> jobsJson = response.data['data'];
      return jobsJson.map((json) => JobModel.fromJson(json)).toList();
    } catch (e) {
      throw ApiError.fromDioError(e);
    }
  }

  // Get job details by ID
  Future<JobModel> getJobDetails(int id) async {
    try {
      final response = await _dio.get('${ApiConstants.jobs}/$id');
      return JobModel.fromJson(response.data['data']);
    } catch (e) {
      throw ApiError.fromDioError(e);
    }
  }

  // Mark/unmark job as favorite
  Future<bool> markAsFavorite(int id) async {
    try {
      final response = await _dio.post('${ApiConstants.favorites}/$id');
      return response.data['success'] ?? false;
    } catch (e) {
      throw ApiError.fromDioError(e);
    }
  }

  // Get favorite jobs
  Future<List<JobModel>> getFavoriteJobs() async {
    try {
      final response = await _dio.get(ApiConstants.favorites);
      final List<dynamic> jobsJson = response.data['data'];
      return jobsJson.map((json) => JobModel.fromJson(json)).toList();
    } catch (e) {
      throw ApiError.fromDioError(e);
    }
  }

  // Apply to job with video
  Future<bool> applyToJob(int id, File videoFile) async {
    try {
      final formData = FormData.fromMap({
        'video': await MultipartFile.fromFile(
          videoFile.path,
          filename: 'application_video.mp4',
        ),
      });

      final response = await _dio.post(
        '${ApiConstants.jobs}/$id/apply',
        data: formData,
      );

      return response.data['success'] ?? false;
    } catch (e) {
      throw ApiError.fromDioError(e);
    }
  }

  // Get companies
  Future<List<Map<String, dynamic>>> getCompanies() async {
    try {
      final response = await _dio.get(ApiConstants.companies);
      return List<Map<String, dynamic>>.from(response.data['data']);
    } catch (e) {
      throw ApiError.fromDioError(e);
    }
  }

  // Get FAQs
  Future<List<Map<String, dynamic>>> getFaqs() async {
    try {
      final response = await _dio.get(ApiConstants.faqs);
      return List<Map<String, dynamic>>.from(response.data['data']);
    } catch (e) {
      throw ApiError.fromDioError(e);
    }
  }

  // Get privacy policies
  Future<List<Map<String, dynamic>>> getPolicies() async {
    try {
      final response = await _dio.get(ApiConstants.policies);
      return List<Map<String, dynamic>>.from(response.data['data']);
    } catch (e) {
      throw ApiError.fromDioError(e);
    }
  }
} 