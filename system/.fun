#!/usr/bin/env bash

# Create a new directory and enter it
function mkd() {
    mkdir -p "$@" && cd "$@"
}
