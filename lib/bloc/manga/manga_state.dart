part of 'manga_bloc.dart';

class MangaState extends Equatable {
  
  const MangaState({
    this.mangas = const [],
  });

  final List<Manga> mangas;
    
  @override
  List<Object> get props => [];

  MangaState copyWith({
    List<Manga>? mangas,
  }) {
    return MangaState(
      mangas: mangas ?? this.mangas,
    );
  }
}



