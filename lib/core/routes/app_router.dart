import 'package:bridgefy/features/home/presentation/screens/home_page.dart';
import 'package:bridgefy/features/select_roles/presentation/screens/select_roles_screen.dart';
import 'package:bridgefy/features/sign_in/presentation/screens/sign_in_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter goRouter = GoRouter(
    initialLocation: SelectRolesScreen.id,
    routes: [
      GoRoute(
        path: HomeScreen.id,
        name: HomeScreen.id,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: SignInScreen.id,
        name: SignInScreen.id,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: SelectRolesScreen.id,
        name: SelectRolesScreen.id,
        builder: (context, state) => const SelectRolesScreen(),
      ),
    ],
  );
}
