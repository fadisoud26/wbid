import 'package:wbid/constents/constents.dart';
import 'package:wbid/constents/text_style_constents.dart';
import 'package:flutter/material.dart';

// --------------------------- start -----------------------------------
class RowWithIconInformation extends StatefulWidget {
  const RowWithIconInformation({Key? key, this.icon, this.title, this.value})
      : super(key: key);

  final String? title;
  final String? value;
  final IconData? icon;

  @override
  State<RowWithIconInformation> createState() => _RowWithIconInformationState();
}

class _RowWithIconInformationState extends State<RowWithIconInformation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Icon(
            widget.icon,
            size: 30,
          ),
          sBoxW10,
          Text(
            widget.title ?? '',
            style: f18BlackTextStyle,
          ),
          sBoxW10,
          Text(
            widget.value ?? '',
            style: f18C3TextStyle,
          ),
        ],
      ),
    );
  }
}
//---------------------------------- end -----------------------------------------

//--------------------------------start -------------------------------------------
class RowWithIconAndAvatarCircleInformation extends StatefulWidget {
  const RowWithIconAndAvatarCircleInformation(
      {Key? key, this.icon, this.title, this.img, this.fName, this.lName})
      : super(key: key);

  final String? title, fName, lName;
  final IconData? icon;
  final ImageProvider<Object>? img;

  @override
  State<RowWithIconAndAvatarCircleInformation> createState() =>
      _RowWithIconAndAvatarCircleInformationState();
}

class _RowWithIconAndAvatarCircleInformationState
    extends State<RowWithIconAndAvatarCircleInformation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Icon(
            widget.icon,
            size: 30,
          ),
          sBoxW10,
          Text(
            widget.title ?? '',
            style: f18BlackTextStyle,
          ),
          sBoxW20,
          CircleAvatar(
            radius: 22.0,
            backgroundImage: widget.img,
          ),
          sBoxW10,
          Column(
            children: [
              Text(widget.fName ?? ''),
              Text(widget.lName ?? ''),
            ],
          ),
        ],
      ),
    );
  }
}
