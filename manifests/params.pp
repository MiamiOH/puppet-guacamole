# == Class: guacamole::params
#
#
class guacamole::params {
  $server_version    = '1.5.4'
  $guacd_listen_ip   = '127.0.0.1'
  $guacd_listen_port = '4822'
  $install_tomcat    = true
  $tomcat_version    = '9.0.85'
}
