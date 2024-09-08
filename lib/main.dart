import 'package:doctor/doc_app.dart';
import 'package:flutter/material.dart';

import 'core/routings/app_router.dart';

void main() {
  // setUpGetIt();
  runApp(
    DocApp(
    appRouter: AppRouter(),
  ));
}
