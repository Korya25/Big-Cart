import 'package:big_cart/core/presentation/widgets/text_app.dart';
import 'package:flutter/material.dart';
import 'package:big_cart/core/resources/style/theme/app_colors.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textBlack),
          onPressed: () => Navigator.pop(context),
        ),
        title: const TextApp(
          text: 'Verify Number',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textBlack,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const TextApp(
              text: 'Verify your number',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textBlack,
              ),
            ),
            const SizedBox(height: 8),
            const TextApp(
              text: 'Enter your OTP code below',
              style: TextStyle(fontSize: 16, color: AppColors.textGrey),
            ),
            const SizedBox(height: 40),
            // OTP Input Fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: 45,
                  height: 45,
                  child: TextField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: AppColors.borderGrey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: AppColors.primary),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 5) {
                        _focusNodes[index + 1].requestFocus();
                      } else if (value.isEmpty && index > 0) {
                        _focusNodes[index - 1].requestFocus();
                      }
                    },
                  ),
                );
              }),
            ),
            const SizedBox(height: 40),
            // Next Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const TextApp(
                  text: 'Next',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textWhite,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Resend Code
            Center(
              child: Column(
                children: [
                  const TextApp(
                    text: "Didn't receive the code ?",
                    style: TextStyle(fontSize: 14, color: AppColors.textGrey),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const TextApp(
                      text: 'Resend a new code',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.linkBlue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Number Keypad
            _buildNumberKeypad(),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberKeypad() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          // Row 1: 1, 2, 3
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildKeypadButton('1', ''),
              _buildKeypadButton('2', 'ABC'),
              _buildKeypadButton('3', 'DEF'),
            ],
          ),
          const SizedBox(height: 10),
          // Row 2: 4, 5, 6
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildKeypadButton('4', 'GHI'),
              _buildKeypadButton('5', 'JKL'),
              _buildKeypadButton('6', 'MNO'),
            ],
          ),
          const SizedBox(height: 10),
          // Row 3: 7, 8, 9
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildKeypadButton('7', 'PQRS'),
              _buildKeypadButton('8', 'TUV'),
              _buildKeypadButton('9', 'WXYZ'),
            ],
          ),
          const SizedBox(height: 10),
          // Row 4: *, 0, #
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildKeypadButton('*', ''),
              _buildKeypadButton('0', ''),
              _buildKeypadButton('⌫', '', isBackspace: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildKeypadButton(
    String number,
    String letters, {
    bool isBackspace = false,
  }) {
    return GestureDetector(
      onTap: () {
        // Handle keypad tap
        if (isBackspace) {
          // Handle backspace
          for (int i = 5; i >= 0; i--) {
            if (_controllers[i].text.isNotEmpty) {
              _controllers[i].clear();
              if (i > 0) _focusNodes[i - 1].requestFocus();
              break;
            }
          }
        } else {
          // Handle number input
          for (int i = 0; i < 6; i++) {
            if (_controllers[i].text.isEmpty) {
              _controllers[i].text = number;
              if (i < 5) _focusNodes[i + 1].requestFocus();
              break;
            }
          }
        }
      },
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextApp(
              text: number,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.textBlack,
              ),
            ),
            if (letters.isNotEmpty)
              TextApp(
                text: letters,
                style: const TextStyle(fontSize: 10, color: AppColors.textGrey),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }
}
