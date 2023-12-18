import 'package:flutter/material.dart';
import 'package:flutter_music_app/config/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SongTile extends StatelessWidget {
  final String songName;
  final VoidCallback onPressed;
  const SongTile({super.key, required this.songName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: divColor.withOpacity(0.6),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              SvgPicture.asset('assets/icons/play.svg'),
              const Gap(10),
              Flexible(
                child: Text(
                  songName,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
