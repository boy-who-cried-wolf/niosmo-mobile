import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('PulseCheck'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Logo
            Image.asset(
              'assets/images/niosmo_logo.png',
              height: 40,
            ),
            const SizedBox(height: 48),
            
            // Step indicator
            Text(
              'STEP 1',
              style: AppTheme.bodyText.copyWith(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'REVIEW',
              style: AppTheme.heading2.copyWith(
                color: AppTheme.primaryColor,
                fontSize: 28,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 16),
            
            // Description
            Text(
              'Congratulations on taking the first step!',
              style: AppTheme.bodyText.copyWith(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Answer a few basic questions in less than 2 mins to get your first PulseCheck results.',
              style: AppTheme.bodyText.copyWith(
                color: Colors.white.withOpacity(0.7),
                fontSize: 14,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            
            const Spacer(),
            
            // Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child: const Text(
                  'Let\'s Go!',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
} 