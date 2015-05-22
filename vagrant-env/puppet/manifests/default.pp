# Requires nodejs, stdlib, apt and wget modules.
 
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
 
exec { 'apt-get update':
  command => 'apt-get update',
  timeout => 60,
  tries   => 3,
}
 
class { 'apt':
  update => {
    frequency => 'always',
  },
}
 
$sysPackages = [ 'build-essential', 'git']
package { $sysPackages:
  ensure => "installed",
  require => Exec['apt-get update'],
}
 
class { 'nodejs':
  version => 'stable',
  before => Exec['import-mongo-key'],
}

exec { 'import-mongo-key':
  command => 'sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10',
  timeout => 0,
} ->
exec { 'list-file-mongo':
  command => 'echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb.list',
  timeout => 0,
  notify => Exec['apt_update'],
  before => Exec['install-mongo'],
}

exec { 'install-mongo':
  command => 'sudo apt-get install -y mongodb-org',
  timeout => 0,
  tries => 3,
  onlyif => "sudo apt-get update"
}