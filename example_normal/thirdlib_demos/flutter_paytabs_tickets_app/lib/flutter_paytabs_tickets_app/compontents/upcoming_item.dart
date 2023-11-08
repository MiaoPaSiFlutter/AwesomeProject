import 'package:flutter/material.dart';
import 'package:flutter_paytabs_tickets_app/flutter_paytabs_tickets_app.dart';

class UpcomingItem extends StatelessWidget {
  final Event upcoming;
  const UpcomingItem({
    Key? key,
    required this.upcoming,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(upcoming.image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () => Navigator.of(context)
              .pushNamed(RouterNames.eventDetailsRoute, arguments: upcoming),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  upcoming.title,
                  style: lightCollectionTitle,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Image(image: AssetImage(AssetImages.genre)),
                    const SizedBox(width: 5),
                    Text(
                      upcoming.genre,
                      style: lightCollectionGenre,
                    ),
                    const SizedBox(width: 8),
                    Image(
                      image: AssetImage(AssetImages.ticketsActive),
                      color: AppColors.grey,
                      height: 12.5,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Є${upcoming.prices[0]} - Є${upcoming.prices[upcoming.prices.length - 1]}',
                      style: lightCollectionGenre,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
