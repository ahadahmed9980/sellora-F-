import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:sellora/utils/BarcodeReticlePainter.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen>
    with SingleTickerProviderStateMixin {
  final MobileScannerController scannerController = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    formats: const [
      BarcodeFormat.all, // Sab barcodes & QR support karega
    ],
  );

  late AnimationController _laserController;
  late Animation<double> _laserAnimation;

  bool _isScanned = false;
  String _scannedValue = "";

  @override
  void initState() {
    super.initState();
    _laserController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..repeat(reverse: true);

    _laserAnimation =
        Tween<double>(begin: 0.05, end: 0.95).animate(_laserController);
  }

  @override
  void dispose() {
    _laserController.dispose();
    scannerController.dispose();
    super.dispose();
  }

  Future<void> _onDetectCode(String code) async {
    setState(() {
      _isScanned = true;
      _scannedValue = code;
    });

    // 1. Scanner stop
    scannerController.stop();

    // 2. Crisp feedback (Sound + Double Vibration)
    HapticFeedback.heavyImpact();
    SystemSound.play(SystemSoundType.click);

    // 3. Short delay so user perceives the success state
    await Future.delayed(const Duration(milliseconds: 850));

    if (mounted) {
      Navigator.pop(context, code);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Barcode reticle dimensions (Horizontal wide aspect ratio)
    final double windowWidth = MediaQuery.of(context).size.width * 0.82;
    const double windowHeight = 180.0;

    final Color activeAccent = _isScanned
        ? const Color(0xFF10B981) // Emerald Green on Success
        : const Color(0xFF6366F1); // Indigo / Sellora Primary

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 1. Camera View
          MobileScanner(
            controller: scannerController,
            onDetect: (capture) {
              if (_isScanned) return;
              final code = capture.barcodes.firstOrNull?.rawValue;
              if (code != null && code.isNotEmpty) {
                _onDetectCode(code);
              }
            },
          ),

          // 2. Cinematic Dim Vignette with Horizontal Cutout
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.72),
              BlendMode.srcOut,
            ),
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: Container(color: Colors.black),
                ),
                Center(
                  child: Container(
                    width: windowWidth,
                    height: windowHeight,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 3. Reticle Viewport (Custom HUD Corners + Laser)
          Center(
            child: Container(
              width: windowWidth,
              height: windowHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: activeAccent.withOpacity(0.2),
                  width: 1.0,
                ),
              ),
              child: CustomPaint(
                painter: BarcodeReticlePainter(cornerColor: activeAccent),
                child: Stack(
                  children: [
                    // Moving Laser with Gradient Light Trail
                    if (!_isScanned)
                      AnimatedBuilder(
                        animation: _laserAnimation,
                        builder: (context, child) {
                          return Positioned(
                            top: _laserAnimation.value * (windowHeight - 8),
                            left: 14,
                            right: 14,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Glowing beam line
                                Container(
                                  height: 2.5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    gradient: LinearGradient(
                                      colors: [
                                        activeAccent.withOpacity(0.0),
                                        activeAccent,
                                        activeAccent.withOpacity(0.0),
                                      ],
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: activeAccent.withOpacity(0.9),
                                        blurRadius: 8,
                                        spreadRadius: 2,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                    // Success Feedback Overlay
                    if (_isScanned)
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF10B981).withOpacity(0.12),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: TweenAnimationBuilder<double>(
                            tween: Tween(begin: 0.0, end: 1.0),
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.elasticOut,
                            builder: (context, value, child) {
                              return Transform.scale(
                                scale: value,
                                child: Container(
                                  padding: const EdgeInsets.all(14),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF10B981),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.check_rounded,
                                    color: Colors.white,
                                    size: 34,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),

          // 4. Header Bar (Glassmorphic Back & Torch)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildGlassControl(
                    icon: Icons.arrow_back_ios_new_rounded,
                    onTap: () => Navigator.pop(context),
                  ),
                  ValueListenableBuilder(
                    valueListenable: scannerController,
                    builder: (context, state, child) {
                      final isFlashOn = state.torchState == TorchState.on;
                      return _buildGlassControl(
                        icon: isFlashOn
                            ? Icons.flash_on_rounded
                            : Icons.flash_off_rounded,
                        tint: isFlashOn ? Colors.amber : Colors.white,
                        onTap: () => scannerController.toggleTorch(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // 5. Bottom Instructions Pill
          Positioned(
            bottom: 50,
            left: 24,
            right: 24,
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: _isScanned
                      ? const Color(0xFF10B981)
                      : Colors.black.withOpacity(0.65),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: _isScanned ? Colors.transparent : Colors.white12,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _isScanned
                          ? Icons.verified_rounded
                          : Icons.view_week_outlined,
                      color: Colors.white,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _isScanned
                          ? "Scanned: $_scannedValue"
                          : "Align red/blue line over barcode",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlassControl({
    required IconData icon,
    required VoidCallback onTap,
    Color tint = Colors.white,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white12, width: 1.2),
        ),
        child: Icon(icon, color: tint, size: 18),
      ),
    );
  }
}