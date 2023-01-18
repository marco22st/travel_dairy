import 'package:intl/intl.dart';
import 'package:faker/faker.dart';

import 'DiaryEntry.dart';

class Utils {
  static List<DiaryEntry> createDummyDiaryEntries(
      {required int numberOfEntries,
      required int minYear,
      required int maxYear}) {
    final faker = Faker();
    final List<DiaryEntry> entries = [];
    for (var i = 0; i < numberOfEntries; i++) {
      final entry = DiaryEntry(
        faker.lorem.sentence(),
        faker.lorem.word(),
        faker.lorem.sentence(),
        faker.date.dateTimeBetween(DateTime(minYear), DateTime(maxYear)),
        faker.randomGenerator.boolean(),
        List.generate(3, (_) => faker.lorem.word()),
      );
      entries.add(entry);
    }
    return entries;
  }

  static String formatDateStandard(DateTime date) {
    return DateFormat('dd.MM.yy').format(date);
  }
}
