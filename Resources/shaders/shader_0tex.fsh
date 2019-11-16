varying vec4 v_color; //（入力）色

void main(){
        //シェーダの出力にRGBAでカラーを設定
        gl_FragColor = v_color;
}