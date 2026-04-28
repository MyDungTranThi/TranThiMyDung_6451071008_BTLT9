import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/task_model.dart';

class TaskRepository {
  static const String collectionName = 'tasks';
  final CollectionReference<Map<String, dynamic>> _collection =
      FirebaseFirestore.instance.collection(collectionName);

  Stream<List<TaskModel>> getTasks() {
    return _collection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => TaskModel.fromDocument(doc))
          .toList();
    });
  }

  Future<void> addTask(String title) async {
    await _collection.add({
      'title': title.trim(),
      'isDone': false,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> updateTaskDone(String taskId, bool isDone) async {
    await _collection.doc(taskId).update({'isDone': isDone});
  }

  Future<void> updateTask(String taskId, String title) async {
    await _collection.doc(taskId).update({'title': title.trim()});
  }

  Future<void> deleteTask(String taskId) async {
    await _collection.doc(taskId).delete();
  }
}
