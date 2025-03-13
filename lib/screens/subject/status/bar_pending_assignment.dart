import 'package:flutter/material.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';

class BarPendingAssignment extends StatelessWidget {
  const BarPendingAssignment({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: 551,
      color: colorsApp.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: 487,
                constraints: const BoxConstraints(minHeight: 902),
                decoration: BoxDecoration(
                  color: colorsApp.background,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      " coomin soon ",
                      style: TextStyle(fontSize: 24, color: colorsApp.blue20),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
