import 'package:flutter/material.dart';

import 'app/ecommerce_app.dart';
import 'core/cache/cache_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(const Ecommerce());
}
