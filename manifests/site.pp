## site.pp ##


node default {
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }
  
  # example code for the classroom
  include examples::puppetize
  
  notify { "This is the default message from the production environment": }
}

node 'fsishii.puppetlabs.vm' {

  notify { "This is the Linux box": }
  
}
