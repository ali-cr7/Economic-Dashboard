/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/app_icon (2).png
  AssetGenImage get appIcon2 =>
      const AssetGenImage('assets/images/app_icon (2).png');

  /// File path: assets/images/auth_background.png
  AssetGenImage get authBackground =>
      const AssetGenImage('assets/images/auth_background.png');

  /// File path: assets/images/auth_background.png
  AssetGenImage get history => const AssetGenImage('assets/images/history.png');

  /// File path: assets/images/auth_background.png
  AssetGenImage get home => const AssetGenImage('assets/images/home.png');

  /// File path: assets/images/auth_background.png
  AssetGenImage get requests =>
      const AssetGenImage('assets/images/requests.png');

  /// File path: assets/images/auth_background.png
  AssetGenImage get profile => const AssetGenImage('assets/images/profile.png');

  /// File path: assets/images/auth_background.png
  AssetGenImage get settings =>
      const AssetGenImage('assets/images/settings.png');

  /// File path: assets/images/auth_background.png
  AssetGenImage get logout => const AssetGenImage('assets/images/logout.png');

  /// File path: assets/images/auth_background.png
  AssetGenImage get profilePhoto =>
      const AssetGenImage('assets/images/profile-photo.png');

  /// File path: assets/images/auth_background.png
  AssetGenImage get up_down => const AssetGenImage('assets/images/up_down.png');

  /// File path: assets/images/auth_background.png
  AssetGenImage get balance => const AssetGenImage('assets/images/balance.png');

  /// File path: assets/images/auth_background.png
  AssetGenImage get discussingCriticize =>
      const AssetGenImage('assets/images/Discussing_criticize.png');
        /// File path: assets/images/auth_background.png
  AssetGenImage get phone =>
      const AssetGenImage('assets/images/phone.png');
        /// File path: assets/images/auth_background.png
  AssetGenImage get message =>
      const AssetGenImage('assets/images/message.png');
        /// File path: assets/images/auth_background.png
  AssetGenImage get edit =>
      const AssetGenImage('assets/images/edit.png');
              /// File path: assets/images/auth_background.png
  AssetGenImage get uploadIcon =>
      const AssetGenImage('assets/images/upload_icon 1.png'); 
                    /// File path: assets/images/auth_background.png
  AssetGenImage get photoICon =>
      const AssetGenImage('assets/images/photo_icon.png'); 
                          /// File path: assets/images/auth_background.png
  AssetGenImage get photos =>
      const AssetGenImage('assets/images/photos.png'); 
                               /// File path: assets/images/auth_background.png
  AssetGenImage get negotiationIcon =>
      const AssetGenImage('assets/images/negotiation (2).png'); 
      AssetGenImage get saveIcon =>
      const AssetGenImage('assets/images/save_icon.png'); 

  /// List of all assets
  List<AssetGenImage> get values => [
    appIcon2,
    authBackground,
    history,
    requests,
    profile,
    home,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
