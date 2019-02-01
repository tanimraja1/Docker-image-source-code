FROM local/c7-systemd
RUN yum -y install httpd; yum clean all; systemctl enable httpd.service

RUN mkdir -p /var/www/example.com/public_html
RUN mkdir -p /var/www/example2.com/public_html

RUN chown -R $USER:$USER /var/www/example.com/public_html
RUN chown -R $USER:$USER /var/www/example2.com/public_html

RUN chmod -R 755 /var/www

COPY /example/index.html /var/www/example.com/public_html
COPY /example2/index.html /var/www/example2.com/public_html

RUN mkdir /etc/httpd/sites-available
RUN mkdir /etc/httpd/sites-enabled

COPY /exampleconf/example.com.conf /etc/httpd/sites-available
COPY /example2conf/example2.com.conf /etc/httpd/sites-available

WORKDIR /etc/httpd/conf

RUN sed -i '$ a Listen 8081' httpd.conf
RUN sed -i '$ a IncludeOptional sites-enabled/*.conf' httpd.conf

RUN ln -s /etc/httpd/sites-available/example.com.conf /etc/httpd/sites-enabled/example.com.conf
RUN ln -s /etc/httpd/sites-available/example2.com.conf /etc/httpd/sites-enabled/example2.com.conf

EXPOSE 80
EXPOSE 8081

CMD ["/usr/sbin/init"]
