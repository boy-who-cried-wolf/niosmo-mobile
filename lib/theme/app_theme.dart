import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color primaryColor = Color(0xFF00E575); // New Main Color
  static const Color backgroundColor = Color(0xFF1A1A1A); // Dark Background
  static const Color cardBackgroundColor = Color(0xFF1C1C1E); // Dark Gray
  static const Color textColor = Color(0xFFFFFFFF); // White
  static const Color greyTextColor = Color(0xFF8E8E93); // Gray
  static const Color linkColor = Color(0xFF00E575); // Updated to match primary color
  
  // Text Styles
  static TextStyle heading1 = GoogleFonts.inter(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: textColor,
  );
  
  static TextStyle heading2 = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: textColor,
  );
  
  static TextStyle heading3 = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: textColor,
  );
  
  static TextStyle bodyText = GoogleFonts.inter(
    fontSize: 16,
    color: textColor,
  );
  
  static TextStyle caption = GoogleFonts.inter(
    fontSize: 14,
    color: greyTextColor,
  );

  static TextStyle linkText = GoogleFonts.inter(
    fontSize: 16,
    color: linkColor,
    decoration: TextDecoration.underline,
  );

  // Theme Data
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: textColor),
        titleTextStyle: heading2,
      ),
      cardTheme: CardTheme(
        color: cardBackgroundColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: heading1,
        displayMedium: heading2,
        titleMedium: heading3,
        bodyLarge: bodyText,
        bodySmall: caption,
      ),
      colorScheme: ColorScheme.dark(
        primary: primaryColor,
        background: backgroundColor,
        surface: cardBackgroundColor,
        onSurface: textColor,
        secondary: primaryColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.black,
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: BorderSide(color: primaryColor),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
} 