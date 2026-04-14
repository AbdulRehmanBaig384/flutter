import 'product.dart';
import 'news_item.dart';
import 'user.dart';

const mockUser = User(
  name: 'Alex Harrison',
  email: 'alex.harrison@ubit.edu',
  studentId: 'UB-9283471',
  department: 'Computer Science & Engineering',
  role: 'Verified Student',
);

const campusNews = [
  NewsItem(
    tag: 'FEATURED',
    title: 'New Research Grant Awarded to Engineering Faculty',
    excerpt: 'The $2.4M grant will fund sustainable energy initiatives across the campus for the next two years.',
    imageUrl: 'https://images.unsplash.com/photo-1503424886303-1f58071e1e26?auto=format&fit=crop&w=1200&q=80',
  ),
  NewsItem(
    tag: 'ACADEMIC',
    title: 'AI & Ethics Workshop Opens Registration',
    excerpt: 'Students are invited to join interdisciplinary sessions on the future of AI and responsible innovation.',
    imageUrl: 'https://images.unsplash.com/photo-1559757175-5700c3d50d1b?auto=format&fit=crop&w=1200&q=80',
  ),
  NewsItem(
    tag: 'EVENT',
    title: 'Annual Career Fair: 50+ Employers Confirmed',
    excerpt: 'Meet industry representatives from tech, finance, and engineering during the fall campus career fair.',
    imageUrl: 'https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?auto=format&fit=crop&w=1200&q=80',
  ),
];

const productCategories = [
  'All Items',
  'Textbooks',
  'Laptops',
  'Accessories',
  'Wearables',
];

const marketplaceProducts = [
  Product(
    title: 'Fundamentals of Algorithms',
    category: 'Textbooks',
    price: '45.00',
    imageUrl: 'https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&w=600&q=80',
    isNew: true,
  ),
  Product(
    title: 'MacBook Pro 14" M1',
    category: 'Laptops',
    price: '650.00',
    imageUrl: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=600&q=80',
    isNew: false,
  ),
  Product(
    title: 'Modern Sociology Vol. 1',
    category: 'Textbooks',
    price: '25.00',
    imageUrl: 'https://images.unsplash.com/photo-1515378791036-0648a3ef77b2?auto=format&fit=crop&w=600&q=80',
    isNew: false,
  ),
  Product(
    title: 'Mechanical Keyboard',
    category: 'Accessories',
    price: '65.00',
    imageUrl: 'https://images.unsplash.com/photo-1545239351-1141bd82e8a6?auto=format&fit=crop&w=600&q=80',
    isNew: false,
  ),
  Product(
    title: 'Smartwatch Series 6',
    category: 'Wearables',
    price: '120.00',
    imageUrl: 'https://images.unsplash.com/photo-1516574187841-cb9cc2ca948b?auto=format&fit=crop&w=600&q=80',
    isNew: true,
  ),
  Product(
    title: 'Graphing Calculator',
    category: 'Accessories',
    price: '15.00',
    imageUrl: 'https://images.unsplash.com/photo-1518770660439-4636190af475?auto=format&fit=crop&w=600&q=80',
    isNew: false,
  ),
];
