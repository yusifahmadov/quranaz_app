import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quranazapp/features/ayah/data/models/helper/get_ayat_helper_model.dart';
import 'package:quranazapp/features/ayah/data/models/helper/get_one_ayah_helper_model.dart';
import 'package:quranazapp/features/ayah/presentation/pages/ayah_detail_page_view.dart';
import 'package:quranazapp/features/ayah/presentation/pages/ayah_page_view.dart';
import 'package:quranazapp/features/ayah/presentation/pages/ayah_search_page_view.dart';
import 'package:quranazapp/features/surah/presentation/pages/surah_page_view.dart';

import '../../../../core/button/custom_button.dart';
import '../../../../core/constant.dart';
import '../../../../core/dropdown/dropdowns.dart';
import '../../../../injection.dart';
import '../../data/models/surah_model.dart';
import '../bloc/surah_cubit.dart';

class SurahSearchView extends StatefulWidget {
  const SurahSearchView({super.key});
  static GetAyatHelperModel getAyatHelperModel = GetAyatHelperModel(surahId: 0, translatorId: 4);
  @override
  State<SurahSearchView> createState() => _SurahSearchViewState();
}

class _SurahSearchViewState extends State<SurahSearchView> {
  bool ayahFieldFreezed = true;
  bool surahFieldFreezed = false;
  FocusNode ayahFieldFocusNode = FocusNode();
  TextEditingController ayahFieldController = TextEditingController();
  final surahDropdownState = GlobalKey<DropdownSearchState<dynamic>>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: IgnorePointer(
                ignoring: surahFieldFreezed,
                child: SizedBox(
                  height: 48,
                  child: DropdownSearch<dynamic>(
                    clearButtonProps: const ClearButtonProps(
                        padding: EdgeInsets.zero,
                        iconSize: 10,
                        highlightColor: Colors.transparent,
                        constraints: BoxConstraints(minWidth: 15, maxHeight: 49, minHeight: 49),
                        alignment: Alignment.center,
                        icon: Icon(
                          Icons.clear,
                          size: 20,
                        ),
                        isVisible: true),
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      baseStyle: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.black),
                      dropdownSearchDecoration: InputDecoration(
                        filled: true,
                        fillColor:
                            surahFieldFreezed ? const Color.fromARGB(255, 240, 240, 240) : Colors.white,
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
                      ayahFieldFreezed = value == null;
                      ayahFieldFocusNode.unfocus();
                      ayahFieldController.clear();
                      SurahSearchView.getAyatHelperModel.surahId = value == null ? 0 : value.id;
                      SurahSearchView.getAyatHelperModel.ayahId = null;
                      setState(() {});
                      return;
                    },
                    dropdownButtonProps:
                        DropdownButtonProps(color: mainColor, highlightColor: Colors.transparent),
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
                      showSearchBox: true,
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
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 16, color: Colors.black),
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
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
                      listViewProps: const ListViewProps(),
                      showSelectedItems: false,
                      isFilterOnline: true,
                      searchFieldProps: TextFieldProps(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              constraints: const BoxConstraints(maxHeight: 40, minHeight: 20),
                              hintText: "Axtar",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: mainColor, width: 0.07))),
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.black)),
                    ),
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    selectedItem: null,
                    asyncItems: (dynamic a) async {
                      List<dynamic> list = await getIt.get<SurahCubit>().getSurahList(a);
                      return list;
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: IgnorePointer(
                ignoring: ayahFieldFreezed,
                child: TextField(
                  controller: ayahFieldController,
                  focusNode: ayahFieldFocusNode,
                  onChanged: (value) {
                    SurahSearchView.getAyatHelperModel.ayahId = value == "" ? null : int.parse(value);
                  },
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: Theme.of(context).textTheme.bodyText2,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Ayə",
                    fillColor: ayahFieldFreezed ? const Color.fromARGB(255, 240, 240, 240) : Colors.white,
                    contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: mainColor, width: 0.4)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: mainColor, width: 0.4)),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: CustomDropdown.translatorDropdown(
                  context: context,
                  onChanged: (value) {
                    SurahSearchView.getAyatHelperModel.translatorId = value == "Əlixan Musayev"
                        ? 1
                        : value == "Bünyadov-Məmmədəliyev"
                            ? 2
                            : value == "Ələddin Sultanov"
                                ? 4
                                : 3;
                    return null;
                  }),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 4,
              child: TextField(
                style: Theme.of(context).textTheme.bodyText2,
                onChanged: (value) {
                  surahDropdownState.currentState?.clear();
                  surahFieldFreezed = value != "";
                  ayahFieldFreezed = true;
                  ayahFieldFocusNode.unfocus();
                  ayahFieldController.clear();
                  SurahSearchView.getAyatHelperModel.word = value == "" ? null : value;
                },
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Kəlmə",
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: mainColor, width: 0.4)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: mainColor, width: 0.4)),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        CustomMaterialButton(
          onPressed: () async {
            /// SURAH ID SEARCH
            List<SurahModel> surahList = await getIt<SurahCubit>().getSurahList("");

            if (SurahSearchView.getAyatHelperModel.surahId != 0) {
              if (SurahSearchView.getAyatHelperModel.ayahId != null) {
                navigatorKey.currentState?.pushReplacement(
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => AyahDetailPageView(
                            surahModel: surahList
                                .where((element) => element.id == SurahSearchView.getAyatHelperModel.surahId)
                                .first,
                            getOneAyahHelperModel: GetOneAyahHelperModel(
                                ayahId: SurahSearchView.getAyatHelperModel.ayahId ?? 0,
                                translatorId: SurahSearchView.getAyatHelperModel.translatorId,
                                surahId: SurahSearchView.getAyatHelperModel.surahId),
                          )),
                );
              } else {
                navigatorKey.currentState?.pushReplacement(
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => AyahPageView(
                            surahModel: surahList
                                .where((element) => element.id == SurahSearchView.getAyatHelperModel.surahId)
                                .first,
                          )),
                );
              }
            } else {
              if (SurahSearchView.getAyatHelperModel.word != null) {
                navigatorKey.currentState?.pushReplacement(
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => AyahSearchPageView(
                            getAyatHelperModel: GetAyatHelperModel(
                                surahId: 0,
                                translatorId: SurahSearchView.getAyatHelperModel.translatorId,
                                word: SurahSearchView.getAyatHelperModel.word),
                          )),
                );
              } else {
                navigatorKey.currentState
                    ?.pushReplacement(PageRouteBuilder(pageBuilder: (_, __, ___) => const SurahPageView()));
              }
            }
          },
          text: "Axtar",
          maxSize: true,
          height: 25,
        ),
      ],
    );
  }
}
