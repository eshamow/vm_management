require 'rubygems'
require 'net/ssh'
require 'yaml'

servers = YAML.load_file('./servers.yaml')

servers.each do |server,vmname|
  Net::SSH.start( server, 'root' ) do |ssh|
    ssh.exec!('shutdown -h now')
  end
end

puts 'All servers shut down.'
