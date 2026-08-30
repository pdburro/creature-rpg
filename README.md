# Creature RPG

This repository is the development baseline for a fangame built with Pokémon
Essentials v21.1. It currently retains the Essentials example game's maps and
data as a working reference while original content is developed.

## Open the project

- Run `Game.exe` to play-test.
- Open `Game.rxproj` in RPG Maker XP to edit maps and events.
- Hold Ctrl while launching from RPG Maker XP when PBS data needs recompiling.
- Treat files in `PBS/` as the source of truth for game data. Files in `Data/`
  with matching names are generated compiled data.

## Before making changes

Run the baseline validator from PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File tools/validate_project.ps1
```

See `docs/PROJECT_BASELINE.md` for the current content boundary, known issues,
and the recommended workflow.

See `docs/CURRENT_GOAL.md` for the active Pokémon-assisted farming vertical
slice, its objectives, checkpoints, and definition of completion.

## Repository conventions

- Commit PBS text changes together with their recompiled `Data` files.
- Commit map changes together with `Data/MapInfos.rxdata` when RPG Maker updates it.
- Keep experimental or downloaded resource packs under `Resource Packs/` until
  their files have been deliberately integrated and tested.
- Do not commit save files, logs, crash dumps, or editor backups.
- Make a focused commit after each coherent map, system, or content change.

Pokémon Essentials and Pokémon assets retain their respective third-party
licenses and ownership. This repository is intended for fangame development.
