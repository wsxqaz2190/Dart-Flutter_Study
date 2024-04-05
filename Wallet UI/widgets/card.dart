import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class card extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool isinverted;
  final double order;

  final _blackColor = const Color(0xFF1F2123);

  const card({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.isinverted,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(order * 5, order * -20),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: isinverted ? Colors.white : _blackColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: isinverted ? _blackColor : Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                          color: isinverted
                              ? _blackColor
                              : Colors.white.withOpacity(0.6),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        code,
                        style: TextStyle(
                            color: isinverted
                                ? _blackColor
                                : Colors.white.withOpacity(0.6)),
                      ),
                    ],
                  )
                ],
              ),
              Transform.scale(
                scale: 1.8,
                child: Transform.translate(
                  offset: const Offset(6, 11),
                  child: Icon(
                    icon,
                    color: isinverted ? _blackColor : Colors.white,
                    size: 88,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
