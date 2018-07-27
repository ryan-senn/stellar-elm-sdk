#!/usr/bin/env bash
elm-live --path-to-elm-make=./elm-make-osx +RTS -A128M -H128M -n8m -RTS --output=./docs/build/app.js ./src/Main.elm --debug
