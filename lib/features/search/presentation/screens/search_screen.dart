import 'package:flutter/material.dart' hide SearchController; // إخفاء الفئة المتعارضة
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/ui_extensions.dart';
import '../controllers/search_controller.dart';

class SearchScreen extends StatelessWidget {
  final SearchController controller;

  const SearchScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            _buildSearchBar().px(16).pOnly(b: 20),
            Expanded(
              child: _buildResultsGrid(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
          onPressed: controller.goBack,
        ),
        const Expanded(
          child: Text(
            'البحث', 
            textAlign: TextAlign.center, 
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)
          ),
        ),
        const SizedBox(width: 48), 
      ],
    ).p(12);
  }

  Widget _buildSearchBar() {
    return TextField(
      onChanged: controller.onSearchChanged,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: 'البحث',
        hintStyle: const TextStyle(color: AppColors.textMuted),
        filled: true,
        fillColor: const Color(0xFF202020), 
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        suffixIcon: const Icon(Icons.search, color: AppColors.textMuted),
      ),
    );
  }

  Widget _buildResultsGrid() {
    if (controller.filteredResults.isEmpty) {
      return const Center(
        child: Text(
          'لا توجد نتائج', 
          style: TextStyle(color: AppColors.textMuted)
        ),
      );
    }

    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 80),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150, 
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 2 / 3, 
      ),
      itemCount: controller.filteredResults.length,
      itemBuilder: (context, index) {
        final movie = controller.filteredResults[index];
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
              errorBuilder: (_, _, _) => const Center( // تم الإصلاح هنا
                child: Icon(Icons.broken_image, color: Colors.white24)
              ),
            ),
          ),
        );
      },
    );
  }
}
