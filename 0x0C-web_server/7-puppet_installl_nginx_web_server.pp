# Install and configure nginx
package { 'jfryman-nginx':
  ensure  => installed,
}

include nginx

class { 'nginx':
  manage_repo     => true,
  package_source  => 'nginx-stable',
}

nginx::resource::server { '54.87.214.223':
  listen_port       => 80,
  www_root          => '/var/www/html',
  vhost_cfg_append  => { 'rewrite' => '^/redirect_me https://github/AustinRado'},
}

file { 'index':
  path     => '/var/www/html/index.nginx-debian.html',
  content  => 'Hello World!'
}

