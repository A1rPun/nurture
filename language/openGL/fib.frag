#ifdef GL_ES
precision mediump float;
#endif

#define PHI.618033988749895

uniform vec2 u_resolution;
uniform float u_time;

float spiral(vec2 pos,float interval,float amount){
  float theta=atan(pos.x,pos.y);
  float logspiral=log(length(pos))/PHI+theta;
  return sin(u_time*interval+logspiral*amount);
}

void main(){
  vec2 pos=(gl_FragCoord.xy-.5*u_resolution.xy)/u_resolution.y;
  float color=spiral(pos,.5,5.);
  gl_FragColor=vec4(color,.5,.5,1.);
}
