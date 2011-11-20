class nginx::install {
    notice('nginx::install')

  package {
    'nginx':
      ensure  => present;
  }

  service {
    'nginx':
      enable => true,
      hasstatus => true,
      ensure => running,
      require => Package['nginx'];
  }

}

class jetty::install {
  notice('jetty::install')

  package {
   'jetty':
      ensure => present;
  }

  service {
    'jetty':
      enable => true,
      hasstatus => true,
      ensure => running,
      require => [Package['jetty'], File['/etc/default/jetty']];
  }

  file {
    '/etc/default/jetty':
      ensure => present,
      content => "
NO_START=0 
VERBOSE=yes
"      
    }
}

class corporateapp::install {
  include jetty::install
  include nginx::install
}

class puppet::fudge {
  group{
    'puppet': ensure => present;
  }}

node default {
  include corporateapp::install
  include puppet::fudge
}
