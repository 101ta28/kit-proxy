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
    if command -v npm &> /dev/null; then
        npm config set http-proxy "${KIT_PROXY}"
        npm config set https-proxy "${KIT_PROXY}"
        npm config set registry "http://registry.npmjs.org/"
    fi

    # yarn settings
    if command -v yarn &> /dev/null; then
        yarn config set proxy "${KIT_PROXY}"
        yarn config set https-proxy "${KIT_PROXY}"
    fi

    # pip settings
    if command -v pip &> /dev/null; then
        pip config set global.proxy "${KIT_PROXY}"
    fi

    echo "Set proxy"
}

function disable_proxy() {
    export http_proxy=""
    export https_proxy=""
    # git settings
    git config --global --unset http.proxy

    # npm settings
    if command -v npm &> /dev/null; then
        npm config delete http-proxy
        npm config delete https-proxy
        npm config delete registry
    fi

    # yarn settings
    if command -v yarn &> /dev/null; then
        yarn config delete proxy
        yarn config delete https-proxy
    fi

    # pip settings
    if command -v pip &> /dev/null; then
        pip config unset global.proxy
    fi

    echo "Unset proxy"
}

function show_status() {
    echo "HTTP Proxy: $http_proxy"
    echo "HTTPS Proxy: $https_proxy"
    echo "GIT Proxy: $(git config --global http.proxy)"
    if command -v npm &> /dev/null; then
        echo "NPM HTTP Proxy: $(npm -g config get http-proxy)"
        echo "NPM HTTPS Proxy: $(npm -g config get https-proxy)"
    else
        echo "NPM: Not installed"
    fi
    if command -v yarn &> /dev/null; then
        echo "Yarn Proxy: $(yarn config get proxy)"
        echo "Yarn HTTPS Proxy: $(yarn config get https-proxy)"
    else
        echo "Yarn: Not installed"
    fi
    if command -v pip &> /dev/null; then
        echo "Python PIP Proxy: $(pip config get global.proxy)"
    else
        echo "Python PIP: Not installed"
    fi
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
