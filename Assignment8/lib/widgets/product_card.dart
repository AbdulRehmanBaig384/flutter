import 'package:flutter/material.dart';
import '../models/models.dart';
import '../theme/app_theme.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  Color _getImageColor(String imageUrl) {
    switch (imageUrl) {
      case 'books':
        return const Color(0xFF6B7280);
      case 'laptop':
        return const Color(0xFFE5E7EB);
      case 'books2':
        return const Color(0xFF78716C);
      case 'keyboard':
        return const Color(0xFF1F2937);
      case 'watch':
        return const Color(0xFFD1D5DB);
      case 'calculator':
        return const Color(0xFFF3F4F6);
      default:
        return const Color(0xFF9CA3AF);
    }
  }

  String _getImageURL(String imageUrl) {
    switch (imageUrl) {
      case 'books':
        return "market1.jpg";
      case 'books2':
        return "books.jpg";
      case 'laptop':
        return "laptop.jpg";
      case 'keyboard':
        return "market4.jpg";
      case 'watch':
        return "market5.jpg";
      case 'calculator':
        return "market6.jpg";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.cardWhite,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with price badge using Stack
          Stack(
            children: [
              // Product image container
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                ),
                child: Image.asset(
                    "assets/images/${_getImageURL(product.imageUrl)}", fit: BoxFit.cover,),
              ),
              // Price badge - Positioned on top right corner
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              // Condition badge - Positioned bottom left
              Positioned(
                bottom: 8,
                left: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    product.condition,
                    style: const TextStyle(
                      color: AppTheme.textDark,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Product details
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    color: AppTheme.textDark,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  product.category,
                  style: const TextStyle(
                    color: AppTheme.textMedium,
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
