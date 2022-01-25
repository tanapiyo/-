from pathlib import Path
from PIL import Image


def _crop_center(pil_img, crop_width, crop_height):
    img_width, img_height = pil_img.size
    return pil_img.crop(((img_width - crop_width) // 2,
                         (img_height - crop_height) // 2,
                         (img_width + crop_width) // 2,
                         (img_height + crop_height) // 2))


def list_dirs_and_crop(folder):
    input_dir = Path(r"./imgs/{folder}".format(folder=folder))
    # 出力先のディレクトリを作成する。
    output_dir = Path(r"./imgs/cropped_{folder}".format(folder=folder))
    output_dir.mkdir(exist_ok=True)
    # 画像ファイルの中を再起的に検索する
    for path in get_paths(input_dir, exts=[".jpg", ".jpeg", ".png"]):
        im = Image.open(str(path))
        _crop_center(im, 240, 240)


if __name__ == 'main':

    input_dir = Path(r"./imgs/")
    for path in get_paths(input_dir, exts=[".jpg", ".jpeg", ".png"]):
        print(path)

    # 出力先のディレクトリを作成する
    # 画像を読み込む
