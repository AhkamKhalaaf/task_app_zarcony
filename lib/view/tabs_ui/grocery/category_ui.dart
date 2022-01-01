 import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:taskapp/models/category_model.dart';
import 'package:taskapp/view/shared/colored_container_ui.dart';

class CategoryUi extends StatelessWidget {
  const CategoryUi({Key? key,required this.items}) : super(key: key);
  final List<Category>items;
//
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ColoredContainerUi(
                    widget: const SizedBox(
                      width: 1.0,
                    ),
                    colorBackground: HexColor(
                        items[index].color),
                    width: MediaQuery.of(context).size.width * 0.17,
                    height:
                    MediaQuery.of(context).size.width * 0.17,
                    borderValue: 15.0,
                    borderColor: Colors.white,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    items[index].name,
                    style: Theme.of(context).textTheme.headline3,
                  )
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.025,
              )
            ],
          );
        });
  }
}
