# centos7-systemd-httpd source code
Contains Dockerfile of centos7-systemd-httpd. Use the following command to build the image
# docker build -t local/c7-systemd-httpd .
Use the following command to run the image

docker run -ti -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 80:80 local/c7-systemd-httpd
