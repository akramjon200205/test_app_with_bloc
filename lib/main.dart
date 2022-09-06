import 'package:flutter/material.dart';
import 'package:flutter_application_1/check/check_bloc.dart';
import 'package:flutter_application_1/contacts/contact_bloc.dart';
import 'package:flutter_application_1/gallery/gallery_bloc.dart';
import 'package:flutter_application_1/main/mein_bloc.dart';
import 'package:flutter_application_1/main_page.dart';
import 'package:flutter_application_1/news/bloc/comments_bloc.dart';
import 'package:flutter_application_1/news/news_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MeinBloc(),
        ),
        BlocProvider(
          create: (_) => NewsBloc(),
        ),
        BlocProvider(
          create: (_) => GalleryBloc(),
        ),
        BlocProvider(
          create: (_) => CheckBloc(),
        ),
        BlocProvider(
          create: (_) => ContactBloc(),
        ),
        BlocProvider(
          create: (_) => CommentsBloc(),
        ),
      ],
      child: const MaterialApp(
        home: MainPage(),
      ),
    );
  }
}
