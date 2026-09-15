# AlyArchetype

Custom theme for PokeMMO.

## Downloads

### Automatic updates — recommended

Download **`AlyArchetype-Updater.zip`** from the latest GitHub Release.

1. Extract `AlyArchetype-Updater.zip`.
2. Run `Install-Updater.bat`.
3. An **AlyArchetype Updater** shortcut with the ALYA icon is created on your Windows Desktop.
4. Use this shortcut whenever you want to check for and install a new AlyArchetype version.

The updater package contains:

```text
AlyArchetype-Updater.zip
├── Install-Updater.bat
├── AlyArchetype-Updater.bat
└── AlyArchetype.ico
```

### Manual installation

Download **`AlyArchetype.zip`** from the latest GitHub Release and place it in:

```text
PokeMMO\data\mods\AlyArchetype.zip
```

Do **not** extract the theme ZIP.

## Updater

The updater:

- checks the latest AlyArchetype GitHub Release;
- downloads the official `AlyArchetype.zip`;
- validates `info.xml` and `version.txt` before installation;
- verifies that the ZIP version matches the GitHub Release;
- refuses to update while PokeMMO is running;
- keeps one rollback copy as `AlyArchetype.backup.zip`;
- replaces the previous backup on the next successful update.

It only manages AlyArchetype files and does not automate gameplay or control PokeMMO.

## Release structure

Every GitHub Release should provide these two main downloads:

```text
AlyArchetype.zip
AlyArchetype-Updater.zip
```

`AlyArchetype.zip` must contain `info.xml` and `version.txt` directly at the root of the archive.

`AlyArchetype-Updater.zip` must contain:

```text
Install-Updater.bat
AlyArchetype-Updater.bat
AlyArchetype.ico
```

Keep these asset names identical between releases so the latest-download links remain stable.

## Publishing a new version

1. Change the theme's root `version.txt` to the new version.
2. Build `AlyArchetype.zip` and verify its root `version.txt`.
3. Create the matching GitHub tag, for example `v1.0.3`.
4. Attach `AlyArchetype.zip`.
5. Attach `AlyArchetype-Updater.zip`.
6. Publish the Release.
7. Close PokeMMO and test the Desktop updater.

## Compatibility

AlyArchetype is a custom PokeMMO theme. Game updates may require theme adjustments.
