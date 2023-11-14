import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({Key? key, required this.currentIndex})
      : super(key: key);

  final int currentIndex;

  void _onItemTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      case 2:
        context.go('/home/2');
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: currentIndex,
      onTap: (value) => _onItemTap(context, value),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_max,
          ),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.label_outline,
          ),
          label: 'Categorías',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite_outline,
          ),
          label: 'Favoritos',
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class CustomBottomNavigation extends StatelessWidget {
//   const CustomBottomNavigation({Key? key}) : super(key: key);

//   int _getCurrentIndex(BuildContext context) {
//     final String location = GoRouterState.of(context).location;

//     switch (location) {
//       case '/':
//         return 0;
//       case '/categories':
//         return 1;
//       case '/favorites':
//         return 2;
//       default:
//         return 0;
//     }
//   }

//   void _onItemTap(BuildContext context, int index) {
//     switch (index) {
//       case 0:
//         context.go('/');
//         break;
//       case 1:
//         context.go('/categories');
//         break;
//       case 2:
//         context.go('/favorites');
//         break;
//       default:
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       elevation: 0,
//       currentIndex: _getCurrentIndex(context),
//       onTap: (value) => _onItemTap(context, value),
//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(
//             Icons.home_max,
//           ),
//           label: 'Inicio',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(
//             Icons.label_outline,
//           ),
//           label: 'Categorías',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(
//             Icons.favorite_outline,
//           ),
//           label: 'Favoritos',
//         ),
//       ],
//     );
//   }
// }
