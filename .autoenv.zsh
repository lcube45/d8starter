autostash TOOLS_IN_DOCKER=1
autostash DOCKER_PHP_CONTAINER=univsandbox_php_1

composer() {
    if [ "$TOOLS_IN_DOCKER" = "1" ]; then
        docker-compose run --rm --entrypoint composer --workdir=/var/www/html php "$@"
    else
        command composer "$@"
    fi
}

drush() {
    if [ "$TOOLS_IN_DOCKER" = "1" ]; then
        docker-compose run --rm --entrypoint php --workdir=/var/www/html/web php  ../vendor/bin/drush "$@"
    else
        command drush "$@"
    fi
}

npm() {
    if [ "$TOOLS_IN_DOCKER" = "1" ]; then
        docker-compose run --rm --entrypoint npm --workdir=/app/web/themes/custom/lcube_ui node "$@"
    else
        command npm "$@"
    fi
}

gulp() {
    if [ "$TOOLS_IN_DOCKER" = "1" ]; then
        docker-compose run -T --rm --entrypoint gulp --workdir=/app/web/themes/custom/lcube_ui node "$@"
    else
        command npm gulp "$@"
    fi
}

dc() {
    command docker-compose "$@"
}