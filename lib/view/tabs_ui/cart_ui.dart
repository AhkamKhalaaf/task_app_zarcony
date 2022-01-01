import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskapp/app_config.dart';
import 'package:taskapp/controllers/data_controller.dart';
import 'package:taskapp/view/shared/colored_container_ui.dart';


class CartUi extends ConsumerWidget {
  const CartUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final viewModel = watch(getAllData);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cart ',
          style: Theme.of(context).textTheme.headline2,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.025,
        ),
        Expanded(
            child: viewModel.cartItemsList.isEmpty
                ?   Center(
                    child: Text('No Deals added ',style: Theme.of(context).textTheme.headline1,),
                  )
                : ListView.builder(
                    itemCount: viewModel.cartItemsList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ColoredContainerUi(
                                height:
                                    MediaQuery.of(context).size.width * 0.175,
                                width:
                                    MediaQuery.of(context).size.width * 0.175,
                                colorBackground:HexColor(viewModel.cartItemsList[index].color),
                                borderColor: Colors.white,
                                borderValue: 15.0,
                                widget: const SizedBox(
                                  width: 1.0,
                                ),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.height * 0.025,
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    viewModel.cartItemsList[index].name,
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Text(
                                    viewModel.cartItemsList[index].pieces,
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Text(
                                    '\$${viewModel.cartItemsList[index].newPrice.toString()}',
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  )
                                ],
                              )),
                              Row(
                                children: [
                                  GestureDetector(onTap: (){
                                    context.read(getAllData).minusCounterDeal(viewModel.cartItemsList[index]);

                                  },
                                    child: ColoredContainerUi(
                                      widget: Icon(
                                        Icons.remove,
                                        color: appConfig.iconAddColor,
                                      ),
                                      colorBackground: appConfig.iconAddColor
                                          .withOpacity(0.25),
                                      width: MediaQuery.of(context).size.height *
                                          0.0425,
                                      height: MediaQuery.of(context).size.height *
                                          0.0425,
                                      borderValue: 5.0,
                                      borderColor: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Text(
                                    viewModel.cartItemsList[index].count.toString(),
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  GestureDetector(onTap: (){
                                    context.read(getAllData).plusCounterDeal(viewModel.cartItemsList[index]);

                                  },
                                    child: ColoredContainerUi(
                                      widget: Icon(
                                        Icons.add,
                                        color: appConfig.iconAddColor,
                                      ),
                                      colorBackground: appConfig.iconAddColor
                                          .withOpacity(0.25),
                                      width: MediaQuery.of(context).size.height *
                                          0.0425,
                                      height: MediaQuery.of(context).size.height *
                                          0.0425,
                                      borderValue: 5.0,
                                      borderColor: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                        ],
                      );
                    }))
      ],
    );
  }
}
