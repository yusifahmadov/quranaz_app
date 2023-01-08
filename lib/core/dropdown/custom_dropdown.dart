// ignore_for_file: avoid_renaming_method_parameters

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:quranazapp/core/constant.dart';

typedef FutureCallBack = Future<void> Function();
typedef FutureCallBackStr = void Function(String);
typedef FutureCallBackStr1 = Future<String>? Function(dynamic);
typedef FutureCallBack2 = Future<List<dynamic>> Function(String?);

class NormalTextDropdown extends StatelessWidget {
  const NormalTextDropdown(
      {Key? key,
      required this.context,
      this.dropdownBuilder,
      this.popupItemBuilder,
      this.validator,
      this.showSearchBox,
      this.textStyle,
      this.items,
      this.itemAsString,
      this.gonderilenData,
      this.onChanged,
      this.clearOnTap,
      this.onPopupDismissed,
      this.scrollController,
      required this.selectedItem,
      this.onFind,
      this.popupItemDisabled,
      this.enabled,
      this.mainText,
      this.sizeBetweenWidget,
      this.onClearTap,
      this.maxHeight = 300,
      this.width,
      this.noBorder,
      this.mainTextStyle,
      this.dropkey,
      this.isCentered,
      this.isDifferentVersion,
      this.height = 36,
      this.clearButtonVisible})
      : super(key: key);

  final ScrollController? scrollController;
  final BuildContext context;
  final dropkey;
  final Widget Function(BuildContext, dynamic)? dropdownBuilder;
  final FutureCallBackStr1? onChanged;
  final List<dynamic>? items;
  final String Function(dynamic)? itemAsString;
  final String? Function(dynamic)? validator;
  final Widget Function(BuildContext, dynamic, bool)? popupItemBuilder;
  final String? gonderilenData;
  final FutureCallBack2? onFind;
  final void Function()? onPopupDismissed;
  final TextStyle? textStyle;
  final bool? showSearchBox;
  final bool? enabled;
  final bool? isCentered;
  final Future<bool?> Function(dynamic, dynamic)? clearOnTap;
  final dynamic selectedItem;
  final bool Function(dynamic)? popupItemDisabled;
  final String? mainText;
  final double? width;
  final double? sizeBetweenWidget;
  final bool? noBorder;
  final TextStyle? mainTextStyle;
  final void Function()? onClearTap;
  final bool? isDifferentVersion;
  final double height;
  final double maxHeight;
  final bool? clearButtonVisible;
  @override
  Widget build(context1) {
    return SizedBox(
      height: 48,
      child: DropdownSearch<dynamic>(
        validator: validator,

        itemAsString: itemAsString,
        clearButtonProps: ClearButtonProps(
            padding: EdgeInsets.zero,
            iconSize: 10,
            constraints: const BoxConstraints(minWidth: 10, maxHeight: 49, minHeight: 49),
            alignment: Alignment.center,
            icon: const Icon(
              Icons.clear,
              size: 20,
            ),
            isVisible: clearButtonVisible ?? true),
        // showClearButton: true,

        onBeforeChange: clearOnTap,
        // showSearchBox: showSearchBox ?? true,
        items: items ?? [],

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
            border: noBorder == true ? InputBorder.none : null,
          ),
        ),

        selectedItem: selectedItem,
        onChanged: onChanged,

        dropdownButtonProps: DropdownButtonProps(color: mainColor, highlightColor: Colors.transparent),
        enabled: enabled ?? true,
        dropdownBuilder: dropdownBuilder,
        key: dropkey,
        popupProps: PopupProps.menu(
          itemBuilder: popupItemBuilder,
          onDismissed: onPopupDismissed,
          showSearchBox: false,

          constraints: BoxConstraints(maxHeight: maxHeight),
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

          disabledItemFn: popupItemDisabled,

          menuProps: const MenuProps(
              elevation: 2,
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
          listViewProps: ListViewProps(
            controller: scrollController,
          ),
          showSelectedItems: false,

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

        asyncItems: onFind,
        // dropdownSearchBaseStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.black),
      ),
    );
  }
}
