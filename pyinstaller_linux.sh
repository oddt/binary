#!/bin/bash
export CONDA_ROOT="$HOME/miniconda/envs/oddt_env/"
pyinstaller \
    --clean \
    --hidden-import=six \
    --hidden-import=sklearn.tree._utils \
    --hidden-import=compiledtrees \
    --exclude-module tcl \
    --exclude-module Tkinter \
    --add-data "${CONDA_ROOT}/share/openbabel/2.4.0/*:data/" \
    --add-binary "${CONDA_ROOT}/lib/openbabel/2.4.0/*.so:." \
    --add-binary "${CONDA_ROOT}/lib/libinchi.so.0:." \
    --add-binary "${CONDA_ROOT}/lib/libmkl_avx.so:." \
    --add-binary "${CONDA_ROOT}/lib/libmkl_def.so:." \
    --runtime-hook pyi_rth_obdata.py \
    --add-data=${CONDA_ROOT}/lib/python2.7/site-packages/oddt/scoring/functions/RFScore/*.csv:oddt/scoring/functions/RFScore/ \
    --add-data=${CONDA_ROOT}/lib/python2.7/site-packages/oddt/scoring/functions/NNScore/*.csv:oddt/scoring/functions/NNScore/ \
    --nowindow \
    -n oddt_cli --onefile ${CONDA_ROOT}/bin/oddt_cli
