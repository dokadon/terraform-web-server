exec { 'install_jenkins_package_keys':
  command => '/usr/bin/wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | /usr/bin/apt-key add - ',
}

file { "/etc/apt/sources.list.d/jenkins.list":
  ensure   => file,
  mode     => '644',
  owner    => root,
  group    => root,
  content  => 'deb https://pkg.jenkins.io/debian-stable binary/',
  require  => Exec['install_jenkins_package_keys'],
}

exec { 'update_apt':
  command => '/usr/bin/apt-get update',
  require => File['/etc/apt/sources.list.d/jenkins.list'],
}

package { 'jenkins':
    provider => apt,
    name     => 'jenkins',
    ensure   => 'installed',
    require    => Exec['update_apt'],
}

service { 'jenkins_service':
  name       => 'jenkins',
  ensure     => running,
  enable     => true,
  hasrestart => true,
  hasstatus  => true,
  require    => Package['jenkins'],
}
