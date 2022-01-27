#!/bin/sh
echo generating ex2 html....
python generate_html.py all ex2 > htmls/ex2/all.html
python generate_html.py all2 ex2 > htmls/ex2/all2.html
echo done