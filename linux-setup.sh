#!/bin/bash

if [shopt -q login_shell];then
  echo "Your terminal needs to be set as a login shell. Please follow the instructions in this link to accomplish this:"
  echo "http://help.learn.co/workflow-tips/local-environment/how-to-set-your-ubuntu-terminal-as-a-login-shell"
else
  sudo groupadd npm &&
  sudo usermod -a -G npm,staff $USER &&
  sudo apt-get update -yqq &&
  sudo apt-get upgrade &&
  sudo apt-get -y install curl postgresql libpq-dev default-jre build-essential phantomjs &&

  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - &&
  sudo apt-get install nodejs &&

  sudo apt-get -y install ack-grep vim libgnome2-bin &&

  sudo chown root:staff /usr/bin &&
  sudo chmod 0775 /usr/bin &&
  sudo chown root:staff /usr/local/bin &&
  sudo chmod 0775 /usr/local/bin &&
  sudo chown -R root:npm /usr/lib/local/node_modules &&
  sudo chmod 0775 /usr/lib/local/node_modules &&

  touch ~/.netrc && chmod 0600 ~/.netrc &&

  gpg --keyserver hkp://pgp.mit.edu --recv-keys \
    409B6B1796C275462A1703113804BB82D39DC0E3 \
    7D2BAF1CF37B13E2069D6956105BD0E739499BDB &&
  # \curl -sSL https://get.rvm.io | bash -s stable --ruby &&
  \curl -sSL https://raw.githubusercontent.com/wayneeseguin/rvm/stable/binscripts/rvm-installer | bash -s stable
  curl "https://raw.githubusercontent.com/flatiron-school/dotfiles/master/linux_bash_profile" -o "$HOME/.bash_profile" &&
  source ~/.bash_profile &&
  rvm install 2.3.1 &&
  rvm use 2.3.1 --default &&

  echo "gem: --no-ri --no-rdoc" > $HOME/.gemrc &&
  gem update --system 2.4.8 &&
  gem install learn-co &&
  gem install phantomjs &&
  gem install pg &&
  gem install sqlite3 &&
  gem install bundler &&
  gem install rails &&


  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash &&
  echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bash_profile &&
  echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm' | grep '\$' >> ~/.bash_profile &&

  source ~/.bash_profile &&

  curl "https://raw.githubusercontent.com/flatiron-school/dotfiles/master/irbrc" -o "$HOME/.irbrc" &&
  curl "https://raw.githubusercontent.com/flatiron-school/dotfiles/master/ubuntu-gitignore" -o "$HOME/.gitignore" &&
  curl "https://raw.githubusercontent.com/flatiron-school/dotfiles/master/linux_gitconfig" -o "$HOME/.gitconfig" &&

  echo "========================================================="
  echo "Please go to learn.co/manual_setup and complete steps 9, 10, and 11"
  echo "And finally, download and install Chrome and the Atom text editor and you are all set to Learn!!"
fi
