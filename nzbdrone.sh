#!/bin/bash

exec /sbin/setuser nobody mono /opt/NzbDrone/NzbDrone.exe -nobrowswer -data=/config
