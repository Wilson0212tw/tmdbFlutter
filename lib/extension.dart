import 'package:gi_tg/constant.dart';

extension Url on String {
  String getPosterURL([PosterImageURL status = PosterImageURL.ori]) =>
      status.partialUrl + this;
  String getBackDropURL([BackdropImageURL status = BackdropImageURL.ori]) =>
      status.partialUrl + this;
  String getLogoURL([LogoImageURL status = LogoImageURL.ori]) =>
      status.partialUrl + this;
}
