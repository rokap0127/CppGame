varying vec4 v_color; //�i���́j�F

//(����)�}�`�̒��S
uniform vec2 center;
//�i���́j�}�`�̕��̍����̔���
uniform vec2 size_div2;
//(����) �o�ߎ���
uniform float time;

//0���傫�����1��Ԃ�
//sign�֐��ɋ߂����A�}�C�i�X����0��Ԃ��B
float u( float x ) { return (x>0.0)?1.0:0.0; }

void main(){
// �m�[�h�̒��S�ʒu���猩���A�`��s�N�Z���̍��W
vec2 p = gl_FragCoord.xy - center;
// X,Y�Ƃ���-1�`+1�͈̔͂ɁB
p /= size_div2;
// a: ���S����̊p�x
float a = atan(p.x,p.y);
// r: ���S����̋���
float r = length(p);
// w: ���S����̋����Ǝ��Ԃł̂�炬�B-1�`+1�͈̔́B
float w = cos( 3.1415927*time - r*2.0);
// h: �p�x�A���S�����Ǝ��Ԃł̂�炬�B0�`+1�͈̔͂ɁB
float h = 0.5 + 0.5*cos(12.0*a - w*7.0 + r*8.0);
// d: �����Ȃ񂩐F�X�B0.25�`+1.0�͈̔͂ɁB
float d = 0.25 + 0.75*pow(h,1.0*r)*(0.7 + 0.3*w);
// d��r���傫���Ƃ������F���o��B
float col = u( d-r ) * sqrt(1.0-r/d)*r*2.5;
// �����킯���킩��Ȃ��B
col *= 1.25+0.25*cos((12.0*a-w*7.0+r*8.0)/2.0);
col *= 1.0 - 0.35*(0.5+0.5*sin(r*30.0))*(0.5+0.5*cos(12.0*a-w*7.0+r*8.0));
// h���g���āARGB���ꂼ��ɁA�p�x�A���S�����ł̂���������Ă���B
gl_FragColor = vec4(
col,
col-h*0.5+r*.2 + 0.35*h*(1.0-r),
col-h*r + 0.1*h*(1.0-r),
1.0);
}