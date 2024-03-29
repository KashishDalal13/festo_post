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

  EditableItem({this.imageList, this.add, this.show, this.position, this.top, this.left, this.scale, this.rotation, this.editWidget, this.textStyle});
}
