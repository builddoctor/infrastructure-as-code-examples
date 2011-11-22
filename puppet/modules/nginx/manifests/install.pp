class nginx::install {
  include ubuntu::common

  package {
    'nginx':
      ensure  => present,
      require => Class['ubuntu::common'];
  }

  file {
    'nginx config file':
      ensure  => present,
      path    => '/etc/nginx/sites-available/www.corporateapp.com',
      source  => 'puppet:///modules/nginx/nginx_www.corporateapp.com',
      require => Package['nginx'];

    '/etc/nginx/sites-enabled/www.corporateapp.com':
      ensure  => link,
      target  => '/etc/nginx/sites-available/www.corporateapp.com',
      require => Package['nginx'];

    'default nginx config file':
      ensure  => absent,
      path    => '/etc/nginx/sites-enabled/default',
      require => Package['nginx'];

  }

  service {
    'nginx':
      ensure    => running,
      enable    => true,
      hasstatus => true,
      require   => Package['nginx'];
  }

}
