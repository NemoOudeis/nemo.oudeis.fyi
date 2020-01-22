#!/usr/bin/env zsh

rm -r public
hugo
gsutil -m rsync -R public gs://nemo.oudeis.fyi