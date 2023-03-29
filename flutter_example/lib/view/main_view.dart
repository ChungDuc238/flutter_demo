import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_example/dimens/dimens_main_view.dart';
import 'package:flutter_example/dimens/dimens_manager.dart';
import 'package:flutter_example/widget/background_item_widget.dart';
import 'package:flutter_svg/svg.dart';

import 'base_view.dart';

class MainView extends BaseView {
  const MainView({super.key});

  @override
  BaseViewState<MainView> createState() => _MainViewState();
}

class _MainViewState extends BaseViewState<MainView> {

  late DimensMainView viewSize;

  @override
  void createViewModel() {
    DimensManager();
    viewSize = DimensManager.mainDimension;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        DimensManager.mainDimension.allowCalculatorSize(context: context,
            calculatorSizeFunc: () {
              DimensManager.instance.calculatorRatio<MainView>(context);
            });
        return Stack(
          children: [
            BackgroundItemWidget(
              width: viewSize.size,
              height: viewSize.size,
              top: viewSize.topBlue,
              left: viewSize.leftBlue,
              color: Colors.blue.withOpacity(0.4),
            ),
            BackgroundItemWidget(
              width: viewSize.size,
              height: viewSize.size,
              top: viewSize.top,
              left: viewSize.left,
              color: Colors.red.withOpacity(0.55),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 45,
                  sigmaY: 45,
                ),
                child: Container(
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(
                    top: viewSize.positionTop,
                    left: viewSize.positionLeft,
                  ),
                  child: SvgPicture.asset(
                    "assets/svg/swift.svg",
                    height: viewSize.heightImage,
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

}