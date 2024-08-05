#!/bin/bash
city=$(curl -s https://ipinfo.io/city)
weather=$(curl -s "wttr.in/${city}?format="%l:+%c+%t"")
echo "$weather"
