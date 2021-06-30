#!/bin/python

import sys
from os import path
import numpy as np
from PIL import Image

def rgb_to_8_bit(rgb):
    return (int(rgb[0] * 7 / 255) << 5) + (int(rgb[1] * 7 / 255) << 2) + int(rgb[2] * 3 / 255)
    #return (rgb[0] & 0xE0) | ((rgb[1] & 0xE0) >> 3) | (rgb[2] >> 6)

def main(image):
    img = Image.open(image)
    img = img.resize((int(1024/4), int(768/4)), Image.ANTIALIAS)
    img = img.convert("RGB")
    arr = np.array(img)
    print(" ".join("{:02x}".format(rgb_to_8_bit(rgb)) for a in arr for rgb in a))

if __name__ == "__main__":
    if len(sys.argv) == 1 or not path.exists(sys.argv[1]):
        print(sys.argv[0], " imagefile > image.hex")
    else:
        main(sys.argv[1])