import 'package:dz_pos/app/app.dart';
import 'package:dz_pos/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets(
      'renders Counter page',
      (widgetTester) async {
        await widgetTester.pumpWidget(const App());
        expect(find.byType(CounterPage), findsWidgets);
      },
    );
  });
}
