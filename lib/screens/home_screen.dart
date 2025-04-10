import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/hero_section.dart';
import '../widgets/features_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Row(
          children: [
            const Text('Welcome'),
            const Spacer(),
            CircleAvatar(
              backgroundColor: AppTheme.cardBackgroundColor,
              child: IconButton(
                icon: const Icon(Icons.person_outline),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroSection(),
            FeaturesSection(),
          ],
        ),
      ),
    );
  }
} 