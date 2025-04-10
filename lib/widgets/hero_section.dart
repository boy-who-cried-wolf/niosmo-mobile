import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../screens/review_screen.dart';
import 'background_pattern.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      child: BackgroundPattern(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Feeling Financially Stressed?',
                style: AppTheme.heading1.copyWith(
                  fontSize: 40,
                  height: 1.2,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.cardBackgroundColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: AppTheme.bodyText.copyWith(
                      fontSize: 20,
                      height: 1.5,
                      color: Colors.white.withOpacity(0.8),
                    ),
                    children: [
                      const TextSpan(text: 'You are not alone. Get a '),
                      TextSpan(
                        text: 'PulseCheck',
                        style: AppTheme.bodyText.copyWith(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      const TextSpan(text: ' with '),
                      TextSpan(
                        text: 'MyMoneyMedic',
                        style: AppTheme.bodyText.copyWith(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      const TextSpan(text: ' today. '),
                      TextSpan(
                        text: 'Get Better',
                        style: AppTheme.bodyText.copyWith(
                          fontSize: 20,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReviewScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    foregroundColor: Colors.black,
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                  ),
                  child: Text(
                    'Get Your FREE Pulse Check Now',
                    style: AppTheme.bodyText.copyWith(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 