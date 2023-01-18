class DiaryEntry {
  String title = "";
  String titleImageName = "";
  String info = "";
  DateTime entryDate = DateTime(0);
  bool isFavourite = false;
  List<String> imageNameList = [];

  DiaryEntry(this.title, this.titleImageName, this.info, this.entryDate,
      this.isFavourite, this.imageNameList);

  DiaryEntry.withTitleImage(
      this.title, this.info, this.entryDate, this.titleImageName);

  DiaryEntry.withTitle(this.title, this.info, this.entryDate);
}
