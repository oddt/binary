#!/bin/bash
export CONDA_ROOT="$HOME/miniconda/envs/oddt_env/"

pyinstaller \
    --clean \
    --additional-hooks-dir=. \
    --hidden-import=six \
    --hidden-import=sklearn.tree._utils \
    --hidden-import=compiledtrees \
    --hidden-import=rdkit \
    --exclude-module tcl \
    --exclude-module Tkinter \
    --add-data "${CONDA_ROOT}/share/openbabel/*/*:data/" \
    --add-data "${CONDA_ROOT}/share/RDKit/Data/*:rdkit/Data" \
    --add-binary "${CONDA_ROOT}/lib/openbabel/*/mdlformat.so:." \
    --add-binary "${CONDA_ROOT}/lib/openbabel/*/mol2format.so:." \
    --add-binary "${CONDA_ROOT}/lib/openbabel/*/pdbformat.so:." \
    --add-binary "${CONDA_ROOT}/lib/openbabel/*/pdbqtformat.so:." \
    --add-binary "${CONDA_ROOT}/lib/openbabel/*/smilesformat.so:." \
    --runtime-hook pyi_rth_obdata.py \
    --runtime-hook pyi_rth_rdkit.py \
    --add-data=${CONDA_ROOT}/lib/python${CONDA_PY}/site-packages/oddt/scoring/functions/RFScore/*.csv:oddt/scoring/functions/RFScore/ \
    --add-data=${CONDA_ROOT}/lib/python${CONDA_PY}/site-packages/oddt/scoring/functions/NNScore/*.csv:oddt/scoring/functions/NNScore/ \
    --nowindow \
    --strip \
    --add-binary "${CONDA_ROOT}/lib/libinchi.so:." \
    --add-binary "${CONDA_ROOT}/lib/libmkl_avx.so:." \
    -n oddt_cli --onefile ${CONDA_ROOT}/bin/oddt_cli
