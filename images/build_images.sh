
# Directory structure
# ├── mariadb
# │   ├── Dockerfile
# │   ├── dump.sql
# │   └── entrypoint.sh
# ├── nginx
# │   ├── Dockerfile
# │   └── nginx.conf
# ├── setup.sh
# └── wordpress
#     ├── Dockerfile
#     ├── latest.tar.gz
#     ├── php-fpm.conf
#     ├── wp-config.php
#     └── www.conf

# Define the directories containing Dockerfiles
echo "test hello" > /tmp/test.txt

DOCKERFILE_DIRS=("mariadb" "nginx" "wordpress")

# # Build Docker images from Dockerfiles in each directory
for dir in "${DOCKERFILE_DIRS[@]}"; do
  if [ -f "/tmp/images/$dir/Dockerfile" ]; then
    echo "Building image from /tmp/images/$dir/Dockerfile..."
    docker build -t "$dir:latest" "/tmp/images/$dir"
  else
    echo "Dockerfile not found in /tmp/images/$dir. Skipping..."
  fi
done

# docker build --no-cache  -t my_mysql srcs/mysql/
# !/bin/sh

# echo "HELLO WOLRD"