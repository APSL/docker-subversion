FROM apsl/lamp
MAINTAINER  APSL <eherraiz@apsl.net>

# Create user
RUN groupadd -g 501 subversion && \
    useradd -u 501 -g 501 -d /subversion -s /bin/bash subversion && \
    adduser www-data subversion

# Install dependencies
RUN apt-get update && \
    apt-get -y install subversion libapache2-svn && \
    apt-get clean
    
# Add subversion repositories and css e index
ADD repositories /subversion/repositories 
ADD www /subversion/www
RUN chown www-data:www-data -R /subversion && \
    chmod 777 -R /subversion
    
# Module Configuration
ADD dav_svn.conf /etc/apache2/mods-enabled/dav_svn.conf

# Permissions and passwords
ADD grants.conf /etc/apache2/grants.conf
ADD htpasswd /etc/apache2/htpasswd-subversion

# Module activation
RUN service apache2 restart