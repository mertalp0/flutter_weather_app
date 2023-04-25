import 'package:flutter/material.dart';
import 'package:flutter_havadurumu/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_page.dart';

class LoadingPage extends ConsumerStatefulWidget {
  const LoadingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoadingPageState();
}

class _LoadingPageState extends ConsumerState<LoadingPage> {
  @override
  void initState() {
    ref.read(getAdress);
    Future.delayed(const Duration(seconds: 3)).then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            opacity: 0.8,
            image: AssetImage("assets/bulut.jpg"),
          ),
        ),
        child: const Center(
          child: Text(
            "Lütfen Bekleyin",
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: 25),
          ),
        ));
  }
}
