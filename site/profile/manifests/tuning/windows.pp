class profile::tuning::windows {
    registry::value { 'KeepAliveInterval':
      key    => 'HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters',
      value  => 'KeepAliveInterval',
      data   => '1',
    }
    registry::value { 'TcpMaxDataRetransmissions':
      key    => 'HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters',
      data   => '5',
    }
    registry::value { 'TcpTimedWaitDelay':
      key    => 'HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters',
      data   => '0x0000001e',
    }

  # Add more registry resources as directed

}
