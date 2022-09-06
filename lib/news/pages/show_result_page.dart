import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/coments_model.dart';
import 'package:flutter_application_1/news/bloc/comments_bloc.dart';
import 'package:flutter_application_1/utills/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowResult extends StatefulWidget {
  ShowResult({required this.text, required this.id, super.key});

  String text;
  int id;

  @override
  State<ShowResult> createState() => _ShowResultState();
}

class _ShowResultState extends State<ShowResult> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<CommentsBloc, CommentsState>(builder: (context, state) {
      if (state is CommentsInitial) {
        context.read<CommentsBloc>().add(const CommentsEventLoad());
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is CommentsInitial) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is CommentsStateCompleted) {
        List<CommentsModel> list = state.listComments;
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: appBarColor,
            centerTitle: true,
            title: Text(
              widget.text,
              style: kTextStyle(
                size: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                _itemConainer(size, 0),
                const SizedBox(
                  height: 20,
                ),
                _itemConainer(size, 1),
                const SizedBox(
                  height: 20,
                ),
                _itemConainer(size, 2),
                const SizedBox(
                  height: 20,
                ),
                _itemConainer(size, 3),
                const SizedBox(
                  height: 20,
                ),
                _itemConainer(size, 4),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget _itemConainer(
    Size size,
    int number,
  ) {
    List numbers = [];
    for (int i = widget.id * 5; i <= widget.id * 5 + 5; i++) {
      numbers.add(i);
    }
    return BlocBuilder<CommentsBloc, CommentsState>(
      builder: (context, state) {
        if (state is CommentsInitial) {
          context.read<CommentsBloc>().add(const CommentsEventLoad());
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CommentsInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CommentsStateCompleted) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: size.height * 0.2,
            width: size.width * 0.95,
            decoration: BoxDecoration(
              color: Colors.indigo[800],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  leading: const CircleAvatar(
                    radius: 20,
                    child: Icon(
                      Icons.person,
                      size: 20,
                    ),
                  ),
                  title: Text(
                    "${state.listComments[numbers[number]].name}",
                    style: kTextStyle(
                      size: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Text(
                  "${state.listComments[numbers[number]].body}",
                  style: kTextStyle(
                    size: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
