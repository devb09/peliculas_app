import 'package:flutter/material.dart';

class CastingCard extends StatelessWidget {
  const CastingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      height: 180,
      color: Colors.green,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return const _CastCard();
        },
      ),
    );
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 100,
      height: 100,
      color: Colors.amberAccent,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/150x300'),
              height: 140,
              width: 100,
              fit: BoxFit.fill,
            ),
          ),
          const Text(
            'Actor.name Actor.name Actor.name Actor.name ',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
