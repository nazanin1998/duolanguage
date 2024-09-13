import 'package:flutter/cupertino.dart';
import '../landing/presentation/pages/landing_page.dart';

class MainWrapperPage extends StatefulWidget {
  const MainWrapperPage({super.key});

  @override
  State<MainWrapperPage> createState() => _MainWrapperPageState();
}

class _MainWrapperPageState extends State<MainWrapperPage> {
  @override
  Widget build(BuildContext context) {
    return const LandingPage();
  }
}
