#!/bin/bash
#
# Created by ice1000 at 2017/3/26
#

echo "======generating LaTeX========"

cabal run resume --verbose=0 -- en > latex/resume.tex
# cabal run resume --verbose=0 -- zh > latex/resume-zh.tex
cabal run resume --verbose=0 -- elab > latex/resume-elab.tex

echo "=======building LaTeX========="

make -C latex >> latex/make.log
mv latex/*.pdf .
make -C latex clean clean-tex

echo "====removing useless files===="

rm -rf .git

echo "===initialize git repository=="

git init --initial-branch=main
git remote add origin https://github.com/CYBAI/resume.git

echo "======committing changes======"

git add *
git add .gitignore
git commit -a -m "Initial commit"

echo "=====pushing, please wait====="

git push --force --set-upstream origin main
git status

echo "========all tasks done========"
