
part of 'splash_imports.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future _initiateCache() async {
    return CacheManagerUtils.conditionalCache(
      key: AppKeys.onBoardDone,
      valueType: ValueType.StringValue,
      actionIfNull: () {
        Navigator.of(context).pushNamed(AppRouter.onBoardRoute).whenComplete(
            () => {
                  WriteCache.setString(
                      key: AppKeys.onBoardDone, value: 'Something')
                });
      },
      actionIfNotNull: () {
        CacheManagerUtils.conditionalCache(
            key: AppKeys.userData,
            valueType: ValueType.StringValue,
            actionIfNull: () {
              Navigator.of(context).pushReplacementNamed(AppRouter.loginRoute);
            },
            actionIfNotNull: () {
              Navigator.of(context).pushReplacementNamed(AppRouter.homeRoute);
            });
      },
    );
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 1), _initiateCache);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = _themeNotifier.darkTheme;
    return Scaffold(
      backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Peeptoon',
              style: TextStyle(
                color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                fontFamily: AppFonts.contax,
                fontSize: 50.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
