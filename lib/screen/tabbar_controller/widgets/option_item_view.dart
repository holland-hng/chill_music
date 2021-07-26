import 'package:chill_music/core/tools/app_navigator.dart';
import 'package:chill_music/core/widgets/bouncing_button.dart';
import 'package:chill_music/screen/library/library_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum OptionItemType {
  download,
  favorite,
  history,
  rate,
}

class OptionItemView extends StatefulWidget {
  final OptionItemType type;
  const OptionItemView({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  _OptionItemViewState createState() => _OptionItemViewState(type);
}

class _OptionItemViewState extends State<OptionItemView> {
  final OptionItemType type;
  late IconData _iconData;
  late String _title;
  late double _iconSize;

  _OptionItemViewState(this.type);

  @override
  void initState() {
    switch (type) {
      case OptionItemType.download:
        _iconData = Icons.folder;
        //_iconData = Icons.downloading_outlined;
        _title = "Library";
        _iconSize = 25;
        break;
      case OptionItemType.favorite:
        _iconData = CupertinoIcons.heart_fill;
        _title = "Favorite";
        _iconSize = 25;
        break;
      case OptionItemType.history:
        _iconData = Icons.history;
        _title = "History";
        _iconSize = 25;
        break;
      case OptionItemType.rate:
        _iconData = Icons.star;
        _title = "Rate Chill Music";
        _iconSize = 27;
        break;

      default:
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BouncingButton(
      onTap: () {
        Navigator.pop(context);
        switch (type) {
          case OptionItemType.download:
            AppNavigator.push(
              context,
              LibraryScreen(),
            );
            break;
          default:
        }
      },
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                _iconData,
                size: _iconSize,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                _title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
