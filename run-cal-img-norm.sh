export PYTHONPATH=/usr/local/lib/python2.7/dist-packages:$PYTHON
nohup python -u ./src/cal_img_norm.py \
     --model=/workspace/data/insightface-models/model-r100-spa-m2.0-8gpu-blueface_ansia_95660_and_deepint_ansia_143050/slim/model-r100-slim,90 \
    --image-list=/workspace/data/megaface2_refinedet_align_112x112/bad.lst \
    --image-dir=/workspace/data/megaface2_refinedet_align_112x112/aligned_imgs_clean \
    --save-dir=./ > ./logs/nohup.log 2>&1 &
