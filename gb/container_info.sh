#!/bin/bash
docker -H :4000 stats $(docker -H :4000 ps|grep -v "NAMES"|awk '{ print $NF }'|tr "\n" " ")
