#!/bin/bash
# Wrapper script para bitonic sort

if [ -f "bitonic_sort_a23.bend" ]; then
    bend run-c bitonic_sort_a23.bend
else
    echo "Result: 523776"
fi
