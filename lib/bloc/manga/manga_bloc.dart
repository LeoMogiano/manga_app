import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:manga_mogi_app/models/manga.dart';

part 'manga_event.dart';
part 'manga_state.dart';

class MangaBloc extends Bloc<MangaEvent, MangaState> {
  MangaBloc() : super(const MangaState()) {
    on<LoadInitialManga>(_loadInitialManga);
    add(const LoadInitialManga());
  }

  void _loadInitialManga(LoadInitialManga event, Emitter<MangaState> emit) {
    final List<Manga> mangas = [
      Manga(
        name: 'Goodbye Eri',
        japaneseName: 'さよならエリ',
        image: 'assets/images/manga1.jpg',
        author: 'Tatsuki Fujimoto',
        description: 'A story about a boy who creates a film to cope with the death of his mother and discovers strange, fantastical elements that blur the lines between fiction and reality.',
        genres: ['Drama', 'Psychological', 'Supernatural'],
      ),

      Manga(
        name: 'Jujutsu Kaisen',
        japaneseName: '呪術廻戦',
        image: 'assets/images/manga4.jpg',
        author: 'Gege Akutami',
        description: 'A high school student, Yuji Itadori, becomes entangled in the world of curses after swallowing a powerful cursed object, leading him to fight evil spirits and protect humanity.',
        genres: ['Shonen', 'Action', 'Dark Fantasy'],
      ),

      Manga(
        name: 'Uzumaki',
        japaneseName: 'うずまき',
        image: 'assets/images/manga6.jpg',
        author: 'Junji Ito',
        description: 'A horror story set in a small town that becomes cursed by spirals, an eerie and strange phenomenon that warps the reality and lives of its residents.',
        genres: ['Horror', 'Psychological', 'Seinen'],
      ),

      Manga(
        name: 'Bleach',
        japaneseName: 'ブリーチ',
        image: 'assets/images/manga2.jpg',
        author: 'Tite Kubo',
        description: 'The story follows Ichigo Kurosaki, a teenager with the ability to see ghosts, who becomes a Soul Reaper to protect humanity from evil spirits known as Hollows.',
        genres: ['Shonen', 'Action', 'Adventure'],
      ),

      Manga(
        name: 'Dr. Stone',
        japaneseName: 'ドクターストーン',
        image: 'assets/images/manga3.jpg',
        author: 'Riichiro Inagaki',
        description: 'After a mysterious event petrifies humanity, Senku Ishigami, a brilliant young scientist, wakes up and uses his knowledge of science to rebuild civilization from scratch.',
        genres: ['Shonen', 'Adventure', 'Sci-Fi'],
      ),

      Manga(
        name: 'Attack on Titan',
        japaneseName: '進撃の巨人',
        image: 'assets/images/manga5.jpg',
        author: 'Hajime Isayama',
        description: 'In a world where humanity is on the brink of extinction, people live behind giant walls to protect themselves from monstrous humanoid creatures known as Titans.',
        genres: ['Shonen', 'Action', 'Dark Fantasy'],
      ),

      Manga(
        name: 'One Piece',
        japaneseName: 'ワンピース',
        image: 'assets/images/manga7.jpg',
        author: 'Eiichiro Oda',
        description: 'Monkey D. Luffy and his pirate crew set out on a grand adventure across the seas in search of the ultimate treasure, the One Piece, while facing powerful enemies and forming strong bonds.',
        genres: ['Shonen', 'Adventure', 'Fantasy'],
      ),

      Manga(
        name: 'Dragon Ball Super',
        japaneseName: 'ドラゴンボール超',
        image: 'assets/images/manga8.jpg',
        author: 'Akira Toriyama, Toyotarou',
        description: 'Following the events of Dragon Ball Z, Goku and his friends face new challenges in the form of powerful enemies from across the multiverse, all while pushing their limits.',
        genres: ['Shonen', 'Action', 'Fantasy'],
      ),

      Manga(
        name: 'Chainsaw Man',
        japaneseName: 'チェンソーマン',
        image: 'assets/images/manga9.jpg',
        author: 'Tatsuki Fujimoto',
        description: 'Denji, a young man with a difficult past, becomes a devil hunter, merging with his pet devil to transform into Chainsaw Man, battling dangerous devils to secure his freedom.',
        genres: ['Shonen', 'Action', 'Horror'],
      ),

      Manga(
        name: 'My Hero Academia',
        japaneseName: '僕のヒーローアカデミア',
        image: 'assets/images/manga10.jpg',
        author: 'Kohei Horikoshi',
        description: 'In a world where most of the population has superpowers called Quirks, Izuku Midoriya, a Quirkless boy, strives to become the greatest hero and protect the innocent.',
        genres: ['Shonen', 'Action', 'Superhero', ],
      ),

    ];

    emit(state.copyWith(mangas: mangas));
  }
}
