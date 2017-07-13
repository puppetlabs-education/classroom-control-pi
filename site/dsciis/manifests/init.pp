class dsciis {

  # TODO: add the correct name to this resource so DSC can trigger reboots
  reboot { 'dcs_reboot':
    when    => pending,
    timeout => 15,
  }

  # Translate these DSC Powershell resources into Puppet code below
#  WindowsFeature iis {
#    Ensure    = 'Present'
#    Name      = 'Web-Server'
#  }
  
#  WindowsFeature iisscriptingtools {
#    Ensure    = 'Present',
#    Name      = 'Web-Scripting-Tools',
#  }
  
  # The index file is managed as a native Puppet file resource.
  file { 'C:/inetpub/wwwroot/index.html':
    ensure  => 'file',
    source  => 'puppet:///modules/dsciis/index.html',
    require => Dcs_windowsfeature['iis']
    
  }

}
