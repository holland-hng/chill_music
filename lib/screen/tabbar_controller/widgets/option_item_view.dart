import 'package:chill_music/core/tools/app_navigator.dart';
import 'package:chill_music/core/widgets/bouncing_button.dart';
import 'package:chill_music/screen/download/download_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum OptionItemType {
  download,
  favorite,
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

  _OptionItemViewState(this.type);

  @override
  void initState() {
    switch (type) {
      case OptionItemType.download:
        _iconData = Icons.downloading_outlined;
        _title = "Download";
        break;
      case OptionItemType.favorite:
        _iconData = CupertinoIcons.heart;
        _title = "Favorite";
        break;
      case OptionItemType.rate:
        _iconData = Icons.star_border;
        _title = "Rate Chill Music";
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
              DownloadScreen(),
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
                size: 25,
              ),
              SizedBox(
                width: 10,
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
            height: 15,
          ),
        ],
      ),
    );
  }
}
