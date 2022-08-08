# Test $_SERVER vs filter_input discrepancy

This repository was created to show that `$_SERVER` and `filter_input()` (or `filter_input_array`) with type `INPUT_SERVER` differs when xdebug is enabled.

The test is setup using [docker](https://www.docker.com/) and [docker compose](https://docs.docker.com/compose/reference/). Once you have it installed, you can run `run.sh` and it will start two containers:

1. app: A PHP container with FPM and xdebug (image built will be found as `local/php:8-fpm-xdebug`)
2. loadbalancer: An nginx container which always forwards the header `FOO=BAR`

The test then sends a request to a page that simply outputs the value of `$_SERVER['FOO']` and `filter_input(INPUT_SERVER, 'FOO')` in JSON format, once where `xdebug.mode=off` and another where `xdebug.mode=develop`.

When `xdebug.mode=off` you should see the output of both lines match:

```
{
    "$_SERVER": "BAR",
    "filter_input": "BAR"
}
```

However when `xdebug.mode=develop` you will see `filter_input` return `null`:

```
{
    "$_SERVER": "BAR",
    "filter_input": null
}
```
