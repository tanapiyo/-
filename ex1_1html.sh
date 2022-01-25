#!/bin/sh
echo generating ex1-1 html....
python generate_html.py bof ex1-1 > htmls/ex1-1/bof.html
python generate_html.py color ex1-1 > htmls/ex1-1/color.html
python generate_html.py dcnn_linear ex1-1 > htmls/ex1-1/dcnn_linear.html
python generate_html.py dcnn_nonlinear ex1-1 > htmls/ex1-1/dcnn_nonlinear.html
python generate_html.py dcnn_vgg16_linear ex1-1 > htmls/ex1-1/dcnn_vgg16_linear.html
echo done