#!/usr/local/bin/ python

from os import path
from PIL import Image
import numpy as np
import matplotlib.pyplot as plt
import os
from pathlib import Path

from wordcloud import WordCloud, STOPWORDS

d = path.dirname(__file__) if "__file__" in locals() else os.getcwd()

text = open(path.join(d, "book.txt")).read()

if Path(path.join(d, "mask.png")).exists():
    mask = np.array(Image.open(path.join(d, "mask.png")))
else:
    mask = None

stopwords = set(STOPWORDS)
# stopwords.add("said")

if Path(path.join(d, "mask.png")).exists():
    wc = WordCloud(
        background_color="white",
        max_words=2000,
        mask=mask,
        stopwords=stopwords,
        contour_width=3,
        contour_color="steelblue",
    )
else:
    wc = WordCloud(
        background_color="white",
        max_words=2000,
        mask=mask,
        stopwords=stopwords,
        contour_width=3,
        contour_color="steelblue",
    )

wc.generate(text)
wc.to_file(path.join(d, "wordcloud.png"))
