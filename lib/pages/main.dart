import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import '../data_classes/DiaryEntry.dart';
import '../data_classes/Utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DiaryPage(),
    );
  }
}

class DiaryPage extends StatefulWidget {
  @override
  State<DiaryPage> createState() => _State();
}

class _State extends State<DiaryPage> {
  final List<DiaryEntry> entries = Utils.createDummyDiaryEntries(
      numberOfEntries: 10, minYear: 2019, maxYear: 2022);

  changeIsFavorite(DiaryEntry entry) {
    setState(() {
      if (entry.isFavourite == false) {
        entry.isFavourite = true;
      } else {
        entry.isFavourite = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Diary'),
      ),
      body: GroupedListView<DiaryEntry, DateTime>(
        groupBy: (entry) =>
            DateTime(entry.entryDate.year, entry.entryDate.month),
        groupSeparatorBuilder: (date) => Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(DateFormat().format(date)),
        ),
        itemBuilder: (context, entry) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(entry.titleImageName),
            ),
            title: Text(entry.title),
            subtitle: Text(Utils.formatDateStandard(entry.entryDate)),
            trailing: IconButton(
              onPressed: () {
                changeIsFavorite(entry);
              },
              icon: Icon(entry.isFavourite ? Icons.favorite : Icons.favorite_border,
                color: entry.isFavourite ? Colors.red : null,),
            ),
          );
        },
        elements: entries,
      ),
    );
  }
}
