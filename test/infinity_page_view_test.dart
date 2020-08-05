import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:infinity_page_view/infinity_page_view.dart';

void main() {
  testWidgets('Test basic usage', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: InfinityPageView(
        itemBuilder: (context, index) {
          return Text("$index");
        },
        itemCount: 3,
      ),
    ));
    expect(find.text('0', skipOffstage: false), findsOneWidget);
  });

  testWidgets('Test controller', (tester) async {
    // Build our app and trigger a frame.
    InfinityPageController controller = InfinityPageController(initialPage: 1);
    await tester.pumpWidget(MaterialApp(
      home: InfinityPageView(
        controller: controller,
        itemBuilder: (context, index) {
          return Text("$index");
        },
        itemCount: 3,
      ),
    ));
    expect(find.text('1', skipOffstage: false), findsOneWidget);

    controller.jumpToPage(2);
  });
}
