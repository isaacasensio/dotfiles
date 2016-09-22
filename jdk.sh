#!/usr/bin/env bash

brew cask install --appdir="~/Applications" java

# Install SDKMAN
curl -s "https://get.sdkman.io" | bash

# Activate
if grep -q "sdkman" ~/.bash_profile; then
  echo "sdkman already added to bash_profile"
else
  echo "source ~/.sdkman/bin/sdkman-init.sh" >> ~/.bash_profile
fi

source ~/.sdkman/bin/sdkman-init.sh

sed -i -e 's/sdkman_auto_answer=false/sdkman_auto_answer=true/g' ~/.sdkman/etc/config

sdk install gradle
sdk install groovy
sdk install kotlin
sdk install groovy
sdk install maven
sdk install scala
