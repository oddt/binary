#!/bin/bash
export CONDA_ROOT="$HOME/miniconda/envs/oddt_env/"

pyi-bindepend /opt/X11/lib/libxcb-shm.0.dylib

pyinstaller \
    --clean \
    --hidden-import=six \
    --hidden-import=sklearn.tree._utils \
    --hidden-import=compiledtrees \
    --exclude-module tcl \
    --exclude-module Tkinter \
    --exclude-module rdkit \
    --add-data "${CONDA_ROOT}/share/openbabel/2.4.0/*:data/" \
    --add-binary "${CONDA_ROOT}/lib/openbabel/2.4.0/mdlformat.so:." \
    --add-binary "${CONDA_ROOT}/lib/openbabel/2.4.0/mol2format.so:." \
    --add-binary "${CONDA_ROOT}/lib/openbabel/2.4.0/pdbformat.so:." \
    --add-binary "${CONDA_ROOT}/lib/openbabel/2.4.0/pdbqtformat.so:." \
    --add-binary "${CONDA_ROOT}/lib/openbabel/2.4.0/smilesformat.so:." \
    --runtime-hook pyi_rth_obdata.py \
    --add-data=${CONDA_ROOT}/lib/python2.7/site-packages/oddt/scoring/functions/RFScore/*.csv:oddt/scoring/functions/RFScore/ \
    --add-data=${CONDA_ROOT}/lib/python2.7/site-packages/oddt/scoring/functions/NNScore/*.csv:oddt/scoring/functions/NNScore/ \
    --nowindow \
    --strip \
    --add-binary "${CONDA_ROOT}/lib/libinchi.0.dylib:." \
    --add-binary "/opt/X11/lib/libcairo.2.dylib:." \
    --add-binary "/opt/X11/lib/libxcb-render.0.dylib:." \
    --add-binary "/opt/X11/lib/libxcb-shm.0.dylib:." \
    --add-binary "/opt/X11/lib/libfontconfig.1.dylib:." \
    --add-binary "/opt/X11/lib/libXrender.1.dylib:." \
    --add-binary "/opt/X11/lib/libpng16.16.dylib:." \
    --add-binary "/opt/X11/lib/libX11-xcb.1.dylib:." \
    --add-binary "/opt/X11/lib/libfreetype.6.dylib:." \
    --add-binary "/opt/X11/lib/libxcb.1.dylib:." \
    --add-binary "/opt/X11/lib/libX11.6.dylib:." \
    --add-binary "/opt/X11/lib/libpixman-1.0.dylib:." \
    --add-binary "/opt/X11/lib/libXext.6.dylib:." \
    --add-binary "/opt/X11/lib/libXau.6.dylib:." \
    --add-binary "/opt/X11/lib/libXdmcp.6.dylib:." \
    --add-binary "/opt/X11/lib/libxcb.1.dylib:." \
    --additional-hooks-dir=. \
    -n oddt_cli --onefile ${CONDA_ROOT}/bin/oddt_cli
