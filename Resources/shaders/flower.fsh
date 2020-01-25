varying vec4 v_color; //（入力）色

//(入力)図形の中心
uniform vec2 center;
//（入力）図形の幅の高さの半分
uniform vec2 size_div2;
//(入力) 経過時間
uniform float time;

//0より大きければ1を返す
//sign関数に近いが、マイナス時も0を返す。
float u( float x ) { return (x>0.0)?1.0:0.0; }

void main(){
// ノードの中心位置から見た、描画ピクセルの座標
vec2 p = gl_FragCoord.xy - center;
// X,Yともに-1～+1の範囲に。
p /= size_div2;
// a: 中心からの角度
float a = atan(p.x,p.y);
// r: 中心からの距離
float r = length(p);
// w: 中心からの距離と時間でのゆらぎ。-1～+1の範囲。
float w = cos( 3.1415927*time - r*2.0);
// h: 角度、中心距離と時間でのゆらぎ。0～+1の範囲に。
float h = 0.5 + 0.5*cos(12.0*a - w*7.0 + r*8.0);
// d: もうなんか色々。0.25～+1.0の範囲に。
float d = 0.25 + 0.75*pow(h,1.0*r)*(0.7 + 0.3*w);
// dがrより大きいときだけ色が出る。
float col = u( d-r ) * sqrt(1.0-r/d)*r*2.5;
// もうわけがわからない。
col *= 1.25+0.25*cos((12.0*a-w*7.0+r*8.0)/2.0);
col *= 1.0 - 0.35*(0.5+0.5*sin(r*30.0))*(0.5+0.5*cos(12.0*a-w*7.0+r*8.0));
// hを使って、RGBそれぞれに、角度、中心距離でのずれをだしている。
gl_FragColor = vec4(
col,
col-h*0.5+r*.2 + 0.35*h*(1.0-r),
col-h*r + 0.1*h*(1.0-r),
1.0);
}