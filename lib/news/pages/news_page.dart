import 'package:flutter/material.dart';
import 'package:flutter_application_1/contacts/pages/on_tap_contacts.dart';
import 'package:flutter_application_1/models/post_model.dart';
import 'package:flutter_application_1/news/news_bloc.dart';
import 'package:flutter_application_1/news/pages/comments_page.dart';
import 'package:flutter_application_1/utills/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: ((context, state) {
        if (state is NewsInitial) {
          context.read<NewsBloc>().add(const NewsEventLoad());
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is NewsInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is NewsStateCompleted) {
          List<PostsModel> list = state.listPosts;
          return Container(
            color: const Color(0xff0F0C20),
            child: RefreshIndicator(child: ListView.builder(itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CommentsPage(
                          string: state.listPosts[index].title!, bodys: state.listPosts[index].body!, id: index),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.indigo[800],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        list[index].title!,
                        style: kTextStyle(
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        list[index].body!,
                        style: kTextStyle(
                          color: Colors.white70,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }), onRefresh: () async {
              context.read<NewsBloc>().add(const NewsEventLoad());
            }),
          );
        } else if (state is NewsStateFailed) {
          return Center(
            child: Text(
              "Connection Error",
              style: kTextStyle(
                color: Colors.grey,
                size: 20,
              ),
            ),
          );
        } else {
          return ListView(
              children: List.generate(10, (index) {
            return Container(
              height: 200,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: const Color(0xff221B44),
                borderRadius: BorderRadius.circular(10),
              ),
            );
          }));
        }
      }),
    );
  }
}
