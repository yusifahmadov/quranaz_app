import 'package:quranazapp/features/ayah/data/models/ayah_model.dart';

import '../../../ayah/data/models/ayah_detail_model.dart';

class OneSurah {
  List<AyahModel> ayahs;
  List<AyahDetailModel> ayahDetails;

  OneSurah({required this.ayahDetails, required this.ayahs});
}
