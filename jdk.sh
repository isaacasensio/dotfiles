#!/usr/bin/env bash

brew cask install --appdir="~/Applications" java

# Install SDKMAN
curl -s "https://get.sdkman.io" | bash

# Activate
source ~/.sdkman/bin/sdkman-init.sh

sed -i -e 's/sdkman_auto_answer=false/sdkman_auto_answer=true/g' ~/.sdkman/etc/config

sdk install gradle
sdk install groovy
sdk install kotlin
sdk install groovy
sdk install maven
sdk install scala
