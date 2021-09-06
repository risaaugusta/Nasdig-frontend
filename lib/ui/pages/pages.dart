import 'package:Pegassus/bloc/bloc.dart';
import 'package:Pegassus/services/services.dart';
import 'package:Pegassus/shared/shared.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Pegassus/bloc/page_bloc.dart';
import 'package:Pegassus/ui/widgets/widgets.dart';
//import 'package:Pegassus/ui/widgets/dashboard_widgets.dart';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
//import 'package:flutter_form_builder/flutter_form_builder.dart';
//import 'package:Pegassus/components/alert_box.dart';
////import 'package:Pegassus/utils/globals.dart' as globals;
//import 'package:Pegassus/components/link_button.dart';
//import 'package:Pegassus/components/data.dart';
//import 'package:Pegassus/utils/network_utils.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
//import 'package:json_patch/json_patch.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:Pegassus/views/intro/intro.dart';
//import 'package:nasdem/views/tab/tab_view.dart';
import 'package:Pegassus/components/loading_screen.dart';
import 'package:Pegassus/components/route_transition.dart';
import 'package:Pegassus/models/province.dart';

//import 'package:nasdem/utils/network_utils.dart';

part 'wrapper.dart';
part 'main_page.dart';
part 'splash_page.dart';
part 'sign_in_page.dart';
part 'kader_detail_page.dart';
part 'admin_detail_page.dart';
//part 'timses_form_page.dart';
//part 'form/form_profile.dart';
//part 'form/form_address.dart';