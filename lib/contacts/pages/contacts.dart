import 'package:flutter/material.dart';
import 'package:flutter_application_1/contacts/contact_bloc.dart';
import 'package:flutter_application_1/contacts/pages/on_tap_contacts.dart';
import 'package:flutter_application_1/models/users_model.dart';
import 'package:flutter_application_1/utills/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactBloc, ContactState>(builder: (context, state) {
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
        return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OnTapContacts(index: index),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: Colors.white70,
                      size: 20,
                    ),
                    title: Text(
                      list[index].name!,
                      style: kTextStyle(
                        size: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            });
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
