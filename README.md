# AlyArchetype

Custom theme for PokeMMO.

## Download

### Automatic updates — recommended
Download these three files from the latest release and keep them together:

- `Install-Updater.bat`
- `AlyArchetype-Updater.bat`
- `AlyArchetype.ico`

Then run `Install-Updater.bat` once.

The installer copies the updater and the ALYA icon to `%APPDATA%\AlyArchetypeUpdater` and creates an **AlyArchetype Updater** shortcut on the Windows Desktop with the ALYA logo.

After installation, use that Desktop shortcut whenever you want to check for a theme update.

### Manual installation
Download `AlyArchetype.zip` from the latest release and place it in:

`PokeMMO\data\mods\AlyArchetype.zip`

Do not extract the ZIP.

## Updater behavior

The updater:

- checks the latest AlyArchetype GitHub Release;
- downloads the official `AlyArchetype.zip` release asset;
- validates `info.xml` and `version.txt`;
- checks that the ZIP version matches the GitHub Release;
- refuses to update while PokeMMO is running;
- keeps one rollback copy as `AlyArchetype.backup.zip`;
- replaces the previous backup on the next successful update.

The updater only manages AlyArchetype files. It does not automate gameplay or control PokeMMO.

## Release assets

Every release should contain:

- `AlyArchetype.zip`
- `AlyArchetype-Updater.bat`
- `AlyArchetype.ico`
- `Install-Updater.bat`

`AlyArchetype.zip` must contain `info.xml` and `version.txt` directly at the root of the archive.

## Updating a release

Before publishing a new version:

1. Update the root `version.txt` to the new version.
2. Build `AlyArchetype.zip` with the same version in its root `version.txt`.
3. Create the matching GitHub tag, for example `v1.0.3`.
4. Upload all four release assets listed above.
5. Publish the release.
6. Test the Desktop updater with PokeMMO closed.

## Compatibility

AlyArchetype is a custom PokeMMO theme. Game updates may require theme adjustments.
