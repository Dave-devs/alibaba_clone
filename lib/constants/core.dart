import 'package:alibaba_clone/presentation/admin_features/presentation/analytic/analytic_page.dart';
import 'package:alibaba_clone/presentation/admin_features/presentation/products/products_page.dart';
import 'package:alibaba_clone/presentation/cart/cart_page.dart';
import 'package:alibaba_clone/presentation/home/home_page.dart';
import 'package:alibaba_clone/presentation/profile/profile_page.dart';
import 'package:alibaba_clone/presentation/admin_features/presentation/orders/orders_page.dart';

const double radius = 16; //8
const double bottomBarRadius = 30;
const double iconSize = 26;
const double bottomBarHeight = 58;
const double w = 60;
const double h = 30;

const pageList = [
  HomePage(),
  ProfilePage(),
  CartPage(),
];

const adminPageList = [
  ProductsPage(),
  AnalyticPage(),
  OrdersPage(),
];

const picHolder = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQpbbAkPQ1L_C0AwBmPi9rLb6GRG0sSJiZEQ&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvg-aZreXB84S6bVcUWsLIPQkaH39sB_xDSg&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQpbbAkPQ1L_C0AwBmPi9rLb6GRG0sSJiZEQ&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvg-aZreXB84S6bVcUWsLIPQkaH39sB_xDSg&usqp=CAU',
];

const List<Map<String, String>> valuesImages = [
  {
    'name': "Safe & Reliable Payments",
    'image': 'https://img.icons8.com/?size=80&id=SwvDja4ryubi&format=png'
  },
  {
    'name': "Money Back Guarantee",
    'image': 'https://img.icons8.com/?size=80&id=h3USDbkfsNWM&format=png'
  },
  {
    'name': "24/7 Customer Service",
    'image': 'https://img.icons8.com/?size=80&id=pP1yf7xOGzq4&format=png'
  },
  {
    'name': "Buyer Protection",
    'image': 'https://img.icons8.com/?size=80&id=8OdwzXFjBVH2&format=png'
  },
  {
    'name': "50% Black Friday Sales",
    'image': 'https://img.icons8.com/?size=80&id=mnqCs95ap07K&format=png'
  }
];

const couruselImages = [
  'https://ae01.alicdn.com/kf/H99948d81ab0f496292325b1f6046f11fJ.jpg_Q90.jpg_.webp',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2Mm9G7wj_RdQhadjwZzOlTuRRG1l2SP0Szw&usqp=CAU',
  'https://ng.jumia.is/cms/0-1-weekly-cps/0-2023/Week39-Best-Deals-On-Compouting/Computing712x384_Slider.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHKAPLpLY61UkG5W-mu4yEaRleZYuXVsihwA&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQntPmukSMVZb-02eu9iIDO797HRAlxAab62g&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSy5OJSdPNVpREFk9EbYlG1sCkGuV588M_cyw&usqp=CAU',
];

const pic =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSy5OJSdPNVpREFk9EbYlG1sCkGuV588M_cyw&usqp=CAU';
