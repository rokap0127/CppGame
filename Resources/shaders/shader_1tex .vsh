attribute vec4 a_position; //���͍��W
attribute vec4 a_color; //�i���́j�F
attribute vec2 a_texCoord;//(����)�e�N�X�`�����W

varying vec4 v_color;//�i�o�́j�F
varying vec2 v_texCoord;//(�o��)�e�N�X�`�����W

void main() {
	//�V�F�[�_�̏o�͂ɍ��W���R�s�[
	gl_Position = a_position;
	//���͂���o�͂ɐF���R�s�[
	v_color = a_color;
	v_texCoord = a_texCoord;
}