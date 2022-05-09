import '../../ui/shared/size_fit.dart';

extension NumFit on num {

  double get px {
    return ZCLSizeFit.setPx(this.toDouble());
  }

  double get rpx {
    return ZCLSizeFit.setRpx(this.toDouble());
  }
}