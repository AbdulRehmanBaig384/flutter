import 'package:flutter/material.dart';
import '../models/mock_data.dart';
import '../widgets/news_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Welcome, Jordan', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w800)),
              CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFF1D4ED8),
                child: Text('JD', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('Your academic architect dashboard is ready.', style: TextStyle(color: Color(0xFF94A3B8))),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _StatusCard(title: 'Current GPA', value: '3.82'),
              const SizedBox(width: 12),
              _StatusCard(title: 'Next Class', value: 'CS 401', subtitle: '10:30 AM · Hall B'),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Campus News', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
              Text('View All', style: TextStyle(color: Color(0xFF60A5FA), fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 14),
          _FeaturedNewsCard(item: campusNews.first),
          const SizedBox(height: 18),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: campusNews.length - 1,
            itemBuilder: (context, index) {
              final item = campusNews[index + 1];
              return NewsCard(item: item);
            },
          ),
          const SizedBox(height: 88),
        ],
      ),
    );
  }
}

class _StatusCard extends StatelessWidget {
  final String title;
  final String value;
  final String? subtitle;

  const _StatusCard({required this.title, required this.value, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: const Color(0xFF111827),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
            const SizedBox(height: 12),
            Text(value, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800)),
            if (subtitle != null) ...[
              const SizedBox(height: 8),
              Text(subtitle!, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
            ]
          ],
        ),
      ),
    );
  }
}

class _FeaturedNewsCard extends StatelessWidget {
  final dynamic item;

  const _FeaturedNewsCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 220,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            image: DecorationImage(image: NetworkImage(item.imageUrl), fit: BoxFit.cover),
          ),
        ),
        Container(
          height: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Color(0xCC0F172A)],
            ),
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF1D4ED8),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(item.tag, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)),
              ),
              const SizedBox(height: 10),
              Text(
                item.title,
                style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
