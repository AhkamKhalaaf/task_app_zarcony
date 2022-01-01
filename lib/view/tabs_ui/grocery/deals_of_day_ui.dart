import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskapp/app_config.dart';
import 'package:taskapp/controllers/data_controller.dart';
import 'package:taskapp/models/Deal_of_days_model.dart';
import 'package:taskapp/view/shared/colored_container_ui.dart';

class DealsOfDay extends ConsumerWidget {
  const DealsOfDay({Key? key,required this.items }) : super(key: key);
  final List<Deal>items;

  @override
  Widget build(BuildContext context,watch) {
    final viewModel = watch(getAllData);

    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        shrinkWrap: true,
        primary: false,
        itemBuilder: (context, index) {
          return GestureDetector(onTap: (){
             context.read(getAllData).addDealToCart(viewModel.dealItemsList[index]);
          },
            child: Container(
              height: MediaQuery.of(context).size.width * 0.275,
              width: MediaQuery.of(context).size.width * 0.8,
              margin: const EdgeInsets.only(right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    overflow: Overflow.visible,
                    children: [
                      ColoredContainerUi(
                        widget: const SizedBox(
                          width: 1.0,
                        ),
                        colorBackground: HexColor(
                            viewModel.dealItemsList[index].color),
                        width:
                        MediaQuery.of(context).size.width * 0.275,
                        height:
                        MediaQuery.of(context).size.width * 0.275,
                        borderValue: 15.0,
                        borderColor: Colors.white,
                      ),
                      Positioned(
                          left: -5.0,
                          child: GestureDetector(onTap: (){
                            context.read(getAllData).addAndDeleteFromFavorite(viewModel.dealItemsList[index]);

                          },
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white),
                              child:viewModel.dealItemsList[index].isFavorite?Icon(
                                Icons.favorite,
                                color: appConfig.colorMain,
                                size: 15.0,
                              ): Icon(
                                Icons.favorite_border,
                                color: appConfig.colorText,
                                size: 15.0,
                              ),
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    width:
                    MediaQuery.of(context).size.height * 0.0125,
                  ),
                  Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            viewModel.dealItemsList[index].name,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Text(
                            viewModel.dealItemsList[index].pieces,
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Row(
                            children: [
                              ImageIcon(
                                const AssetImage('assets/icons/loc.png'),
                                size: 10.0,
                                color: appConfig.colorText,
                              ),
                              SizedBox(
                                width:
                                MediaQuery.of(context).size.height *
                                    0.01,
                              ),
                              Text(
                                viewModel.dealItemsList[index].place,
                                style:
                                Theme.of(context).textTheme.headline3,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                  '\$${viewModel.dealItemsList[index].newPrice.toString()}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1),
                              SizedBox(
                                width:
                                MediaQuery.of(context).size.height *
                                    0.025,
                              ),
                              Text(
                                  '\$${viewModel.dealItemsList[index].oldPrice.toString()}',
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      decoration:
                                      TextDecoration.lineThrough,
                                      fontWeight: FontWeight.bold,
                                      color: appConfig.colorText))
                              //Theme.of(context).textTheme.headline4)
                            ],
                          )
                        ],
                      )),
                ],
              ),
            ),
          );
        });
  }
}
