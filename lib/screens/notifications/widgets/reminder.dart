import 'dart:developer';

import 'package:active_ally_fitness_zone_250/screens/notifications/data/notification_hive_model.dart';
import 'package:active_ally_fitness_zone_250/screens/notifications/font_sizer.dart';
import 'package:active_ally_fitness_zone_250/screens/notifications/get_notification_cubit/get_notification_cubit.dart';
import 'package:active_ally_fitness_zone_250/screens/notifications/widgets/cupertino_modal.dart';
import 'package:active_ally_fitness_zone_250/screens/notifications/widgets/services/notification_handler.dart';
import 'package:active_ally_fitness_zone_250/utils/images/app_images.dart';
import 'package:active_ally_fitness_zone_250/widgets/spaces.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ReminderWidget extends StatefulWidget {
  const ReminderWidget({super.key});

  @override
  State<ReminderWidget> createState() => _ReminderWidgetState();
}

final NotificationService _notificationService = NotificationService();

class _ReminderWidgetState extends State<ReminderWidget> {
  bool switcher = false;
  int minutes = 0;
  @override
  void initState() {
    super.initState();
    context.read<GetNotificationCubit>().getAllNotificationist();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 25),
        GestureDetector(
          onTap: () {
            showAlertDialogReminder(
              context,
              title: 'Reminder',
              titleSub: 'Specify the reminder time',
              cancel: 'cancel',
              save: "Next",
            ).then(
              (dateTime) async {
                log('data: dateTime: $dateTime ');

                setState(() {});
                var dateNoti =
                    DateFormat('HH:mm').format(DateTime.parse('$dateTime'));

                var dateNow = DateFormat('HH:mm').format(DateTime.now());

                int notifId = DateTime.now().millisecond;

                final notificationHiveModel = NotificationHiveModel(
                    id: notifId, date: dateNoti, chek: true);

                var dateNotiNum = dateNoti.replaceAll(RegExp(r'[^0-9]'), '');
                var dateNowNum = dateNow.replaceAll(RegExp(r'[^0-9]'), '');

                int firstNoti = int.tryParse(dateNotiNum.substring(0, 2)) ?? 0;
                int lastNoti = int.tryParse(dateNotiNum.substring(2, 4)) ?? 0;

                int firstNow = int.tryParse(dateNowNum.substring(0, 2)) ?? 0;
                int lastNow = int.tryParse(dateNowNum.substring(2, 4)) ?? 0;

                var resultNoti = (firstNoti * 60) + lastNoti;
                var resultNow = (firstNow * 60) + lastNow;
                if (resultNow < resultNoti) {
                  minutes = resultNoti - resultNow;
                } else if (resultNow > resultNoti) {
                  minutes = (resultNoti - resultNow) + 1440;
                }
                final currentTime = DateTime.now();
                final date =
                    currentTime.copyWith(hour: firstNoti, minute: lastNoti);

                await _notificationService.scheduleNotifications(
                  id: notifId,
                  title: 'Time $dateNoti',
                  body: "It's time to drink water!",
                  time: date,
                );
                context.read<GetNotificationCubit>().setNotification(
                      notificationHiveModel,
                    );
              },
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Reminders',
                textScaler:
                    TextScaler.linear(FontSizer.textScaleFactor(context)),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              Image.asset(
                AppImages.add,
                scale: 4.5,
              ),
            ],
          ),
        ),
        const SizedBox(height: 23),
        BlocBuilder<GetNotificationCubit, GetNotificationState>(
          builder: (context, state) {
            return state.when(
              loading: () {
                return Column(
                  children: [
                    SizedBox(height: context.height * 0.16),
                    const Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  ],
                );
              },
              error: (v) {
                return const Text('eror');
              },
              success: (notifications) {
                if (notifications.isEmpty) {
                  return Column(
                    children: [
                      SizedBox(height: context.height * 0.16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'No reminders yet',
                            textAlign: TextAlign.center,
                            textScaler: TextScaler.linear(
                              FontSizer.textScaleFactor(context),
                            ),
                            style: TextStyle(
                              color:
                                  Colors.black.withOpacity(0.6000000238418579),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: notifications
                        .map((model) => ReminderContainer(
                              model: model,
                            ))
                        .toList(),
                  );

                  // SizedBox(
                  //   height: context.height * 0.32,
                  //   child: ListView.separated(
                  //     padding: const EdgeInsets.symmetric(vertical: 15),
                  //     shrinkWrap: true,
                  //     physics: const AlwaysScrollableScrollPhysics(),
                  //     itemCount: notifications.length,
                  //     separatorBuilder: (BuildContext context, int index) {
                  //       return const SizedBox(height: 20);
                  //     },
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return ReminderContainer(
                  //         model: notifications[index],
                  //       );
                  //     },
                  //   ),
                  // );
                }
              },
              success2: () {
                return const Text('text');
              },
            );
          },
        ),
      ],
    );
  }
}

class ReminderContainer extends StatefulWidget {
  const ReminderContainer({super.key, required this.model});
  final NotificationHiveModel model;

  @override
  State<ReminderContainer> createState() => _ReminderContainerState();
}

class _ReminderContainerState extends State<ReminderContainer> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotificationCubit, GetNotificationState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          width: context.width,
          height: 55,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: ShapeDecoration(
            color: const Color(0xFFF5F5F5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x33000000),
                blurRadius: 2,
                offset: Offset(0, 1),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.model.date,
                textScaler:
                    TextScaler.linear(FontSizer.textScaleFactor(context)),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0.09,
                ),
              ),
              Switch(
                activeTrackColor: const Color(0xffFF008A),
                value: widget.model.chek ?? false,
                onChanged: (newValue) async {
                  setState(() => widget.model.chek = newValue);
                  context
                      .read<GetNotificationCubit>()
                      .setUpadteNotificationChek(
                          widget.model.id, widget.model.chek ?? false);

                  if (widget.model.chek == true) {
                    // var dateNotiNum =
                    //     widget.model.date.replaceAll(RegExp(r'[^0-9]'), '');
                    // int firstNoti =
                    //     int.tryParse(dateNotiNum.substring(0, 2)) ?? 0;
                    // int lastNoti =
                    //     int.tryParse(dateNotiNum.substring(2, 4)) ?? 0;
                    // final currentTime = DateTime.now();
                    // final date = currentTime.copyWith(
                    //     hour: firstNoti, minute: lastNoti);

                    // await _notificationService.scheduleNotifications(
                    //   id: model.id,
                    //   title: 'Time ${model.date}',
                    //   body: "It's time to drink water!",
                    //   time: date,
                    // );
                  } else {
                    await _notificationService.deleteNotifications(
                      id: widget.model.id,
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
