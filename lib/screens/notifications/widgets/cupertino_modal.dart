import 'dart:developer';

import 'package:active_ally_fitness_zone_250/screens/notifications/font_sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<int?> showAlertDialog(
  BuildContext context, {
  required String title,
  required String titleSub,
  required String cancel,
  required String save,
}) async =>
    await showCupertinoModalPopup<int>(
      context: context,
      builder: (BuildContext context) {
        ValueNotifier customValue = ValueNotifier<int>(0);
        return CupertinoAlertDialog(
          title: Text(
            title,
            textAlign: TextAlign.center,
            textScaler: TextScaler.linear(FontSizer.textScaleFactor(context)),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              children: [
                Text(
                  titleSub,
                  textAlign: TextAlign.center,
                  textScaler:
                      TextScaler.linear(FontSizer.textScaleFactor(context)),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 120,
                  child: CupertinoTheme(
                    data: const CupertinoThemeData(
                      textTheme: CupertinoTextThemeData(
                        dateTimePickerTextStyle: TextStyle(color: Colors.white),
                      ),
                      brightness: Brightness.light,
                      primaryColor: Colors.red,
                      barBackgroundColor: Colors.red,
                    ),
                    child: CupertinoPicker(
                      diameterRatio: 10,
                      magnification: 1,
                      squeeze: 1,
                      // backgroundColor: Colors.red,
                      useMagnifier: false,
                      itemExtent: 30,
                      // This sets the initial item.
                      scrollController: FixedExtentScrollController(
                        initialItem: 4,
                      ),
                      // This is called when selected item is changed.
                      onSelectedItemChanged: (int selectedItem) {
                        log('data: selectedItem: $selectedItem ');
                        customValue.value = selectedItem;
                      },
                      selectionOverlay:
                          const CupertinoPickerDefaultSelectionOverlay(
                        background: Color(0x33FF008A),
                      ),

                      children: List<Widget>.generate(
                        10, // Уменьшите количество элементов на 1
                        (int index) {
                          return Center(
                              child: Text(
                            '${(index + 1) * 100} ml',
                            textScaler: TextScaler.linear(
                                FontSizer.textScaleFactor(context)),
                          ));
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                cancel,
                textScaler:
                    TextScaler.linear(FontSizer.textScaleFactor(context)),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () =>
                  Navigator.pop(context, (customValue.value + 1) * 100),
              child: Text(
                save,
                textAlign: TextAlign.center,
                textScaler:
                    TextScaler.linear(FontSizer.textScaleFactor(context)),
                style: const TextStyle(
                  color: Color(0xFFFF0089),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );

Future<DateTime?> showAlertDialogReminder(
  BuildContext context, {
  required String title,
  required String titleSub,
  required String cancel,
  required String save,
}) async =>
    await showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (BuildContext context) {
        DateTime dateTime = DateTime.now();

        return CupertinoAlertDialog(
          title: Text(
            title,
            textAlign: TextAlign.center,
            textScaler: TextScaler.linear(FontSizer.textScaleFactor(context)),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              children: [
                Text(
                  titleSub,
                  textAlign: TextAlign.center,
                  textScaler:
                      TextScaler.linear(FontSizer.textScaleFactor(context)),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 120,
                  child: CupertinoTheme(
                    data: const CupertinoThemeData(
                      textTheme: CupertinoTextThemeData(
                        dateTimePickerTextStyle: TextStyle(color: Colors.black),
                      ),
                      brightness: Brightness.light,
                      primaryColor: Colors.red,
                      barBackgroundColor: Colors.red,
                    ),
                    child: CupertinoDatePicker(
                      // backgroundColor: Colors.white,
                      initialDateTime: dateTime,
                      onDateTimeChanged: (DateTime newTime) {
                        dateTime = newTime;
                      },
                      mode: CupertinoDatePickerMode.time,
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                cancel,
                textScaler:
                    TextScaler.linear(FontSizer.textScaleFactor(context)),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () => Navigator.pop(context, dateTime),
              child: Text(
                save,
                textAlign: TextAlign.center,
                textScaler:
                    TextScaler.linear(FontSizer.textScaleFactor(context)),
                style: const TextStyle(
                  color: Color(0xFFFF0089),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
