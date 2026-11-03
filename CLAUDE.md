# HA-Firemote

Personal fork of PRProd/HA-Firemote. A Home Assistant Lovelace card shipped as
plain JS: `dist/HA-Firemote.js` (+ `dist/lit/`). No build step and no test suite.

## Verify a change in HA
1. Copy `dist/` into HA's `/config/www/` (or point HACS at this fork as a custom
   Frontend repository and redownload).
2. Confirm the resource is registered (Settings > Dashboards > Resources), then
   hard refresh the browser (Ctrl+Shift+R) so the old JS isn't cached.
3. In the browser console, confirm the "FIREMOTE-CARD <version> installed" banner
   shows the new version, with no errors.
4. Exercise what changed on a real card: editor dropdowns (entity, family, device
   type), remote style, and any buttons or app launchers touched. Confirm the device
   responds via the Android Debug Bridge entity.

## Release
- Don't tag or create a release unless I ask.
- When I do: bump `HAFiremoteVersion` at the top of `dist/HA-Firemote.js`
  (`-bN` suffix for prereleases), commit, push, confirm the "HACS Action" workflow
  passes, then tag that version and create a GitHub release from it. Mark `-bN`
  builds as prerelease.
