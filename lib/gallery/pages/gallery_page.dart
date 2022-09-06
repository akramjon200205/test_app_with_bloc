import 'package:flutter/material.dart';
import 'package:flutter_application_1/gallery/gallery_bloc.dart';
import 'package:flutter_application_1/gallery/pages/photos_page.dart';
import 'package:flutter_application_1/models/alboms_model.dart';
import 'package:flutter_application_1/news/news_bloc.dart';
import 'package:flutter_application_1/utills/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryBloc, GalleryState>(builder: (context, state) {
      if (state is GalleryInitial) {
        context.read<GalleryBloc>().add(const GalleryEventLoad());
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is NewsInitial) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is GalleryStateCompleted) {
        List<AlbomsModel> list = state.listAlboms;
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200, childAspectRatio: 3 / 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PhotosPage(index: index),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      list[index].title!,
                      style: kTextStyle(
                        size: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
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
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
