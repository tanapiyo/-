from pathlib import Path
from PIL import Image


def get_paths(input_dir, exts=None):
    paths = sorted([x for x in input_dir.iterdir()])
    if exts:
        paths = list(filter(lambda x: x.suffix in exts, paths))

    return paths


def crop_center(pil_img, crop_width, crop_height):
    img_width, img_height = pil_img.size
    return pil_img.crop(((img_width - crop_width) // 2,
                         (img_height - crop_height) // 2,
                         (img_width + crop_width) // 2,
                         (img_height + crop_height) // 2))


def list_dirs_and_crop(folder):
    print("processing" + folder + "images")
    input_dir = Path(r"./imgs/{folder}".format(folder=folder))
    # 出力先のディレクトリを作成する。
    output_dir = Path(r"./imgs/cropped_{folder}".format(folder=folder))
    output_dir.mkdir(exist_ok=True)
    # 画像ファイルの中を再起的に検索する
    for path in get_paths(input_dir, exts=[".jpg", ".jpeg", ".png"]):
        print("crop target : " + str(path))
        im = Image.open(str(path))
        im = crop_center(im, 220, 220)
        target_path = str(path).split("/")[2]
        im.save(
            "./imgs/cropped_{folder}".format(folder=folder) + '/' + target_path, quality=95)


input_dir = Path(r"./imgs/")
folders = ["leopard_200", "okonomiyaki_200",
           "takoyaki_50", "takoyaki_300", "tiger_200"]
for folder in folders:
    list_dirs_and_crop(folder)

# imgs/takoyaki_300/000281.jpg
