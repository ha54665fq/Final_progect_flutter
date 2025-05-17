import 'package:flutter/foundation.dart';
import 'package:testprogect/features/jobs/data/services/jobs_service.dart';
import 'package:testprogect/features/jobs/domain/models/job.dart';

class JobsProvider with ChangeNotifier {
  final JobsService _jobsService;
  List<Job> _jobs = [];
  List<Job> _favoriteJobs = [];
  Job? _selectedJob;
  bool _isLoading = false;
  String? _error;

  JobsProvider(this._jobsService);

  List<Job> get jobs => _jobs;
  List<Job> get favoriteJobs => _favoriteJobs;
  Job? get selectedJob => _selectedJob;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchJobs({
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
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final response = await _jobsService.getAllJobs(
        fromDate: fromDate,
        toDate: toDate,
        workFieldId: workFieldId,
        title: title,
        workPlace: workPlace,
        genderPreference: genderPreference,
        educationLevelId: educationLevelId,
        workExperience: workExperience,
        businessManId: businessManId,
      );

      _jobs = response;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchJobDetails(int jobId) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _selectedJob = await _jobsService.getJobDetails(jobId);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> toggleFavorite(int jobId) async {
    try {
      _error = null;
      await _jobsService.markJobAsFavorite(jobId);
      
      // Update the job in the lists
      _jobs = _jobs.map((job) {
        if (job.id == jobId) {
          return Job(
            id: job.id,
            title: job.title,
            workPlace: job.workPlace,
            employmentType: job.employmentType,
            workFieldId: job.workFieldId,
            salary: job.salary,
            salaryShow: job.salaryShow,
            workExperience: job.workExperience,
            jobValidUnite: job.jobValidUnite,
            summary: job.summary,
            genderPreference: job.genderPreference,
            requestVideo: job.requestVideo,
            question: job.question,
            status: job.status,
            businessManId: job.businessManId,
            educationLevelId: job.educationLevelId,
            isFavorite: !job.isFavorite,
            isApplied: job.isApplied,
            createTime: job.createTime,
            expireDate: job.expireDate,
            applicants: job.applicants,
          );
        }
        return job;
      }).toList();

      await fetchFavoriteJobs();
    } catch (e) {
      _error = e.toString();
    } finally {
      notifyListeners();
    }
  }

  Future<void> fetchFavoriteJobs() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _favoriteJobs = await _jobsService.getFavoriteJobs();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> applyForJob(int jobId, String videoPath) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      await _jobsService.applyForJob(jobId, videoPath);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
} 