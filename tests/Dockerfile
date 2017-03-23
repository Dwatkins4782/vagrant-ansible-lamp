FROM ansible/ubuntu14.04-ansible

MAINTAINER Bryan CS <@iambryancs>

RUN echo "localhost ansible_connection=local" > /etc/ansible/hosts

COPY . /tmp

WORKDIR /tmp

RUN ansible-galaxy install -r requirements.yml
