import 'package:flutter/material.dart';

import '../../../../core/widgets/status_badge.dart';

class HeaderBadges extends StatelessWidget {
  const HeaderBadges({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const StatusBadge(
          child: Row(
            children: [
              CircleAvatar(radius: 4, backgroundColor: Colors.greenAccent),
              SizedBox(width: 8),
              Text(
                'JID GATEWAY',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        StatusBadge(
          child: Row(
            children: [
              Icon(Icons.lock_outline, color: Colors.amber, size: 14),
              Text(
                'TLS 1.3 SECURE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
