import 'package:active_ally_fitness_zone_250/screens/notifications/font_sizer.dart';
import 'package:flutter/material.dart';

class DrinkWidget extends StatefulWidget {
  const DrinkWidget({
    Key? key,
    required this.goalMl,
  }) : super(key: key);

  final Function(int value) goalMl;

  @override
  State<DrinkWidget> createState() => _DrinkWidgetState();
}

class _DrinkWidgetState extends State<DrinkWidget> {
  int selectedValueIndex = -1;
  int valueMl = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Water',
                    textAlign: TextAlign.center,
                    textScaler:
                        TextScaler.linear(FontSizer.textScaleFactor(context)),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0.06,
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              selectedValueIndex != -1
                  ? '${(selectedValueIndex + 1) * 50} ml'
                  : '0 ml',
              textAlign: TextAlign.center,
              textScaler: TextScaler.linear(FontSizer.textScaleFactor(context)),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              children: List.generate(
                20,
                (index) {
                  final value = 50 + index * 50;
                  final isSelected = index == selectedValueIndex;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedValueIndex = index;
                        valueMl = value;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 15, bottom: 30),
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0x99FF0089),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xffFF008A)
                              : Colors.transparent,
                          width: 3,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '$value',
                          textAlign: TextAlign.center,
                          textScaler: TextScaler.linear(
                            FontSizer.textScaleFactor(context),
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0.07,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                if (selectedValueIndex != -1) {
                  Navigator.pop(context);
                  widget.goalMl(valueMl);
                }
              },
              child: Container(
                alignment: Alignment.center,
                width: 335,
                height: 60,
                decoration: ShapeDecoration(
                  color: selectedValueIndex != -1
                      ? const Color(0xffFF008A)
                      : Colors.black.withOpacity(0.25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: 4,
                      offset: Offset(0, 1),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Text(
                  'ADD',
                  textAlign: TextAlign.center,
                  textScaler: TextScaler.linear(
                    FontSizer.textScaleFactor(context),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
