sudo docker run --detach \
  --hostname gitlab.jlg-consulting.com \
  --publish 51.38.129.125:443:443 \
  --publish 51.38.129.125:80:80 \
  --publish 51.38.129.125:10022:22 \
  --name gitlab \
  --restart always \
  --volume /srv/gitlab/config:/etc/gitlab \
  --volume /srv/gitlab/logs:/var/log/gitlab \
  --volume /srv/gitlab/data:/var/opt/gitlab \
  gitlab/gitlab-ce:latest
