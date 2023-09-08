
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:peerp_toon/Bloc/product_bloc.dart';
import 'package:peerp_toon/app/Repository/produt_repo.dart';
import 'package:peerp_toon/core/service/locator.dart';
import 'package:peerp_toon/presentation/screens/productScreen/pagination_bloc/transation_bloc.dart';
import 'package:provider/provider.dart';
import 'app/Bloc_Observer/bloc_observer.dart';
import 'app/constants/app.theme.dart';
import 'app/providers/app.provider.dart';
import 'app/routes/routes_imports.dart';
import 'core/notifiers/theme.notifier.dart';
import 'web_url/configure_nonweb.dart'
if (dart.library.html) 'web_url/configure_web.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  locator();
  await Hive.initFlutter();
  await Hive.openBox('hive_local_db');
  runApp(
      MultiRepositoryProvider(
          providers: [
        RepositoryProvider(create: (context)=>ProductsRepo())
          ], child: const Lava())
      );
}

class Lava extends StatelessWidget {
  const Lava({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProvider.providers,
      child: const Core(),
    );
  }
}

class Core extends StatelessWidget {
  const Core({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create:
        (context)=> ProductBloc(ProductsRepo())),
        BlocProvider(create:
        (context)=> TransationBloc(TransactionRepo())
        )
      ],
      child: MaterialApp(
        title: 'Peeptoon',
        // supportedLocales: AppLocalization.all,
        // theme: notifier.darkTheme ? darkTheme : lightTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: AppRouter.splashRoute,
        builder: EasyLoading.init(),
        // home: Bottombar(),
      ),
    );
  }
}
