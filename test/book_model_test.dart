import 'dart:convert';

import 'package:flutter_book_search_app/data/model/book.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('book model test', () {
    String dumyData = """
    {
    "title": "Harry! (Gedichte)",
    "link": "https://search.shopping.naver.com/book/catalog/32524001879",
    "image": "https://shopping-phinf.pstatic.net/main_3252400/32524001879.20220522144716.jpg",
    "author": "",
    "discount": "18500",
    "publisher": "Books on Demand",
    "pubdate": "20210519",
    "isbn": "9783753499949",
    "description": ""
  }
 """;

    Map<String, dynamic> map = jsonDecode(dumyData);
    Book book = Book.fromJson(map);
    expect(book.discount, '18500');
    print(book.toJson());
  });
}
