# Current goal: Pokémon-assisted farming vertical slice

Last updated: 2026-08-30

## Vision

Create a cozy life-and-farming game in Pokémon Essentials where Pokémon are
partners in building a home and helping a community. Pokémon should contribute
according to their abilities and personalities rather than functioning as
faceless farm equipment.

The current goal is not to recreate all of Stardew Valley. It is to prove that
planting a crop, caring for it over several in-game days, and asking a trusted
Pokémon to help with the work is understandable, reliable, and fun.

## Definition of accomplished

The vertical slice is accomplished when a new save can be played through the
following loop without developer intervention:

1. The player begins at a small farm and receives or befriends a helper Pokémon.
2. The player plants, waters, grows, and harvests at least one crop.
3. The helper Pokémon can perform one useful farm chore with clear feedback and
   a meaningful limitation.
4. The player visits a nearby town, interacts with its residents, and obtains a
   practical reason to keep farming.
5. The player explores one nearby area containing gathering and Pokémon gameplay.
6. Sleeping advances the day and all important progress survives saving,
   closing, and reopening the game.
7. The loop remains stable for at least seven consecutive in-game days.

## Design principles

- Pokémon are companions first and productivity bonuses second.
- Helping requires an appropriate Pokémon, sufficient trust, and reasonable
  limits such as stamina, time, range, or frequency.
- Manual chores must remain understandable and usable before automation is added.
- Every system needs visible player feedback; hidden state should be minimized.
- Prefer a small, polished loop over many unfinished features.
- Use original development maps and avoid building new progression into stock
  example maps.
- Keep systems data-driven where practical so crops and helper abilities can be
  expanded without rewriting their foundations.

## Objective 0: Prepare for custom systems

Goal: Make custom Ruby development safe and reviewable.

- [ ] Restore or export the editable Pokémon Essentials v21.1 script sources.
- [ ] Confirm the exported sources reproduce the current game without behavior
      changes.
- [ ] Decide where original scripts and data definitions will live.
- [ ] Add a repeatable smoke-test checklist for launching, loading, saving, and
      starting a new game.
- [ ] Commit the restored source tree separately from gameplay changes.

Checkpoint: The game launches from editable sources, and script changes can be
reviewed in Git as text.

## Objective 1: Establish the prototype space

Goal: Create a contained area for the vertical slice.

- [ ] Create one original farm map.
- [ ] Create one small nearby town map.
- [ ] Create one route or gathering-area map.
- [ ] Add required interiors: farmhouse, shop, and one community location.
- [ ] Connect outdoor maps cleanly and add tested door/transfer events.
- [ ] Add map metadata, names, outdoor settings, and appropriate music.
- [ ] Keep the new maps grouped and clearly labeled in RPG Maker XP.
- [ ] Confirm no original example-map progression was accidentally changed.

Checkpoint: The player can walk from the farmhouse to the farm, town, and
gathering area and return without broken transfers, black borders, or traps.

## Objective 2: Implement the day cycle

Goal: Give farm activity a dependable daily rhythm.

- [ ] Track the current day and time of day.
- [ ] Display time clearly enough for play-testing.
- [ ] Define when time advances and which menus or scenes pause it.
- [ ] Implement sleeping and the transition to the next morning.
- [ ] Return the player to the farmhouse after sleeping.
- [ ] Define a simple late-night rule such as forced rest or passing out.
- [ ] Persist the day and time through normal saves.

Checkpoint: The player can complete seven days, including saving and loading,
without the clock, player location, or day count becoming invalid.

## Objective 3: Build the manual crop loop

Goal: Make farming work before Pokémon assistance is introduced.

- [ ] Define a small farmable plot rather than making every ground tile farmable.
- [ ] Implement soil preparation or clearly designate prepared plots.
- [ ] Implement seed planting.
- [ ] Implement manual watering.
- [ ] Advance crop growth when a new day begins.
- [ ] Prevent unwatered crops from advancing, or define another clear penalty.
- [ ] Implement harvesting and a crop item reward.
- [ ] Add at least two crops with different growth times or values.
- [ ] Show distinct visual states for empty, planted, growing, ready, and
      harvested plots.
- [ ] Persist every plot's crop, growth stage, and watered state.

Checkpoint: A player who has no helper Pokémon can plant and harvest both crops,
and all plot states survive saving and loading.

## Objective 4: Add the first helper Pokémon

Goal: Prove that Pokémon assistance improves the farming loop while still
feeling like partnership.

- [ ] Choose the first helper species and explain why its ability fits it.
- [ ] Create a simple way to ask the Pokémon for help.
- [ ] Implement one chore ability, preferably watering a limited group of plots.
- [ ] Require the Pokémon to be owned, present, or assigned to the farm.
- [ ] Add one meaningful restriction: stamina, uses per day, range, trust, or
      another readable constraint.
- [ ] Add animation, sound, dialogue, or another clear response when it helps.
- [ ] Handle invalid requests gracefully, including no eligible plots or an
      exhausted helper.
- [ ] Ensure assistance uses the same crop state rules as manual watering.
- [ ] Persist the Pokémon's assignment and daily usage state.

Checkpoint: The helper reliably completes its chore, cannot be exploited beyond
its stated limit, and saves the player noticeable effort without eliminating
all participation.

