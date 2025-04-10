import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'privacy_policy_screen.dart';
import 'quiz_screen.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _emailController = TextEditingController();
  bool _agreeToEmail = false;
  bool _showErrors = false;
  bool _isLoading = false;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

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

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    _fadeController.forward();
    _pulseController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _emailController.dispose();
    _fadeController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    setState(() => _showErrors = true);
    if (_formKey.currentState!.validate() && _agreeToEmail) {
      setState(() => _isLoading = true);
      await Future.delayed(const Duration(milliseconds: 800)); // Simulate loading
      if (!mounted) return;
      
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
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Stack(
            children: [
              // Background gradient and pattern
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppTheme.backgroundColor,
                        AppTheme.backgroundColor.withOpacity(0.9),
                      ],
                    ),
                  ),
                ),
              ),
              // Main content
              SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Welcome card with glass effect
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.white.withOpacity(0.1),
                              Colors.white.withOpacity(0.05),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.1),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShaderMask(
                              shaderCallback: (bounds) => LinearGradient(
                                colors: [
                                  AppTheme.primaryColor,
                                  Colors.white,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(bounds),
                              child: Text(
                                'Welcome to',
                                style: AppTheme.heading2.copyWith(
                                  height: 1.2,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Stack(
                              children: [
                                // Base outline text
                                Text(
                                  'PulseCheck',
                                  style: AppTheme.heading2.copyWith(
                                    height: 1.2,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 2.0
                                      ..shader = LinearGradient(
                                        colors: [
                                          Colors.white.withOpacity(0.2),
                                          AppTheme.primaryColor.withOpacity(0.2),
                                          Colors.white.withOpacity(0.2),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ).createShader(
                                        const Rect.fromLTWH(0, 0, 200, 70),
                                      ),
                                  ),
                                ),
                                // Enhanced flowing gradient effect
                                ShineEffect(
                                  child: Text(
                                    'PulseCheck',
                                    style: AppTheme.heading2.copyWith(
                                      height: 1.2,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      foreground: Paint()
                                        ..shader = LinearGradient(
                                          colors: [
                                            Colors.transparent,
                                            Colors.white.withOpacity(0.9),
                                            AppTheme.primaryColor,
                                            Colors.white.withOpacity(0.9),
                                            Colors.transparent,
                                          ],
                                          stops: const [0.0, 0.3, 0.5, 0.7, 1.0],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ).createShader(
                                          const Rect.fromLTWH(0, 0, 200, 70),
                                        ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Your journey to financial wellness starts here',
                              style: AppTheme.bodyText.copyWith(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Let\'s get started',
                        style: AppTheme.heading3.copyWith(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildAnimatedTextField(
                        controller: _firstNameController,
                        labelText: 'First Name',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      _buildAnimatedTextField(
                        controller: _emailController,
                        labelText: 'Email',
                        keyboardType: TextInputType.emailAddress,
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
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.white.withOpacity(0.1),
                              Colors.white.withOpacity(0.05),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.1),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 18,
                              height: 18,
                              child: TweenAnimationBuilder<double>(
                                duration: const Duration(milliseconds: 200),
                                tween: Tween(begin: 0.0, end: _agreeToEmail ? 1.0 : 0.0),
                                builder: (context, value, child) {
                                  return Transform.scale(
                                    scale: 0.8 + (value * 0.2),
                                    child: Checkbox(
                                      value: _agreeToEmail,
                                      onChanged: (value) => setState(() => _agreeToEmail = value ?? false),
                                      activeColor: AppTheme.primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Email me my PulseCheck result!',
                                style: AppTheme.bodyText.copyWith(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (_showErrors && !_agreeToEmail)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'Please agree to receive your PulseCheck result',
                            style: AppTheme.caption.copyWith(color: Colors.red),
                          ),
                        ),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        height: 44,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppTheme.primaryColor,
                              AppTheme.primaryColor.withOpacity(0.8),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.primaryColor.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                            BoxShadow(
                              color: AppTheme.primaryColor.withOpacity(0.1),
                              blurRadius: 16,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: _isLoading ? null : _handleSubmit,
                            borderRadius: BorderRadius.circular(10),
                            splashColor: Colors.white.withOpacity(0.2),
                            highlightColor: Colors.white.withOpacity(0.1),
                            child: Center(
                              child: _isLoading
                                ? const SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                    ),
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Start Your Journey',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      Icon(
                                        Icons.arrow_forward_rounded,
                                        color: Colors.white.withOpacity(0.8),
                                        size: 14,
                                      ),
                                    ],
                                  ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'The PulseCheck is a general assessment tool and should not be considered financial advice. All information is secured and confidential.',
                              style: AppTheme.caption.copyWith(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Hero(
                              tag: 'privacy-policy',
                              child: TextButton(
                                onPressed: () => _showPrivacyPolicy(context),
                                style: TextButton.styleFrom(
                                  foregroundColor: AppTheme.primaryColor,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                ),
                                child: const Text(
                                  'Privacy Policy',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedTextField({
    required TextEditingController controller,
    required String labelText,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.1),
            Colors.white.withOpacity(0.05),
          ],
        ),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 200),
        tween: Tween(begin: 1.0, end: controller.text.isEmpty ? 1.0 : 1.02),
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: Stack(
              children: [
                TextFormField(
                  controller: controller,
                  style: AppTheme.bodyText.copyWith(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
                    labelText: labelText,
                    labelStyle: AppTheme.bodyText.copyWith(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 14,
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    errorStyle: AppTheme.caption.copyWith(
                      color: Colors.red.withOpacity(0.8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    prefixIcon: Icon(
                      keyboardType == TextInputType.emailAddress
                          ? Icons.email_outlined
                          : Icons.person_outline,
                      color: Colors.white.withOpacity(0.6),
                      size: 20,
                    ),
                  ),
                  validator: validator,
                  onChanged: (value) => setState(() {}),
                ),
                // Shine effect on focus
                if (controller.text.isNotEmpty)
                  Positioned(
                    right: 16,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: Icon(
                        Icons.check_circle_outline,
                        color: AppTheme.primaryColor.withOpacity(0.8),
                        size: 18,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
} 