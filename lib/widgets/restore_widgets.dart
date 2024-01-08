import 'package:active_ally_fitness_zone_250/utils/app_text_styles.dart';
import 'package:active_ally_fitness_zone_250/utils/app_urls.dart';
import 'package:active_ally_fitness_zone_250/utils/premium/premium.dart';
import 'package:active_ally_fitness_zone_250/widgets/web_view_fitess_zone.dart';
import 'package:flutter/material.dart';

class RestoreButtons extends StatelessWidget {
  const RestoreButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        InkWell(
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
          child: Text(
            'Term of Service',
            style: AppTextStylesFitnessZone.s15W400(color: Colors.white),
          ),
        ),
        const Spacer(),
        Container(
          width: 1,
          height: 10,
          color: Colors.white,
        ),
        const Spacer(),
        InkWell(
          onTap: () async {
            await PremiumFitnessZone.buyFitnessZone(context);
          },
          child: Text(
            'Restore',
            style: AppTextStylesFitnessZone.s15W400(color: Colors.white),
          ),
        ),
        const Spacer(),
        Container(
          width: 1,
          height: 10,
          color: Colors.white,
        ),
        const Spacer(),
        InkWell(
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
          child: Text(
            'Privacy Policy',
            style: AppTextStylesFitnessZone.s15W400(color: Colors.white),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
