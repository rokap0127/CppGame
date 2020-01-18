varying vec4 v_color; //�i���́j�F

//(����)�}�`�̒��S
uniform vec2 center;
//�i���́j�}�`�̕��̍����̔���
uniform vec2 size_div2;
//(����) �o�ߎ���
uniform float time;

void main(){

		// �`��s�N�Z���̍��W�Ɛ}�`�̒��S���W�̍����v�Z
		// {-250�`+250}
		vec2 p = gl_FragCoord.xy - center;
		float col;

		//{-1.0�`1.0}
		//2��(2 * 3.14)�ł��Ƃɖ߂�
		col = sin(time * 3.14);

		col = col / 2.0 + 0.5;

		//�F������
        gl_FragColor = vec4(col, col, col, 1);

        //�V�F�[�_�̏o�͂�RGBA�ŃJ���[��ݒ�
        gl_FragColor *= v_color;
}