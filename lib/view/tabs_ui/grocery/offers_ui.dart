import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:taskapp/app_config.dart';
import 'package:taskapp/models/offer_model.dart';
import 'package:taskapp/view/shared/colored_container_ui.dart';

class OfferUI extends StatelessWidget {
  const OfferUI({Key? key,required this.items}) : super(key: key);
  final List<Offer>items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        shrinkWrap: true,
        primary: false,
        itemBuilder: (context, index) {
          return Row(
            children: [
              ColoredContainerUi(
                widget: Row(
                  children: [
                    const Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 1.0,
                        )),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            items[index].name,
                            style: Theme.of(context)
                                .textTheme
                                .headline1,
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          //
                          Text(
                              items[index]
                                  .description,
                              style: TextStyle(
                                  color: HexColor('#21114B'),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0)),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              Text(
                                  '\$${items[index].newPrice.toString()}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1),
                              SizedBox(
                                width: MediaQuery.of(context)
                                    .size
                                    .height *
                                    0.025,
                              ),
                              Text(
                                  '\$${items[index].oldPrice.toString()}',
                                  style: const TextStyle(
                                      fontSize: 12.0,
                                      decoration: TextDecoration
                                          .lineThrough,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white))
                              //* Available until 24 December 2020
                              //Theme.of(context).textTheme.headline4),
                              ,
                            ],
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                            Text(
                               items[index].until.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.0)),
                        ],
                      ),
                    ),
                  ],
                ),
                colorBackground:
                appConfig.colorMain.withOpacity(0.4),
                width: MediaQuery.of(context).size.width - 40.0,
                height: MediaQuery.of(context).size.width * 0.3,
                borderValue: 15.0,
                borderColor: Colors.white,
              ),
              const SizedBox(
                width: 20.0,
              )
            ],
          );
        });
  }
}
