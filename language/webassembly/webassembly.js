export default (fileName, cb) =>
  fetch(fileName)
    .then((reponse) => reponse.arrayBuffer())
    .then((bytes) => WebAssembly.instantiate(bytes, {}))
    .then((result) => result.instance)
    .then(cb);
