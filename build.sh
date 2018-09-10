#!/usr/bin/env zsh

rm -r site
mkdir site
cp -r src/* site
#cp -r drafts/* site
multimarkdown --batch --full site/**/*.md
rm -r site/**/*.md