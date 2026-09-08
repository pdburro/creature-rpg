# Lanesboro-inspired prototype map plan

Last updated: 2026-08-30

## Purpose

This plan translates the spatial character of Lanesboro, Minnesota into a
compact game world. It is not a tile-for-tile recreation. The prototype should
feel like a small town concentrated in a river valley: a walkable center,
roads that converge downtown, a river and trail that organize movement, farms
at the edge, and wooded bluffs that form natural boundaries.

## World structure

```text
                         North bluff
                    [future exploration]
                             |
 [Prototype Farm] ===== [Central Town] ===== [Trail and Gathering Area]
        |                    |                         |
   [Farmhouse]       bridge over river          future trail town
                             |
                    [Riverside Park]

Legend: ===== seamless outdoor map connection
        |     door, bridge, or transfer connection
```

The main road is the west-east spine. It begins among fields, narrows into the
downtown street, and continues east as a trail corridor. The river runs along
the southern side of town. A bridge connects downtown to the riverside park.
Wooded slopes and limestone-like cliffs constrain the northern edge.

## Prototype map list

Map IDs must be assigned by RPG Maker XP when the maps are created. Record the
IDs in this table before editing PBS connections or metadata.

| ID | Working map name | Size | Role | Required connections |
| ---: | --- | ---: | --- | --- |
| 77 | DEV - Prototype Farm | 40 x 35 | Home, crop testing, Pokémon helper testing | East to Central Town; farmhouse door |
| 80 | DEV - Farmhouse | 20 x 15 | Bed, save/sleep loop, introductory scenes | Door to Prototype Farm |
| 78 | DEV - Central Town | 50 x 40 | Walkable social and commercial hub | West to Farm; east to Trail; south bridge to Park |
| 81 | DEV - Seed and General Store | 20 x 15 | Seeds, produce sales, supplies | Door to Central Town |
| TBD | DEV - Community Hall | 25 x 20 | Quests, meetings, festivals later | Door to Central Town |
| TBD | DEV - Riverside Park | 40 x 30 | Fishing, gathering, community events | Bridge/transfer to Central Town |
| 79 | DEV - Trail and Gathering Area | 60 x 25 | Foraging, wild Pokémon, resource loop | West to Central Town |

These names deliberately use the `DEV -` prefix. They should remain isolated
from the example game's story until the vertical slice replaces it.

## Shared visual language

- Use a compact historic-looking downtown rather than a wide modern city.
- Keep important services within a short walk of the central intersection.
- Make the main road readable from each outdoor map entrance.
- Use the river, bluff walls, tree lines, fences, and buildings as natural map
  boundaries instead of invisible barriers.
- Allow secondary footpaths to create small loops, but keep the primary route
  unmistakable.
- Reserve open space near the river for a park, market, and future festival.
- Let the trail feel flatter and gentler than the bluff paths.
- Avoid copying real homes or private properties exactly.

## First build: DEV - Prototype Farm

Create this map first. It proves scale and establishes the western approach to
town without requiring custom scripts.

### RPG Maker XP settings

- Name: `DEV - Prototype Farm`
- Width: `40`
- Height: `35`
- Tileset: use the same outdoor tileset as an existing example town initially
- Map position in list: create a new parent folder/group named `DEV Prototype`
  if practical, then place this map under it
- Music: reuse a calm existing outdoor track for the prototype

### Tile-space layout

Coordinates below are planning ranges, not engine events. RPG Maker coordinates
start at the upper-left corner.

- Northern tree/bluff buffer: rows 0-5
- Main west-east road: rows 16-19, extending from column 0 to column 39
- Farmhouse footprint: columns 5-13, rows 7-13
- Farmhouse front door: around column 9, row 14
- Initial crop field: columns 5-14, rows 21-28
- Pokémon rest/habitat area: columns 18-25, rows 22-28
- Pond or irrigation feature: columns 28-34, rows 23-29
- Southern fence/tree buffer: rows 31-34
- Town connection opening: east edge, rows 16-19
- Western service path/future expansion: west edge, rows 17-18, blocked for now

### Schematic

```text
  0         10        20        30       39
0 T T T T T T T T T T T T T T T T T T T T
  T       wooded/bluff boundary             T
6 T                                          T
  T    +---------+                           T
  T    |farmhouse|                           T
  T    +----D----+                           T
15T                                          T
16============================================> town
19============================================> town
20T                                          T
  T    [ crop plots ]   [Pokémon rest]       T
  T    [ crop plots ]             ( pond )    T
30T                                          T
  T T T T T T T T fence / trees T T T T T T T
34T T T T T T T T T T T T T T T T T T T T
```

### Farm-map completion checklist

- [ ] Map is created with the exact working name and dimensions.
- [ ] The main road is four tiles wide and reaches the east edge cleanly.
- [ ] The player cannot walk into black space around any outer edge.
- [ ] The farmhouse exterior and door are visually readable.
- [ ] The crop field has at least 40 usable-looking tiles.
- [ ] The helper habitat and pond are visually distinct from the crop field.
- [ ] Space exists for later shipping, storage, and crafting objects without
      placing those systems yet.
- [ ] The map is pleasant to cross on foot and does not feel excessively large.
- [ ] A screenshot is captured for review before creating Central Town.

## Second build: DEV - Central Town

Do not detail this map until the farm scale feels right. Its initial blockout
should contain:

- A west-east main street aligned with the farm road
- A central intersection and small civic square
- General store close to the intersection
- Community hall facing the square
- A Pokémon service location reserved but not necessarily implemented
- River along the southern portion of the map
- One bridge leading south toward Riverside Park
- Trail entrance on the east edge
- Bluff/tree boundary along the north edge
- Several decorative building plots left empty for future residents

## Connection rules

- Farm to town and town to trail should be seamless outdoor map connections.
- Interiors should use door transfer events.
- Town to Riverside Park may begin as a bridge transfer; it can become a
  seamless connection later if the maps align cleanly.
- Do not add entries to `PBS/map_connections.txt` until both participating maps
  exist and their openings have been tested visually.
- Record every new map ID in this document immediately.

## Prototype success criteria

This map package is complete when the player can walk from the farmhouse,
across the farm, through downtown, into the gathering trail, return through
town, cross to the riverside park, and get home without broken transfers,
unintended dead ends, black borders, or confusing road alignment.
