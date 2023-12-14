import 'package:flutter/material.dart';

class GridMessageImagesWidget extends StatelessWidget {
  const GridMessageImagesWidget({
    super.key,
    required this.imagesUrl,
  });

  final List<String> imagesUrl;

  double calculateImageSize(double width) {
    if (imagesUrl.length == 1) return width;
    return (width - 4) / 2;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    var handledImagens = imagesUrl;
    if (handledImagens.length > 4) {
      handledImagens = handledImagens.sublist(0, 4);
    }

    return LayoutBuilder(builder: (_, constraints) {
      return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Wrap(
          spacing: 4,
          runSpacing: 4,
          children: handledImagens.map((e) {
            bool isLastImage = false;
            if (imagesUrl.length > 4 && handledImagens.last == e) {
              isLastImage = true;
            }

            if (isLastImage) {
              return Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Image.network(
                      handledImagens.first,
                      width: calculateImageSize(constraints.maxWidth),
                    ),
                  ),
                  Container(
                    color: Colors.black12,
                    height: calculateImageSize(constraints.maxWidth),
                    width: calculateImageSize(constraints.maxWidth),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: theme.primaryColor,
                        size: 30,
                      ),
                    ),
                  )
                ],
              );
            }

            return ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Image.network(
                handledImagens.first,
                width: calculateImageSize(constraints.maxWidth),
              ),
            );
          }).toList(),
        ),
      );
    });
  }
}
