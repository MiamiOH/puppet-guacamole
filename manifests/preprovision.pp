# guacamole::preprovision
#
# Requirements installation for Guacomole building & usage
#
# Considered to be private class.
class guacamole::preprovision inherits guacamole::install {
  $packages = [
  'cairo-devel', 'libjpeg-turbo-devel', 'libpng-devel', 'uuid-devel',
  'ffmpeg-devel', 'freerdp-devel', 'pango-devel', 'libssh2-devel',
  'libtelnet-devel', 'libvncserver-devel', 'pulseaudio-libs-devel',
  'openssl-devel', 'libvorbis-devel', 'libwebp-devel', 'jq', 'libgcrypt-devel'
  ]


  package { 'epel-release':
    ensure   => present,
    provider => yum
  } -> package { 'rpmfusion-free-release':
    ensure       => installed,
    provider     => rpm,
    source       => 'https://download1.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm',
    install_only => true,
  } -> package { 'rpmfusion-nonfree-release':
    ensure       => installed,
    provider     => rpm,
    source       => 'https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-8.noarch.rpm',
    install_only => true,
  } -> package { $packages: ensure => present }

  #package { 'nux-dextop-release':
  #  ensure   => present,
  #  provider => 'rpm',
  #  require  => Package['epel-release'],
  #  source   => 'http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm',
  #}

  #exec { '/bin/yum update -y':
  #  refreshonly => true,
  #  subscribe   => Package['nux-dextop-release']
  #}

  class { 'java': }

}
