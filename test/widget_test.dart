import 'package:flutter_test/flutter_test.dart';
import 'package:sellora/main.dart';

void main() {
  testWidgets('App renders Splashscreen successfully', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(MyApp), findsOneWidget);
  });
}
