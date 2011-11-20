class ubuntu::common {
  exec {
    'apt-get clean':
      command => '/usr/bin/aptitude update';
    'apt-get update':
      command => '/usr/bin/aptitude update',
      require => Exec['apt-get clean'];
  }
}

class nginx::install {
  include ubuntu::common

  package {
    'nginx':
      ensure  => present,
      require => Class['ubuntu::common'];
  }

  service {
    'nginx':
      ensure    => running,
      enable    => true,
      hasstatus => true,
      require   => Package['nginx'];
  }

}

class jetty::install {
  include ubuntu::common

  package {
    'jetty':
      ensure  => present,
      require => Class['ubuntu::common'];
  }

  service {
    'jetty':
      ensure    => running,
      enable    => true,
      hasstatus => true,
      require   => [Package['jetty'], File['/etc/default/jetty']];
  }

  file {
    '/etc/default/jetty':
      ensure  => present,
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
  }
}

node default {
  include corporateapp::install
  include puppet::fudge
}
