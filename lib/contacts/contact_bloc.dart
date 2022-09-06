import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/users_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial()) {
    on<ContactEvent>((event, emit) {});
    on<ContactEventLoad>(
      (event, emit) async {
        try {
          List<UsersModel> listContact = [];
          emit(ContactStateProgress());
          var response = await get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
          if (response.statusCode == 200) {
            for (var item in jsonDecode(response.body)) {
              listContact.add(UsersModel.fromJson(item));
            }
            emit(ContactStateComplated(listContact: listContact));
          } else {}
        } on SocketException {
          emit(const ContactStateField("Connection error"));
        } catch (e) {
          emit(ContactStateField(e.toString()));
        }
      },
    );
  }
}
