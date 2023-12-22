import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads/cubits/add_post_cubit.dart';
import 'package:threads/cubits/time_line_cubit.dart';
import 'package:threads/screens/auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context) => AddPostCubit(),),
        BlocProvider(create:(context) => TimeLineCubit(),),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthScreen(),
        theme: ThemeData(
          useMaterial3: true,
        ),
      ),
    );
  }
}
