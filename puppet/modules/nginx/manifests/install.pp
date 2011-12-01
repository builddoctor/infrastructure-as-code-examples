class nginx::install {
  include ubuntu::common

  package {
    'nginx':
      ensure  => present,
      require => Class['ubuntu::common'];
  }

  exec {
    'restart nginx':
      command     => '/usr/sbin/service nginx restart',
      refreshonly => true,
      require => Service['nginx'];
  }

  file {
    'nginx config file':
      ensure  => present,
      path    => '/etc/nginx/sites-available/www.corporateapp.com',
      source  => 'puppet:///modules/nginx/nginx_www.corporateapp.com',
      require => Package['nginx'],
      notify  => Exec['restart nginx'];

    '/etc/nginx/sites-enabled/www.corporateapp.com':
      ensure  => link,
      target  => '/etc/nginx/sites-available/www.corporateapp.com',
      require => Package['nginx'],
      notify  => Exec['restart nginx'];

    'default nginx config file':
      ensure  => absent,
      path    => '/etc/nginx/sites-enabled/default',
      require => Package['nginx'],
      notify  => Exec['restart nginx'];

  }

  service {
    'nginx':
      ensure    => running,
      enable    => true,
      hasstatus => true,
      require   => Package['nginx'];
  }

}
