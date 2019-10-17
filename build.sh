#!/usr/bin/env bash
set -e

# check if we have ttfautohint
if ! which ttfautohint >/dev/null 2>&1;
then
brew install ttfautohint
fi
# check if we have otfcc
if ! which otfccdump >/dev/null 2>&1;
then
brew tap caryll/tap
brew install otfcc-mac64
fi

if [ ! -d iosevka-repo ]; then
  git clone https://github.com/be5invis/Iosevka.git iosevka-repo --depth=1
t  ln -s ${PWD}/private-build-plans.toml iosevka-repo/private-build-plans.toml
fi

pushd iosevka-repo
git pull --rebase
npm install
npm run build -- contents::iosevka-evilroot

