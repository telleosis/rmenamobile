import 'package:flutter/material.dart';

class PasswordUpdate extends StatefulWidget {
  const PasswordUpdate({super.key});

  @override
  State<PasswordUpdate> createState() => _PasswordUpdateState();
}

class _PasswordUpdateState extends State<PasswordUpdate> {
  final TextEditingController newPwController = TextEditingController();
  final TextEditingController confirmNewPwController = TextEditingController();

  @override
  void dispose() {
    newPwController.clear();
    confirmNewPwController.clear();
    super.dispose();
  }

  void callPasswordUpdateAPI(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        leading: SizedBox(
          width: 50,
          height: 50,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(0),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: 20,
                    color: Color(0xFFFFFFFF),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        ),
        shadowColor: const Color(0xffffffff),
        elevation: 0.5,
        centerTitle: true,
        backgroundColor: const Color(0xFF3A3A3A),
        toolbarHeight: 116.0,
        title: const SizedBox(
          width: 130,
          height: 27,
          child: Text(
            'Password Update',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Helvetica Neue',
              fontWeight: FontWeight.w500,
              height: 1.3,
            ),
          ),
        ),
      ),
      body: Container(
        width: 375,
        height: 844,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            const Positioned(
              left: 15.50,
              top: 80,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Update your password',
                    style: TextStyle(
                      color: Color(0xFF212B36),
                      fontSize: 24,
                      fontFamily: 'Helvetica Neue',
                      fontWeight: FontWeight.w700,
                      height: 1.3,
                    ),
                  ),
                  SizedBox(height: 4),
                  SizedBox(
                    width: 344,
                    child: Text(
                      'Set your new password',
                      style: TextStyle(
                        color: Color(0xFF637381),
                        fontSize: 14,
                        fontFamily: 'Helvetica Neue',
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 16,
              top: 180,
              child: SizedBox(
                width: 340,
                height: 50,
                child: TextFormField(
                  controller: newPwController,
                  obscureText: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your desired password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'New password',
                    labelStyle: const TextStyle(
                      color: Color(0xFF919EAB),
                      fontSize: 14,
                      fontFamily: 'Helvetica Neue',
                      fontWeight: FontWeight.w400,
                      height: 1.3,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color(0x51919EAB),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color(0x51919EAB),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16,
              top: 220,
              child: SizedBox(
                width: 340,
                height: 50,
                child: TextFormField(
                  controller: newPwController,
                  obscureText: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Confirm your desired password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Confirm New password',
                    labelStyle: const TextStyle(
                      color: Color(0xFF919EAB),
                      fontSize: 14,
                      fontFamily: 'Helvetica Neue',
                      fontWeight: FontWeight.w400,
                      height: 1.3,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color(0x51919EAB),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color(0x51919EAB),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16,
              top: 280,
              child: ElevatedButton(
                onPressed: () {
                  onPressed:
                  () => callPasswordUpdateAPI(context);
                },
                child: Container(
                  width: 343,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 11),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFBE0027),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Change password',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Helvetica Neue',
                          fontWeight: FontWeight.w700,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
