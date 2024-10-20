import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manga_mogi_app/models/manga.dart';

class MangaDetail extends StatelessWidget {
  const MangaDetail({
    super.key, 
    required this.manga,
    required this.heroTag
  });

  final Manga manga;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          manga.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: CustomScrollView(
        slivers: [
          // MangaPreviewSliver(heroTag: heroTag, manga: manga),

          SliverPersistentHeader(
            delegate: _MyMangaHeader(
              heroTag: heroTag,
              manga: manga,
            ),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 2),
                  alignment: Alignment.topLeft,
                  child: Text(
                    manga.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontFamily: GoogleFonts.oswald().fontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.topLeft,
                  child: Text(
                    manga.japaneseName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: GoogleFonts.oswald().fontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                
                //descripción
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    manga.description * 10,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: GoogleFonts.oswald().fontFamily,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _MyMangaHeader extends SliverPersistentHeaderDelegate {

  final String heroTag;
  final Manga manga;

  const _MyMangaHeader({
    required this.heroTag,
    required this.manga,
  });

  final _minImageSize = 100.0;
  final _maxImageSize = 300.0;

  final _minImageWidth = 70.0;
  final _maxImageWidth = 200.0;

  final _minFontSize = 7.0;
  final _maxFontSize = 10.0;

  
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / maxExtent;
    final imageSize = (_maxImageSize * (1 - percent)).clamp(_minImageSize, _maxImageSize);
    final imageWidth = (_maxImageWidth * (1 - percent)).clamp(_minImageWidth, _maxImageWidth);
    
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.46,
      child: Stack(
        
        children: [
          
          Stack(
           alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/bg_manga.jpg',
                width: MediaQuery.of(context).size.width,
                
                fit: BoxFit.cover,
              ),
              // widget para un offset

              Positioned(
                top: (35 * (1 - percent)).clamp(10, 35),
                left: (MediaQuery.of(context).size.width * 0.365 * (1 - percent - 0.25)).clamp(25, MediaQuery.of(context).size.width * 0.365),
                height: imageSize,
                width: imageWidth,
                child: Hero(
                  tag:  heroTag,
                  child: Image.asset(
                    manga.image,
                    
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              
              Positioned(
                top: (475 * (1 - percent - 0.25 )).clamp(50, 350),
                child: Container(
                  margin:  EdgeInsets.only(
                    left: (percent * 145).clamp(0, 105),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: manga.genres.map((genre) {
                        return SlantedContainer(
                          text: genre,
                          fontSize: (_maxFontSize * (1 - percent)).clamp(_minFontSize, _maxFontSize),
                        );
                      }).toList(),
                    ),
                ),
              ),    
              
            ],
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 400;

  @override
  double get minExtent => 120;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
  
}

// class MangaPreviewSliver extends StatelessWidget {
//   const MangaPreviewSliver({
//     super.key,
    
//   });

//   final String heroTag;
//   final Manga manga;

//   @override
//   Widget build(BuildContext context) {
    
//   }
// }


class SlantedContainer extends StatelessWidget {
  final String text;
  final double fontSize;

  const SlantedContainer({super.key, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BorderPainter(), // El pintor del borde
      child: ClipPath(
        clipper: SymmetricSlantedClipper(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: Colors.white, // Color de fondo
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontFamily: 'Anime Ace',
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class SymmetricSlantedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(10, 0); // Inclinación superior izquierda
    path.lineTo(size.width, 0); // Esquina superior derecha
    path.lineTo(size.width - 10, size.height); // Inclinación inferior derecha
    path.lineTo(0, size.height); // Inclinación inferior izquierda
    path.close(); // Cierra el path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Clase que dibuja el borde
class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(10, 0); // Inclinación superior izquierda
    path.lineTo(size.width, 0); // Esquina superior derecha
    path.lineTo(size.width - 10, size.height); // Inclinación inferior derecha
    path.lineTo(0, size.height); // Inclinación inferior izquierda
    path.close(); // Cierra el pathCierra el path
    

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}