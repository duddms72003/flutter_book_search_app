import 'package:flutter/material.dart';
import 'package:flutter_book_search_app/ui/widgets/home_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    // TextEditingController 사용시에는 반드시 dispose 호출해줘야 메모리에서 소거됨.
    textEditingController.dispose();
    super.dispose();
  }

  void onSearch(String text) {
    //
    print(' 호출됨');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
                onTap: () {
                  onSearch(textEditingController.text);
                },
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.transparent,
                  child: Icon(Icons.search),
                )),
          ],
          title: TextField(
            onSubmitted: onSearch,
            maxLines: 1,
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: '검색어를 입력해주세요',
              border: MaterialStateOutlineInputBorder.resolveWith(
                (states) {
                  if (states.contains(WidgetState.focused)) {
                    //
                    return OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    );
                  }
                  return OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  );
                },
              ),
            ),
          ),
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(20),
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                //
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return HomeBottomSheet();
                  },
                );
              },
              child: Image.network('https://picsum.photos/200/300'),
            );
          },
        ),
      ),
    );
  }
}
