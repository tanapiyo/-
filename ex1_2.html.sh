#!/bin/sh
echo generating ex1-2 html....
python generate_html.py bof ex1-2 > htmls/ex1-2/bof.html
python generate_html.py color ex1-2 > htmls/ex1-2/color.html
python generate_html.py dcnn_linear ex1-2 > htmls/ex1-2/dcnn_linear.html
python generate_html.py dcnn_nonlinear ex1-2 > htmls/ex1-2/dcnn_nonlinear.html
python generate_html.py dcnn_vgg16_linear ex1-2 > htmls/ex1-2/dcnn_vgg16_linear.html
echo done