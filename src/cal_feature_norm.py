import numpy as np
import matio
import argparse
import os
import sys
import os.path as osp

fea_type = '_feat.bin'

def parse_args(argv):
    parser = argparse.ArgumentParser()
    parser.add_argument('--threshold', type=float, help='less threshold will remove')
    parser.add_argument('--image-list', type=str, help='image list file')
    parser.add_argument('--feature-dir', type=str,
                        help='feature root dir if feature list contains relative paths')
    parser.add_argument('--out-result-list', type=str,
                        help='save path of feature norm ')
    return parser.parse_args(argv)


def main(args):
    root_folder =args.feature_dir
    img_list = args.image_list
    save_list = args.out_result_list
    threshold = args.threshold

    with open(img_list) as f, open(save_list,'w')as f2:
        lines = f.readlines()
        print('All Feature Num: %d' %len(lines))
        for line in lines:
            fea_name = line.strip() + fea_type
            if not os.path.exists(osp.join(root_folder, fea_name)):
                continue

            fea  = matio.load_mat(osp.join(root_folder, fea_name)).flatten()
            norm = np.linalg.norm(fea)
            if norm < threshold:
                f2.write(line.strip() + ' ' + str(norm) + '\n')

if __name__ == '__main__':
    main(parse_args(sys.argv[1:]))
    print('Finished')
