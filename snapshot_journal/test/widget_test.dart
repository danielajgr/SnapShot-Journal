import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:snapshot_journal/Object/Entry.dart';
import 'package:camera/camera.dart';
import 'package:snapshot_journal/Widgits/Entry_list.dart';
import 'package:snapshot_journal/Widgits/main.dart';
import 'package:snapshot_journal/pages/journal_entries.dart';

void main() {
  testWidgets('Journal starts with no entries', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: JournalEntries(firstCamera: CameraDescription(name: 'name', lensDirection: CameraLensDirection.back, sensorOrientation: 1))));
        
      final entryFinder = find.byType(EntryList);

    expect(entryFinder, findsNothing);
  });
}




// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:snapshot_journal/Object/Entry.dart';
import 'package:camera/camera.dart';
import 'package:snapshot_journal/Widgits/Entry_list.dart';
import 'package:snapshot_journal/Widgits/main.dart';
import 'package:snapshot_journal/pages/journal_entries.dart';

void main() {
testWidgets('Journal starts with one entry', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: JournalEntries(firstCamera: CameraDescription(name: 'name', lensDirection: CameraLensDirection.back, sensorOrientation: 1))));
        
      final entryFinder = find.byType(EntryList);

    expect(entryFinder, findsOneWidget);
  });

testWidgets('Textfield starts empty and can be edited', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: JournalEntries(firstCamera: CameraDescription(name: 'name', lensDirection: CameraLensDirection.back, sensorOrientation: 1))));

      expect(find.byType(TextField), findsOneWidget);

      await tester.tap(find.byType(TextField));
      await tester.pump();
      expect(find.text("starter text"), findsNothing);

      await tester.enterText(find.byType(TextField), 'My day was great');
      await tester.pump();
      expect(find.text("My day was great"), findsOneWidget);

});


  /*testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });*/
}

