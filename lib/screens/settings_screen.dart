import 'package:active_ally_fitness_zone_250/screens/premium_screen.dart';
import 'package:active_ally_fitness_zone_250/utils/app_text_styles.dart';
import 'package:active_ally_fitness_zone_250/utils/app_urls.dart';
import 'package:active_ally_fitness_zone_250/utils/colors.dart';
import 'package:active_ally_fitness_zone_250/utils/images/app_images.dart';
import 'package:active_ally_fitness_zone_250/utils/premium/premium.dart';
import 'package:active_ally_fitness_zone_250/widgets/custom_button.dart';
import 'package:active_ally_fitness_zone_250/widgets/web_view_fitess_zone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isBuyPrem = true;
  @override
  void initState() {
    getPrem();
    super.initState();
  }

  getPrem() async {
    isBuyPrem = await PremiumFitnessZone.getPremium();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Settings',
                style: AppTextStylesFitnessZone.s30W700(),
              ),
              if (!isBuyPrem) const SizedBox(height: 20),
              if (!isBuyPrem)
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.colorFF008A.withOpacity(0.2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Upgrade your subscription to',
                        style: AppTextStylesFitnessZone.s15W500(
                          color: AppColors.colorFF008A,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'access more features',
                            style: AppTextStylesFitnessZone.s15W500(
                              color: AppColors.colorFF008A,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Image.asset(AppImages.crownIcon, height: 15.h),
                        ],
                      ),
                      SizedBox(height: 28.h),
                      CustomButtonFitessZone(
                        radius: 30,
                        color: AppColors.colorFF008A,
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PremiumScreen(
                                isClose: true,
                              ),
                            ),
                          );
                        },
                        text: 'Buy Premium for \$0,99',
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 30),
              SettingsRow(
                title: 'Privacy Policy',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WebFitnessZone(
                        title: 'Privacy Policy',
                        url: AppUrlsFitnessZone.prPol,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              SettingsRow(
                title: 'Term of Use',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WebFitnessZone(
                        title: 'Term of use',
                        url: AppUrlsFitnessZone.terUSe,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              SettingsRow(
                title: 'Support',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WebFitnessZone(
                        title: 'Support',
                        url: AppUrlsFitnessZone.supp,
                      ),
                    ),
                  );
                },
              ),
              if (!isBuyPrem) SizedBox(height: 20.h),
              if (!isBuyPrem)
                SettingsRow(
                  title: 'Restore',
                  onTap: () async {
                    await PremiumFitnessZone.buyFitnessZone(context);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsRow extends StatelessWidget {
  const SettingsRow({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStylesFitnessZone.s16W500(),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
              ),
            ],
          ),
          SizedBox(height: 10.h),
          const Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
