# Install and configure nginx

package { 'nginx':
  ensure  => installed,
}

file_line { 'install':
  ensure => 'present',
  path   => 'ets/nginx/sites-enabled/default',
  after  => 'listen 80 default_server;',
  line   => 'rewrite ^/redirect_me https://www.githun.com/AustinRado permanent;', 
}

file { '/var/www/html/index.nginx-debian.html':
  content  => 'Hello World!',
}

service { 'nginx':
  ensure  => running,
  require => package['nginx'],
}

