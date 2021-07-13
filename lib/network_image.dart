import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImageCache extends StatelessWidget {
  final String? image;
  final BoxFit? fit;
  final double? width, height;
  const NetworkImageCache(this.image,
      {Key? key, this.fit, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Image.network(
    //   image!,
    //   // placeholder: (context, url) => Center(child: CircularProgressIndicator()),
    //   // errorWidget: (context, url, error) => Image.asset('assets/placeholder.jpg',fit: BoxFit.cover,),
    //   fit: fit,
    //   width: width,
    //   height: height,
    // );
    return CachedNetworkImage(
      imageUrl: image!,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
