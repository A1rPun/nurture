import returnResponse from "./webassembly.js";

returnResponse("fib.wasm", (wasm) => {
  console.log(wasm.exports.fib(12));
});
