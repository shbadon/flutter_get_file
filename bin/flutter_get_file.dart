import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:pub_api_client/pub_api_client.dart';

String _projectName = '';
String _appName = '';
String _projectSdk = '';
String _library = '';
int _totalFile = 13;
int _count = 0;

void main(List<String> arguments) async {
  print(
      'Welcome to Flutter Get File Program. This program created only the dart file & directory. This program was created by "Shuoib Hossain Badon"');

  while (true) {
    stdout.write('Enter your project name :');
    _projectName = stdin.readLineSync().toString();
    if (_projectName.isNotEmpty) {
      break;
    }
  }
  makeAppName();
  _library = "import 'package:$_projectName/$_projectName.dart';";
  while (true) {
    stdout.write('Enter your project sdk name :');
    _projectSdk = stdin.readLineSync().toString();
    if (_projectSdk.isNotEmpty) {
      break;
    }
  }
  await createAssetsDirectory1();
  await createConstantsDirectory2();
  await createControllersDirectory3();
  await createModelsDirectory4();
  await createExtensionsDirectory5();
  await createObjectsDirectory6();
  await createServicesDirectory7();
  await createUtilsDirectory8();
  await createViewsDirectory9();
  await createPubspecFile10();
  await createLibraryFile11();
  await createMainDart12();
  await createWidgetTest13();
  print("\nTotal File Creation(13/${_count.toString()})");
  if (_totalFile == _count) {
    print("Creation Complete 🙂");
  } else {
    print("Creation Complete 🙁");
  }
  print("\n");
  print('Flutter Pub Get Process Started... ');

  final process =
      Process.runSync('C:\\flutter\\bin\\flutter.bat', ['pub', 'get']);
  print(await process.stdout);
  print(await process.stderr);
  print('Process Exit Code ${process.exitCode}');
  print('Program Finished.\n');
}

void makeAppName() {
  final splitData = _projectName.split('_');

  for (String data in splitData) {
    _appName =
        _appName + data.substring(0, 1).toUpperCase() + data.substring(1) + ' ';
  }
}


Future<void> createAssetsDirectory1() async {
  try {
    String viewPath = "${path.current}/assets/";
    await Directory('${viewPath}anim').create(recursive: true);
    await Directory('${viewPath}fonts').create(recursive: true);
    await Directory('${viewPath}icons').create(recursive: true);
    await Directory('${viewPath}images').create(recursive: true);
    await Directory('${viewPath}logos').create(recursive: true);
    await Directory('${viewPath}sounds').create(recursive: true);
    await Directory('${viewPath}videos').create(recursive: true);
    print('Assets Directory Creation... \u2713');
    _count++;
  } catch (error) {
    print('Assets Directory Creation... \u2715 :  Error:- $error');
  }
}

Future<void> createConstantsDirectory2() async {
  try {
    await createFile('Colors');
    await createFile('Anim');
    await createFile('Logos');
    await createFile('Sounds');
    await createFile('Videos');
    await createFile('Fonts');
    await createFile('Icons');
    await createFile('Images');
    await createFile('Key');
    await createFile('Size');
    await createFile('String');
    String text = '''
export 'app_colors.dart';
export 'app_anim.dart';
export 'app_logos.dart';
export 'app_sounds.dart';
export 'app_videos.dart';
export 'app_fonts.dart';
export 'app_icons.dart';
export 'app_images.dart';
export 'app_key.dart';
export 'app_size.dart';
export 'app_string.dart';
''';
    final File file = await File('${path.current}/lib/constants/constant.dart')
        .create(recursive: true);

    await file.writeAsString(text);

    print('Constants Directory Creation... \u2713');
    _count++;
  } catch (error) {
    print('Constants Directory Creation... \u2715 :  Error:- $error');
  }
}

Future<void> createFile(name) async {
  String text = '''
// $_library

class App$name {
  App$name._(); 
}

''';

  final File file = await File(
          '${path.current}/lib/constants/app_${name.toString().toLowerCase()}.dart')
      .create(recursive: true);
  await file.writeAsString(text);
}

