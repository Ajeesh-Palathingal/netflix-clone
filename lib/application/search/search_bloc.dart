import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';
import 'package:netflix_clone/domain/search/search_service.dart';

import '../../domain/search/models/search_resp/search_resp.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsService;
  final SearchService _searchService;
  SearchBloc(this._downloadsService, this._searchService)
      : super(SearchState.initial()) {
    /* 
    idle state
    */

    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(SearchState(
          searchResultList: [],
          idleList: state.idleList,
          isLoading: false,
          isError: false,
        ));
        return;
      }
      emit(const SearchState(
        searchResultList: [],
        idleList: [],
        isLoading: true,
        isError: false,
      ));
      //fetch trending movies list
      final _result = await _downloadsService.getDownloadsImage();
      _result.fold((MainFailure f) {
        emit(const SearchState(
          searchResultList: [],
          idleList: [],
          isLoading: false,
          isError: true,
        ));
      }, (List<Downloads> list) {
        emit(SearchState(
          searchResultList: [],
          idleList: list,
          isLoading: false,
          isError: false,
        ));
      });
      //show list to UI
    });

    /* 
    search result state
    */

    on<SearchMovie>((event, emit) async {
      //call search movie api
      log("searching for ${event.movieQuery}");
      emit(const SearchState(
        searchResultList: [],
        idleList: [],
        isLoading: true,
        isError: false,
      ));
      final _result = await _searchService.searchMovie(movieQuery: event.movieQuery);
      // print("resut is        $_result.");
      final _state = _result.fold(
        (MainFailure f) {
          return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true,
          );
        },
        (SearchResp r) {
          return SearchState(
            searchResultList: r.results,
            idleList: [],
            isLoading: false,
            isError: false,
          );
        },
      );
      //show results to UI
      emit(_state);
    });
  }
}
