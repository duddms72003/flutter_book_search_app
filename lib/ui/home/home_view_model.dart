import 'package:flutter_book_search_app/data/model/book.dart';
import 'package:flutter_book_search_app/data/repository/book_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 상태 클래스 만들고
class HomeState {
  List<Book> books;
  HomeState(this.books);
}

// 2. 뷰 모델 만들고 - Notifier 상속
class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    return HomeState([]);
  }

  Future<void> searchBooks(String query) async {
    final bookRepository = BookRepository();
    final books = await bookRepository.searchBooks(query);
    state = HomeState(books);
  }
}

// 3. 뷰 모델 관리자 만들기 - NotifierProvider 객체
final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
