import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// دالة لتعريف نوع جلب المكتبة المؤجلة
typedef LibraryLoader = Future<void> Function();

/// ويدجت ذكية تتولى تحميل الشاشات عند الطلب فقط (Lazy Chunk Loading)
class DeferredLoader extends StatefulWidget {
  final LibraryLoader libraryLoader;
  final Widget Function() builder;
  final Widget placeholder;

  const DeferredLoader({
    super.key,
    required this.libraryLoader,
    required this.builder,
    this.placeholder = const Center(child: CircularProgressIndicator(color: AppColors.primary)),
  });

  @override
  State<DeferredLoader> createState() => _DeferredLoaderState();
}

class _DeferredLoaderState extends State<DeferredLoader> {
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadLibrary();
  }

  Future<void> _loadLibrary() async {
    await widget.libraryLoader();
    if (mounted) {
      setState(() => _isLoaded = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoaded ? widget.builder() : widget.placeholder;
  }
}
