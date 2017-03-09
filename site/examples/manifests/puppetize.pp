class examples::puppetize {

  if $osfamily == 'RedHat' {
    file { '/root/example.pp':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => epp('examples/example.epp'),
    }
  }
  else {
    # The OpenTable vagrant box that we're using for Windows 2012 R2
    # has an incompletely-configured Administrator account, and we log
    # in as "vagrant/vagrant". The vagrant user is an administrator, so
    # substituting in this username instead of Administrator works.
    $admin_user = $virtual ? {
      'virtualbox' => 'vagrant',
      default      => 'Administrator',
    }

    file { "C:/Users/${admin_user}/example.pp":
      ensure  => file,
      owner   => $admin_user,
      group   => $admin_user,
      mode    => '0664',
      content => epp('examples/example.epp'),
    }
  }
  
}
