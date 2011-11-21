class ubuntu::common {
  exec {
    'apt-get clean':
      command => '/usr/bin/aptitude update';
    'apt-get update':
      command => '/usr/bin/aptitude update',
      require => Exec['apt-get clean'];
  }
}
