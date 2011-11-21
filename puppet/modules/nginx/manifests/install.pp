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
