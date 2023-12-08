import 'package:amazcart/AppConfig/app_config.dart';
import 'package:amazcart/utils/styles.dart';
import 'package:amazcart/widgets/animate_widget/elasticIn.dart';
import 'package:flutter/material.dart';

class CustomLoadingWidget extends StatefulWidget {
  const CustomLoadingWidget({Key? key}) : super(key: key);

  @override
  _CustomLoadingWidgetState createState() => _CustomLoadingWidgetState();
}

class _CustomLoadingWidgetState extends State<CustomLoadingWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElasticIn(
      manualTrigger: false,
      animate: true,
      infinite: true,
      controller: (AnimationController) {},
      //  key: key,
      child: CircleAvatar(
        foregroundColor: Color(0xff0e0c75),
        backgroundColor: Color(0xff0e0c75),
        radius: 30,
        child: Container(
          child: Image.asset(
            'assets/images/loadfanous.png',
            width: 30,
            height: 30,
          ),
        ),
      ),
    );
  }
}
