import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'privacy_policy_screen.dart';
import 'quiz_screen.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _emailController = TextEditingController();
  bool _agreeToEmail = false;
  bool _showErrors = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    setState(() => _showErrors = true);
    if (_formKey.currentState!.validate() && _agreeToEmail) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => QuizScreen(
            firstName: _firstNameController.text,
            email: _emailController.text,
          ),
        ),
      );
    }
  }

  void _showPrivacyPolicy(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const PrivacyPolicyScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.backgroundColor,
      padding: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Enter your details below to start your PulseCheck',
              style: AppTheme.heading2,
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _firstNameController,
              style: AppTheme.bodyText,
              decoration: InputDecoration(
                labelText: 'First Name',
                labelStyle: AppTheme.bodyText.copyWith(color: AppTheme.greyTextColor),
                filled: true,
                fillColor: AppTheme.cardBackgroundColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                errorStyle: AppTheme.caption.copyWith(color: Colors.red),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your first name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              style: AppTheme.bodyText,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: AppTheme.bodyText.copyWith(color: AppTheme.greyTextColor),
                filled: true,
                fillColor: AppTheme.cardBackgroundColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                errorStyle: AppTheme.caption.copyWith(color: Colors.red),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Checkbox(
                    value: _agreeToEmail,
                    onChanged: (value) => setState(() => _agreeToEmail = value ?? false),
                    activeColor: AppTheme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Email me my PulseCheck result!',
                    style: AppTheme.bodyText,
                  ),
                ),
              ],
            ),
            if (_showErrors && !_agreeToEmail)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'Please agree to receive your PulseCheck result',
                  style: AppTheme.caption.copyWith(color: Colors.red),
                ),
              ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _handleSubmit,
                child: const Text('Start'),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'The PulseCheck is a general assessment tool and should not be considered financial advice. All information is secured and confidential.',
              style: AppTheme.caption,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Center(
              child: TextButton(
                onPressed: () => _showPrivacyPolicy(context),
                child: const Text('Privacy Policy'),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 