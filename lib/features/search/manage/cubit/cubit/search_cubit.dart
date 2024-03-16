import 'package:app2/core/webservices/repo.dart';
import 'package:app2/features/search/manage/models/searchmodels.dart';
import 'package:bloc/bloc.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  Future<void> search(String query) async {
    emit(SearchLoading());
    try {
      final searchResults = await HomeRepo().search('products/search', query);
      final data = SearchModels.fromJson(searchResults);
      emit(SearchLoaded(data));
    } catch (error) {
      emit(SearchError(message: error.toString()));
    }
  }
}
