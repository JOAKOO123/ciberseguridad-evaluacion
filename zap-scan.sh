#!/bin/bash

TARGET="http://localhost"

docker run -t owasp/zap2docker-stable zap-baseline.py \
    -t $TARGET \
    -r zap-report.html
