import 'dart:async';

import 'package:api_integration/model/model.dart';
import 'package:api_integration/resources/api_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

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
