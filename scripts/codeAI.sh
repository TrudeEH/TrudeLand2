#! /bin/bash

sudo paru -S ollama foot

foot ollama serve &
sleep 1
echo "Running codellama model..."
ollama run codellama
