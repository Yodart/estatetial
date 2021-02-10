import 'package:flutter/material.dart';
import 'package:spacex/helpers/ui_scale.dart';
import 'package:spacex/helpers/ui_text.dart';

// ignore: must_be_immutable
class CustomTabs extends StatefulWidget {
  int index;
  Function(int) onChange;
  CustomTabs({@required this.index, this.onChange});
  @override
  _CustomTabsState createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabs> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            if (widget.index == 0) return;
            setState(() => widget.index = 0);
            widget.onChange(0);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIText(
                'Upcoming',
                fontSize: UIScale.width(4.5),
                fontWeight: FontWeight.w600,
                color: widget.index == 0 ? Color(0xffFF003D) : Colors.black.withOpacity(0.59),
              ),
              Container(
                  height: UIScale.width(1),
                  width: UIScale.width(15),
                  margin: EdgeInsets.only(top: UIScale.width(2)),
                  decoration: BoxDecoration(
                    color: widget.index == 0 ? Color(0xffFF003D) : Colors.transparent,
                    borderRadius: BorderRadius.circular(UIScale.width(1)),
                  ))
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            if (widget.index == 1) return;
            setState(() => widget.index = 1);
            widget.onChange(1);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UIText(
                'Launches',
                fontSize: UIScale.width(4.5),
                fontWeight: FontWeight.w600,
                color: widget.index == 1 ? Color(0xffFF003D) : Colors.black.withOpacity(0.59),
              ),
              Container(
                  height: UIScale.width(1),
                  width: UIScale.width(15),
                  margin: EdgeInsets.only(top: UIScale.width(2)),
                  decoration: BoxDecoration(
                    color: widget.index == 1 ? Color(0xffFF003D) : Colors.transparent,
                    borderRadius: BorderRadius.circular(UIScale.width(1)),
                  ))
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            if (widget.index == 2) return;
            setState(() => widget.index = 2);
            widget.onChange(2);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              UIText(
                'Rockets',
                fontSize: UIScale.width(4.5),
                fontWeight: FontWeight.w600,
                color: widget.index == 2 ? Color(0xffFF003D) : Colors.black.withOpacity(0.59),
              ),
              Container(
                  height: UIScale.width(1),
                  width: UIScale.width(15),
                  margin: EdgeInsets.only(top: UIScale.width(2)),
                  decoration: BoxDecoration(
                    color: widget.index == 2 ? Color(0xffFF003D) : Colors.transparent,
                    borderRadius: BorderRadius.circular(UIScale.width(1)),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
