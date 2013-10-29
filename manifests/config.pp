# == Class crowd::config
#
# This class is called from crowd
#
class crowd::config {
  include crowd::params

  $crowd_home    = $crowd::params::home
  $crowd_version = $crowd::params::version

  user { 'crowd':
    ensure => present,
    home   => $crowd_home,
  }

  file { $crowd_home:
    ensure  => directory,
    owner   => 'crowd',
    require => User['crowd'],
  }

  file { 'setenv.sh':
    ensure => present,
    path   => "/opt/atlassian-crowd-${crowd_version}/apache-tomcat/bin/setenv.sh",
    source => 'puppet:///modules/crowd/setenv.sh',
  }

}
