export PYTHONPATH=/usr/local/lib/python2.7/dist-packages:$PYTHON

nohup python -u ./src/cal_feature_norm.py \
    --image-list=/workspace/data/megaface2_refinedet_align_112x112/img_clean.lst \
    --feature-dir=/workspace/data/megaface2_refinedet_align_112x112/feature/no_norm_model-r100-spa-m2.0-8gpu-blueface_ansia_95660_and_deepint_ansia_143050-ep90 \
    --threshold = 17 \
    --out-result-list=./result/megaface2_norm.lst > ./logs/nohup.log 2>&1 &
