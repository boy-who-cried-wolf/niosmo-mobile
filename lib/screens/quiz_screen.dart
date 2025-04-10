import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class QuizScreen extends StatefulWidget {
  final String firstName;
  final String email;

  const QuizScreen({
    super.key,
    required this.firstName,
    required this.email,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<String> financialConcerns = [
    'Income',
    'Mortgage',
    'Living Expenses',
    'Rent',
    'Savings',
    'Retirement',
    'Family',
    'Other',
  ];

  String? selectedConcern;
  int currentStep = 2; // Starting from step 2 after user details
  final int totalSteps = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('PulseCheck'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Progress Bar
          Container(
            height: 4,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: LinearProgressIndicator(
                value: currentStep / totalSteps,
                backgroundColor: Colors.white.withOpacity(0.2),
                valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '$currentStep / $totalSteps',
                style: AppTheme.caption.copyWith(color: Colors.white70),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Logo
          Image.asset(
            'assets/images/my_money_medic_logo.png',
            height: 40,
          ),
          const SizedBox(height: 32),

          // Question
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'What are your major financial concerns?',
              style: AppTheme.heading2,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 32),

          // Options
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: financialConcerns.length,
              itemBuilder: (context, index) {
                final concern = financialConcerns[index];
                final isSelected = selectedConcern == concern;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: InkWell(
                    onTap: () => setState(() => selectedConcern = concern),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.cardBackgroundColor,
                        border: Border.all(
                          color: isSelected ? AppTheme.primaryColor : Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        concern,
                        style: AppTheme.bodyText.copyWith(
                          color: isSelected ? AppTheme.primaryColor : Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Navigation Buttons
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Back'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: selectedConcern != null
                        ? () {
                            // TODO: Handle next step
                          }
                        : null,
                    child: const Text('Next'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
