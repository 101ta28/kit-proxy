#!/bin/bash
# KIT proxy control script
# (Tatsuya Imai, Japan)

KIT_PROXY="http://wwwproxy.kanazawa-it.ac.jp:8080/"

function enable_proxy() {
    export http_proxy="${KIT_PROXY}"
    export https_proxy="${KIT_PROXY}"
    # git settings
    git config --global http.proxy "${KIT_PROXY}"
    # npm settings
    npm -g config set http-proxy "${KIT_PROXY}"
    npm -g config set https-proxy "${KIT_PROXY}"
    npm -g config set registry "http://registry.npmjs.org/"
    # yarn settings
    yarn config set proxy "${KIT_PROXY}"
    yarn config set https-proxy "${KIT_PROXY}"
    # pip settings
    pip config set global.proxy "${KIT_PROXY}"
    echo "Set proxy"
}

function disable_proxy() {
    export http_proxy=""
    export https_proxy=""
    # git settings
    git config --global --unset http.proxy
    # npm settings
    npm -g config delete http-proxy
    npm -g config delete https-proxy
    npm -g config delete registry
    # yarn settings
    yarn config delete proxy
    yarn config delete https-proxy
    # pip settings
    pip config unset global.proxy
    echo "Unset proxy"
}

function show_status() {
    echo "HTTP Proxy: $http_proxy"
    echo "HTTPS Proxy: $https_proxy"
    echo "GIT Proxy: $(git config --global http.proxy)"
    echo "NPM HTTP Proxy: $(npm -g config get http-proxy)"
    echo "NPM HTTPS Proxy: $(npm -g config get https-proxy)"
    echo "Yarn Proxy: $(yarn config get proxy)"
    echo "Yarn HTTPS Proxy: $(yarn config get https-proxy)"
    echo "Python PIP Proxy: $(pip config get global.proxy)"
}

function show_help() {
    echo "Usage: kit-proxy {on | off | status | help}"
    echo "  on     : Enable KIT proxy"
    echo "  off    : Disable KIT proxy"
    echo "  status : Show current proxy settings"
    echo "  help   : Show this help message"
}

case "$1" in
    on)
        enable_proxy
        ;;
    off)
        disable_proxy
        ;;
    status)
        show_status
        ;;
    help)
        show_help
        ;;
    *)
        echo "Invalid command. Use kit-proxy help for usage information."
        ;;
esac
