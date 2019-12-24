file { "/etc/apache2/sites-enabled/000-default.conf":
  ensure   => absent,
}

file { "/etc/apache2/sites-available/jenkins.example.com.conf":
  ensure   => file,
  mode     => '644',
  owner    => root,
  group    => root,
  source  => '/home/ubuntu/upload/jenkins.example.com.conf',
}

file { "/etc/apache2/sites-enabled/jenkins.example.com.conf":
  ensure   => link,
  target   => '/etc/apache2/sites-available/jenkins.example.com.conf',
  require  => File['/etc/apache2/sites-available/jenkins.example.com.conf'],
}

file { "/etc/apache2/mods-enabled/headers.load":
  ensure   => link,
  target   => '/etc/apache2/mods-available/headers.load',
}

file { "/etc/apache2/mods-enabled/xml2enc.load":
  ensure   => link,
  target   => '/etc/apache2/mods-available/xml2enc.load',
}

file { "/etc/apache2/mods-enabled/proxy_html.conf":
  ensure   => link,
  target   => '/etc/apache2/mods-available/proxy_html.conf',
}

file { "/etc/apache2/mods-enabled/proxy_html.load":
  ensure   => link,
  target   => '/etc/apache2/mods-available/proxy_html.load',
}

file { "/etc/apache2/mods-enabled/proxy_http.load":
  ensure   => link,
  target   => '/etc/apache2/mods-available/proxy_http.load',
}

file { "/etc/apache2/mods-enabled/proxy.load":
  ensure   => link,
  target   => '/etc/apache2/mods-available/proxy.load',
}

file { "/etc/apache2/mods-enabled/proxy.conf":
  ensure   => link,
  target   => '/etc/apache2/mods-available/proxy.conf',
}
