from PyInstaller.utils.hooks import get_gi_typelibs, is_darwin

if is_darwin:
    binaries, datas, hiddenimports = get_gi_typelibs('cairo', '2')
