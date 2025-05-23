import 'package:cached_network_image/cached_network_image.dart';
import 'package:economic_team_desktop/data/models/request_details_response/id_image.dart';
import 'package:economic_team_desktop/data/models/request_details_response/property_document.dart';
import 'package:economic_team_desktop/data/models/request_details_response/property_image.dart';
import 'package:economic_team_desktop/utility/api_config/api_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyImagesUploader extends StatelessWidget {
  final String title;
  final int maxImages;
  final List<dynamic>? images;

  const PropertyImagesUploader({
    super.key,
    this.title = "Property images:",
    this.maxImages = 8,
    this.images,
  });

  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredImages = images ?? [];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          const Text(
            'Notice: please make the photos clear and real.',
            style: TextStyle(
              color: Color(0x9EF1272A),
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  // TODO: implement image upload
                },
                child: Icon(Icons.upload, size: 30.sp),
              ),
              const SizedBox(height: 10),
              Container(
                width: 400.w,
                height: 300.h,
                decoration: ShapeDecoration(
                  color: const Color(0x60D9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      filteredImages.length + 1 <= maxImages
                          ? filteredImages.length + 1
                          : maxImages,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    if (index < filteredImages.length) {
                      final image = filteredImages[index];
                      final path = _getImagePath(image);

                      if (path == null) {
                        return const Icon(Icons.error);
                      }

                      return GestureDetector(
                        onTap: () {
                          _showFullScreenImage(
                            context,
                            '${APIConfig.baseUrl}$path',
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: '${APIConfig.baseUrl}$path',
                            fit: BoxFit.cover,
                            placeholder:
                                (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                            errorWidget: (context, url, error) {
                              debugPrint('Error loading image: $url, $error');
                              return const Icon(Icons.error);
                            },
                          ),
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () {
                          // TODO: handle adding new image
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.add_a_photo,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showFullScreenImage(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) {
        return GestureDetector(
           onTap: () {
            Navigator.of(context).pop();
          },
          child: Dialog(
            backgroundColor: Colors.transparent,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black,
                ),
                clipBehavior: Clip.hardEdge,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.contain,
                  placeholder:
                      (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String? _getImagePath(dynamic image) {
    try {
      if (image == null) return null;
      if (image is PropertyImage) return image.path;
      if (image is PropertyDocument) return image.path;
      if (image is IdImage) return image.path;
      if (image is Map && image.containsKey('path')) return image['path'];
      if (image is String) return image;
    } catch (e) {
      debugPrint('Failed to get image path: $e');
    }
    return null;
  }
}
