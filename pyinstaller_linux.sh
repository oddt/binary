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
    --add-data "${CONDA_ROOT}/share/openbabel/2.4.0/*:data/" \
    --add-data "${CONDA_ROOT}/share/RDKit/Data/*:rdkit/Data" \
    --add-binary "${CONDA_ROOT}/lib/openbabel/2.4.0/mdlformat.so:." \
    --add-binary "${CONDA_ROOT}/lib/openbabel/2.4.0/mol2format.so:." \
    --add-binary "${CONDA_ROOT}/lib/openbabel/2.4.0/pdbformat.so:." \
    --add-binary "${CONDA_ROOT}/lib/openbabel/2.4.0/pdbqtformat.so:." \
    --add-binary "${CONDA_ROOT}/lib/openbabel/2.4.0/smilesformat.so:." \
    --runtime-hook pyi_rth_obdata.py \
    --runtime-hook pyi_rth_rdkit.py \
    --add-data=${CONDA_ROOT}/lib/python${CONDA_PY}/site-packages/oddt/scoring/functions/RFScore/*.csv:oddt/scoring/functions/RFScore/ \
    --add-data=${CONDA_ROOT}/lib/python${CONDA_PY}/site-packages/oddt/scoring/functions/NNScore/*.csv:oddt/scoring/functions/NNScore/ \
    --nowindow \
    --strip \
    --add-binary "${CONDA_ROOT}/lib/libinchi.so:." \
    --add-binary "${CONDA_ROOT}/lib/libmkl_avx.so:." \
    -n oddt_cli --onefile ${CONDA_ROOT}/bin/oddt_cli
