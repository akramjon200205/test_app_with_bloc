import 'package:flutter/material.dart';
import 'package:flutter_application_1/contacts/contact_bloc.dart';
import 'package:flutter_application_1/contacts/pages/text_field_func.dart';
import 'package:flutter_application_1/models/users_model.dart';
import 'package:flutter_application_1/news/news_bloc.dart';
import 'package:flutter_application_1/utills/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnTapContacts extends StatefulWidget {
  OnTapContacts({required this.index, super.key});
  int index;

  @override
  State<OnTapContacts> createState() => _OnTapContactsState();
}

class _OnTapContactsState extends State<OnTapContacts> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactBloc, ContactState>(builder: (contact, state) {
      if (state is ContactInitial) {
        context.read<ContactBloc>().add(const ContactEventLoad());
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is ContactInitial) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is ContactStateComplated) {
        List<UsersModel> list = state.listContact;
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: appBarColor,
            centerTitle: true,
            title: Text(
              list[widget.index].name!,
              style: kTextStyle(
                size: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.black38,
                  radius: 25,
                  child: Icon(
                    Icons.person,
                    size: 25,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  list[widget.index].name!,
                  style: kTextStyle(
                    size: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  list[widget.index].email!,
                  style: kTextStyle(
                    size: 14,
                    color: Colors.indigo,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldFunc("E-mail", "${list[widget.index].email}"),
                const SizedBox(
                  height: 20,
                ),
                TextFieldFunc("Phone number", "${list[widget.index].phone}"),
                const SizedBox(
                  height: 20,
                ),
                TextFieldFunc("Website", "${list[widget.index].website}"),
                const SizedBox(
                  height: 20,
                ),
                TextFieldFunc("Company", "${list[widget.index].company!.name}"),
                const SizedBox(
                  height: 20,
                ),
                TextFieldFunc("Adress", "${list[widget.index].address!.street}"),
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
}
