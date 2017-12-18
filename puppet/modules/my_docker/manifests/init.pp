class my_docker {
# Create the directory to store the docker code in
#file { ['/var/src/docker']:
#
# make sure the goup docker exist
group { 'docker':
	ensure=> 'present',
	
}

exec { 'docker_install':
#	ensure => directory,
 	command => 'apt-get update;curl https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce_17.03.2~ce-0~ubuntu-xenial_amd64.deb > /tmp/docker-$(lsb_release -cs).deb; dpkg -i /tmp/docker-$(lsb_release -cs).deb; systemctl start docker.service; docker run hello-world > /tmp/hello.out',
	require => Group['docker'],
	path    => '/usr/local/bin/:/bin/:/usr/bin/:/usr/local/bin/:/sbin/:/usr/sbin',
	onlyif => '/usr/bin/test ! -f /usr/bin/docker'
}
} # End of class declaration
