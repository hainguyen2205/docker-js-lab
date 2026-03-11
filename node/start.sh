#!/bin/bash

set -e

echo "Starting JS workspace services..."

cd /workspace/rent-house-react
npm install
npm run dev &

cd /workspace/rent-house-epxress
npm install
npm run dev &

wait