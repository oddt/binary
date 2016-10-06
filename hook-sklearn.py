from PyInstaller.utils.hooks import import collect_submodules
hiddenimports = collect_submodules('sklearn')
