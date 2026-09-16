import 'package:flutter/material.dart';

/// Central source of truth for all Sellora POS border radii and shapes defined in `design.md`.
class AppRadius {
  AppRadius._();

  // ---------------------------------------------------------------------------
  // Raw Values
  // ---------------------------------------------------------------------------
  /// 6px - Tiny micro-badges, stock level indicator dots
  static const double vXS = 6.0;

  /// 10px - Category icon tiles, quantity toggle steppers
  static const double vSM = 10.0;

  /// 14px - Text input fields, dropdown menus, product thumbnail tiles
  static const double vMD = 14.0;

  /// 18px - Transaction ledger rows, secondary metric cards
  static const double vLG = 18.0;

  /// 24px - Master white cards, modal dialogs, bottom sheet top edges
  static const double vXL = 24.0;

  /// 999px - Primary CTA buttons, filter chips, search bars, nav pills
  static const double vPill = 999.0;

  // ---------------------------------------------------------------------------
  // Radius Objects
  // ---------------------------------------------------------------------------
  static const Radius r6 = Radius.circular(vXS);
  static const Radius r10 = Radius.circular(vSM);
  static const Radius r14 = Radius.circular(vMD);
  static const Radius r18 = Radius.circular(vLG);
  static const Radius r24 = Radius.circular(vXL);
  static const Radius rPill = Radius.circular(vPill);

  // ---------------------------------------------------------------------------
  // BorderRadius Objects
  // ---------------------------------------------------------------------------
  /// 6px radius
  static final BorderRadius xs = BorderRadius.all(r6);

  /// 10px radius
  static final BorderRadius sm = BorderRadius.all(r10);

  /// 14px radius
  static final BorderRadius md = BorderRadius.all(r14);

  /// 18px radius
  static final BorderRadius lg = BorderRadius.all(r18);

  /// 24px radius
  static final BorderRadius xl = BorderRadius.all(r24);

  /// 999px pill radius
  static final BorderRadius pill = BorderRadius.all(rPill);

  // ---------------------------------------------------------------------------
  // ShapeBorder Presets
  // ---------------------------------------------------------------------------
  static const OutlinedBorder shapeXS = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(r6),
  );

  static const OutlinedBorder shapeSM = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(r10),
  );

  static const OutlinedBorder shapeMD = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(r14),
  );

  static const OutlinedBorder shapeLG = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(r18),
  );

  static const OutlinedBorder shapeXL = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(r24),
  );

  static const OutlinedBorder shapePill = StadiumBorder();
}
