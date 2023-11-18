import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_black_hole/flutter_black_hole.dart';

import 'package:flutter_black_hole/flutter_black_hole/pages/Models/models_index.dart';

Widget imageCard({
  required String imageUrl,
  bool localImage = false,
  double elevation = 5,
  EdgeInsetsGeometry margin = EdgeInsets.zero,
  double borderRadius = 7.0,
  double? boxDimension = 55.0,
  ImageProvider? placeholderImage,
  bool selected = false,
  ImageQuality imageQuality = ImageQuality.low,
  Function(Object, StackTrace?)? localErrorFunction,
}) {
  return Card(
    elevation: elevation,
    margin: margin,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    clipBehavior: Clip.antiAlias,
    child: SizedBox.square(
      dimension: boxDimension,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (localImage || imageUrl == '')
            Image(
              fit: BoxFit.cover,
              errorBuilder: (context, error, stacktrace) {
                if (localErrorFunction != null) {
                  localErrorFunction(error, stacktrace);
                }
                return Image(
                  fit: BoxFit.cover,
                  image: placeholderImage ??
                      AssetImage(
                        Utils.assets('images/cover.jpg'),
                      ),
                );
              },
              image: FileImage(
                File(
                  imageUrl,
                ),
              ),
            )
          else
            CachedNetworkImage(
              fit: BoxFit.cover,
              errorWidget: (context, _, __) => Image(
                fit: BoxFit.cover,
                image: placeholderImage ??
                    AssetImage(
                      Utils.assets('images/cover.jpg'),
                    ),
              ),
              imageUrl:
                  UrlImageGetter([imageUrl]).getImageUrl(quality: imageQuality),
              placeholder: (context, url) => Image(
                fit: BoxFit.cover,
                image: placeholderImage ??
                    AssetImage(
                      Utils.assets('images/cover.jpg'),
                    ),
              ),
            ),
          if (selected)
            Container(
              decoration: const BoxDecoration(
                color: Colors.black54,
              ),
              child: const Center(
                child: Icon(
                  Icons.check_rounded,
                ),
              ),
            ),
        ],
      ),
    ),
  );
}
