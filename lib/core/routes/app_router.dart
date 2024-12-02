import 'package:bridgefy/features/categories/presentation/screens/categories_screen.dart';
import 'package:bridgefy/features/categories/presentation/screens/projects_screen.dart';
import 'package:bridgefy/features/consultants/presentation/screens/consultants_screen.dart';
import 'package:bridgefy/features/create_project/presentation/screens/add_project_screen.dart';
import 'package:bridgefy/features/forget_password/persentation/screen/forget_password_screen.dart';
import 'package:bridgefy/features/home/presentation/screens/home_screen.dart';
import 'package:bridgefy/features/layout/presentation/screen/layout_screen.dart';
import 'package:bridgefy/features/notificatoins/presentation/screens/notifications_screen.dart';
import 'package:bridgefy/features/reset_password/presentation/screens/reset_password_screen.dart';
import 'package:bridgefy/features/select_roles/presentation/screens/select_roles_screen.dart';
import 'package:bridgefy/features/sign_in/presentation/screens/sign_in_screen.dart';
import 'package:bridgefy/features/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:bridgefy/features/verfication/presentation/screens/verfication_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter goRouter = GoRouter(
    initialLocation: LayoutScreen.id,
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
        path: SignUpScreen.id,
        name: SignUpScreen.id,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: SelectRolesScreen.id,
        name: SelectRolesScreen.id,
        builder: (context, state) => const SelectRolesScreen(),
      ),
      GoRoute(
        path: ForgetPasswordScreen.id,
        name: ForgetPasswordScreen.id,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
      GoRoute(
        path: VerficationScreen.id,
        name: VerficationScreen.id,
        builder: (context, state) => const VerficationScreen(),
      ),
      GoRoute(
        path: ResetPasswordScreen.id,
        name: ResetPasswordScreen.id,
        builder: (context, state) => const ResetPasswordScreen(),
      ),
      GoRoute(
        path: LayoutScreen.id,
        name: LayoutScreen.id,
        builder: (context, state) {
          var index = state.extra as int?;

          return LayoutScreen(navigatedIndex: index);
        },
      ),
      GoRoute(
        path: CategoriesScreen.id,
        name: CategoriesScreen.id,
        builder: (context, state) => const CategoriesScreen(),
      ),
      GoRoute(
        path: NotificationsScreen.id,
        name: NotificationsScreen.id,
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: ProjectsScreen.id,
        name: ProjectsScreen.id,
        builder: (context, state) {
          final cagtegoryName = state.extra as String;
          return ProjectsScreen(
            categoryName: cagtegoryName,
          );
        },
      ),
      GoRoute(
        path: ConsultantsScreen.id,
        name: ConsultantsScreen.id,
        builder: (context, state) {
          return const ConsultantsScreen();
        },
      ),
      GoRoute(
        path: AddProjectScreen.id,
        name: AddProjectScreen.id,
        builder: (context, state) {
          return const AddProjectScreen();
        },
      ),
    ],
  );
}
