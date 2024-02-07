# guacamole
#
# Main class for usage of this module.
#
# @summary Executes classes preprovision and install for Guacomole installation.
#
# @param server_version  -   Version of guacamole server to download and install.
#                            You could check the latest one there:
#                            https://guacamole.incubator.apache.org/releases/
# @param guacd_listen_ip   - IP for guacd to bind for.
# @param guacd_listen_port - Same for port.
# @example
#   Full example of usage included in examples/site.pp
class guacamole (
  String $server_version = $guacamole::params::server_version,
  String $tomcat_version = $guacamole::params::tomcat_version,
  String $guacd_listen_ip = $guacamole::params::guacd_listen_ip,
  String $guacd_listen_port = $guacamole::params::guacd_listen_port,
  Boolean $install_tomcat = $guacamole::params::install_tomcat,

  ) {
    class { '::guacamole::install':
      server_version    => $server_version,
      tomcat_version    => $tomcat_version,
      guacd_listen_ip   => $guacd_listen_ip,
      guacd_listen_port => $guacd_listen_port,
      install_tomcat    => $install_tomcat
    }
    include guacamole::preprovision
    Class['guacamole::preprovision'] -> Class['guacamole::install']

}
