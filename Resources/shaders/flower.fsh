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
		float col;

		col = time / 5;

		//色を決定
        gl_FragColor = vec4(col, col, col, 1);

        //シェーダの出力にRGBAでカラーを設定
        gl_FragColor *= v_color;
}