FROM jenkins/jenkins:lts-jdk11

# Switch user to root so that we can install apps (jenkins image switches to user "jenkins" in the end)
USER root

# Install Docker prerequisites
RUN apt-get update -qq && apt-get install -qqy apt-transport-https ca-certificates lxc supervisor curl lsb-release gnupg

# Create log folder for supervisor, jenkins and docker
RUN mkdir -p /var/log/supervisor
RUN mkdir -p /var/log/docker
RUN mkdir -p /var/log/jenkins

# Install Docker from Docker Inc. repositories.
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN apt-get update -qqy
RUN apt-get install -qqy docker-ce docker-ce-cli containerd.io

# Add jenkins user to the docker groups so that the jenkins user can run docker without sudo
RUN gpasswd -a jenkins docker

# Add supervisord config
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Install the magic wrapper
ADD wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf