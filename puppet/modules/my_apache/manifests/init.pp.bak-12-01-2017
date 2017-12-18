class my_apache {
$docker_root="/var/src/docker"
$apache_root="/var/src/docker/apache2"
$doc_root="$apache_root/www/"
# ensure info.php file exists
file { '/tmp/info3.php':
  ensure => file,
  content => '<?php  phpinfo(); ?>',    # phpinfo code
 # #require => Package['apache2'],        # require 'apache2' package before creating
} 
#####
# Create the directory to store the docker code in
#file { ['/var/src/docker']:
file { [$docker_root]:
	ensure => directory,
        mode => '0755',
        owner => 'puppet',
        group => 'docker',
	recurse => 'true',
        #source => 'puppet:///modules/lamp/apache2',
}
#####
# Copy over the docker files to build the docker image
file { 'apache2':
	#path => '/var/src/docker/apache2/',
	path => $apache_root,
	ensure => directory,
        mode => '0755',
        owner => 'puppet',
        group => 'docker',
	recurse => 'true',
        source => 'puppet:///modules/my_apache/apache2/',
}
#####
# Build the image on the client
exec { 'apache_build':
	require => Exec['docker_install'],
	cwd => $apache_root,
	#command =>"/usr/bin/docker build -t my_apache .; sleep 6; /usr/bin/docker image ls | grep my_ > /tmp/my_apache.inst; docker run -p 8080:80 -d my_apache",
	command =>"/usr/bin/docker build -t my_apache .; sleep 6; /usr/bin/docker image ls | grep my_ > /tmp/my_apache.inst",
	#command =>"/usr/bin/docker build -t my_apache .",
	#command => "/bin/echo ${apache_root} > /tmp/apache_root.out",



}
#####
# Build the image on the client
exec { 'apache_run':
	cwd => $apache_root,
#docker run -p 8080:80 –name=apache -d-v `pwd`/www:/var/www/site mysite
#docker run -p 8080:80 --name=my_apache -d -v /var/src/docker/apache2/www:/var/www/site my_apache
	command =>"/usr/bin/docker stop my_apache; docker rm my_apache; /usr/bin/docker run -p 8080:80 --name=my_apache -d -v  $doc_root:/var/www/site my_apache",
	#command =>"/usr/bin/docker build -t my_apache .",
	#command => "/bin/echo ${apache_root} > /tmp/apache_root.out",
}





#Exec['install_Docker'] -> File['apache2']
Exec['install_Docker'] -> File[$docker_root]
File[$docker_root] -> File['apache2']
File['apache2'] -> Exec['apache_build']
Exec['apache_build'] -> Exec['apache_run']

#file { '/var/src/docker/apache2':
	#ensure => directory,
        #mode => '0755',
        #owner => 'puppet',
        #group => 'docker',
	#recurse => 'true',
        #source => 'puppet:///modules/lamp/modules/apache2',
#}
}
