import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final String id;
  final String title;
  final bool isDone;
  final Timestamp? createdAt;

  TaskModel({
    required this.id,
    required this.title,
    required this.isDone,
    required this.createdAt,
  });

  factory TaskModel.fromMap(Map<String, dynamic> map, String id) {
    return TaskModel(
      id: id,
      title: map['title'] as String? ?? '',
      isDone: map['isDone'] as bool? ?? false,
      createdAt: map['createdAt'] as Timestamp?,
    );
  }

  factory TaskModel.fromDocument(DocumentSnapshot doc) {
    return TaskModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isDone': isDone,
      'createdAt': createdAt,
    };
  }

  String get formattedDate {
    if (createdAt == null) return 'No date';
    final date = createdAt!.toDate();
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year;
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return '$day/$month/$year $hour:$minute';
  }
}
