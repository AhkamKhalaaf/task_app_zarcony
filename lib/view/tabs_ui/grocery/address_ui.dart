import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:taskapp/models/address_model.dart';
import 'package:taskapp/view/shared/colored_container_ui.dart';

class AddressUi extends StatelessWidget {
  const AddressUi({Key? key, required this.items}) : super(key: key);
  final List<Address> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        primary: false,
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width * 0.45 - 7.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                    width: 1.0, color: HexColor('#CCCCCC').withOpacity(0.5))),
            child: Row(
              children: [
                ColoredContainerUi(
                  widget: const SizedBox(
                    width: 1.0,
                  ),
                  colorBackground: HexColor(items[index].color),
                  width: MediaQuery.of(context).size.width * 0.11,
                  height: MediaQuery.of(context).size.width * 0.11,
                  borderValue: 10.0,
                  borderColor: HexColor('#CBCBCB'),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[index].name.toString(),
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Text(
                      items[index].region.toString(),
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      items[index].street.toString(),
                      style: Theme.of(context).textTheme.headline3,
                    )
                  ],
                ))
              ],
            ),
          );
        });
  }
}
