#!/usr/bin/env zsh

mkdir backup
cp public/CNAME backup
cp public/.gitignore backup
cp -r public/.git backup
rm -rf public
mv backup public

hugo

pushd public
git add --all & git ci -m "publish" & git push
popd
