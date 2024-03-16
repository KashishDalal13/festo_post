import 'package:flutter/material.dart';
import 'package:stack_board/stack_board.dart';

class CustomItem extends StackBoardItem {
  final Widget childWidget;

  const CustomItem({
    required this.childWidget,
    Future<bool> Function()? onDel,
    int? id,
  }) : super(child: childWidget, onDel: onDel, id: id);

  @override // <==== must
  CustomItem copyWith({
    CaseStyle? caseStyle,
    Widget? child,
    int? id,
    Future<bool> Function()? onDel,
    dynamic Function(bool)? onEdit,
    bool? tapToEdit,
  }) =>
      CustomItem(
        onDel: onDel,
        id: id,
        childWidget: child ?? Text("custom item"),
      );
}
