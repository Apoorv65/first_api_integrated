
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/model.dart';
import '../resources/api_repo.dart';

part 'info_event.dart';
part 'info_state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  InfoBloc() : super(InfoInitial()) {
    final ApiRepository _repo = ApiRepository();

    on<GetInfoList>((event, emit) async {
      try {
        emit(InfoLoading());
        final _infoList = await _repo.fetchList();
        emit(InfoLoaded(_infoList));
        if(_infoList.error != null) {
          emit(InfoError(_infoList.error));
        }
      } on NetworkError {
        emit(const  InfoError('Failed to fetch the data.'));
      }
    });
  }
}
