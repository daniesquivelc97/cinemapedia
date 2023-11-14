import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedrMoviesProvider.notifier).loadNextPage();
    ref.read(upComingrMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();

    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedrMoviesProvider);
    final upcomingMovies = ref.watch(upComingrMoviesProvider);

    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomAppBar(),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Column(
              children: [
                // const CustomAppbar(),
                MovieSlideShow(movies: slideShowMovies),

                MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'En cines',
                    subtitle: 'Lunes 20',
                    loadNextPage: () => ref
                        .read(nowPlayingMoviesProvider.notifier)
                        .loadNextPage()),

                MovieHorizontalListview(
                    movies: upcomingMovies,
                    title: 'Próximamente',
                    subtitle: 'En este mes',
                    loadNextPage: () => ref
                        .read(upComingrMoviesProvider.notifier)
                        .loadNextPage()),

                MovieHorizontalListview(
                    movies: popularMovies,
                    title: 'Populares',
                    // subTitle: '',
                    loadNextPage: () => ref
                        .read(popularMoviesProvider.notifier)
                        .loadNextPage()),

                MovieHorizontalListview(
                    movies: topRatedMovies,
                    title: 'Mejor calificadas',
                    subtitle: 'Desde siempre',
                    loadNextPage: () => ref
                        .read(topRatedrMoviesProvider.notifier)
                        .loadNextPage()),

                const SizedBox(height: 10),
              ],
            );
          },
          childCount: 1,
        ),
      ),
    ]);
  }
}
