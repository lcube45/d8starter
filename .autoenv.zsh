autostash TOOLS_IN_DOCKER=1
autostash DOCKER_PHP_CONTAINER=univsandbox_php_1

composer() {
    if [ "$TOOLS_IN_DOCKER" = "1" ]; then
        docker-compose run --rm --entrypoint composer --workdir=/var/www/html php "$@"
    else
        command composer "$@"
    fi
}

dc() {
    command docker-compose "$@"
}