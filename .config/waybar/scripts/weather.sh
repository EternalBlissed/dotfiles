#!/bin/bash
city=$(curl -s https://ipinfo.io/city)
weather=$(curl -s "wttr.in/${city}?format=3")
echo "Weather: $weather"
