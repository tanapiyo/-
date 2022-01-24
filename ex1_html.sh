#!/bin/sh
python generate_html.py bof > htmls/bof.html
python generate_html.py color > htmls/color.html
python generate_html.py dcnn_linear > htmls/dcnn_linear.html
python generate_html.py dcnn_nonlinear > htmls/dcnn_nonlinear.html
python generate_html.py coldcnn_vgg16or > htmls/dcnn_vgg16.html