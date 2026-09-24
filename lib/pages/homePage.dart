import 'package:flutter/material.dart';

import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellora/controller/homePage.controller.dart';
import 'package:sellora/utils/responsive.dart';
import 'package:sellora/utils/theme/app_colors.dart';
import 'package:sellora/utils/theme/app_theme.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  final Homepagecontroller homeController = Get.find<Homepagecontroller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceBackground,
      appBar: appbars(),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: AppTheme.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppTheme.spacingMD),

            // 1. Today's Sales Hero Card
            _buildHeroSalesCard(),
            const SizedBox(height: AppTheme.spacingLG),

            // 2. Three Mini Metric Cards
            _buildMetricCardsRow(),
            const SizedBox(height: AppTheme.spacingLG),

            // 3. Net Profit Card with Trend Sparkline
            _buildNetProfitCard(),
            const SizedBox(height: AppTheme.spacingLG),
            Text("Quick Actions", style: AppTheme.h1),
            const SizedBox(height: AppTheme.spacingLG),
            // Quick actions row
       Obx(
  () => GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: Responsive.isMobileScreen(context) ? 4 : 5,
      crossAxisSpacing: 12,
      mainAxisSpacing: 16,
      childAspectRatio: 0.8,
    ),
    itemCount: homeController.quickActions.length,
    itemBuilder: (context, index) {
      final action = homeController.quickActions[index];

      return quickaction(
        title: action.title,
        icon: action.icon,
        bgColor: action.backgroundColor,
        iconColor: action.iconColor,
        textColor: action.textColor,
        isPrimary: action.isPrimary,
        route: action.route,
        context: context,
      );
    },
  ),
)   ],
        ),
      ),
    );
  }



  Widget _buildHeroSalesCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: AppColors.salesHeroGradient,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4338CA).withOpacity(0.28),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      clipBehavior: Clip
          .antiAlias, //(overflow), toh usko smooth cut (clip) kar diya jaye.
      child: Stack(
        children: [
          // Wave/curve decorative background overlay
          Positioned.fill(child: CustomPaint(painter: _SalesWavePainter())),

          // Foreground Content
          Padding(
            padding: AppTheme.cardPadding,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Left Column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Header Row
                      Row(
                        children: [
                          const Icon(
                            Icons.trending_up_rounded,
                            color: Colors.white,
                            size: 18,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            "Today's Sales",
                            style: AppTheme.bodyLarge.copyWith(
                              color: AppColors.textOnPrimary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppTheme.spacingSM),

                      // Amount
                      Text(
                        "Rs 45,500",
                        style: AppTheme.displayLarge.copyWith(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.5,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Pill Badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.18),
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusPill,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.arrow_upward_rounded,
                              color: Color(0xFF34D399),
                              size: 13,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              "+18.2%",
                              style: AppTheme.bodySmall.copyWith(
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF34D399),
                              ),
                            ),
                            Text(
                              " vs last week",
                              style: AppTheme.bodySmall.copyWith(
                                fontWeight: FontWeight.w400,

                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Right Illustration (Shopping Bag)
                Image.asset(
                  "assets/images/bag.webp",
                  height: 105,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const SizedBox(
                    width: 80,
                    height: 80,
                    child: Icon(
                      Icons.shopping_bag_rounded,
                      size: 60,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 2. THREE MINI METRIC CARDS

  Widget _buildMetricCardsRow() {
    return Row(
      children: [
        // 1. Cash Collected
        Expanded(
          child: _buildMetricCard(
            title: "Cash Collected",
            amount: "Rs 32,800",
            icon: Icons.payments_rounded,
            iconBgColor: AppColors.cardGreenIconBg,
            iconColor: AppColors.cardGreenIcon,
            cardBgColor: AppColors.cardGreenBg,
            borderColor: AppColors.cardGreenBorder,
            dotColor: const Color(0xFF10B981),
          ),
        ),
        const SizedBox(width: 10),

        // 2. Credit (Udhaar)
        Expanded(
          child: _buildMetricCard(
            title: "Credit",
            amount: "Rs 12,700",
            icon: Icons.credit_card_rounded,
            iconBgColor: AppColors.cardBlueIconBg,
            iconColor: AppColors.cardBlueIcon,
            cardBgColor: AppColors.cardBlueBg,
            borderColor: AppColors.cardBlueBorder,
            dotColor: const Color(0xFF3B82F6),
          ),
        ),
        const SizedBox(width: 10),

        // 3. Expenses
        Expanded(
          child: _buildMetricCard(
            title: "Expenses",
            amount: "Rs 2,000",
            icon: Icons.receipt_long_rounded,
            iconBgColor: AppColors.cardRedIconBg,
            iconColor: AppColors.cardRedIcon,
            cardBgColor: AppColors.cardRedBg,
            borderColor: AppColors.cardRedBorder,
            dotColor: const Color(0xFFEF4444),
          ),
        ),
      ],
    );
  }

  //widget card
  Widget _buildMetricCard({
    required String title,
    required String amount,
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required Color cardBgColor,
    required Color borderColor,
    required Color dotColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
        border: Border.all(color: borderColor, width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Icon & Dot row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 18),
              ),
              Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  color: dotColor,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Title
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTheme.badge.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 4),

          // Amount
          Text(
            amount,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.sora(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.3,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  // NET PROFIT CARD WITH SPARKLINE

  Widget _buildNetProfitCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF6FEFA),
        borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
        border: Border.all(color: const Color(0xFFD1FAE5), width: 1.2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left Circular Green Trend Icon
          Container(
            width: 46,
            height: 46,
            decoration: const BoxDecoration(
              color: Color(0xFF10B981),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.trending_up_rounded,
              color: Colors.white,
              size: 26,
            ),
          ),
          const SizedBox(width: 12),

          // Middle text column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Net Profit title + info icon
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Net Profit",
                      style: GoogleFonts.sora(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.info_outline_rounded,
                      size: 14,
                      color: Color(0xFF94A3B8),
                    ),
                  ],
                ),
                const SizedBox(height: 2),

                // Amount
                Text(
                  "Rs 10,400",
                  style: GoogleFonts.sora(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.4,
                    color: const Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 2),

                // Subtitle (+12.4% vs yesterday)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.arrow_upward_rounded,
                      color: Color(0xFF10B981),
                      size: 12,
                    ),
                    Text(
                      "+12.4%",
                      style: AppTheme.bodyMedium.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF10B981),
                        fontSize: 11,
                      ),
                    ),
                    Text(
                      " vs yesterday",
                      style: AppTheme.bodyMedium.copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF64748B),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Right side Sparkline Chart
          SizedBox(
            width: 95,
            height: 48,
            child: CustomPaint(painter: _NetProfitSparklinePainter()),
          ),
        ],
      ),
    );
  }

  // APPBAR WIDGET

  PreferredSizeWidget appbars() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(90),
      child: SafeArea(
        child: Padding(
          padding: AppTheme.screenPadding,
          child: AppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            toolbarHeight: 80,
            backgroundColor: Colors.transparent,
            elevation: 0,
            scrolledUnderElevation: 0,
            title: Row(
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(AppTheme.radiusMD),
                    border: Border.all(
                      color: AppColors.border,
                      width: AppTheme.borderWidth,
                    ),
                  ),
                  child: const Icon(
                    Icons.store_mall_directory_rounded,
                    color: AppColors.textOnPrimary,
                    size: 28,
                  ),
                ),
                const SizedBox(width: AppTheme.spacingSM),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Luna Boutique", style: AppTheme.navLabel),
                    const SizedBox(height: 2),
                    Text(
                      "Good Evening Ahad",
                      style: AppTheme.h1.copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Your business overview today ✨",
                      style: AppTheme.navLabel,
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              // Notification
              GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                    color: AppColors.textOnPrimary,
                    borderRadius: BorderRadius.circular(AppTheme.radiusXL),
                    border: Border.all(
                      color: AppColors.border,
                      width: AppTheme.borderWidth,
                    ),
                  ),
                  child: const Icon(Icons.notifications_none_rounded, size: 22),
                ),
              ),
              const SizedBox(width: AppTheme.spacingSM),
              // Profile
              GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(AppTheme.radiusXL),
                    border: Border.all(
                      color: AppColors.border,
                      width: AppTheme.borderWidth,
                    ),
                  ),
                  child: Text(
                    "LB",
                    style: AppTheme.h3.copyWith(
                      color: AppColors.textOnPrimary,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Quick action Widget
Widget quickaction({
  required String title,
  required IconData icon,
  required Color bgColor,
  required Color iconColor,
  Color? textColor,
  bool isPrimary = false,
  required String route,
  required BuildContext context,
}) {
  final labelColor =
      textColor ?? (isPrimary ? AppColors.primary : const Color(0xFF334155));

  return InkWell(
    onTap: () {
      context.push(route);
    },
    borderRadius: BorderRadius.circular(20),
    splashColor: isPrimary ? Colors.white24 : AppColors.primaryLight,
    highlightColor: Colors.transparent,
    child: SizedBox(
      width: 60,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(20),
              border: isPrimary
                  ? null
                  : Border.all(color: const Color(0xFFE2E8F0), width: 1.2),
              boxShadow: isPrimary
                  ? [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.35),
                        blurRadius: 14,
                        offset: const Offset(0, 6),
                      ),
                    ]
                  : [
                      BoxShadow(
                        color: const Color(0xFF0F172A).withOpacity(0.04),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
            ),
            child: Icon(icon, color: iconColor, size: isPrimary ? 28 : 26),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: GoogleFonts.sora(
              fontSize: 12,
              fontWeight: isPrimary ? FontWeight.w700 : FontWeight.w600,
              color: labelColor,
            ),
          ),
        ],
      ),
    ),
  );
}

