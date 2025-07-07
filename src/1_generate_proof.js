const snarkjs = require("snarkjs");
const fs = require("fs");

async function proof_generator() {
  const { proof, publicSignals } = await snarkjs.groth16.fullProve(
    { age: 10 },
    "./compiled/age_check/age_check_js/age_check.wasm",
    "./keys/age_check_final.zkey"
  );

  fs.writeFileSync("./proof.json", JSON.stringify(proof))
  fs.writeFileSync("./publicInputSignals.json", JSON.stringify(publicSignals))
  console.log("Proof & publicInput Generated!");

}

proof_generator().then(() => {
  process.exit(0);
});
