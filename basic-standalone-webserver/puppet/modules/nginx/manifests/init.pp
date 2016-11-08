class nginx {
    package { 'nginx':
        ensure => present
    }

    service { 'nginx':
        ensure => running,
        enable => true,
        require => Package['nginx']
    }

    file { [ '/usr/share/nginx', '/usr/share/nginx/html' ]:
        ensure => directory,
        before => File['/usr/share/nginx/html/index.html'],
    }

    file { '/usr/share/nginx/html/index.html':
        source => 'puppet:///modules/nginx/index.html',
        notify => Service['nginx']
    }
}