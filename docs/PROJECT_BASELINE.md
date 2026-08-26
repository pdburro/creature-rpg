# Project baseline

Baseline audited on 2026-08-26.

## Current identity

- Engine: Pokémon Essentials v21.1 / RPG Maker XP
- Working title: not chosen; `Game.ini` still uses the Essentials default
- Repository branch: `main`
- Content strategy: retain the Essentials example game as a known-good sandbox
  while replacing it with original content deliberately
- Plugins: none installed

## Runtime content

The active runtime directories are `Audio/`, `Data/`, `Fonts/`, `Graphics/`,
`PBS/`, and `Plugins/`. Downloaded assets must not be assumed active merely
because they exist in the repository.

The starting point is still substantially the Essentials example game. Its
world includes Lappet Town, Cedolan City, Lerucean Town, Routes 1-8, Natural
Park, Ingido Plateau, the Battle Frontier, the Safari Zone, Berth Island, and
Faraday Island. These names do not yet represent an approved original region.

There are 76 map files. Maps 9, 10, 23, 25, 33, 42, 43, and 48 show later edits
than the initial copied project, and map 76 was saved later still. Treat these
as experimental until reviewed in RPG Maker XP.

The connection data also contains a development cluster involving Test Town
(22), alternate Route 1 (33), alternate Route 2 (42), and Route 7 (47). Do not
build story progression on those connections until they have been inspected.

## Source-of-truth rules

- PBS text files are authoritative for species, moves, items, trainers,
  encounters, metadata, and other database content.
- Compiled `.dat` files under `Data/` are generated from PBS and are committed
  so the game remains immediately playable.
- RPG Maker `.rxdata` map files are authoritative for maps and events.
- `Data/Scripts.rxdata` is currently the only script bundle. No editable Ruby
  source tree is present, so script changes should wait until source export or
  restoration is handled as a separate, verified task.

## Quarantined resources

`Graphics/Graphics/` contains a large legacy graphics collection. Because of its
nested path, its files are not active in normal Essentials lookups. It remains
in its original tracked location to avoid a noisy relocation of roughly 20,000
files. Treat it exactly like a quarantined resource pack: integrate assets in
small reviewed batches using the correct paths under `Graphics/`, then test.

The generation-specific folders under `PBS/` are intentional reference backups
provided with the example project and remain in place.

## Known baseline gaps

- Choose the game's title and update `Game.ini`.
- Define the original region, premise, player characters, starters, and initial
  progression before replacing example content.
- Review maps 22, 33, 42, 43, 47, 48, and 76 in RPG Maker XP.
- Confirm every retained map has appropriate metadata, encounters, and valid
  transfers/connections.
- Restore editable script sources before developing custom systems.
- Establish asset attribution and licensing records as resources are adopted.

## Safe first milestone

Create a vertical slice containing one original starting town, one route, one
small destination, a starter choice, two trainer battles, and a short quest.
Keep the remaining example maps available as a mechanics sandbox until that
slice is playable end to end.
