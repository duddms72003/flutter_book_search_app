import 'dart:convert';

import 'package:flutter_book_search_app/data/model/book.dart';
import 'package:http/http.dart';

class BookRepository {
  Future<List<Book>> searchBooks(String query) async {
    final client = Client();
    final response = await client.get(
      Uri.parse('https://openapi.naver.com/v1/search/book.json?query=$query'),
      headers: {
        'X-Naver-Client-Id': 'M6_yCrSS_ELSupfwi94u',
        'X-Naver-Client-Secret': 'ZyAgnDA2mv',
      },
    );

    // Get 요청 시 성공 => 200
    // 서버의 응답코드가 200일 때 -> body의 json 데이터를 jsonDecode 함수 사용해서 map으로 바꾼 후 List<Book> 으로 반환
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      final items = List.from(map['items']);

      // 1.아래 코드는 아직 완성된게 아님
      final iterable = items.map((e) {
        return Book.fromJson(e);
      });

      // 2.여기까지 작성해줘야 비로소 완성
      final list = iterable.toList();
      return list;
    }

    // 아닐 경우에 빈 리스트 반환
    return [];
  }
}
