varying vec4 v_color; //�i���́j�F

uniform vec2 center;
uniform vec2 size;

void main(){

        //gl_FragColor = vec4(gl_FragCoord.x / 1280, 0, 0, 1);
		vec2 p = gl_FragCoord.xy - center;

		float col;
		
		col = p.x / 250;

        gl_FragColor = vec4(col, col, col, 1);

        //�V�F�[�_�̏o�͂�RGBA�ŃJ���[��ݒ�
        gl_FragColor *= v_color;
}