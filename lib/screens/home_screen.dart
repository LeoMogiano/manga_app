import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:manga_mogi_app/bloc/blocs.dart';
import 'package:manga_mogi_app/core/native_mogi_channel.dart';
import 'package:manga_mogi_app/style/homebg_style.dart';
import 'package:manga_mogi_app/widgets/widgets.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  
  @override
  Widget build(BuildContext context) {

    final mangaBloc = context.watch<MangaBloc>();
    
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Mogi',
                style: TextStyle(
                  
                  fontFamily: GoogleFonts.oswald().fontFamily,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
              // const Spacer(),
              //  IconButton(
              //   onPressed: () async {

              //     final version = await NativeMogiChannel.getPlatformVersion();
                  

              //   },
              //   icon:  const Icon(
              //     Icons.book,
              //     color: Colors.white,
              //   ),
              // ),

            ],
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
      decoration: customGradientDec(),
      child: DotsPainterBg(
        child: SingleChildScrollView(
          child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 1.2,
                        fontFamily: GoogleFonts.oswald().fontFamily,
                        fontSize: 24,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 28,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      contentPadding: EdgeInsets.zero
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    'TOP-10 SUGGESTIONS',
                    style: TextStyle(
                      fontFamily: 'Anime Ace',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      // fontFamily: 'Anime Ace',
                      // fontWeight: FontWeight.bold,
                      // color: Colors.white
                    ),
                  ),
                ),
          
          
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: CustomCarousel(
                    mangas: mangaBloc.state.mangas,
                  ),
                ),
          
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 20, top: 10),
                  child: const Text(
                    'ALL MANGA',
                    style: TextStyle(
                      fontFamily: 'Anime Ace',
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
          
                // grid view
          
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.58,
                  ),
                  itemCount: mangaBloc.state.mangas.length,
                  itemBuilder: (context, index) {
                    return MangaWidget(manga: mangaBloc.state.mangas[index]);
                  },
                ),
          
              ],
              
            ),
        )
        ),
      ),
    );
  }

 
}

