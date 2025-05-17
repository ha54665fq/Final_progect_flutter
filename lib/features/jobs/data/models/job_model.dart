class JobModel {
  final int id;
  final String title;
  final String company;
  final String location;
  final String description;
  final String salary;
  final bool isFavorite;
  final DateTime postedAt;

  JobModel({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.description,
    required this.salary,
    this.isFavorite = false,
    required this.postedAt,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['id'],
      title: json['title'],
      company: json['company'],
      location: json['location'],
      description: json['description'],
      salary: json['salary'],
      isFavorite: json['is_favorite'] ?? false,
      postedAt: DateTime.parse(json['posted_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'company': company,
      'location': location,
      'description': description,
      'salary': salary,
      'is_favorite': isFavorite,
      'posted_at': postedAt.toIso8601String(),
    };
  }
} 