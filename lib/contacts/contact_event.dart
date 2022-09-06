part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();
}

class ContactEventLoad extends ContactEvent {
  const ContactEventLoad();
  @override
  List<Object?> get props => [];
}
