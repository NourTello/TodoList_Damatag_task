import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:todo_list_damatag_task/features/tasks/data/tasks_data.dart';
import 'package:todo_list_damatag_task/features/tasks/domain/bloc/tasks_events.dart';
import 'package:todo_list_damatag_task/features/tasks/domain/bloc/tasks_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/app_string/string_const.dart';
import '../models/task_model.dart';

class TasksBloc extends Bloc<TasksEvent, TasksStates> {
  TasksData tasksData;

  static TasksBloc get(context) => BlocProvider.of(context);

  TasksBloc({required this.tasksData}) : super(TasksInitialState()) {
    on<AddTaskEvent>(_addTask);
    on<GetTasksEvent>(_getTasks);
    on<ChangeTaskStatusEvent>(_changeTaskStatus);
    on<DeleteTaskEvent>(_deleteTask);
    on<OpenDataBaseEvent>(_openDataBase);
  }

  FutureOr<void> _addTask(AddTaskEvent event, Emitter<TasksStates> emit) async {
    emit(AddTaskLoadingState());
    try {
      await tasksData.addTask(
          title: event.title, description: event.description);
      emit(AddTaskSuccessState());
    } catch (error) {
      emit(AddTaskErrorState());
    }
  }

  List<Task> tasks = [];
  FutureOr<void> _getTasks(
      GetTasksEvent event, Emitter<TasksStates> emit) async {
    emit(GetTasksLoadingState());
    try {
      tasks = [];
      tasks = await tasksData.getTasks();
      emit(GetTasksSuccessState());
    } catch (error) {
      emit(GetTasksErrorState());
    }
  }

  FutureOr<void> _changeTaskStatus(
      ChangeTaskStatusEvent event, Emitter<TasksStates> emit) async {
    emit(ChangeTaskStatusLoadingState());
    try {
      await tasksData.ChangeTaskStatus(event.taskID);
      emit(ChangeTaskStatusSuccessState());
    } catch (error) {
      emit(ChangeTaskStatusErrorState());
    }
  }

  FutureOr<void> _deleteTask(
      DeleteTaskEvent event, Emitter<TasksStates> emit) async {
    emit(DeleteTaskLoadingState());
    try {
      await tasksData.deleteTask(id: event.taskID);
      emit(DeleteTaskSuccessState());
    } catch (error) {
      emit(DeleteTaskErrorState());
    }
  }

  FutureOr<void> _openDataBase(OpenDataBaseEvent event, Emitter<TasksStates> emit) async {
    await tasksData.openDataBase();
    emit(OpenDataBaseState());
  }
}
