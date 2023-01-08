class Surah {
  final int id;
  final String title;
  final String fullTitle;
  final int ayahCount;
  final int order;
  final String arabic;
  final String city;
  final List<int> juz;

  Surah(
      {required this.arabic,
      required this.ayahCount,
      required this.city,
      required this.fullTitle,
      required this.id,
      required this.juz,
      required this.order,
      required this.title});
}
