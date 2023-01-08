import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../features/surah/data/models/surah_model.dart';
import '../../features/surah/presentation/bloc/surah_cubit.dart';
import '../../injection.dart';
import '../constant.dart';

class SurahDropdown extends StatefulWidget {
  void Function(dynamic value) onSurahDropdownChanged;
  SurahDropdown({super.key, required this.onSurahDropdownChanged});

  @override
  State<SurahDropdown> createState() => _SurahDropdownState();
}

class _SurahDropdownState extends State<SurahDropdown> {
  final surahDropdownState = GlobalKey<DropdownSearchState<dynamic>>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: DropdownSearch<dynamic>(
        clearButtonProps: const ClearButtonProps(
            padding: EdgeInsets.zero,
            iconSize: 10,
            constraints: BoxConstraints(minWidth: 10, maxHeight: 49, minHeight: 49),
            alignment: Alignment.center,
            icon: Icon(
              Icons.clear,
              size: 20,
            ),
            isVisible: true),
        // showClearButton: true,

        // showSearchBox: showSearchBox ?? true,

        dropdownDecoratorProps: DropDownDecoratorProps(
          baseStyle: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.black),
          dropdownSearchDecoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: mainColor, width: 0.4)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: mainColor, width: 0.4)),
            border: null,
          ),
        ),

        onChanged: (value) async {
          widget.onSurahDropdownChanged(value);
          return;
        },

        dropdownButtonProps: DropdownButtonProps(color: mainColor, highlightColor: Colors.transparent),
        enabled: true,
        items: const [],
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

        key: surahDropdownState,
        popupProps: PopupProps.menu(
          itemBuilder: (context, dynamic a, bool b) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${a.title.toString()} - ${a.id.toString()}",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 14),
              ),
            );
          },

          showSearchBox: false,

          constraints: const BoxConstraints(maxHeight: 300),
          errorBuilder: (a, b, c) {
            return Center(
                child: Text(
              "Xəta Baş Verdi!",
              style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 16),
            ));
          },
          emptyBuilder: (a, b) {
            return Center(
                child: Text(
              "Tapılmadı!",
              style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 16, color: Colors.black),
            ));
          },
          scrollbarProps: ScrollbarProps(
            interactive: true,
            thickness: 8,
            trackColor: Theme.of(context).colorScheme.primary,
            thumbColor: Theme.of(context).colorScheme.primary,
            trackBorderColor: Theme.of(context).colorScheme.primary,
            radius: const Radius.circular(0),
          ),

          menuProps: const MenuProps(
              elevation: 2,
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
          listViewProps: const ListViewProps(),
          showSelectedItems: false,
          isFilterOnline: true,
          // fit: FlexFit.tight,
          // onPopupDismissed: onPopupDismissed,
          // scrollbarProps: ScrollbarProps(controller: scrollController),
          searchFieldProps:
              TextFieldProps(style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.black)),
        ),
        // popupElevation: 1,
        // popupItemDisabled: popupItemDisabled,
        // mode: Mode.MENU,

        autoValidateMode: AutovalidateMode.onUserInteraction,
        selectedItem: null,
        asyncItems: (dynamic a) async {
          List<dynamic> list = await getIt.get<SurahCubit>().getSurahList(a);
          return list;
        },
        // dropdownSearchBaseStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.black),
      ),
    );
  }
}
