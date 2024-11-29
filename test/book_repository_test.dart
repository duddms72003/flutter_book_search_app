import 'dart:convert';

import 'package:flutter_book_search_app/data/repository/book_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('book', () async {
    //클래스를 객체화해서 변수에 담아주는 과정
    BookRepository bookRepository = BookRepository();
    final books = await bookRepository.searchBooks('harry');
    expect(books.isEmpty, false);
    for (var book in books) {
      print(book.toJson());
    }
  });
}
