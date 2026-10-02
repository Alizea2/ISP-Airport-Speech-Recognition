# Airport Speech Recognition

A multilingual **automatic speech recognition (ASR)** system for airport phrases in **English, Spanish and Italian**, built in Python with the offline **Vosk** speech recognition toolkit. It cleans up each recording, transcribes it, and scores the accuracy with **Word Error Rate (WER)**. You can also record your own sentences with the microphone.

Exercise 4 of an Intelligent Signal Processing course.

## Features

- **`AirportASR` class** that loads one Vosk model per language
- **Audio preprocessing** before recognition:
  - stereo to mono
  - DC offset removal and peak normalisation
  - RMS loudness normalisation with a gain limit
  - a simple low-pass filter to cut high-frequency noise
- **Transcription** with Vosk's Kaldi recogniser
- **Evaluation** on 15 test recordings (5 per language) using WER from `jiwer`, checked against target thresholds (English < 25%, Spanish and Italian < 35%)
- **Custom recording session**: record two English sentences with your microphone and see how accurately they're transcribed

## Results

| Language | Average WER | Target | Result |
|----------|-------------|--------|--------|
| English | 11.43% | < 25% | ✓ PASS |
| Spanish | 19.52% | < 35% | ✓ PASS |
| Italian | 15.72% | < 35% | ✓ PASS |

Both custom-recorded English sentences were transcribed with **0% WER**.

These are the results saved in the notebook. A fresh run can differ by a fraction of a percent with newer package versions.

## Running the notebook

### Quick start (one command)

**Step 1:** Run this command in the terminal first. It downloads the project from GitHub into a temporary folder, installs the required packages in a separate environment (so your main Python isn't changed), downloads the speech models and starts Jupyter:

```bash
D=$(mktemp -d) && gh repo clone Alizea2/ISP-Airport-Speech-Recognition "$D" && cd "$D" && python3 -m venv .venv && .venv/bin/pip install -q -r requirements.txt && ./download_models.sh && .venv/bin/jupyter notebook "exercise 4.1.ipynb"
```

> ⚠️ The speech models are about **2 GB** (mostly the English model), so the first run takes a while to download.

**Step 2:** Jupyter usually opens in your browser by itself. If it doesn't, click the link that starts with **`http://localhost:8888/`** in the terminal output. Copy the whole link, including the `?token=...` part.

**Step 3:** Choose **Run → Run All Cells**. After the test recordings are evaluated, the notebook asks *"Would you like to record custom sentences? (y/n)"*:
- type **`n`** and press Enter to skip straight to the results table, or
- type **`y`** to record yourself. Allow microphone access if asked, then press Enter before each sentence and speak within 5 seconds.

When you're done, close the browser tab and press `Ctrl + C` in the terminal to stop Jupyter.

> This needs Python 3 and the [GitHub CLI](https://cli.github.com/) (`gh`) signed in to an account that can access this repository.

### Manual setup

From inside the project folder:

```bash
pip install -r requirements.txt
./download_models.sh
jupyter notebook "exercise 4.1.ipynb"
```

## Speech models

The models aren't stored in this repository because they're too large for GitHub. `download_models.sh` downloads them from the [official Vosk model page](https://alphacephei.com/vosk/models) into `models/`:

| Language | Model |
|----------|-------|
| English | `vosk-model-en-us-0.22` |
| Spanish | `vosk-model-small-es-0.42` |
| Italian | `vosk-model-small-it-0.22` |

## Project Structure

| File / Folder | Purpose |
|---------------|---------|
| `exercise 4.1.ipynb` | The ASR system, evaluation and custom recording |
| `Ex4_audio_files/` | Test recordings in `EN/`, `ES/` and `IT/`, plus their preprocessed versions |
| `your_sentence1.wav`, `your_sentence2.wav` | Custom recordings, with their preprocessed versions |
| `download_models.sh` | Downloads the Vosk models |
| `requirements.txt` | Python packages |

## Built With

- Python 3, [Jupyter](https://jupyter.org/)
- [Vosk](https://alphacephei.com/vosk/): offline speech recognition
- [jiwer](https://github.com/jitsi/jiwer): Word Error Rate
- [NumPy](https://numpy.org/), [SoundFile](https://github.com/bastibe/python-soundfile), [sounddevice](https://python-sounddevice.readthedocs.io/)

## Related exercises

- [ISP-Audio-Effects-App](https://github.com/Alizea2/ISP-Audio-Effects-App): Exercise 1
- [ISP-Audio-Captcha-Voice-Control](https://github.com/Alizea2/ISP-Audio-Captcha-Voice-Control): Exercise 2
- [ISP-Audio-Steganography](https://github.com/Alizea2/ISP-Audio-Steganography): Exercise 3

## Author

[@Alizea2](https://github.com/Alizea2)
