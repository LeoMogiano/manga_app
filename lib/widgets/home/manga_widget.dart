import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manga_mogi_app/models/models.dart';
import 'package:manga_mogi_app/screens/screens.dart';

class MangaWidget extends StatelessWidget {
  const MangaWidget({
    super.key,
    required this.manga,
  });

  final Manga manga;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => MangaDetail(
              manga: manga,
              heroTag: '${manga.name}_second',
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
      child: Column(
        children: [
          Hero(
            tag: '${manga.name}_second',
            child: Image.asset(
              manga.image,
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.44,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            manga.name,
            style: const TextStyle(
              fontFamily: 'Anime Ace',
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
      
          Text(
            manga.name,
            style: TextStyle(
              fontFamily: GoogleFonts.oswald().fontFamily,
              color: Colors.grey[700],
              fontSize: 14,
              fontWeight: FontWeight.w900,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          
        ],
      ),
    );
  }
}
