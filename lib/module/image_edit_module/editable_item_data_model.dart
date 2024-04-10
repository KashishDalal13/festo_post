import 'package:festo_post/app_export.dart';

class EditableItem {
  String? imageList;
  String? add;
  bool? show;
  Offset? position;
  double? top;
  double? left;
  double? scale;
  double? rotation;
  Widget? editWidget;
  TextStyle? textStyle;

  EditableItem({
    this.imageList,
    this.add,
    this.show = false,
    this.position = const Offset(1, 1),
    this.top = 0.0,
    this.left = 0.0,
    this.scale = 1.0,
    this.rotation = 0.0,
    this.editWidget,
    this.textStyle,
  });
}
