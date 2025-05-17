import 'package:json_annotation/json_annotation.dart';

part 'job.g.dart';

@JsonSerializable()
class Job {
  final int id;
  final String title;
  @JsonKey(name: 'work_place')
  final String workPlace;
  @JsonKey(name: 'employment_type')
  final String employmentType;
  @JsonKey(name: 'work_field_id')
  final int workFieldId;
  final String? salary;
  @JsonKey(name: 'salary_show')
  final int salaryShow;
  @JsonKey(name: 'work_experience')
  final int workExperience;
  @JsonKey(name: 'job_valid_unite')
  final String jobValidUnite;
  final String summary;
  @JsonKey(name: 'gender_perfrence')
  final String? genderPreference;
  @JsonKey(name: 'request_vedio')
  final int requestVideo;
  final String? question;
  final int status;
  @JsonKey(name: 'business_man_id')
  final int businessManId;
  @JsonKey(name: 'education_level_id')
  final int educationLevelId;
  @JsonKey(name: 'is_favorite')
  final bool isFavorite;
  @JsonKey(name: 'is_applied')
  final bool isApplied;
  @JsonKey(name: 'create_time')
  final String createTime;
  @JsonKey(name: 'expire_date')
  final int expireDate;
  final int applicants;

  Job({
    required this.id,
    required this.title,
    required this.workPlace,
    required this.employmentType,
    required this.workFieldId,
    this.salary,
    required this.salaryShow,
    required this.workExperience,
    required this.jobValidUnite,
    required this.summary,
    this.genderPreference,
    required this.requestVideo,
    this.question,
    required this.status,
    required this.businessManId,
    required this.educationLevelId,
    required this.isFavorite,
    required this.isApplied,
    required this.createTime,
    required this.expireDate,
    required this.applicants,
  });

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
  Map<String, dynamic> toJson() => _$JobToJson(this);
} 