// CUSTOM PAINTERS

/// Decorative subtle wave curve for the Sales Hero Card
class _SalesWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..color = Colors.white.withOpacity(0.06)
      ..style = PaintingStyle.fill;

    final path1 = Path();
    path1.moveTo(0, size.height * 0.7);
    path1.quadraticBezierTo(
      size.width * 0.35,
      size.height * 0.95,
      size.width * 0.65,
      size.height * 0.5,
    );
    path1.quadraticBezierTo(
      size.width * 0.85,
      size.height * 0.15,
      size.width,
      size.height * 0.4,
    );
    path1.lineTo(size.width, size.height);
    path1.lineTo(0, size.height);
    path1.close();

    canvas.drawPath(path1, paint1);

    final paint2 = Paint()
      ..color = Colors.white.withOpacity(0.04)
      ..style = PaintingStyle.fill;

    final path2 = Path();
    path2.moveTo(0, size.height * 0.45);
    path2.quadraticBezierTo(
      size.width * 0.4,
      size.height * 0.3,
      size.width * 0.7,
      size.height * 0.8,
    );
    path2.quadraticBezierTo(
      size.width * 0.85,
      size.height * 0.95,
      size.width,
      size.height * 0.75,
    );
    path2.lineTo(size.width, size.height);
    path2.lineTo(0, size.height);
    path2.close();

    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Upward Financial Trend Sparkline for Net Profit Card
