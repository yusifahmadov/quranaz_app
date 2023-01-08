import 'package:dio/dio.dart';
import 'package:quranazapp/features/ayah/data/models/one_ayah_model.dart';
import 'package:retrofit/retrofit.dart';
part 'ayah_remote_data_source.g.dart';

abstract class AyahRemoteDataSource {
  Future<OneAyahModel> getOneAyah(int surahId, int ayahId, int translatorId);
}

@RestApi(baseUrl: "https://quran.az/api")
abstract class AyahRemoteDataSourceImpl implements AyahRemoteDataSource {
  factory AyahRemoteDataSourceImpl(Dio dio) = _AyahRemoteDataSourceImpl;

  @override
  @GET("/{surahId}/{ayahId}?t={t}")
  Future<OneAyahModel> getOneAyah(
      @Path("surahId") int surahId, @Path("ayahId") int ayahId, @Path("t") int translatorId);
}
