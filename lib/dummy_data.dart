import 'package:flutter/material.dart';

import './models/category.dart';
import './models/item.dart';

const DUMMY_CATEGORIES = const [
  Category(
    id: 'c1',
    title: 'Technology',
    color: Colors.purple,
  ),
  Category(
    id: 'c2',
    title: 'Beauty',
    color: Colors.red,
  ),
  Category(
    id: 'c3',
    title: 'Fashion',
    color: Colors.orange,
  ),
  Category(
    id: 'c4',
    title: 'Gaming',
    color: Colors.amber,
  ),
  Category(
    id: 'c5',
    title: 'Style',
    color: Colors.blue,
  ),
  Category(
    id: 'c6',
    title: 'Home And Office',
    color: Colors.green,
  ),
  Category(
    id: 'c7',
    title: 'Electronics',
    color: Colors.lightBlue,
  ),
  Category(
    id: 'c8',
    title: 'Baby Products',
    color: Colors.lightGreen,
  ),
  Category(
    id: 'c9',
    title: 'Books And Movies',
    color: Colors.pink,
  ),
  Category(
    id: 'c10',
    title: 'Computing',
    color: Colors.teal,
  ),
];

const DUMMY_MEALS = [
  Meal(
    id: 'm1',
    categories: [
      'c1',
      'c4',
      'c10',
      'c7',
    ],
    title: 'HP OMEN Laptop',
    price: '32000 EGP',
    affordability: Affordability.Luxurious,
    imageUrl:
        'https://images-na.ssl-images-amazon.com/images/I/71LvwfUwr4L._AC_SL1500_.jpg',
  ),
  Meal(
    id: 'm2',
    categories: [
      'c2',
      'c5',
    ],
    title: 'Essence | Love Extreme Mascara',
    price: '100 EGP',
    affordability: Affordability.Affordable,
    imageUrl:
        'https://cdn.shopify.com/s/files/1/0024/0196/0036/products/essence-i-love-extreme-crazy-volume-mascara_e662f1ac-982c-46f9-9bb5-a72cc1b94844_1200x1121.jpg?v=1573162762',
  ),
  Meal(
    id: 'm4',
    categories: [
      'c3',
    ],
    title: 'Channel Black Dress',
    price: '2700 EGP',
    affordability: Affordability.Luxurious,
    imageUrl:
        'https://cdn.shopify.com/s/files/1/1156/9136/products/image_ccb94b7b-2500-4479-910c-09381219d6be_2048x2048.jpg?v=1583884917',
  ),
  Meal(
    id: 'm5',
    categories: [
      'c5',
      'c4',
      'c3',
    ],
    title: 'Oakley Sunglasses',
    price: '2000 EGP',
    affordability: Affordability.Luxurious,
    imageUrl:
        'https://cdn.shopify.com/s/files/1/0471/0885/products/700285879505-134_1024x1024.jpg?v=1598682022',
  ),
  Meal(
    id: 'm6',
    categories: [
      'c6',
    ],
    title: 'LINNMON / ALEX Table - white 120x60 cm',
    price: '2330 EGP',
    affordability: Affordability.Pricey,
    imageUrl:
        'https://www.ikea.com/eg/en/images/products/linnmon-alex-table-white__0737597_PE741188_S5.JPG',
  ),
  Meal(
    id: 'm7',
    categories: [
      'c7',
    ],
    title: 'Mobisun Powebank',
    price: '1700 EGP',
    affordability: Affordability.Pricey,
    imageUrl:
        'https://www.mobisun.com/wp-content/uploads/2018/08/Mobisun-Portable-Solar-Generator-Laptop-Powerbank-120W-154Wh-230V-accu-battery-camping-outdoor-power-fishing-sailing-AC-output-pure-sine-sinus-draagbaar.jpg',
  ),
  Meal(
    id: 'm8',
    categories: [
      'c8',
    ],
    title: 'Baby Jhonson Powder',
    price: '100 EGP',
    affordability: Affordability.Affordable,
    imageUrl:
        'https://images-na.ssl-images-amazon.com/images/I/61AhX8q0cdL._SL1500_.jpg',
  ),
  Meal(
    id: 'm9',
    categories: [
      'c9',
    ],
    title: 'Game Of Thrones Collection',
    price: '1300 EGP',
    affordability: Affordability.Pricey,
    imageUrl:
        'https://gameofthronesshop.org/wp-content/uploads/2017/09/1111469431-1.jpg',
  ),
  Meal(
    id: 'm10',
    categories: [
      'c1',
      'c4',
      'c7',
      'c10',
    ],
    title: 'Razer Mouse',
    price: '500 EGP',
    affordability: Affordability.Affordable,
    imageUrl:
        'https://s3-ap-southeast-2.amazonaws.com/wc-prod-pim/JPEG_1000x1000/SYDADDERES_razer_deathadder_essential_gaming_mouse.jpg',
  ),
];