class _NetProfitSparklinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final points = [
      Offset(size.width * 0.05, size.height * 0.88),
      Offset(size.width * 0.28, size.height * 0.84),
      Offset(size.width * 0.52, size.height * 0.55),
      Offset(size.width * 0.78, size.height * 0.40),
      Offset(size.width * 0.95, size.height * 0.12),
    ];

    final path = Path();
    path.moveTo(points[0].dx, points[0].dy);

    for (int i = 0; i < points.length - 1; i++) {
      final p0 = points[i];
      final p1 = points[i + 1];
      final midX = (p0.dx + p1.dx) / 2;
      path.cubicTo(midX, p0.dy, midX, p1.dy, p1.dx, p1.dy);
    }

    // Fill gradient under curve
    final fillPath = Path.from(path);
    fillPath.lineTo(points.last.dx, size.height);
    fillPath.lineTo(points.first.dx, size.height);
    fillPath.close();

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF10B981).withOpacity(0.22),
          const Color(0xFF10B981).withOpacity(0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    canvas.drawPath(fillPath, fillPaint);

    // Stroke line
    final linePaint = Paint()
      ..color = const Color(0xFF10B981)
      ..strokeWidth = 2.2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path, linePaint);

    // Data points dots
    final dotPaint = Paint()
      ..color = const Color(0xFF10B981)
      ..style = PaintingStyle.fill;

    final dotInnerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    for (final point in points) {
      canvas.drawCircle(point, 3.2, dotPaint);
      canvas.drawCircle(point, 1.6, dotInnerPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
