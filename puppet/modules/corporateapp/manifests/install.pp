class corporateapp::install {
  include jetty::install
  include nginx::install
  file {
    "corporate app":
      ensure => file,
      path => '/usr/share/jetty/webapps/app.war',
      source => 'puppet:///modules/corporateapp/app.war',
      require => Class['jetty::install'];
  }
}
