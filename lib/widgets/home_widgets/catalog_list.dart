import 'package:flutter/material.dart';
import 'package:flutter_application/models/billu.dart';
import 'package:flutter_application/pages/home_detail.dart';
import 'package:flutter_application/utils/routes.dart';
import 'package:flutter_application/widgets/home_widgets/catalog_item.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () => context.vxNav.push(
                  Uri(path: MyRoutes.homeDetailRoute, queryParameters: {
                    "id": BilluModel.getByPosition(index).id.toString()
                  }),
                  params: BilluModel.getByPosition(index)),
              child: CatalogItem(catalogItem: BilluModel.items[index]));
        },
        itemCount: BilluModel.items.length);
  }
}
