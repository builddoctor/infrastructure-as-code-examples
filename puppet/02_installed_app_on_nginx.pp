class nginx::install {

  package {
    'nginx':
      ensure  => present;
  }

  file {
    'default web page':
      path => '/var/www/nginx-default/index.html',
      content => 'This page, courtesy of puppet',
      require => Package['nginx'];
  }

  service {
    'nginx':
      enable => true,
      hasstatus => true,
      ensure => running,
      require => Package['nginx'];
  }

}

node default {
  include nginx::install
}
