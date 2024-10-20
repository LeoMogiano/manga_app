import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_mogi_app/bloc/blocs.dart';

class MultiProviderData extends StatelessWidget {
  const MultiProviderData({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MangaBloc()),
      ],
      child: child
    );
  }
}