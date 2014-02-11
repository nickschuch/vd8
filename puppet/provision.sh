# Install the puppet related mdoules via shell.

# Variables for the script.
PUPPET_DIR='/tmp/puppet'

# Install the related tools.
apt-get update > /dev/null
apt-get install git -y > /dev/null
gem install puppet > /dev/null
gem install librarian-puppet-maestrodev -v 0.9.10.1 --no-ri --no-rdoc > /dev/null

# Copy the manifest.
rm -fR $PUPPET_DIR
rsync -avz --quiet /vagrant/puppet/* $PUPPET_DIR
cd $PUPPET_DIR && librarian-puppet install

# Install the manifest.
cd $PUPPET_DIR && puppet apply --modulepath=$PUPPET_DIR/modules $PUPPET_DIR/site.pp

# Cleanup.
rm -fR $PUPPET_DIR