Future<void> createControllersDirectory3() async {
  try {
    String viewPath = "${path.current}/lib/";
    await Directory('${viewPath}controllers').create(recursive: true);
    print('Controllers Directory Creation... \u2713');
    _count++;
  } catch (error) {
    print('Controllers Directory Creation... \u2715 :  Error:- $error');
  }
}

Future<void> createModelsDirectory4() async {
  try {
    String viewPath = "${path.current}/lib/";
    await Directory('${viewPath}models').create(recursive: true);
    print('Models Directory Creation... \u2713');
    _count++;
  } catch (error) {
    print('Models Directory Creation... \u2715 :  Error:- $error');
  }
}

Future<void> createExtensionsDirectory5() async {
  try {
    await File('${path.current}/lib/extensions/extension.dart')
        .create(recursive: true);
  await File('${path.current}/lib/extensions/extension.dart')
            .create(recursive: true);
    print('Extensions Directory Creation... \u2713');
    _count++;
  } catch (error) {
    print('Extensions Directory Creation... \u2715 :  Error:- $error');
  }
}

Future<void> createObjectsDirectory6() async {
  try {
    String viewPath = "${path.current}/lib/";
    await Directory('${viewPath}objects').create(recursive: true);
    print('Objects Directory Creation... \u2713');
    _count++;
  } catch (error) {
    print('Objects Directory Creation... \u2715 :  Error:- $error');
  }
}

Future<void> createServicesDirectory7() async {
  try {
    String viewPath = "${path.current}/lib/";
    await Directory('${viewPath}services/database').create(recursive: true);

    String text = '''
// $_library


class Navigate {
  Navigate._();
  }
''';
    final File file = await File('${viewPath}services/navigation/navigate.dart')
        .create(recursive: true);
    await file.writeAsString(text);

    await Directory('${viewPath}services/navigation').create(recursive: true);
    print('Services Directory Creation... \u2713');
    _count++;
  } catch (error) {
    print('Services Directory Creation... \u2715 :  Error:- $error');
  }
}

Future<void> createUtilsDirectory8() async {
  try {
    String viewPath = "${path.current}/lib/";
    await Directory('${viewPath}utils').create(recursive: true);
    _count++;
    print('Utils Directory Creation... \u2713');
  } catch (error) {
    print('Utils Directory Creation... \u2715 :  Error:- $error');
  }
}

Future<void> createViewsDirectory9() async {
  try {
    String viewPath = "${path.current}/lib/";
    String stylePath = '${viewPath}views/styles/';

    await Directory('${viewPath}views/dialogs').create(recursive: true);
    await Directory('${viewPath}views/screens').create(recursive: true);
    await Directory('${viewPath}views/widgets').create(recursive: true);
    await createStyleFile('Container');
    await createStyleFile('Text');
    await createStyleFile('Button');
    await createStyleFile('Text_Field');
    await createStyleFile('App_Bar');
    await createThemeFile();
    String text = '''
export 'container_styles.dart';
export 'text_styles.dart';
export 'button_styles.dart';
export 'text_field_styles.dart';
export 'app_bar_styles.dart';
export 'theme.dart';
''';
    final File file =
        await File('${stylePath}styles.dart').create(recursive: true);

    await file.writeAsString(text);
    _count++;
    print('Views Directory Creation... \u2713');
  } catch (error) {
    print('Views Directory Creation... \u2715 :  Error:- $error');
  }
}

Future<void> createStyleFile(name) async {
  String text = '''
// $_library


class App${name.replaceAll('_', '')}Styles {
   App${name.replaceAll('_', '')}Styles._(); 
}

''';

  final File file = await File(
          '${path.current}/lib/views/styles/${name.toString().toLowerCase()}_styles.dart')
      .create(recursive: true);
  await file.writeAsString(text);
}

Future<void> createThemeFile() async {
  String text = '''
// $_library

class AppTheme {
   AppTheme._(); 
}

''';

  final File file = await File(
          '${path.current}/lib/views/styles/theme.dart')
      .create(recursive: true);
  await file.writeAsString(text);
}

