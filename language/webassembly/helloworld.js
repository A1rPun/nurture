import returnResponse from "./webassembly.js";

returnResponse("helloworld.wasm", (wasm) => {
  const memory = wasm.exports.memory;
  const length = wasm.exports.length;
  const position = wasm.exports.position;

  const bytes = new Uint8Array(memory.buffer, position, length);
  const s = new TextDecoder("utf8").decode(bytes);

  console.log(s);
  document.write(s);
});
