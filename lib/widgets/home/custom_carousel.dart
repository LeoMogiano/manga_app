import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:manga_mogi_app/models/models.dart';
import 'package:manga_mogi_app/screens/screens.dart';

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({super.key, required this.mangas});

  final List<Manga> mangas;

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    
    return CarouselSlider.builder(
      itemCount: widget.mangas.length,
      itemBuilder: (context, index, realIndex) {
        // Calculamos la distancia relativa del índice con la consideración de infinito
        int relativeIndex = index - _currentIndex;
        if (relativeIndex < 0) {
          relativeIndex += widget.mangas.length;
        }

        bool isCurrent = relativeIndex == 0;
        bool isLeft = relativeIndex == widget.mangas.length - 1;
        bool isRight = !isCurrent && !isLeft;

        return Hero(
          tag: widget.mangas[index].name,
          child: GestureDetector(
            onTap: () {
              if(_currentIndex != index) return;
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => MangaDetail(
                    manga: widget.mangas[index],
                    heroTag: widget.mangas[index].name,
                  ),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );
            },
            child: Transform.rotate(
              angle: isLeft ? -0.12 : isRight ? 0.12 : 0.0, // Rota los elementos a la izquierda o derecha
              child: Opacity(
                opacity: isCurrent ? 1.0 : 0.65, // Ajusta la opacidad de los elementos no actuales
                child: ClipRRect(                
                  child: Image.asset(
                    width: MediaQuery.of(context).size.width * 0.37,
                    height: MediaQuery.of(context).size.height * 0.3,
                    widget.mangas[index].image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(
        initialPage: 1,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        viewportFraction: 0.38,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
