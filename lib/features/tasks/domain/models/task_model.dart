class Task {
  final int id;
  final String title;
  final String description;
  final int status;

  Task({
    required this.id,
    required this.title,
    required this.description,
    this.status = 0, // Default to 'not completed'
  });

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      status: map['status'] ?? 0, // Default to 0 if not provided
    );
  }
}
