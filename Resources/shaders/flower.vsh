attribute vec4 a_position; //���͍��W
attribute vec4 a_color; //�i���́j�F
uniform mat4 u_wvp_matrix; //(����)���[���h�A�r���[�A�v���W�F�N�V�����s��
varying vec4 v_color; //�i�o�́j�F

void main() {
	gl_Position = u_wvp_matrix * a_position;
	//���͂���o�͂ɐF���R�s�[
	v_color = a_color;
}