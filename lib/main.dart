import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_block_note_app/todo_feature/logic/bloc/todo_bloc.dart';
import 'package:hive_block_note_app/todo_feature/models/todo_model.dart';
import 'package:hive_block_note_app/todo_feature/screens/show_todo_screen.dart';
import 'package:hive_block_note_app/tools/router/app_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  runApp(
    BlocProvider<TodoBloc>(
      create: (context) => TodoBloc(),
      child: MyApp(
        appRouter: AppRouter(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('fa')],
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.onGenerateRout,
        home: const ShowTodoScreen(),
      ),
    );
  }
}
