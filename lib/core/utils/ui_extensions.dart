import 'package:flutter/material.dart';

/// اختصارات حديثة لتقليل الكود إلى أقل حد ممكن (DRY)
extension PaddingExt on Widget {
  Widget p(double v) => Padding(padding: EdgeInsets.all(v), child: this);
  Widget px(double v) => Padding(padding: EdgeInsets.symmetric(horizontal: v), child: this);
  Widget py(double v) => Padding(padding: EdgeInsets.symmetric(vertical: v), child: this);
  Widget pOnly({double t=0, double b=0, double l=0, double r=0}) => 
      Padding(padding: EdgeInsets.only(top: t, bottom: b, left: l, right: r), child: this);
}

extension GapExt on num {
  SizedBox get gap => SizedBox(width: toDouble(), height: toDouble());
  SizedBox get gapH => SizedBox(width: toDouble());
  SizedBox get gapV => SizedBox(height: toDouble());
}
