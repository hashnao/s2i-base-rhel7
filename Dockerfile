FROM rhscl/s2i-base-rhel7
MAINTAINER Naoya Hashimoto <nhashimo@redhat.com>

RUN yum install -y cronie curl \
    rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm \
    yum install -y --enablerepo=remi,remi-php70 php php-cli php-devel php-mbstring php-pdo php-gd
    yum install -y cron

ADD crontab /etc/cron.d/hello-cron
RUN chmod 0644 /etc/cron.d/hello-cron
RUN touch /var/log/cron.log

CMD ["crond", "-n"]
