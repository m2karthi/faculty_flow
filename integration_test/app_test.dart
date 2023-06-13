import 'package:faculty_flow/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:faculty_flow/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end to end test', () {
    testWidgets(
      "verify login screen with correct username and password",
      (tester) async {
        app.main();
        await tester.pumpAndSettle();
        await tester.enterText(
            find.byType(TextFormField).at(0), 'suriya@g.com');
        await tester.enterText(find.byType(TextFormField).at(1), '123456');
        await tester.tap(find.byType(ElevatedButton));
        await tester.pumpAndSettle();

        expect(find.byType(NavBar), findsOneWidget);
      },
    );
  });
}
