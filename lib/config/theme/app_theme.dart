import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    brightness: Brightness.light,
    textTheme: AppTextThemes.textTheme,
    scaffoldBackgroundColor: const Color(0xFF232D39),
    dividerTheme: const DividerThemeData(
      thickness: 3,
      color: Color(0xFF1E88F6),
      indent: 32,
      endIndent: 32,
    ),
  );
}

class AppTextThemes {
  static TextTheme textTheme = TextTheme(
    titleLarge: GoogleFonts.roboto(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: const Color(0xFFFCF7FF),
    ),
    bodyLarge: GoogleFonts.openSans(
      fontSize: 96,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      shadows: [
        const Shadow(
          color: Color(0xFF11B5FD),
          offset: Offset(0, 4),
          blurRadius: 25,
        )
      ],
    ),
    bodyMedium: GoogleFonts.openSans(
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.w700,
    ),
    bodySmall: GoogleFonts.openSans(
      color: const Color(0xFFCAE4FF),
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    labelMedium: GoogleFonts.openSans(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: GoogleFonts.openSans(
      color: const Color(0xFFCAE4FF),
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
  );
}
