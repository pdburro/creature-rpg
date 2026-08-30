# Gameplay smoke test

Use this checklist after script-loader, engine, plugin, compiler, or save-system
changes. Test in Debug mode through RPG Maker XP unless a release-build test is
specifically required.

## Clean launch

- [ ] Close any running copy of the game.
- [ ] Launch the project from RPG Maker XP.
- [ ] Confirm no Ruby exception or missing-file message appears.
- [ ] Reach the title/load screen.
- [ ] Confirm audio plays and the window accepts controls.

## Existing save

- [ ] Load an existing save if one is available.
- [ ] Confirm the player, party, inventory, money, and current map look correct.
- [ ] Walk between two connected outdoor maps.
- [ ] Enter and leave an interior through a transfer event.
- [ ] Open and close the pause menu, party, bag, and Pokédex where available.
- [ ] Trigger one wild encounter and finish or flee from it normally.
- [ ] Save, return to the title screen, and reload the new save.

## New game

- [ ] Start a new game in an unused save slot or after safely preserving the
      existing save.
- [ ] Complete the intro and obtain player control.
- [ ] Confirm the player starts on the intended map and tile.
- [ ] Confirm movement, interaction, menu access, and basic text display.
- [ ] Save and reload the new game.

## Result

- Tester:
- Date:
- Commit or working-tree state:
- Existing-save result:
- New-game result:
- Errors or unexpected behavior:
- Overall result: PASS / FAIL

Do not mark a source-extraction or engine milestone complete until both required
test paths pass, or any intentionally skipped path is documented above.
