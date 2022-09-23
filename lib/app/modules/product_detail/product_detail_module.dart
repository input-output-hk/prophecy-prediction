import 'package:flutter_modular/flutter_modular.dart';
import 'package:squidgame/app/modules/product_detail/presenter/product_create_page.dart';
import 'package:squidgame/app/modules/product_detail/presenter/product_detail_page.dart';

import 'presenter/product_detail_store.dart';

class ProductDetailModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProductDetailStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ProductDetailPage(args: args.data)),
    ChildRoute('/create',
        child: (_, args) => ProductCreatePage(args: args.data)),
  ];
}
