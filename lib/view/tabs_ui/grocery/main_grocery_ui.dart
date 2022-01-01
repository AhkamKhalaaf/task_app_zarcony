import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskapp/app_config.dart';
import 'package:taskapp/controllers/data_controller.dart';
import 'address_ui.dart';
import 'category_ui.dart';
import 'deals_of_day_ui.dart';
import 'offers_ui.dart';

class GroceryUi extends ConsumerWidget {
  const GroceryUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final distance = MediaQuery.of(context).size.height * 0.03;
    final viewModel = watch(getAllData);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 45.0,
            padding: const EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: HexColor('#F4F9FA'),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 1.0, color: HexColor('#CBCBCB'))),
            child: Row(
              children: [
                const ImageIcon(AssetImage('assets/icons/search.png')),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                    child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search in thousands of products',
                      hintStyle: TextStyle(
                          fontSize: 12.0, color: appConfig.colorBlack)),
                )),
              ],
            ),
          ),
          SizedBox(
            height: distance,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.16,
            child: viewModel.addressItemsList.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : AddressUi(items: viewModel.addressItemsList),
          ),
          SizedBox(
            height: distance,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Explore By category ',
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                'See All (36) ',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
          SizedBox(
            height: distance,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.225,
            child: viewModel.categoryItemsList.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : CategoryUi(items:viewModel.categoryItemsList,),
          ),
          SizedBox(
            height: distance,
          ),
          Text(
            'Deals of the Day ',
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            height: distance,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.275,
            child: viewModel.dealItemsList.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : DealsOfDay(items: viewModel.dealItemsList ),
          ),
          SizedBox(
            height: distance,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.3,
            child: viewModel.offerItemsList.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )

                : OfferUI(items:viewModel.offerItemsList),
          ),
          SizedBox(
            height: distance * 2,
          ),
        ],
      ),
    );
  }
}
