part of 'info_bloc.dart';

@immutable
abstract class InfoEvent extends Equatable{
  const InfoEvent();
  @override
  List<Object> get props =>[];
}

class GetInfoList extends InfoEvent {}