const String NOTETABLE = "note";

class NoteFiels {
  static final List<String> values = [
    id,
    isImportant,
    title,
    description,
    time
  ];

  static const String dbTableName = "note";
  static const String id = '_id';
  static const String isImportant = 'isimportant';
  static const String title = 'title';
  static const String description = 'description';
  static const String time = 'time';
}

class NoteModel {
  final int? id;
  final bool isImportant;
  final String title;
  final String description;
  final DateTime createdAt;

  NoteModel(
      {this.id,
      required this.isImportant,
      required this.title,
      required this.description,
      required this.createdAt});

  NoteModel copy({
    int? id,
    bool? isImportant,
    String? title,
    String? description,
    DateTime? createdTime,
  }) =>
      NoteModel(
          id: id ?? this.id,
          isImportant: isImportant ?? this.isImportant,
          title: title ?? this.title,
          description: description ?? this.description,
          createdAt: createdTime ?? createdAt);

  static NoteModel fromJson(Map<String, dynamic> json) {
    return NoteModel(
        id: json[NoteFiels.id] as int?,
        isImportant: json[NoteFiels.isImportant] == 1,
        title: json[NoteFiels.title] as String,
        description: json[NoteFiels.description] as String,
        createdAt: DateTime.parse(json[NoteFiels.time] as String));
  }

  Map<String, dynamic> toJson() {
    return {
      NoteFiels.id: id,
      NoteFiels.isImportant: isImportant ? 1 : 0,
      NoteFiels.title: title,
      NoteFiels.description: description,
      NoteFiels.time: createdAt.toIso8601String()
    };
  }
}
