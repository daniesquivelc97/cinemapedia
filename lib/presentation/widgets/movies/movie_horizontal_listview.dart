import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieHorizontalListview extends StatelessWidget {
  const MovieHorizontalListview({
    Key? key,
    required this.movie,
    this.title,
    this.subtitle,
    this.loadNextPage,
  }) : super(key: key);

  final List<Movie> movie;
  final String? title;
  final String? subtitle;
  final VoidCallback? loadNextPage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (title != null || subtitle != null)
            _Title(
              title: title,
              subtitle: subtitle,
            ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
    this.title,
    this.subtitle,
  }) : super(key: key);

  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null)
            Text(
              title!,
              style: titleStyle,
            ),
          const Spacer(),
          if (subtitle != null)
            FilledButton.tonal(
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              onPressed: () {},
              child: Text(subtitle!),
            ),
        ],
      ),
    );
  }
}
