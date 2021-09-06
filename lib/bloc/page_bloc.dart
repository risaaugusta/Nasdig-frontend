import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState>{

  @override
  PageBloc() : super(OnInitialPage());

  @override
  Stream<PageState> mapEventToState(
      PageEvent event,
      ) async* {
    // TODO: implement mapEventToState
    if (event is GoToSplashPage) {
      yield OnSplashPage();
    } else if (event is GoToLoginPage) {
      yield OnLoginPage();
    } else if (event is GoToMainPage) {
      yield OnMainPage();
    }else if (event is GoToAdminListPage) {
      yield OnAdminListPage();
    }else if (event is GoToKaderListPage) {
      yield OnKaderListPage();
    }else if (event is GoToFormProfilePage) {
      yield OnFormProfilePage();
    }
  }
}