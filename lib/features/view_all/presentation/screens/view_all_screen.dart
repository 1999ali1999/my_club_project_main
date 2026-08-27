import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
// تمت إزالة الاستيراد غير المستخدم ui_extensions.dart
import '../controllers/view_all_controller.dart';

class ViewAllScreen extends StatelessWidget {
  final ViewAllController controller;

  const ViewAllScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: _buildGrid(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.bg,
        border: Border(bottom: BorderSide(color: AppColors.surface)),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
            onPressed: controller.goBack,
          ),
          Expanded(
            child: Text(
              controller.tr(controller.titleKey),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const SizedBox(width: 48), 
        ],
      ),
    );
  }

  Widget _buildGrid() {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 80, top: 16),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150, 
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 2 / 3,
      ),
      itemCount: controller.items.length,
      itemBuilder: (context, index) {
        final movie = controller.items[index];
        return GestureDetector(
          onTap: () => controller.onMovieTap(movie.id),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              movie.imageUrl,
              fit: BoxFit.cover,
              // تم إصلاح المتجاهلات لتتوافق مع معايير Dart 3
              errorBuilder: (_, _, _) => const Center(
                child: Icon(Icons.broken_image, color: Colors.white24)
              ),
            ),
          ),
        );
      },
    );
  }
}
