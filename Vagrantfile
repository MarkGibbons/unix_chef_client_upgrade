# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.berkshelf.enabled = true
  config.vm.define :sol10 do |box|
    box.vm.hostname = 'chef-upgrade-sol10'
    box.vm.box = 'nordsol10'
    box.vm.box_url = ''
    box.vm.provider :virtualbox do |vb|
      vb.gui = true
      vb.customize ['modifyvm', :id, '--memory', '1024']
      vb.customize ['modifyvm', :id, '--usbehci', 'off']
    end
    box.vm.provision :chef_solo do |chef|
      chef.log_level = :debug
      chef.run_list = [
        'recipe[unix_chef_client_upgrade::default]'
      ]
    end
  end

  config.vm.define :rhel59 do |box|
    box.vm.hostname = 'chef-upgrade-rhel59'
    box.vm.box = 'nordrhel59'
    box.vm.box_url = ''
    box.vm.provider :virtualbox do |vb|
      vb.gui = true
      vb.customize ['modifyvm', :id, '--memory', '1024']
      vb.customize ['modifyvm', :id, '--usbehci', 'off']
    end
    box.vm.provision :chef_solo do |chef|
      chef.log_level = :debug
      chef.run_list = [
        'recipe[rhn_satellite::default]',
        'recipe[unix_chef_client_upgrade::default]'
      ]
    end
  end

  config.vm.define :rhel64 do |box|
    box.vm.hostname = 'chef-upgrade-rhel64'
    box.vm.box = 'nordrhel64'
    box.vm.box_url = ''
    box.vm.provider :virtualbox do |vb|
      vb.gui = true
      vb.customize ['modifyvm', :id, '--memory', '1024']
      vb.customize ['modifyvm', :id, '--usbehci', 'off']
    end
    box.vm.provision :chef_solo do |chef|
      chef.log_level = :debug
      chef.run_list = [
        'recipe[rhn_satellite::default]',
        'recipe[unix_chef_client_upgrade::default]'
      ]
    end
  end
end
