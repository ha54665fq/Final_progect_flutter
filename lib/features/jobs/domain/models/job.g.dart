// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Job _$JobFromJson(Map<String, dynamic> json) => Job(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      workPlace: json['work_place'] as String,
      employmentType: json['employment_type'] as String,
      workFieldId: (json['work_field_id'] as num).toInt(),
      salary: json['salary'] as String?,
      salaryShow: (json['salary_show'] as num).toInt(),
      workExperience: (json['work_experience'] as num).toInt(),
      jobValidUnite: json['job_valid_unite'] as String,
      summary: json['summary'] as String,
      genderPreference: json['gender_perfrence'] as String?,
      requestVideo: (json['request_vedio'] as num).toInt(),
      question: json['question'] as String?,
      status: (json['status'] as num).toInt(),
      businessManId: (json['business_man_id'] as num).toInt(),
      educationLevelId: (json['education_level_id'] as num).toInt(),
      isFavorite: json['is_favorite'] as bool,
      isApplied: json['is_applied'] as bool,
      createTime: json['create_time'] as String,
      expireDate: (json['expire_date'] as num).toInt(),
      applicants: (json['applicants'] as num).toInt(),
    );

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'work_place': instance.workPlace,
      'employment_type': instance.employmentType,
      'work_field_id': instance.workFieldId,
      'salary': instance.salary,
      'salary_show': instance.salaryShow,
      'work_experience': instance.workExperience,
      'job_valid_unite': instance.jobValidUnite,
      'summary': instance.summary,
      'gender_perfrence': instance.genderPreference,
      'request_vedio': instance.requestVideo,
      'question': instance.question,
      'status': instance.status,
      'business_man_id': instance.businessManId,
      'education_level_id': instance.educationLevelId,
      'is_favorite': instance.isFavorite,
      'is_applied': instance.isApplied,
      'create_time': instance.createTime,
      'expire_date': instance.expireDate,
      'applicants': instance.applicants,
    };
