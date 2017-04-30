Vagrant.configure("2") do |config|
  config.vm.define 'lamp', primary: true do |lamp|
    lamp.vm.box      = 'pnx/lamp'
    lamp.vm.hostname = 'd8.dev'

    # This script is a last chance for Developers to add more
    # configuration to the Vagrant host.
    #
    # Examples:
    #  * Create files directories
    #  * Setup additional databases
    # lamp.vm.provision :shell, path: "provision.sh"
  end
end
