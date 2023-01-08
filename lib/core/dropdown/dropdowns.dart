import 'package:flutter/material.dart';
import 'package:quranazapp/features/surah/data/models/surah_model.dart';
import 'package:quranazapp/features/surah/presentation/bloc/surah_cubit.dart';

import '../../injection.dart';
import 'custom_dropdown.dart';

class CustomDropdown {
  static NormalTextDropdown surahDropdown(
      {required BuildContext context,
      String textFieldName = "Surələr",
      dynamic selectedItem = "",
      Future<List<dynamic>> Function(String?)? onFind,
      required Future<String>? Function(dynamic)? onChanged,
      double width = 220,
      String? Function(dynamic)? validator,
      bool showHint = true}) {
    return NormalTextDropdown(
        validator: validator,
        height: 48,
        context: context,
        dropdownBuilder: (BuildContext context, dynamic a) {
          if (a.runtimeType == SurahModel) {
            return Text(a.title.toString());
          } else {
            return Text(
              "Surələr:",
              style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.grey),
            );
          }
        },
        width: width,
        isCentered: true,
        popupItemBuilder: (context, dynamic a, bool b) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${a.title.toString()} - ${a.id.toString()}",
              style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 14),
            ),
          );
        },
        textStyle: Theme.of(context).textTheme.bodyText2,
        selectedItem: selectedItem,
        showSearchBox: false,
        onFind: onFind ??
            (dynamic a) async {
              List<dynamic> list = await getIt.get<SurahCubit>().getSurahList(a);
              return list;
            },
        onChanged: onChanged);
  }

  static NormalTextDropdown translatorDropdown(
      {required BuildContext context,
      String textFieldName = "",
      dynamic selectedItem = "",
      Future<List<dynamic>> Function(String?)? onFind,
      required Future<String>? Function(dynamic)? onChanged,
      double width = 220,
      String? Function(dynamic)? validator,
      bool showHint = true}) {
    return NormalTextDropdown(
        validator: validator,
        context: context,
        maxHeight: 180,
        height: 48,
        dropdownBuilder: (BuildContext context, dynamic a) {
          return Center(
              child: Text(
            a.toString().length > 15 ? a.toString().substring(0, 16) : a.toString(),
            style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 13),
          ));
        },
        clearButtonVisible: false,
        width: width,
        isCentered: true,
        popupItemBuilder: (context, dynamic a, bool b) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              a,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 14),
            ),
          );
        },
        textStyle: Theme.of(context).textTheme.bodyText2,
        selectedItem: "Ələddin Sultanov",
        showSearchBox: false,
        items: const ["Əlixan Musayev", "Bünyadov-Məmmədəliyev", "Эльмир Кулиев", "Ələddin Sultanov"],
        onChanged: onChanged);
  }
}
