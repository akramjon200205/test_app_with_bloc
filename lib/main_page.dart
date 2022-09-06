import 'package:flutter/material.dart';
import 'package:flutter_application_1/check/pages/check_page.dart';
import 'package:flutter_application_1/contacts/pages/contacts.dart';
import 'package:flutter_application_1/gallery/pages/gallery_page.dart';
import 'package:flutter_application_1/main/mein_bloc.dart';
import 'package:flutter_application_1/news/pages/news_page.dart';
import 'package:flutter_application_1/utills/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controllerPage = PageController();
  late List<String> titleList = ['News', "Gallery", "Check", "Contacts"];
  late String title;

  int indexBar = 0;

  @override
  void initState() {
    super.initState();
    title = titleList[0];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MeinBloc, MeinState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: const Color(0xff282148),
          centerTitle: true,
          title: Text(
            titleList[state.indexPage],
            style: kTextStyle(
              color: Colors.white,
              size: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        body: PageView(
          onPageChanged: ((index) {
            context.read<MeinBloc>().add(MeinEventSetIndexPage(indexPage: index));
            title = titleList[index];
          }),
          controller: controllerPage,
          children: const [
            NewsPage(),
            GalleryPage(),
            CheckPage(),
            ContactsPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: kTextStyle(color: Colors.white),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: "News",
              backgroundColor: bottomNavigationBarColor,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.photo_sharp,
                color: Colors.white,
              ),
              label: "Gallery",
              backgroundColor: bottomNavigationBarColor,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              label: "Check",
              backgroundColor: bottomNavigationBarColor,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.contact_page,
                color: Colors.white,
              ),
              label: "Contacts",
              backgroundColor: bottomNavigationBarColor,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: state.indexPage,
          selectedItemColor: Colors.white,
          onTap: (index) {
            controllerPage.animateToPage(index, duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
            context.read<MeinBloc>().add(MeinEventSetIndexPage(indexPage: index));
            title = titleList[index];
          },
        ),
      );
    });
  }
}
