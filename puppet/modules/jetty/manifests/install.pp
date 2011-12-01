class jetty::install {
  include ubuntu::common
  exec {
    'restart jetty':
      command     => '/usr/sbin/service jetty force-reload',
      refreshonly => true,
      require     => Service['jetty'];
  }

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
JETTY_PORT=8080
";
    }
}
