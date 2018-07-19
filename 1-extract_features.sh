#!/bin/bash

export PYTHONPATH=/usr/local/lib/python2.7/dist-packages:$PYTHON
export MXNET_CUDNN_AUTOTUNE_DEFAULT=0

MODEL_ROOT="/workspace/data/insightface-models/"
#change your model name

MODEL_NAME="model-r100-spa-m2.0-8gpu-blueface_ansia_95660_and_deepint_ansia_143050/slim/model-r100-slim,90"
MODEL_PATH="${MODEL_ROOT}${MODEL_NAME}"
echo $MODEL_PATH
#feature save
SAVE_ROOT="/workspace/data/megaface2_refinedet_align_112x112/feature/"
SAVE_NAME="no_norm_model-r100-spa-m2.0-8gpu-blueface_ansia_95660_and_deepint_ansia_143050-ep90"
SAVE_DIR="${SAVE_ROOT}${SAVE_NAME}"

#log
LOG_NAME="./logs/nohup-extract-log-model-r100-spa-m2.0-4gpu-faceemore-asian-91926-ep156-"

GPU_NUM=8

for ((i=0; i<$GPU_NUM; i++))
    do
        /bin/sleep 2
        nohup python ./extract_features/extract_features_for_aligned_imagelist.py \
              --model=$MODEL_PATH \
              --image-list="/workspace/data/qyc/upload/data/megaface2/"${i}.txt \
              --image-dir=/workspace/data/megaface2_refinedet_align_112x112/aligned_imgs_clean \
              --save-dir=$SAVE_DIR \
              --batch-size=50 \
              --image-size=3,112,112 \
              --add-flip \
              --gpu=$i \
              --save-format=.bin \
              --flip-sim > ${LOG_NAME}"split"${i}".txt" 2>&1 &
    done
