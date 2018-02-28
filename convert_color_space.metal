
//
//  convert_color_space.metal
//  odkey/study_metal
//
//  Created by Yota Odaka on 2018/03/01.
//  Copyright © 2018 Yota Odaka. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

float3 hsb2rgb(float3 hsb) {
  float r, g, b, i, f, p, q, t;
  i = floor(hsb.x * 6);
  f = hsb.x * 6 - i;
  p = hsb.z * (1 - hsb.y);
  q = hsb.z * (1 - f * hsb.y);
  t = hsb.z * (1 - (1 - f) * hsb.y);
  switch (int(i) % int(6)) {
    case 0:
      r = hsb.z;
      g = t;
      b = p;
    break;
    
    case 1:
      r = q;
      g = hsb.z;
      b = p;
    break;
    
    case 2:
      r = p;
      g = hsb.z;
      b = t;
    break;
    
    case 3:
      r = p;
      g = q;
      b = hsb.z;
    break;
    
    case 4:
      r = t;
      g = p;
      b = hsb.z;
    break;
    
    case 5:
      r = hsb.z;
      g = p;
      b = q;
    break;
  }
  return float3(r, g, b);
}

float3 hsb2rgb(float h, float s, float b) {
  float3 hsb = float3(h, s, b);
  return hsb2rgb(hsb);
}
