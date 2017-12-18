node 'puppetclient1'  {    # applies to ns1 and ns2 nodes
include my_docker
include my_apache
#include myApache
#exec {
#        'install_Docker':
#        command => 'groupadd docker; apt-get update;curl https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce_17.03.2~ce-0~ubuntu-xenial_amd64.deb > /tmp/docker-$(lsb_release -cs).deb; dpkg -i /tmp/docker-$(lsb_release -cs).deb; systemctl start docker.service; docker run hello-world > /tmp/hello.out',
        #command => 'groupadd docker;apt-get update;curl https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce_17.03.2~ce-0~ubuntu-xenial_amd64.deb > /tmp/docker-$(lsb_release -cs).deb; dpkg -i /tmp/docker-$(lsb_release -cs).deb; dockerd & sleep 5; docker run hello-world > /tmp/hello.out',

#apt-get -y install apt-transport-https ca-certificates curl software-properties-common; curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - ;add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable";apt-get update; apt-get -y install docker-ce; dockerd & sleep 5; docker run hello-world',
#path    => '/usr/local/bin/:/bin/:/usr/bin/:/usr/local/bin/:/sbin/:/usr/sbin',

########
# Deploy apache and content


#}

} #End of node

# Will execute on all nodes

#file {'/tmp/example-ip':                                            # resource type file and filename
  #ensure  => present,                                               # make sure it exists
  #mode    => 0644,                                                  # file permissions
  #content => "Here is my Public IP Address: ${ipaddress_eth0}.\n and ${ipaddress_enp0s8}.\n",  # note the ipaddress_eth0 fact
#}

