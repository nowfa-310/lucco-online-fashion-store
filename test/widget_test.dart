import 'package:flutter_test/flutter_test.dart';
import 'package:lucco/main.dart';

void main() {
  testWidgets('App launches successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const LuccoApp());

    // Just verify the app renders without error
    // The app should navigate to SplashScreen which is the initial route
    expect(tester.takeException(), isNull);
  });
}
