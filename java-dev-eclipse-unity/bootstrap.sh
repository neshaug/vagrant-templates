#!/usr/bin/env bash
apt-get update

apt-get update
apt-get install -y  \
    git             \
    tig             \
    vim             \
    curl            \
    openjdk-7-jdk

echo "export PATH=\"$PATH:/home/vagrant/bin\"" >> /home/vagrant/.bashrc
echo "export MAVEN_HOME=\"/home/vagrant/bin/maven-3.0.5\"" >> /home/vagrant/.bashrc

if [ ! -d "bin" ]; then
    mkdir bin
fi

# eclipse
if [ ! -d "bin/eclipse-juno" ]; then
    wget ftp://ftp.uninett.no/pub/eclipse/technology/epp/downloads/release/juno/SR2/eclipse-jee-juno-SR2-linux-gtk-x86_64.tar.gz
    tar -zxvf eclipse-jee-juno-SR2-linux-gtk-x86_64.tar.gz
    mv eclipse bin/eclipse-juno
    ln -sf /home/vagrant/bin/eclipse-juno/eclipse /home/vagrant/bin/eclipse
    rm eclipse-jee-juno-SR2-linux-gtk-x86_64.tar.gz
fi

# maven
if [ ! -d "bin/apache-maven" ]; then
    wget http://apache.uib.no/maven/maven-3/3.0.5/binaries/apache-maven-3.0.5-bin.tar.gz
    tar -zxvf apache-maven-3.0.5-bin.tar.gz
    mv apache-maven-3.0.5 bin/apache-maven
    ln -sf /home/vagrant/bin/apache-maven/bin/mvn /home/vagrant/bin/mvn
    rm apache-maven-3.0.5-bin.tar.gz
fi

chown -R vagrant:vagrant /home/vagrant/bin

echo "Installing Eclipse plugins. Please be patient.."
sudo -u vagrant -s /home/vagrant/bin/eclipse \
-application org.eclipse.equinox.p2.director -noSplash \
-repository http://download.eclipse.org/releases/juno,\
http://m2eclipse.sonatype.org/sites/m2e \
-installIUs org.eclipse.egit.feature.group,\
org.eclipse.m2e.feature.feature.group
