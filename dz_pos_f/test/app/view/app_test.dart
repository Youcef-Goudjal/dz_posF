import 'package:flutter_test/flutter_test.dart';
import 'package:dz_pos_f/app/app.dart';
import 'package:dz_pos_f/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