## Objective 5: Add trust and care

Goal: Give the helper relationship emotional and mechanical meaning.

- [ ] Define a small trust scale or reuse an appropriate existing Pokémon value.
- [ ] Identify at least two ways trust can increase.
- [ ] Prevent repetitive actions from producing unlimited trust.
- [ ] Let trust improve one aspect of the helper ability.
- [ ] Give the Pokémon a resting place or habitat on the farm.
- [ ] Provide readable reactions at low, normal, and high trust.
- [ ] Ensure neglect is not excessively punitive in the prototype.

Checkpoint: A tester can explain how trust changes, identify its effect, and
describe the helper as a character rather than a tool.

## Objective 6: Create the town motivation loop

Goal: Give harvested crops and daily travel a purpose.

- [ ] Add a shop that sells seeds and buys or accepts harvested produce.
- [ ] Add three named residents with distinct roles and short daily dialogue.
- [ ] Give at least one resident a simple schedule or location change.
- [ ] Add one introductory quest involving crops or Pokémon assistance.
- [ ] Reward the quest with something that improves the farm loop.
- [ ] Add a simple money or barter balance that permits continued planting.
- [ ] Make the town recognize at least one stage of the player's progress.

Checkpoint: Farming produces a useful reward, the reward supports another day
of farming, and the introductory quest has a clear beginning and ending.

## Objective 7: Add exploration and Pokémon gameplay

Goal: Connect the cozy farm loop to the Pokémon side of the game.

- [ ] Populate one gathering area with items or renewable materials.
- [ ] Add a small, intentional wild encounter table.
- [ ] Include at least one ordinary Pokémon battle or alternative encounter.
- [ ] Add one obstacle or resource interaction that benefits from a Pokémon.
- [ ] Provide a reason to revisit the area on later days.
- [ ] Ensure exploration rewards support farming, care, or town progression.

Checkpoint: Exploration feels connected to the farm rather than like a separate
traditional Pokémon route.

## Objective 8: Persistence and reliability

Goal: Ensure the simulation can be trusted.

- [ ] Save day, time, crops, watered states, harvested states, helper assignment,
      helper usage, trust, quest progress, inventory, and money.
- [ ] Test saving on the farm, in town, indoors, and in the gathering area.
- [ ] Test loading before and after sleeping.
- [ ] Test a new game after an existing save has been created.
- [ ] Verify that daily reset logic runs exactly once per new day.
- [ ] Verify that unavailable or changed events do not corrupt older saves made
      during development.
- [ ] Run `tools/validate_project.ps1` before each milestone commit.

Checkpoint: Three test saves at different stages load correctly, and one save
completes seven consecutive days without duplicated or lost progress.

## Objective 9: Presentation and onboarding

Goal: Make the vertical slice understandable without developer explanation.

- [ ] Replace the default Essentials title with a working project title.
- [ ] Teach movement, interaction, planting, watering, sleeping, and requesting
      Pokémon help through play.
- [ ] Add concise feedback for successful and failed actions.
- [ ] Make interactable plots and helper states visually readable.
- [ ] Remove or hide debug-only entrances from the normal play path.
- [ ] Check text for clarity, consistency, and overflow.
- [ ] Check audio levels and obvious missing graphics.

Checkpoint: A new tester can complete the introductory quest and harvest a crop
without verbal instructions.

## Objective 10: Vertical-slice play-test

Goal: Decide whether Pokémon-assisted farming is strong enough to expand.

- [ ] Complete an internal start-to-finish play-through.
- [ ] Have at least one new player test without guidance.
- [ ] Record confusion, bugs, repetitive tasks, and moments of delight.
- [ ] Confirm the helper interaction is more enjoyable than manual chores alone.
- [ ] Fix progression blockers and save corruption before cosmetic issues.
- [ ] Re-test the full seven-day loop after fixes.
- [ ] Write a short retrospective and choose one outcome:
  - [ ] Continue building in Essentials.
  - [ ] Revise the core loop and run another prototype.
  - [ ] Preserve the design findings and evaluate a standalone engine.

Checkpoint: We have evidence—not just assumptions—about whether the concept is
fun and whether Essentials can support it comfortably.

## Deferred until after the vertical slice

These features are deliberately out of scope for the current goal:

- Full seasons and a large crop catalog
- Romance and extensive relationship systems
- Festivals and town-wide calendar events
- Livestock and ranching
- Large mines or procedural dungeons
- Extensive crafting and processing machines
- Farm building placement and freeform decoration
- Many helper species and complex automation chains
- Multiplayer
- A complete Pokémon League journey
- A large original region
- Commercial release planning

Adding a deferred feature requires an explicit decision to change the current
goal; it should not be introduced incidentally.

## Milestone order

1. Editable script source and smoke tests
2. Prototype maps and navigation
3. Day/sleep cycle
4. Manual crop loop
5. First helper Pokémon
6. Trust and care
7. Town economy and introductory quest
8. Exploration loop
9. Persistence hardening
10. Onboarding and external play-test

## Progress log

Record completed milestones here with the date and commit ID.

| Date | Milestone | Commit | Notes |
| --- | --- | --- | --- |
| 2026-08-26 | Clean project baseline | `11e02a1c` | Documentation and validator added. |

