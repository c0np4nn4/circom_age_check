# circom age check example

```
git clone git@github.com:c0np4nn4/circom_age_check.git
npm install
```

## Phases
1. Setup
```
# npm run build_age
# ./GEN_PTAU.sh
./GEN_ZKEY.sh
```

2. Proving
```
npm run gen_proof
cat -n proof.json
cat -n publicInputSignals.json
```

3. Verification
```
npm run ver_proof
```
