import '../data/model/task_model.dart';
import '../data/repository/task_repository.dart';

class TaskController {
  final TaskRepository _repository = TaskRepository();

  /// Get all tasks as a stream
  Stream<List<TaskModel>> getTasks() {
    return _repository.getTasks();
  }

  /// Add a new task
  Future<void> addTask(String title) async {
    if (title.trim().isEmpty) {
      throw Exception('Task title cannot be empty.');
    }
    await _repository.addTask(title);
  }

  /// Update task's isDone status
  Future<void> updateTaskDone(String taskId, bool isDone) async {
    await _repository.updateTaskDone(taskId, isDone);
  }

  /// Update task's title
  Future<void> updateTask(String taskId, String title) async {
    if (title.trim().isEmpty) {
      throw Exception('Task title cannot be empty.');
    }
    await _repository.updateTask(taskId, title);
  }

  /// Delete a task
  Future<void> deleteTask(String taskId) async {
    await _repository.deleteTask(taskId);
  }
}
