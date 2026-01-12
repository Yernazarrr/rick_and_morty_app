import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  AppIcons._();

  static SvgPicture arrowLeft({Color? color}) =>
      _getSvg('assets/icons/arrowLeft.svg', color);
  static SvgPicture characters({Color? color}) =>
      _getSvg('assets/icons/characters.svg', color);
  static SvgPicture close({Color? color}) =>
      _getSvg('assets/icons/close.svg', color);
  static SvgPicture disableSort({Color? color}) =>
      _getSvg('assets/icons/disableSort.svg', color);
  static SvgPicture episodes({Color? color}) =>
      _getSvg('assets/icons/episodes.svg', color);
  static SvgPicture eye({Color? color}) =>
      _getSvg('assets/icons/eye.svg', color);
  static SvgPicture filter({Color? color}) =>
      _getSvg('assets/icons/filter.svg', color);
  static SvgPicture grid({Color? color}) =>
      _getSvg('assets/icons/grid.svg', color);
  static SvgPicture line({Color? color}) =>
      _getSvg('assets/icons/line.svg', color);
  static SvgPicture locations({Color? color}) =>
      _getSvg('assets/icons/locations.svg', color);
  static SvgPicture password({Color? color}) =>
      _getSvg('assets/icons/password.svg', color);
  static SvgPicture person({Color? color}) =>
      _getSvg('assets/icons/person.svg', color);
  static SvgPicture search({Color? color}) =>
      _getSvg('assets/icons/search.svg', color);
  static SvgPicture settings({Color? color}) =>
      _getSvg('assets/icons/settings.svg', color);
  static SvgPicture sortByAscending({Color? color}) =>
      _getSvg('assets/icons/sortByAscending.svg', color);
  static SvgPicture sortByDescending({Color? color}) =>
      _getSvg('assets/icons/sortByDescending.svg', color);

  static SvgPicture list({Color? color}) =>
      _getSvg('assets/icons/list.svg', color);

  static SvgPicture _getSvg(String path, Color? color) {
    return SvgPicture.asset(
      path,
      colorFilter: color != null
          ? ColorFilter.mode(color, BlendMode.srcIn)
          : null,
    );
  }
}
