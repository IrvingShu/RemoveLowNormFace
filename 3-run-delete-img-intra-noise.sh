nohup python -u ./src/delete_intra_img_noise.py \
     --img-root-folder=/workspace/data/megaface2_refinedet_align_112x112/aligned_imgs_clean \
     --intra-noise-path=./log/0.3-megaface2-intra-above5-noise.txt \
     --threshold=17 \
     > ./img_delete.log 2>&1 &
 
