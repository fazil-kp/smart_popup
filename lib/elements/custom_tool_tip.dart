import 'package:custom_alert_popup/elements/common_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomTooltip extends HookWidget {
  final Widget child;
  final Widget? content;
  final Color? backgroundColor;
  final double? cornerRadius;
  final TooltipPosition? position;

  const CustomTooltip({super.key, required this.child, this.content, this.backgroundColor, this.position = TooltipPosition.bottom, this.cornerRadius});

  @override
  Widget build(BuildContext context) {
    final overlayEntry = useState<OverlayEntry?>(null);

    void showOverlay() {
      final overlay = Overlay.of(context);
      final renderBox = context.findRenderObject() as RenderBox?;
      final size = renderBox?.size;
      final offset = renderBox?.localToGlobal(Offset.zero);
      overlayEntry.value = OverlayEntry(
        builder: (context) => Positioned(
          left: offset!.dx,
          top: position == TooltipPosition.bottom ? offset.dy + size!.height + 5.0 : null,
          bottom: position == TooltipPosition.top ? (MediaQuery.of(context).size.height - offset.dy) + 0 : null,
          child: Material(color: backgroundColor ?? Colors.transparent, borderRadius: BorderRadius.circular(cornerRadius ?? 4.0), elevation: 4.0, child: content ?? Container(height: 30, color: Colors.black, child: const Center(child: Text('Add content to show tooltip', style: TextStyle(color: Colors.white))))),
        ),
      );
      overlay.insert(overlayEntry.value!);
    }
    Future<void> removeOverlay() async {
      overlayEntry.value?.remove();
      overlayEntry.value = null;
    }
    useEffect(() {
      return () => {overlayEntry.value?.remove()};
    }, []);
    return MouseRegion(onEnter: (event) => showOverlay(), onExit: (event) => removeOverlay(), child: child);
  }
}
