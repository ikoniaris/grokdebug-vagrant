# Install aptitude
apt-get install aptitude

# Install basic requirements
aptitude update
aptitude -y install git build-essential curl

# Install RVM
curl -L get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
rvm reload

# Install Ruby 2.1.1
rvm install 2.1.1
rvm use 2.1.1 --default

# Install Bundler
gem install bundler

gem update --system

# Install Grok Debugger
git clone https://github.com/nickethier/grokdebug.git
cd grokdebug
gem update
bundle update

# Finalize
chown -R vagrant:vagrant /home/vagrant/
chown -R vagrant:vagrant /usr/local/rvm/

# Start Grok Debugger
nohup rackup -p 80 >> /dev/null 2>> /dev/null  &
