import 'package:flutter_triple/flutter_triple.dart';
import 'package:squidgame/app/modules/product_detail/presenter/product_detail_arguments.dart';

class HomeStore extends NotifierStore<Exception, int> {
  HomeStore() : super(0);

  final List<ProductDetailArguments> itens = [
    ProductDetailArguments(
        name: 'Chapter',
        assetImage: 'asset/image/avatar4.png',
        prophecy: 'ToDo Ben'),
    ProductDetailArguments(
        name: 'Formal Methods',
        assetImage: 'asset/image/avatar1.png',
        prophecy: 'ToDo James'),
    ProductDetailArguments(
        name: 'Cryptogophy',
        assetImage: 'asset/image/avatar2.png',
        prophecy: 'ToDo Inigo'),
    ProductDetailArguments(
        name: 'Cardano',
        assetImage: 'asset/image/avatar3.png',
        prophecy: 'ToDo Duncan'),
    ProductDetailArguments(
        name: 'Atala',
        assetImage: 'asset/image/avatar5.png',
        prophecy: 'ToDo Ben'),
    ProductDetailArguments(
        name: 'Lace',
        assetImage: 'asset/image/avatar6.png',
        prophecy: 'ToDo Bruno'),
  ];

  final List<ProductDetailArguments> itens2 = [
    ProductDetailArguments(
        name: 'Forums',
        assetImage: 'asset/image/recent1.png',
        prophecy: 'ToDo Ger'),
    ProductDetailArguments(
        name: 'Concur',
        assetImage: 'asset/image/recent2.png',
        prophecy: 'ToDo Kelly'),
  ];
}
