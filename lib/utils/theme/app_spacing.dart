import 'package:flutter/material.dart';

/// Central source of truth for all Sellora POS spacing tokens defined in `design.md`.
/// Strictly employs an 8pt primary grid with a 4pt sub-grid.
class AppSpacing {
  AppSpacing._();

  // ---------------------------------------------------------------------------
  // Raw Dimension Tokens
  // ---------------------------------------------------------------------------
  /// 4px - Badge internal padding, icon-to-badge gap
  static const double xs = 4.0;
  static const double s4 = 4.0;

  /// 8px - Icon-to-text spacing, compact chip gaps
  static const double sm = 8.0;
  static const double s8 = 8.0;

  /// 12px - Card internal row padding, list item gaps
  static const double md = 12.0;
  static const double s12 = 12.0;

  /// 16px - Standard screen horizontal padding, card padding
  static const double lg = 16.0;
  static const double s16 = 16.0;

  /// 20px - Hero balance card internal padding, section gap
  static const double xl = 20.0;
  static const double s20 = 20.0;

  /// 24px - Major vertical section separation
  static const double xxl = 24.0;
  static const double s24 = 24.0;

  /// 32px - Top header spacing, modal top inset
  static const double xxxl = 32.0;
  static const double s32 = 32.0;

  /// 80px - Bottom scroll inset preventing docked bar overlap
  static const double bottomNavInset = 80.0;
  static const double s80 = 80.0;

  // ---------------------------------------------------------------------------
  // Layout Insets & Padding
  // ---------------------------------------------------------------------------
  /// Screen horizontal padding: 16px
  static const double screenHorizontal = 16.0;

  /// Screen vertical padding: 16px
  static const double screenVertical = 16.0;

  /// Screen horizontal padding preset: EdgeInsets.symmetric(horizontal: 16.0)
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: s16);

  /// Screen full insets preset: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0)
  static const EdgeInsets screenInsets = EdgeInsets.symmetric(horizontal: s16, vertical: s16);

  /// Standard card padding: EdgeInsets.all(16.0)
  static const EdgeInsets cardPadding = EdgeInsets.all(s16);

  /// Hero balance card padding: EdgeInsets.all(20.0)
  static const EdgeInsets heroCardPadding = EdgeInsets.all(s20);

  /// Input content padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0)
  static const EdgeInsets inputPadding = EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0);

  /// List item vertical gap: 12.0
  static const double listItemGap = 12.0;

  /// Bottom scroll padding: EdgeInsets.only(bottom: 80.0)
  static const EdgeInsets bottomScrollInset = EdgeInsets.only(bottom: s80);
}
