class Notes{
  final int id;
  final String title;
  final String content;
  final String time;

  Notes({
      required this.id,
    required this.title,
    required this.content,
    required this.time,
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'time': time,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Notes{id: $id, title: $title, content: $content, time: $time}';
  }

}
