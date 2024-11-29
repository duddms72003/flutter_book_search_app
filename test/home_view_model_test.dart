import 'package:flutter_book_search_app/ui/home/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('home view model test', () async {
    final proividerContainer = ProviderContainer();
    addTearDown(proividerContainer.dispose);
    final homeVm = proividerContainer.read(homeViewModelProvider.notifier);

    final firstState = proividerContainer.read(homeViewModelProvider);
    await homeVm.searchBooks('harry');
    final afterState = proividerContainer.read(homeViewModelProvider);
    expect(afterState.books.isEmpty, false);

    afterState.books.forEach(
      (element) {
        print(element.toJson());
      },
    );
  });
}
