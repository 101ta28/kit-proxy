#!/bin/bash
# kit-proxy PIP EXTENTION TEST.
# Basicly this test code check whether the executed result is contain specified string

CHECKFILE="./kit-proxy.sh"
KIT_PROXY="http://wwwproxy.kanazawa-it.ac.jp:8080/"

function test_ProxyOfPip(){
    # This testfunction is wrappered.
    if [[ $1 =~ $2 ]]; then
      echo "TEST SUCCEEDED"
    else
      echo "TEST FAILED"
    fi
}

function test_shouldContainSpecifiedString_forSetProxy () {
    # this function judge whether $cmd is contain string which is $msg.
    local msg="config/pip/pip.conf"
    local cmd
    cmd=$(source "$CHECKFILE" on 2>&1)

    test_ProxyOfPip "$cmd" "$msg"
}

function test_shouldContainSpecifiedString_forUnsetProxy() {
    # this function judge whether $cmd is contain string $msg.
    local msg="config/pip/pip.conf"
    local cmd
    cmd=$(source "$CHECKFILE" off 2>&1)

    test_ProxyOfPip "$cmd" "$msg"
}

function test_showStatus_WhenSetPipProxy() {
    # When proxy is on, then this test check whether $cmd is contain string 'active'.
    local msg=$KIT_PROXY
    local cmd
    cmd=$(cat "/home/$USER/.config/pip/pip.conf")
    test_ProxyOfPip "$cmd" "$msg"
}

function test_showStatus_WhenUnsetPipProxy() {
    # When proxy is off, then this test check whether $cmd is contain string 'inactive'.
    local msg=""
    local cmd
    cmd=$(cat "/home/$USER/.config/pip/pip.conf")
    test_ProxyOfPip "$cmd" "$msg"
}

test_setPipProxy                    # Test of `kit-proxy on`
test_showStatus_WhenSetPipProxy     # When proxy is on, Test of `kit-proxy status`
test_unsetPipProxy                  # Test of `kit-proxy off`
test_showStatus_WhenUnsetPipProxy   # When proxy is off, Test of `kit-proxy status`
