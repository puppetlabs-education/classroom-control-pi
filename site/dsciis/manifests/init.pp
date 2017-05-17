class dsciis {

  # TODO: add the correct name to this resource so DSC can trigger reboots
  reboot { 'dsc_reboot':
    when    => pending,
    timeout => 15,
  }

  # Translate these DSC Powershell resources into Puppet code below
#  dsc_WindowsFeature iis {
#    dsc_Ensure    = 'Present',
#    dsc_Name      = 'Web-Server',
#  }
  
#  dsc_WindowsFeature iisscriptingtools {
#    dsc_Ensure    = 'Present',
#    dsc_Name      = 'Web-Scripting-Tools',
#  }
  
  # The index file is managed as a native Puppet file resource.
  file { 'C:/inetpub/wwwroot/index.html':
    ensure  => 'file',
    source  => 'puppet:///modules/dsciis/index.html',
    require => Dsc_windowsfeature['iis'],

  }

}
