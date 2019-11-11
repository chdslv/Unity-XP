#!/bin/bash
wget -q https://raw.githubusercontent.com/mmilidoni/github-downloads-count/master/gdc;chmod +x gdc
./gdc rauldipeas unity-xp | tac | awk 'NR <=1' | awk '{print $1}'  | echo +$(xargs) Downloads > download-counter.log
git clone https://github.com/rauldipeas/Unity-XP;cd Unity-XP;mkdir -pv website/download-counter
cp ../download-counter.log website/download-counter/download-counter.log
git config --global user.email "rauldipeas@mail.com";git config --global user.name "Raul Dipeas"
git add .; git commit -m "Azure Pipelines auto build"
git push http://rauldipeas:$GITHUB_ACCESS_TOKEN@github.com/rauldipeas/Unity-XP.git HEAD:master
