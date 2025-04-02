#!/bin/bash

FRUITS=("APPLE" "KIWI" "ORANGE")

echo "First fruit is: $(FRUITS[0])";
echo "First fruit is: $(FRUITS[1])";
echo "First fruit is: $(FRUITS[2])";

echo "First fruit is: $(FRUITS[@])";