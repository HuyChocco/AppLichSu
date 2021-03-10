import 'package:flutter/material.dart';
import 'package:hisapp/components/place_card.dart';
import 'package:hisapp/components/section_title.dart';
//import 'package:hisapp/models/TravelSpot.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:provider/provider.dart';
import 'package:hisapp/providers/HisEventProvider.dart';

class PopularPlaces extends StatelessWidget {
  const PopularPlaces({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final history_events =
        Provider.of<HisEventProvider>(context, listen: false).events;
    return Column(
      children: [
        SectionTitle(
          title: "Giai đoạn lịch sử",
          press: () {},
        ),
        VerticalSpacing(of: 20),
        SingleChildScrollView(
          // clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                history_events.length,
                (index) => Padding(
                  padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(kDefaultPadding)),
                  child: PlaceCard(
                    key: UniqueKey(),
                    event: history_events[index],
                    press: () {
                      Navigator.of(context).pushNamed(
                        '/event-screen',
                        arguments: {
                          'link': history_events[index].url,
                        },
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(kDefaultPadding),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
