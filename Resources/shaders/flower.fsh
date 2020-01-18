varying vec4 v_color; //（入力）色

//(入力)図形の中心
uniform vec2 center;
//（入力）図形の幅の高さの半分
uniform vec2 size_div2;

void main(){

		// 描画ピクセルの座標と図形の中心座標の差を計算
		// {-250～+250}
		vec2 p = gl_FragCoord.xy - center;
		float col;

		//pベクトルの長さ
		//float len = length(p);
		//col = len / size_div2.x;
		
		// {-1.0～+1.0}
		//col = p / size_div2;

		//絶対値{+1.0～0.0～+1.0}
		//col = abs(col);

		//白黒反転{0.0～+1.0～0.0}
		col = 1.0f - col;

		//大きさを無視して取り出す
		//col = sign(col);

		//0より大きければ1にする
		//col = step(0.1, col);

		//x軸からの角度を求める{-3.14～3.14}
		float angle = atan(p.y, p.x);

		//度数法に変換{-180 ～ 180}
		float deg = degrees(angle);

		col = deg / 180;


        gl_FragColor = vec4(col, col, col, 1);

        //シェーダの出力にRGBAでカラーを設定
        gl_FragColor *= v_color;
}