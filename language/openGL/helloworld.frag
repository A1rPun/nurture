#ifdef GL_ES
precision mediump float;
#endif

void main(){
  // Unusual "hello, world" because rendering text isn't built in
  gl_FragColor=vec4(0.,1.,0.,1.);
}
