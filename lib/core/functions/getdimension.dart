import 'package:qcmapp/core/constant/dimension.dart';

double getHeight(double myHeight) {
  return myHeight * AppDimensions.deviceHeight / AppDimensions.defaultHeight;
}

double getWith(double myWith) {
  return myWith * AppDimensions.deviceWith / AppDimensions.defaultWith;
}
