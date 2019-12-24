exec { 'download_geckodriver':
  command => '/usr/bin/wget -nc https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz',
}

exec { 'gunzip_geckodriver':
  onlyif  => ['/usr/bin/test -f /home/ubuntu/upload/geckodriver-v0.24.0-linux64.tar.gz'],
  command => '/bin/gunzip -f /home/ubuntu/upload/geckodriver-v0.24.0-linux64.tar.gz',
  require => Exec['download_geckodriver'],
}

exec { 'untar_geckodriver':
  command => '/bin/tar -xvf  /home/ubuntu/upload/geckodriver-v0.24.0-linux64.tar',
  require => Exec['gunzip_geckodriver'],
}

file { '/usr/local/bin/geckodriver':
  ensure   => present,
  mode     => '755',
  owner    => root,
  group    => root,
  source   => '/home/ubuntu/upload/geckodriver',
  require => Exec['untar_geckodriver'],
}
