import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOutCubic,
    ));

    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Privacy Policy'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Privacy Policy',
                  style: AppTheme.heading1,
                ),
                const SizedBox(height: 8),
                Text(
                  'Effective Date: November 1, 2024',
                  style: AppTheme.caption,
                ),
                const SizedBox(height: 24),
                Text(
                  'Welcome to NIOSMO! Your privacy is important to us, and we are committed to protecting your personal information. This Privacy Policy explains how we collect, use, and share information gathered through our website, including details captured in the PulseCheck quiz, contact forms, and any other interactions you may have with us online.',
                  style: AppTheme.bodyText,
                ),
                const SizedBox(height: 32),
                _buildSection(
                  '1. Information We Collect',
                  'We collect the following types of information from you:',
                  [
                    'Personal Information: This may include your name, email address, contact details, and any additional information you provide in quizzes, forms, or direct communications with us.',
                    'Financial Information: As part of the PulseCheck quiz, we may ask for information related to your financial habits, property, assets, employment status, and general health.',
                    'Usage Data: We may collect information about your interactions with our website, such as pages visited, time spent, and activities on the site, to improve our services.',
                  ],
                ),
                _buildSection(
                  '2. How We Use Your Information',
                  'We use your information for the following purposes:',
                  [
                    'Providing and Improving Services: Your details help us deliver, customise, and improve the PulseCheck™ and other services on our platform.',
                    'Re-Marketing and Communication: We may use your contact information to re-market our services, notify you of updates, and send you relevant financial tips, offers, and announcements that may interest you.',
                    'Partner Service Sourcing: With your consent, we may share your information with select partners from our provider network to offer you additional financial services and products that complement your needs.',
                    'Customer Support: We use your information to respond to queries, manage requests, and provide customer support.',
                  ],
                ),
                _buildSection(
                  '3. How We Share Your Information',
                  'Your privacy is a priority, and we share your information only as outlined below:',
                  [
                    'Service Providers and Partners: We may share relevant information with trusted service providers, financial institutions, and network partners to deliver requested services, personalised offers, or other information that may be beneficial to you.',
                    'Marketing Partners: With your consent, we may share your information with marketing partners who assist us in targeting relevant offers and financial products based on your interests and needs.',
                    'Legal Compliance: We may disclose your information if required by law or in response to legal processes, such as a subpoena, court order, or government request.',
                  ],
                ),
                _buildSection(
                  '4. Your Privacy Rights',
                  'You have rights regarding the personal information we collect, including:',
                  [
                    'Access and Correction: You may request access to your information and correct any inaccuracies.',
                    'Opt-Out: You can opt out of receiving marketing communications from us by following the unsubscribe instructions in emails or contacting us directly.',
                    'Data Deletion: You may request the deletion of your data from our records, subject to any legal obligations we may have.',
                  ],
                ),
                _buildSection(
                  '5. Security of Your Information',
                  'We implement reasonable security measures to protect your personal information against unauthorised access, disclosure, or misuse. While we strive to safeguard your data, please note that no method of transmission over the internet is completely secure, and we cannot guarantee absolute security.',
                  [],
                ),
                _buildSection(
                  '6. Third-Party Links',
                  'Our website may contain links to third-party websites. This Privacy Policy applies solely to information collected by NIOSMO. We are not responsible for the privacy practices or content of third-party sites, and we encourage you to review the privacy policies of any external sites you visit.',
                  [],
                ),
                _buildSection(
                  '7. Changes to this Privacy Policy',
                  'NIOSMO may update this Privacy Policy periodically to reflect changes in our practices or for legal reasons. We encourage you to review this policy regularly. Your continued use of our website constitutes acceptance of these changes.',
                  [],
                ),
                _buildSection(
                  '8. Contact Us',
                  'If you have any questions about this Privacy Policy or your personal information, please contact us at:',
                  [],
                ),
                const SizedBox(height: 16),
                Text(
                  'NIOSMO\nsupport@niosmo.com',
                  style: AppTheme.bodyText,
                ),
                const SizedBox(height: 32),
                Text(
                  'Thank you for trusting NIOSMO with your financial well-being. We are committed to maintaining your privacy and providing a secure and personalised experience.',
                  style: AppTheme.bodyText,
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String description, List<String> bullets) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 800),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTheme.heading3,
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                  style: AppTheme.bodyText,
                ),
                if (bullets.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  ...bullets.map((bullet) => Padding(
                    padding: const EdgeInsets.only(left: 16, bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('• ', style: AppTheme.bodyText),
                        Expanded(
                          child: Text(bullet, style: AppTheme.bodyText),
                        ),
                      ],
                    ),
                  )),
                ],
                const SizedBox(height: 32),
              ],
            ),
          ),
        );
      },
    );
  }
} 