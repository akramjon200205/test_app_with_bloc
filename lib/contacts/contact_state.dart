part of 'contact_bloc.dart';

abstract class ContactState extends Equatable {
  const ContactState();
}

class ContactInitial extends ContactState {
  @override
  List<Object?> get props => [];
}

class ContactStateProgress extends ContactState {
  const ContactStateProgress();
  @override
  List<Object?> get props => [];
}

class ContactStateComplated extends ContactState {
  const ContactStateComplated({required this.listContact});
  final List<UsersModel> listContact;
  @override
  List<Object?> get props => [listContact];
}

class ContactStateField extends ContactState {
  const ContactStateField(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}
