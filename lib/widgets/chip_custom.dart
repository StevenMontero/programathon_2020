import 'package:flutter/material.dart';

class ChipBenefits extends StatefulWidget {
  ChipBenefits(
      {Key key,
      this.onPressed,
      this.color,
      this.icon,
      this.label = '',
      this.isSelected = false})
      : super(key: key);
  final Function(bool slected) onPressed;
  final Color color;
  final IconData icon;
  final String label;
  final bool isSelected;

  @override
  _ChipBenefitsState createState() => _ChipBenefitsState();
}

class _ChipBenefitsState extends State<ChipBenefits> {
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      selectedColor: widget.color,
      disabledColor: Colors.blue,
      label: Text(widget.label),
      onSelected: widget.onPressed,
      selected: widget.isSelected,
      avatar: CircleAvatar(
        child: Icon(widget.icon),
      ),
    );
  }
}

// Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         OutlineButton(
//           onPressed: widget.onPressed,
//           color: widget.color,
//           borderSide: BorderSide(color: widget.color, width: 2),
//           shape: CircleBorder(),
//           child: Icon(widget.icon),
//         ),
//         SizedBox(
//           height: 8.0,
//         ),
//         Text(widget.label)
//       ],
//     );
