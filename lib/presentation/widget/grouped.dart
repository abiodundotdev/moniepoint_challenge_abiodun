import 'package:flutter/material.dart';

class Group extends StatefulWidget {
  const Group({
    super.key,
    required this.children,
    this.alignment = CrossAxisAlignment.start,
  });

  final List<Widget> children;
  final CrossAxisAlignment alignment;

  @override
  State<Group> createState() => _GroupState();
}

class _GroupState extends State<Group> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.children,
      crossAxisAlignment: widget.alignment,
    );
  }
}
