import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/check/check_bloc.dart';
import 'package:flutter_application_1/models/todos_model.dart';
import 'package:flutter_application_1/news/news_bloc.dart';
import 'package:flutter_application_1/utills/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({super.key});

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      return Colors.white70;
    }

    return BlocBuilder<CheckBloc, CheckState>(builder: (context, state) {
      if (state is CheckInitial) {
        context.read<CheckBloc>().add(const CheckEventLoad());
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is CheckInitial) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is CheckInitial) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is CheckStateCompleted) {
        List<TodosModel> list = state.listTodos;
        return ListView.builder(
          itemCount: state.listTodos.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: (list[index].completed == true ? appBarColor : null),
                  ),
                  child: ListTile(
                    leading: Checkbox(
                        checkColor: Colors.black,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: list[index].completed,
                        onChanged: (bool? value) {}),
                    title: Text(
                      list[index].title!,
                      style: kTextStyle(
                        size: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
