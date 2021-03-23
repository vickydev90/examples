#!/usr/bin/env bash

assume-role() {
    set +x
    
    ROLE_ARN="${1}"
    curl $ROLE_ARN
    
    set -x
}
