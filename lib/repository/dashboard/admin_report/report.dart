class Report {
  final int id;
  final int userId;
  final String title;
  final String description;
  final int isChecked;

  Report({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.isChecked,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      description: json['text_description'],
      isChecked: json['is_checked'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'text_description': description,
      'is_checked': isChecked,
    };
  }
}
