import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/ecommerce_app.dart';
import 'core/cache/cache_helper.dart';
import 'core/services/service_locator.dart';
import 'core/widgets/custom_bloc_observer.dart';

void main() async {
  Bloc.observer = CustomBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  setUpServiceLocator();
  await getIt<CacheHelper>().init();
  runApp(const Ecommerce());
}



