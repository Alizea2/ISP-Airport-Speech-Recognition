#!/usr/bin/env bash
# Downloads the three Vosk speech-recognition models used by the notebook
# into ./models (about 2 GB in total). Models that are already there are skipped.
set -e
cd "$(dirname "$0")"
mkdir -p models

for m in vosk-model-en-us-0.22 vosk-model-small-es-0.42 vosk-model-small-it-0.22; do
  if [ -d "models/$m" ]; then
    echo "✓ $m already downloaded"
    continue
  fi
  echo "Downloading $m..."
  curl -L --fail --progress-bar -o "models/$m.zip" "https://alphacephei.com/vosk/models/$m.zip"
  unzip -q "models/$m.zip" -d models
  rm "models/$m.zip"
  echo "✓ $m ready"
done
