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

		col = time / 5;

		//�F������
        gl_FragColor = vec4(col, col, col, 1);

        //�V�F�[�_�̏o�͂�RGBA�ŃJ���[��ݒ�
        gl_FragColor *= v_color;
}