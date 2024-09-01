import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/router/router.dart';
import 'core/themes/main_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: MainColors.kMainColor,
        statusBarIconBrightness: Brightness.light));
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) => PostsBloc(getAllPostsUseCase: getAllPostsUseCase)),
      ],
      child: ScreenUtilInit(
        designSize: const Size(420, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext ctx, Widget? child) => MaterialApp(
          title: 'Posts App',
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          builder: (context, child) => Directionality(
            child: child!,
            textDirection: TextDirection.rtl,
          ),
          home: Scaffold(
            appBar: AppBar(
              title: Text(
                'Home',
                style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),
              ),
            ),
            body: Container(),
          ),
        ),
      ),
    );
  }
}
