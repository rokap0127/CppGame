varying vec4 v_color; //（入力）色

//(入力)図形の中心
uniform vec2 center;
//（入力）図形の幅の高さの半分
uniform vec2 size_div2;
//(入力) 経過時間
uniform float time;

void main(){

		// 描画ピクセルの座標と図形の中心座標の差を計算
	// {-250～+250}
	vec2 p = gl_FragCoord.xy - center;
	// {-1.0～+1.0}
	p /= size_div2.x;

	// 中心からの角度{-3.14～+3.14}
	float angle = atan(p.y, p.x);

	float col;

	// 中心からの距離 {0.0～1.0}
	float len = length(p);

	// 白黒反転 {0.0～1.0}
	col = 1 - len;

	// 時間による変化 {0.0～1.0}
	//float s = sin(sin(time*3.14)+3.14/2.0) / 2.0 + 0.5;
	float s = cos(sin(time*3.14)) / 2.0 + 0.5;

	// sinカーブによる影響を反映
	col = col * s;

	gl_FragColor = vec4(col,col,col,1);

	// 外部から指定された色を乗算
	gl_FragColor *= v_color;
}