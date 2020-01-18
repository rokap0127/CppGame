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

		//p�x�N�g���̒���
		//float len = length(p);
		//col = len / size_div2.x;
		
		// {-1.0�`+1.0}
		//col = p / size_div2;

		//��Βl{+1.0�`0.0�`+1.0}
		//col = abs(col);

		//�������]{0.0�`+1.0�`0.0}
		col = 1.0f - col;

		//�傫���𖳎����Ď��o��
		//col = sign(col);

		//0���傫�����1�ɂ���
		//col = step(0.1, col);

		//x������̊p�x�����߂�{-3.14�`3.14}
		float angle = atan(p.y, p.x);

		//�x���@�ɕϊ�{-180 �` 180}
		float deg = degrees(angle);

		col = deg / 180;


        gl_FragColor = vec4(col, col, col, 1);

        //�V�F�[�_�̏o�͂�RGBA�ŃJ���[��ݒ�
        gl_FragColor *= v_color;
}