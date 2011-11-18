class nginx::install {
  exec {
    'aptitude update':
      command => '/usr/bin/aptitude update';
  }

  package {
    'nginx':
      ensure  => present,
      require => Exec['aptitude update']
  }

  file {
    'default web page':
      path => '/var/www/nginx-default/index.html',
      content => 'This page, courtesy of puppet';
  }

  service {
    'nginx':
      enable => true,
      hasstatus => true,
      ensure => running,
      require => Package['nginx'];
  }

  group {
    'puppet':
      ensure => present;
      # stop vagrant from moaning.
    }

}

node default {
  include nginx::install
}
