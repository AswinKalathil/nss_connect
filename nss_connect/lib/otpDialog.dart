import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nss_connect/colors.dart';
import 'package:nss_connect/pageTrasitions.dart';
import 'package:nss_connect/ConfirmCard.dart';

import 'ConfirmData.dart';

void otp(BuildContext context, String unitNum) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          children: [
            Text(
              'OTP send to **$unitNum@gmail.com',
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              displayBottomSheet(context);
            },
            child: Text('proceed'))
      ],
    ),
  );
}

void displayBottomSheet(BuildContext context) {
  double factor = 0.7;
  double otpBoxSize = MediaQuery.of(context).size.height * 0.05;
  double botomSheetSize = MediaQuery.of(context).size.height * factor;
  showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: botomSheetSize,
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Enter OTP',
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: otpBoxSize,
                        width: 55,
                        child: TextField(
                          autofocus: true,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: otpBoxSize,
                        width: 55,
                        child: TextField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: otpBoxSize,
                        width: 55,
                        child: TextField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: otpBoxSize,
                        width: 55,
                        child: TextField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(primaryButton)),
                  child: const Text('Submit'),
                  onPressed: () {
                    Navigator.pop(context);
                    // Navigator.pushNamed(context,RegData.id)
                    nextPagePush(context, ConfirmData());
                  },
                ),
              ],
            ),
          ),
        );
      });
}

class OtpDialog extends StatefulWidget {
  const OtpDialog({super.key});

  @override
  State<OtpDialog> createState() => _OtpDialogState();
}

class _OtpDialogState extends State<OtpDialog> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
