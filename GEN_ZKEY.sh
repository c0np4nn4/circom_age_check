#!/bin/bash

set -e

CIRCUIT_NAME="age_check"
BUILD_DIR="./compiled/build_age"
KEY_DIR="./keys"
PTAU_NAME="pot12_final.ptau"

echo "[4] zkey 초기화"
snarkjs groth16 setup $BUILD_DIR/${CIRCUIT_NAME}.r1cs $KEY_DIR/$PTAU_NAME $KEY_DIR/${CIRCUIT_NAME}_00.zkey

echo "[5] zkey 기여"
snarkjs zkey contribute $KEY_DIR/${CIRCUIT_NAME}_00.zkey $KEY_DIR/${CIRCUIT_NAME}_01.zkey --name="1st contributor" -v

echo "[6] beacon"
snarkjs zkey beacon $KEY_DIR/${CIRCUIT_NAME}_01.zkey $KEY_DIR/${CIRCUIT_NAME}_final.zkey 0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f 10 -n="Final Beacon"

echo "[7] 검증"
snarkjs zkey verify $BUILD_DIR/${CIRCUIT_NAME}.r1cs $KEY_DIR/$PTAU_NAME $KEY_DIR/${CIRCUIT_NAME}_final.zkey

echo "[8] Verification key 생성"
snarkjs zkey export verificationkey $KEY_DIR/${CIRCUIT_NAME}_final.zkey $KEY_DIR/${CIRCUIT_NAME}_verification_key.json

echo "✅ 모든 키 생성 완료!"

