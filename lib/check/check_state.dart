part of 'check_bloc.dart';

abstract class CheckState extends Equatable {
  const CheckState();
}

class CheckInitial extends CheckState {
  const CheckInitial();

  @override
  List<Object?> get props => [];
}

class CheckStateCompleted extends CheckState {
  List<TodosModel> listTodos;
  CheckStateCompleted({required this.listTodos});
  @override
  List<Object?> get props => [];
}

class CheckStateProgress extends CheckState {
  @override
  List<Object?> get props => [];
}

class CheckStateFailed extends CheckState {
  String message;

  CheckStateFailed({required this.message});
  @override
  List<Object?> get props => [];
}
