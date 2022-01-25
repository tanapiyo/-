#!/bin/sh
echo generating ex1-1 html....
python generate_html.py bof > htmls/bof.html
python generate_html.py color > htmls/color.html
python generate_html.py dcnn_linear > htmls/dcnn_linear.html
python generate_html.py dcnn_nonlinear > htmls/dcnn_nonlinear.html
python generate_html.py dcnn_vgg16_linear > htmls/dcnn_vgg16_linear.html
echo done