import 'package:eco_app_updater/src/eco_button.dart';
import 'package:flutter/material.dart';

class DialogMessage {
  void showDownloadUpdate(
    BuildContext context, {
    double width = 260,
    double height = 260,
    Color? loadingColor,
    String title = 'Downloading Update',
    String message = 'The application will restart after the update',
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (innerContext) => Center(
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          child: SizedBox(
            width: width,
            height: height,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/launcher.png',
                    height: 100,
                    package: 'eco_app_updater',
                  ),
                  const SizedBox(height: 15),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          // color: Colors.teal,
                        ),
                  ),
                  const SizedBox(height: 15),
                  LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    color: loadingColor,
                    minHeight: 8.0,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  const SizedBox(height: kDefaultFontSize),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 15.0,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> showConfirm({
    required BuildContext context,
    required String message,
    required String title,
    required String confirmLabel,
    double width = 260,
    double height = 240,
  }) async {
    return await showDialog(
      context: context,
      builder: (innerContext) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          content: SizedBox(
            width: width,
            height: height,
            child: Padding(
              padding: const EdgeInsets.all(
                15.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 70.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(50.0),
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).secondaryHeaderColor,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Image.asset(
                      'assets/icons/update.png',
                      package: 'eco_app_updater',
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Visibility(
                    visible: title.isNotEmpty,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    message,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 45.0,
                          child: EcoButton(
                            label: confirmLabel,
                            onPressed: () {
                              Navigator.of(innerContext).pop(true);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
