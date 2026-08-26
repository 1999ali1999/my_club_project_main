import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/ui_extensions.dart';

/// واجهة التحكم بالصفحة الديناميكية لضمان فصل الواجهة (Dumb UI)
abstract class DynamicPageController {
  Map<String, dynamic> get pageData;
  bool get isLoading;
  
  void onContentTap(String contentId);
  void onActionTap(String actionType, dynamic payload);
  void goBack();
}

/// الصفحة الديناميكية: تقوم ببناء واجهتها بالكامل بناءً على بيانات JSON
class DynamicPageScreen extends StatelessWidget {
  final DynamicPageController controller;

  const DynamicPageScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    if (controller.isLoading) {
      return const Scaffold(
        backgroundColor: AppColors.bg,
        body: Center(child: CircularProgressIndicator(color: AppColors.primary)),
      );
    }

    final data = controller.pageData;
    final title = data['title'] as String? ?? '';
    final sections = data['sections'] as List<dynamic>? ?? [];

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
          onPressed: controller.goBack,
        ),
        title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 80),
        itemCount: sections.length,
        itemBuilder: (context, index) {
          return _buildDynamicSection(sections[index] as Map<String, dynamic>);
        },
      ),
    );
  }

  /// مصنع (Factory) لبناء الأقسام ديناميكياً بناءً على نوعها في الـ JSON
  Widget _buildDynamicSection(Map<String, dynamic> sectionData) {
    final type = sectionData['type'] as String?;
    
    switch (type) {
      case 'grid':
        return _buildGridSection(sectionData);
      case 'horizontal_list':
        return _buildHorizontalList(sectionData);
      case 'banner':
        return _buildBanner(sectionData);
      default:
        return const SizedBox.shrink(); // تجاهل الأنواع غير المعروفة
    }
  }

  Widget _buildGridSection(Map<String, dynamic> data) {
    final items = data['items'] as List<dynamic>? ?? [];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 2 / 3,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index] as Map<String, dynamic>;
        return _buildContentCard(item);
      },
    );
  }

  Widget _buildHorizontalList(Map<String, dynamic> data) {
    final title = data['title'] as String? ?? '';
    final items = data['items'] as List<dynamic>? ?? [];
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)).px(16).py(8),
        SizedBox(
          height: 180,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: items.length,
            separatorBuilder: (_, _) => 16.gapH,
            itemBuilder: (context, index) {
              final item = items[index] as Map<String, dynamic>;
              return SizedBox(width: 120, child: _buildContentCard(item));
            },
          ),
        ),
        24.gapV,
      ],
    );
  }

  Widget _buildBanner(Map<String, dynamic> data) {
    final imageUrl = data['imageUrl'] as String? ?? '';
    final targetId = data['targetId'] as String? ?? '';
    
    return GestureDetector(
      onTap: () => controller.onContentTap(targetId),
      child: Container(
        height: 200,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget _buildContentCard(Map<String, dynamic> item) {
    final id = item['id'] as String? ?? '';
    final imageUrl = item['imageUrl'] as String? ?? '';
    
    return GestureDetector(
      onTap: () => controller.onContentTap(id),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.antiAlias,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => const Center(child: Icon(Icons.broken_image, color: Colors.white24)),
        ),
      ),
    );
  }
}
