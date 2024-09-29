class TasksEvent {}

class ChangeTaskStatusEvent extends TasksEvent {
int taskID;
  ChangeTaskStatusEvent({required this.taskID});
}

class AddTaskEvent extends TasksEvent {
  String title;
  String description;

  AddTaskEvent({required this.title,required this.description});
}

class DeleteTaskEvent extends TasksEvent{
  int taskID;
  DeleteTaskEvent({required this.taskID});
}

class GetTasksEvent  extends TasksEvent {}
class OpenDataBaseEvent  extends TasksEvent {}


