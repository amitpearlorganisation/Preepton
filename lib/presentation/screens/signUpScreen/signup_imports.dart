import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:peerp_toon/app/database/hive.dart';
import 'package:peerp_toon/app/database/models/signup_model.dart';
import 'package:peerp_toon/presentation/screens/signUpScreen/signup_bloc/sign_up_bloc.dart';
import 'package:peerp_toon/presentation/screens/signUpScreen/widget/welcome.signup.widget.dart';


import 'package:provider/provider.dart';

import '../../../app/constants/app.colors.dart';
import '../../../app/routes/routes_imports.dart';
import '../../../core/notifiers/authentication.notifer.dart';
import '../../../core/notifiers/theme.notifier.dart';
import '../../widgets/custom.animated.container.dart';
import '../../widgets/custom.text.field.dart';
import '../../widgets/dimensions.widget.dart';
part 'signup.screen.dart';