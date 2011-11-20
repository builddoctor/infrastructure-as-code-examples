class nginx::install {

  package {
    'nginx':
      ensure  => present;
  }

  file {
    'default web page':
      path    => '/var/www/nginx-default/index.html',
      content => 'This page, courtesy of puppet',
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

node default {
  include nginx::install
}
