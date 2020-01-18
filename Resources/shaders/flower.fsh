varying vec4 v_color; //�i���́j�F

//(����)�}�`�̒��S
uniform vec2 center;
//�i���́j�}�`�̕��̍����̔���
uniform vec2 size_div2;

void main(){

		// �`��s�N�Z���̍��W�Ɛ}�`�̒��S���W�̍����v�Z
		// {-250�`+250}
		vec2 p = gl_FragCoord.xy - center;
		float col;
		float col2;

			//x������̊p�x�����߂�{-3.14�`3.14}
		float angle = atan(p.y, p.x);
		angle = abs(angle);

		//�x���@�ɕϊ�{-180 �` 180}
		float deg = degrees(angle);

		col = deg / 180;
		//30�x�œh�蕪��
		col = step(1.0 / 6.0 , col);

		//p�x�N�g���̒���
		float len = length(p);
		col2 = len / size_div2.x;
		
		//���]{0.0�`+1.0�`0.0}
		col2 = 1.0f - col2;

		//�傫���𖳎����Ď��o��
		col2 = sign(col2);

		//�F������
        //gl_FragColor = vec4(col, col, col, 1);

		gl_FragColor = vec4(1, 1, 0, col * col2);

        //�V�F�[�_�̏o�͂�RGBA�ŃJ���[��ݒ�
        gl_FragColor *= v_color;
}