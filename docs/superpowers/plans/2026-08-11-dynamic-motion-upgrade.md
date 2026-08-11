# Seedance Dynamic Motion Upgrade Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Ensure every populated storyboard contains visible character action and every present environmental element receives physically coherent motion guidance.

**Architecture:** Keep the existing four-document Skill structure. Put global invariants in `SKILL.md`, scenario-specific choices in `motion-archetypes.md`, output slots in `output-contract.md`, and concrete demonstrations in `example-cases.md`; use one shell contract test to prevent omissions.

**Tech Stack:** Markdown Skill documents, YAML frontmatter, POSIX shell, `rg`.

## Global Constraints

- Preserve reference-image character identity, count, costume, architecture, perspective, and lighting.
- Default to bodily communication without dialogue or visible lip sync.
- Activate only environmental elements visible in the reference image.
- Keep one primary camera movement per segment.
- Use hard cuts between discontinuous spaces.

---

### Task 1: Add a failing dynamic-contract test

**Files:**
- Create: `tests/check-dynamic-contract.sh`
- Test: `tests/check-dynamic-contract.sh`

**Interfaces:**
- Consumes: the four Markdown files in the Skill package.
- Produces: exit code `0` only when the required dynamic clauses exist.

- [ ] **Step 1:** Add exact `rg -q` assertions for required character, cloud, galaxy, star, foliage, timeline, and example clauses.
- [ ] **Step 2:** Run `sh tests/check-dynamic-contract.sh` and verify it exits non-zero against the old Skill because the new clauses are absent.

### Task 2: Implement the minimal dynamic guidance

**Files:**
- Modify: `SKILL.md`
- Modify: `references/motion-archetypes.md`
- Modify: `references/output-contract.md`
- Modify: `references/example-cases.md`

**Interfaces:**
- Consumes: the requirements in `docs/superpowers/specs/2026-08-11-dynamic-motion-upgrade-design.md`.
- Produces: a discoverable Skill with mandatory action slots and physically coherent environment rules.

- [ ] **Step 1:** Update the frontmatter description and overview to include static-character, galaxy, star, cloud, and foliage triggers.
- [ ] **Step 2:** Add mixed-mode character action selection, bodily communication, and start/process/end action requirements to `SKILL.md`.
- [ ] **Step 3:** Add present-element-based environment motion and frequency separation to `SKILL.md`.
- [ ] **Step 4:** Update each applicable motion archetype with visible character action and relevant environment motion.
- [ ] **Step 5:** Add mandatory variables and structural action slots to the output contract.
- [ ] **Step 6:** Replace pure-static defaults in the examples with stable, visible actions.
- [ ] **Step 7:** Run `sh tests/check-dynamic-contract.sh` and verify exit code `0`.

### Task 3: Verify behavior and deploy locally

**Files:**
- Verify: all Skill files
- Sync: `/Users/joshes/Downloads/design-seedance-celestial-motion`
- Sync: `/Users/joshes/.codex/skills/design-seedance-celestial-motion`

**Interfaces:**
- Consumes: the upgraded working copy.
- Produces: identical source and installed directories ready for GitHub publication.

- [ ] **Step 1:** Run the original three behavior scenarios with the upgraded Skill loaded.
- [ ] **Step 2:** Confirm every populated segment has visible action; galaxy flows; stars flicker asynchronously; clouds and foliage move physically; discontinuous scenes hard-cut.
- [ ] **Step 3:** Fix only observed gaps and rerun the failing scenario.
- [ ] **Step 4:** Compare working, source, and installed directories with `diff -qr`, excluding `docs` and `tests` only if intentionally not installed.
- [ ] **Step 5:** Run the contract test against the final installed copy and verify exit code `0`.

