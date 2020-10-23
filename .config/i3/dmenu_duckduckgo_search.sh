#!/bin/bash

URL='https://duckduckgo.com/?q='
QUERY=$(echo '' | dmenu -p 'Search DuckDuckGo:' -fn 'Fira Mono-10' -sb '#222')
if [ -n "$QUERY" ]; then
  xdg-open "${URL}${QUERY}" 2> /dev/null
  exec i3-msg [class="^Firefox$"] focus
fi
