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
		float len = length(p);
		
		col = len / size_div2.x;
		
		// {-1.0～+1.0}
		//col = p / size_div2;


		//絶対値{+1.0～0.0～+1.0}
		//col = abs(col);

		//白黒反転{0.0～+1.0～0.0}
		col = 1.0f - col;

        gl_FragColor = vec4(col, col, col, 1);

        //シェーダの出力にRGBAでカラーを設定
        gl_FragColor *= v_color;
}