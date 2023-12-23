import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_app_clean_arch/domain/entities/note_entity.dart';

import 'note_tile.dart';

class DisplayNotes extends StatelessWidget {
  DisplayNotes({super.key, required this.notes});

  final List<NoteEntity> notes;
  final tileCounts = [
    [2, 2],
    [2, 2],
    [4, 2],
    [2, 3],
    [2, 2],
    [2, 3],
    [2, 2],
  ];
  final tileTypes = [
    TileType.square,
    TileType.square,
    TileType.horRect,
    TileType.verRect,
    TileType.square,
    TileType.verRect,
    TileType.square,
  ];

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      axisDirection: AxisDirection.down,
      children: [
        for (int i = 0; i < notes.length; i++)
          StaggeredGridTile.count(
            crossAxisCellCount: tileCounts[i % 7][0],
            mainAxisCellCount: tileCounts[i % 7][1],
            child: NoteTile(
              index: i,
              note: notes[i],
              tileType: tileTypes[i % 7],
            ),
          ),
      ],
    );
  }
}
