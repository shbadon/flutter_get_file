import 'dart:io';
import 'package:path/path.dart' as path;

void main(List<String> arguments) async {
  print(
      'Welcome to Flutter Get File Program. This program created only the "dart file & directory. This program was created by "Shuoib Hossain Badon"');

  String _projectName;
  String _projectSdk;

  while (true) {
    stdout.write('Enter your project name :');
    _projectName = stdin.readLineSync().toString();
    if (_projectName.isNotEmpty) {
      break;
    }
  }

  while (true) {
    stdout.write('Enter your project sdk name :');
    _projectSdk = stdin.readLineSync().toString();
    if (_projectSdk.isNotEmpty) {
      break;
    }
  }
  await createAssetsDirectory();
  await createConstantsDirectory();
  await createControllersDirectory();
  await createModelsDirectory();
  await createExtensionsDirectory();
  await createObjectsDirectory();
  await createServicesDirectory();
  await createUtilsDirectory();
  await createViewsDirectory();
  await createPubspecFile(_projectName, _projectSdk);
  await createMainDart();
}

Future<void> createAssetsDirectory() async {
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
  } catch (error) {
    print('Assets Directory Creation... \u2715 :  Error:- $error');
  }
}

Future<void> createConstantsDirectory() async {
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
  } catch (error) {
    print('Constants Directory Creation... \u2715 :  Error:- $error');
  }
}

Future<void> createFile(name) async {
  String text = '''
import 'package:flutter/material.dart';

class App$name {
  App$name._(); 
}

''';

  final File file = await File(
          '${path.current}/lib/constants/app_${name.toString().toLowerCase()}.dart')
      .create(recursive: true);
  await file.writeAsString(text);
}

Future<void> createControllersDirectory() async {
  try {
    String viewPath = "${path.current}/lib/";
    await Directory('${viewPath}controllers').create(recursive: true);
    print('Controllers Directory Creation... \u2713');
  } catch (error) {
    print('Controllers Directory Creation... \u2715 :  Error:- $error');
  }
}

Future<void> createModelsDirectory() async {
  try {
    String viewPath = "${path.current}/lib/";
    await Directory('${viewPath}models').create(recursive: true);
    print('Models Directory Creation... \u2713');
  } catch (error) {
    print('Models Directory Creation... \u2715 :  Error:- $error');
  }
}

Future<void> createExtensionsDirectory() async {
  try {
    await File('${path.current}/lib/extensions/extension.dart')
        .create(recursive: true);

    print('Extensions Directory Creation... \u2713');
  } catch (error) {
    print('Extensions Directory Creation... \u2715 :  Error:- $error');
  }
}

Future<void> createObjectsDirectory() async {
  try {
    String viewPath = "${path.current}/lib/";
    await Directory('${viewPath}objects').create(recursive: true);
    print('Objects Directory Creation... \u2713');
  } catch (error) {
    print('Objects Directory Creation... \u2715 :  Error:- $error');
  }
}

Future<void> createServicesDirectory() async {
  try {
    String viewPath = "${path.current}/lib/";
    await Directory('${viewPath}services/database').create(recursive: true);
    await Directory('${viewPath}services/navigation').create(recursive: true);
    print('Services Directory Creation... \u2713');
  } catch (error) {
    print('Services Directory Creation... \u2715 :  Error:- $error');
  }
}

Future<void> createUtilsDirectory() async {
  try {
    String viewPath = "${path.current}/lib/";
    await Directory('${viewPath}utils').create(recursive: true);
    print('Utils Directory Creation... \u2713');
  } catch (error) {
    print('Utils Directory Creation... \u2715 :  Error:- $error');
  }
}

Future<void> createViewsDirectory() async {
  try {
    String viewPath = "${path.current}/lib/";
    String stylePath = '${viewPath}views/styles/';

    await Directory('${viewPath}views/screens').create(recursive: true);
    await Directory('${viewPath}views/widgets').create(recursive: true);

    await File('${stylePath}container_style.dart').create(recursive: true);
    await File('${stylePath}text_style.dart').create(recursive: true);
    await File('${stylePath}button_style.dart').create(recursive: true);
    String text = '''
export 'container_style.dart';
export 'text_style.dart';
export 'button_style.dart';
''';
    final File file =
        await File('${stylePath}style.dart').create(recursive: true);

    await file.writeAsString(text);

    print('Views Directory Creation... \u2713');
  } catch (error) {
    print('Views Directory Creation... \u2715 :  Error:- $error');
  }
}

Future<void> createPubspecFile(name, sdk) async {
  try {
    String text = '''
name: $name
description: A new Flutter project.

publish_to: 'none'

version: 1.0.0+1

environment:
  sdk: '$sdk'

dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_test:
    sdk: flutter

  flutter_lints: ^1.0.0

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

    print('Pubspec File Creation... \u2713');
  } catch (error) {
    print('Pubspec File Creation... \u2715 :  Error:- $error');
  }
}

Future<void> createMainDart() async {
  try {
    String text = '''
import 'package:flutter/material.dart';


void main() {
 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}
    
''';
    final File file =
        await File('${path.current}/lib/main.dart').create(recursive: true);
    await file.writeAsString(text);

    print('Main File Creation... \u2713');
  } catch (error) {
    print('Main File Creation... \u2715 :  Error:- $error');
  }
}
// dart compile
// dart compile exe bin/flutter_get_file.dart && dart compile aot-snapshot bin/flutter_get_file.dart