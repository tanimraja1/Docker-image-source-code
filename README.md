# centos7-systemd-apachevhost source code
Contains Dockerfile of centos7-systemd-apachevhost. Use the following command to build the image
# docker build -t local/c7-systemd-apachevhost .
use the following command to run the image.
docker run -d -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /tmp/$(mktemp -d):/run -p 4000:80 -p 4001:8081 local/c7-systemd-apachevhost
