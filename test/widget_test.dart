import 'package:flutter_test/flutter_test.dart';
import 'package:sellora/main.dart';

void main() {
  testWidgets('Splashscreen renders brand elements', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify brand text elements exist
    expect(find.text('Sellora'), findsOneWidget);
    expect(find.text('POINT OF SALE'), findsOneWidget);
    expect(find.text('Smart Shop, Smart Sales'), findsOneWidget);
    expect(find.text('Registers Synced'), findsOneWidget);
  });
}
