// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ayah_remote_data_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _AyahRemoteDataSourceImpl implements AyahRemoteDataSourceImpl {
  _AyahRemoteDataSourceImpl(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://quran.az/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<OneAyahModel> getOneAyah(
    surahId,
    ayahId,
    translatorId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<OneAyahModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/${surahId}/${ayahId}?t=${translatorId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OneAyahModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
