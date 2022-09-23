import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:squidgame/app/core/round_colors.dart';
import 'package:squidgame/app/modules/home/presenter/components/running_drop_widget.dart';
import 'package:squidgame/app/modules/product_detail/presenter/product_detail_arguments.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  _NavBarWidgetState createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget>
    with TickerProviderStateMixin {
  int _previousIndex = 0;
  int selectedIndex = 0;

  late AnimationController _controller;

  final List<IconData> selectedIcons = [
    IconlyBold.home,
    IconlyBold.buy,
    IconlyBold.heart,
    IconlyBold.setting,
  ];

  final List<IconData> unselectedIcons = [
    IconlyLight.home,
    IconlyLight.buy,
    IconlyLight.heart,
    IconlyLight.setting,
  ];

  buildIcon(IconData icon, Color color) {
    return FaIcon(
      icon,
      color: color,
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      //milliseconds: 800
      duration: const Duration(milliseconds: 500),
    )..forward(from: 0.0);
  }

  void _onTap(int index) {
    _controller.forward(from: 0.0);
    setState(() {
      selectedIndex = index;
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _previousIndex = index;
        });
      }
    });
    if (selectedIcons[index] == IconlyBold.setting) {
      Modular.to.pushNamed(
        '/product/create',
        arguments: ProductDetailArguments(
          name: '',
          assetImage: '',
          prophecy: '',
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: RunningDropWidget(
              controller: _controller,
              selectedIndex: selectedIndex,
              previousIndex: _previousIndex,
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                4,
                (index) {
                  if (selectedIndex == index) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: AnimatedBuilder(
                              animation: _controller,
                              builder: (context, child) => GestureDetector(
                                onTap: () => _onTap(index),
                                child: Container(
                                  height: Tween<double>(begin: 0, end: 50)
                                      .animate(
                                        CurvedAnimation(
                                          parent: _controller,
                                          curve: const Interval(0.0, 0.35),
                                        ),
                                      )
                                      .value,
                                  width: Tween<double>(begin: 0, end: 50)
                                      .animate(
                                        CurvedAnimation(
                                          parent: _controller,
                                          curve: const Interval(0.0, 0.35),
                                        ),
                                      )
                                      .value,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      stops: [0.0, .6],
                                      colors: [
                                        RoundColor.red.withOpacity(.2),
                                        RoundColor.red,
                                      ],
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                            child:
                                buildIcon(selectedIcons[index], Colors.white)),
                      ],
                    );
                  }
                  return GestureDetector(
                    onTap: () => _onTap(index),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                          child: buildIcon(
                              unselectedIcons[index], Colors.black54)),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
