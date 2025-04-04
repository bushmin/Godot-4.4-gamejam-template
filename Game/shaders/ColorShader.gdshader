shader_type canvas_item;
uniform sampler2D SCREEN_TEXTURE: hint_screen_texture, filter_linear_mipmap;

uniform vec4[10] colorArray: source_color;

void fragment(){
	vec4 color = texture(SCREEN_TEXTURE, SCREEN_UV);
	vec4 new_color = vec4(.0);
	for (int i = 0; i < colorArray.length(); i++) {
		if (distance(colorArray[i], color) < distance(new_color, color)) {
			new_color = colorArray[i];
		}
	}
	COLOR = new_color;
}