part of 'theme.dart';

class Dimens {
  Dimens._();

  static const buttonHeight = kMinInteractiveDimension + 1;
  static const textFieldHeight = kMinInteractiveDimension;
  static const navigationBarHeight =
      kMinInteractiveDimension + (spacingS * 2) + (spacingXS * 2);
  static const iconBadge = 22.0;

  static const spacingXXS = 4.0;
  static const spacingXS = 8.0;
  static const spacingS = 12.0;
  static const spacingM = 16.0;
  static const spacingL = 20.0;
  static const spacingXL = 24.0;
  static const spacingXXL = 32.0;

  static const radiusXXS = 4.0;
  static const radiusXS = 8.0;
  static const radiusS = 12.0;
  static const radiusM = 16.0;
  static const radiusL = 20.0;
  static const radiusXL = 24.0;
  static const radiusXXL = 32.0;
}

class Durations {
  Durations._();

  static const animatedSwitcher = Duration(milliseconds: 600);
  static const dotAnimation = Duration(milliseconds: 300);
  static const animatedTap = Duration(milliseconds: 300);
  static const searchDelay = Duration(milliseconds: 1000);
  static const buttonTap = Duration(milliseconds: 100);
}
