import '../../usecase/landing/presentation/pages/landing_page.dart';
import '../../usecase/login/login_page.dart';

class Routes {
  static get routes => {
        LandingPage.route: (context) => const LandingPage(),
        LoginPage.route: (context) => LoginPage(),
      };
}
