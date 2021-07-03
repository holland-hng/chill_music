import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomTabbar extends StatefulWidget {
  final int? index;
  final bool? isActive;
  const BottomTabbar({Key? key, this.index, this.isActive = false})
      : super(key: key);

  @override
  _BottomTabbarState createState() => _BottomTabbarState(index, isActive);
}

class _BottomTabbarState extends State<BottomTabbar> {
  final int? index;
  final bool? isActive;
  bool? _isActive;
  String? _label;
  Color? _color;
  IconData? _iconData;
  _BottomTabbarState(this.index, this.isActive);

  @override
  void initState() {
    _isActive = isActive;
    _color = _isActive! ? CupertinoColors.white : CupertinoColors.inactiveGray;
    switch (index!) {
      case 0:
        _label = "Home";
        break;
      case 1:
        _label = "Video";
        _iconData = CupertinoIcons.tv_music_note;
        break;
      case 2:
        _label = " Libary";
        _iconData = Icons.folder;
        break;
      case 3:
        _label = "Premium";
        _iconData = CupertinoIcons.headphones;
        break;
      default:
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isActive = !_isActive!;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 26,
            height: 26,
            decoration: index! == 0
                ? BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/icons/icon_home_active.png"),
                    ),
                  )
                : null,
            child: index! != 0
                ? Icon(
                    _iconData,
                    size: 30,
                    color: _color,
                  )
                : null,
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            _label!,
            style: TextStyle(
              fontSize: 10,
              color: _color,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
