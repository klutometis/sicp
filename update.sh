#!/bin/bash
git checkout master '*.html' '*.png' '*.jpg' '*.svg' '*.data' papers
git mv -f sicp.html index.html
git add -v *
