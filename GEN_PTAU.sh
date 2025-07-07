#!/bin/bash

set -e

CIRCUIT_NAME="age_check"
BUILD_DIR="./compiled/age_check"
KEY_DIR="./keys"
PTAU_NAME="pot12_final.ptau"

mkdir -p "$KEY_DIR"

echo "[1] Phase 1: Powers of Tau 초기화"
snarkjs powersoftau new bn128 12 $KEY_DIR/pot12_0000.ptau -v

echo "[2] Phase 1: 기여"
snarkjs powersoftau contribute $KEY_DIR/pot12_0000.ptau $KEY_DIR/pot12_0001.ptau --name="First contribution" -v

echo "[3] Phase 2 준비"
snarkjs powersoftau prepare phase2 $KEY_DIR/pot12_0001.ptau $KEY_DIR/$PTAU_NAME -v

