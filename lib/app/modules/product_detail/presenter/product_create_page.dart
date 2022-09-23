import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:squidgame/app/core/round_colors.dart';
import 'package:squidgame/app/core/widget/button/pink_button_widget.dart';
import 'package:squidgame/app/modules/product_detail/presenter/product_detail_arguments.dart';
import 'package:squidgame/app/modules/product_detail/presenter/product_detail_store.dart';
import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final ProductDetailArguments args;
  const ProductCreatePage({Key? key, required this.args}) : super(key: key);
  @override
  ProductCreatePageState createState() => ProductCreatePageState();
}

class ProductCreatePageState extends State<ProductCreatePage> {
  final ProductDetailStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Prophecy Tageline',
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Prophecy',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 14, left: 14, right: 14),
        child: Row(
          children: [
            Expanded(
              child: PinkButtonWidget(
                color: RoundColor.black,
                height: 56,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Upload Image',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                    const Icon(
                      IconlyBroken.shield_done,
                      size: 22,
                      color: Colors.white,
                    ),
                  ],
                ),
                onPressed: () => Modular.to.pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
