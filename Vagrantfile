#!/usr/bin/env ruby

require 'yaml'

configuration = YAML::load_file('config.yml')
rubies = ENV.has_key?("RUBY_VERSIONS") ? ENV["RUBY_VERSIONS"].split(/ /) : configuration["rubies"]
base_box = configuration['base_box']

Vagrant.configure("2") do |config|
  config.vm.define "shelly-rubies" do |definition|
    definition.vm.box = "shelly-rubies"
    definition.vm.box_url = base_box
    definition.vm.provider(:virtualbox) { |vb| vb.name = "shelly-rubies" }
  end
  config.vm.provider :virtualbox do |vb|
    vb.customize [
      "modifyvm", :id,
      "--memory", "1024",
      "--cpus", "2",
      "--ioapic", "on",
    ]
    # vb.gui = true
  end

  config.vm.provision :shell, :path => "setup-vm.sh"
  # rubies.each do |ruby|
  #   config.vm.provision :shell, :path => "install-rubies.rb", :args => ruby
  # end
  # config.vm.provision :shell, :path => "cleanup-rubies.sh"
end
