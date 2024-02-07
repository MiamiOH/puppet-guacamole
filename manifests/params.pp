# == Class: guacamole::params
#
#
class guacamole::params {
  $server_version    = '1.5.4',
  $guacd_listen_ip   = $::ip,
  $guacd_listen_port = '4822',
  $install_tomcat    = true,
}
