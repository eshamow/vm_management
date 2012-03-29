require 'rubygems'
require 'net/ssh'
require 'fission'
require 'yaml'

servers = YAML.load_file('./servers.yaml')

servers.each do |server, vmname|
  Fission::Command::Start.new(args=[vmname]).execute
end

servers.each do |server, vmname|
  Fission::Command::SnapshotRevert.new(args=[vmname, 'TestEnv']).execute
end

servers.each do |server, vmname|
  Fission::Command::Start.new(args=[vmname]).execute
end

puts 'Waiting for all VMs to start...'
sleep 60

servers.each do |server, vmname|
  puts "Updating time and running Puppet on #{vmname}"
  Net::SSH.start( server, 'root' ) do |ssh|
    puts ssh.exec!('ntpdate time.apple.com ; puppet agent -tv')
  end
end

puts 'All servers reverted.'
