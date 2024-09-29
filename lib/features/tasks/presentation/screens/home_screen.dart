import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_damatag_task/core/components/widget_componant/app-button.dart';
import 'package:todo_list_damatag_task/core/themes/light-colors.dart';
import 'package:todo_list_damatag_task/core/themes/text_style.dart';
import 'package:todo_list_damatag_task/features/tasks/data/tasks_data.dart';
import 'package:todo_list_damatag_task/features/tasks/domain/bloc/tasks_bloc.dart';
import 'package:todo_list_damatag_task/features/tasks/domain/bloc/tasks_events.dart';
import 'package:todo_list_damatag_task/features/tasks/domain/bloc/tasks_states.dart';

import '../../../../core/components/widget_componant/app-text-field.dart';
import '../../../../core/constant/app_string/string_const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          TasksBloc(tasksData: TasksData())..add(OpenDataBaseEvent()),
      child: BlocConsumer<TasksBloc, TasksStates>(
        listener: (BuildContext context, TasksStates state) {
          var bloc = TasksBloc.get(context);

          if (state is OpenDataBaseState ||
              state is ChangeTaskStatusSuccessState ||
              state is DeleteTaskSuccessState ||
              state is AddTaskSuccessState) bloc.add(GetTasksEvent());
        },
        builder: (BuildContext context, TasksStates state) {
          var bloc = TasksBloc.get(context);

          return
               Scaffold(
                  appBar: AppBar(
                    title: Text(
                      'TODO LIST',
                      style: appBartTextStyle(),
                    ),
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      var descriptionController = TextEditingController();
                      var titleController = TextEditingController();
                      final formKey = GlobalKey<FormState>();
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        builder: (BuildContext context) {
                          double width = MediaQuery.sizeOf(context).width;
                          // UDE : SizedBox instead of Container for whitespaces
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context)
                                  .viewInsets
                                  .bottom, // Adjust the bottom padding when keyboard appears
                            ),
                            child: SingleChildScrollView(
                              child: Form(
                                key: formKey,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 30),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        StringConst.addNewTask,
                                        style: titleTextStyle(),
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      AppTextField(
                                        hintText: StringConst.title,
                                        prefixIcon: Icons.title,
                                        validate: (value) {
                                          if (value == null || value.isEmpty) {
                                            return StringConst
                                                .validationMessage;
                                          }
                                          return null;
                                        },
                                        controller: titleController,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      AppTextField(
                                        hintText: StringConst.description,
                                        prefixIcon: Icons.description,
                                        validate: (value) {
                                          if (value == null || value.isEmpty) {
                                            return StringConst
                                                .validationMessage;
                                          }
                                          return null;
                                        },
                                        controller: descriptionController,
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      AppButton(
                                          minWidth: width / 2,
                                          onPressed: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              bloc.add(AddTaskEvent(
                                                  title: titleController.text,
                                                  description:
                                                      descriptionController
                                                          .text));

                                              descriptionController.clear();
                                              titleController.clear();
                                              Navigator.pop(context);
                                            }
                                          },
                                          child: Text(
                                            StringConst.add,
                                            style: buttonTextStyle(),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                      // cubit.changeBottomSheetState();
                    },
                    child: const Icon(Icons.add),
                  ),
                  body: Padding(
                      padding: const EdgeInsets.all(16),
                      child: (state is GetTasksLoadingState ||
                          state is DeleteTaskLoadingState ||
                          state is AddTaskLoadingState ||
                          state is ChangeTaskStatusLoadingState)
                          ? Center(
                        child: CircularProgressIndicator(),
                      ):ListView.separated(
                          itemCount: bloc.tasks.length,
                          itemBuilder: (context, index) => Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black
                                          .withOpacity(0.2), // Shadow color
                                      offset: Offset(0, 4), // Vertical offset
                                      blurRadius: 8, // Blur effect
                                      spreadRadius:
                                          1, // How much the shadow spreads
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          bloc.tasks[index].title,
                                          style: titleTextStyle(),
                                        ),
                                        Spacer(),
                                        IconButton(
                                            onPressed: () {
                                              bloc.add(DeleteTaskEvent(
                                                  taskID:
                                                      bloc.tasks[index].id));
                                            },
                                            icon: const Icon(
                                              Icons.delete_outline_outlined,
                                              size: 35,
                                            )),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Transform.scale(
                                          scale: 1.5,
                                          child: Checkbox(
                                            value:
                                                bloc.tasks[index].status == 1,
                                            onChanged: (bool? value) {
                                              bloc.add(ChangeTaskStatusEvent(
                                                  taskID:
                                                      bloc.tasks[index].id));
                                            },
                                            side: BorderSide(
                                                color: primaryColor, width: 2),
                                            activeColor:
                                                primaryColor, // Background color of the box when checked
                                            checkColor: Colors
                                                .white, // The color of the checkmark
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(bloc.tasks[index].description,
                                        style: normalTextStyle()),
                                  ],
                                ),
                              ), separatorBuilder: (BuildContext context, int index)=>SizedBox(height: 20),)));
        },
      ),
    );
  }
}