Future<void> createPubspecFile10() async {
  final client =  PubClient();
  final cupertinoIconsVersion = await client.packageInfo('cupertino_icons').then((value) {return value.version;});
  final flutterScreenutilVersion  = await client.packageInfo('flutter_screenutil').then((value) {return value.version;});
  final recaseVersion  = await client.packageInfo('recase').then((value) {return value.version;});
  final flutterSvgVersion  = await client.packageInfo('flutter_svg').then((value) {return value.version;});
  final httpVersion  = await client.packageInfo('http').then((value) {return value.version;});
  final connectivityPlusVersion  = await client.packageInfo('connectivity_plus').then((value) {return value.version;});
  final getVersion  = await client.packageInfo('get').then((value) {return value.version;});
  final intlVersion  = await client.packageInfo('intl').then((value) {return value.version;});
  final sharedPreferencesVersion  = await client.packageInfo('shared_preferences').then((value) {return value.version;});
  final flutterLintsVersion  = await client.packageInfo('flutter_lints').then((value) {return value.version;});
  try {
    String text = '''
name: $_projectName
description: A new Flutter project.

publish_to: 'none'

version: 1.0.0+1

environment:
  sdk: '$_projectSdk'

dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^$cupertinoIconsVersion
  flutter_screenutil: ^$flutterScreenutilVersion
  recase: ^$recaseVersion
  flutter_svg: ^$flutterSvgVersion
  http: ^$httpVersion
  connectivity_plus: ^$connectivityPlusVersion
  get: ^$getVersion
  intl: ^$intlVersion
  shared_preferences: ^$sharedPreferencesVersion

dev_dependencies:
  flutter_test:
    sdk: flutter

  flutter_lints: ^$flutterLintsVersion

flutter:

  uses-material-design: true

  assets:
    - assets/anim/
    - assets/icons/
    - assets/images/
    - assets/logos/
    - assets/sounds/
    - assets/videos/

#  fonts:
#        
#    - family: FontFamilyName
#      fonts:
#        - asset: assets\\fonts\\name.extension    
 
   
    
''';
    final File file =
        await File('${path.current}/pubspec.yaml').create(recursive: true);
    await file.writeAsString(text);
    _count++;
    print('Pubspec File Creation... \u2713');
  } catch (error) {
    print('Pubspec File Creation... \u2715 :  Error:- $error');
  }
}

Future<void> createLibraryFile11() async {
  try {
    String text = '''    
library $_projectName; 

export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'dart:async';
export 'dart:math'; 
export 'constants/constant.dart';
export 'views/styles/styles.dart';
export 'services/navigation/navigate.dart';
export 'dart:convert';
export 'dart:io';
export 'extensions/extension.dart';
export 'package:recase/recase.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:flutter_svg/flutter_svg.dart';
''';
    final File file = await File('${path.current}/lib/$_projectName.dart')
        .create(recursive: true);
    await file.writeAsString(text);
    _count++;
    print('Library File Creation... \u2713');
  } catch (error) {
    print('Library File Creation... \u2715 :  Error:- $error');
  }
}

Future<void> createMainDart12() async {
  try {
    final className = _appName.replaceAll(' ', '');

    String text = '''
$_library


void main() {
 runApp(const $className());
}

class $className extends StatelessWidget {
  const $className({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, widget) {
        return MaterialApp(
          title: '${_appName.replaceAll(' ','')}',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(),
          home: widget,
        );
      },
      child:Container(),
    );
  }
}
    
''';
    final File file =
        await File('${path.current}/lib/main.dart').create(recursive: true);
    await file.writeAsString(text);
    _count++;
    print('Main File Creation... \u2713');
  } catch (error) {
    print('Main File Creation... \u2715 :  Error:- $error');
  }
}

Future<void> createWidgetTest13() async {
  try {
    final className = _appName.replaceAll(' ', '');

    String text = '''
// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:$_projectName/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const $className());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

  
''';
    final File file = await File('${path.current}/test/widget_test.dart')
        .create(recursive: true);
    await file.writeAsString(text);
    _count++;
    print('Test File Creation... \u2713');
  } catch (error) {
    print('Test File Creation... \u2715 :  Error:- $error');
  }
}
// dart compile
// dart compile exe bin/flutter_get_file.dart && dart compile aot-snapshot bin/flutter_get_file.dart
