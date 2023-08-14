import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
final String title;

  const CustomHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text("航空券とホテル込み",
              style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
