import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'feature_card.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FeatureCard(
            title: 'PulseCheck FREE for a Limited Time',
            description: 'Get free 1-on-1 guidance from our AI Financial Advisor',
            icon: Icons.access_time,
          ),
          
          const SizedBox(height: 32),
          Text(
            'Why Choose PulseCheck?',
            style: AppTheme.heading2,
          ),
          const SizedBox(height: 16),
          
          // Features list
          _buildFeatureItem(Icons.lock, 'Secure, Private & Protected'),
          _buildFeatureItem(Icons.speed, 'Quick & Accurate'),
          _buildFeatureItem(Icons.person, 'Get an AI-led Analysis'),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.cardBackgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppTheme.primaryColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(text, style: AppTheme.bodyText),
          ),
        ],
      ),
    );
  }
} 