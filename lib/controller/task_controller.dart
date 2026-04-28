import '../data/model/task_model.dart';
import '../data/repository/task_repository.dart';

class TaskController {
  final TaskRepository _repository = TaskRepository();

  Stream<List<TaskModel>> getTasks() {
    return _repository.getTasks();
  }

  Future<void> addTask(String title) async {
    if (title.trim().isEmpty) {
      throw Exception('Task title cannot be empty.');
    }
    await _repository.addTask(title);
  }

  Future<void> updateTaskDone(String taskId, bool isDone) async {
    await _repository.updateTaskDone(taskId, isDone);
  }

  Future<void> updateTask(String taskId, String title) async {
    if (title.trim().isEmpty) {
      throw Exception('Task title cannot be empty.');
    }
    await _repository.updateTask(taskId, title);
  }

  Future<void> deleteTask(String taskId) async {
    await _repository.deleteTask(taskId);
  }
}
