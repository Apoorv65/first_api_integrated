part of 'info_bloc.dart';

@immutable
abstract class InfoState  extends Equatable{
  const InfoState();
  List<Object> get props => [];
}

class InfoInitial extends InfoState {}

class InfoLoading extends InfoState {}

class InfoLoaded extends InfoState {
  final PostResponseModel postResponseModel;
  const InfoLoaded(this.postResponseModel);

}

class InfoError extends InfoState {
  final String? msg;
  const InfoError(this.msg);

}
