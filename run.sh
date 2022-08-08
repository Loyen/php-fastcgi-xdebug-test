#!/usr/bin/env bash

run_test() {
    export XDEBUG_MODE=$1

    echo "========= Running with XDEBUG_MODE=${XDEBUG_MODE} ========="

    docker compose up -d

    curl http://localhost:8080/

    docker compose down
}

run_test off

run_test develop
