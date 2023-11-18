import 'package:flutter/material.dart';
import 'package:pecahan_rupiah/pecahan_rupiah.dart';
import '../constant/constant_index.dart';
import '../models/models_index.dart';
import '../pages/product_detail.dart';
import 'rating_tag.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Color titleColor;
  final Color priceColor;

  const ItemCard({
    super.key,
    required this.product,
    this.titleColor = Colors.black,
    this.priceColor = AppColor.primary,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetail(product: product)));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 16 - 8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // item image
            Container(
              width: MediaQuery.of(context).size.width / 2 - 16 - 8,
              height: MediaQuery.of(context).size.width / 2 - 16 - 8,
              padding: const EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    image: AssetImage(product.image?[0] ?? ''),
                    fit: BoxFit.cover),
              ),
              child: RatingTag(value: product.rating ?? 0.0),
            ),

            // item details
            Container(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${product.name}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: titleColor,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 2, bottom: 8),
                    child: Text(
                      Pecahan.rupiah(value: product.price ?? 0, withRp: true),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                        color: priceColor,
                      ),
                    ),
                  ),
                  Text(
                    '${product.storeName}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
