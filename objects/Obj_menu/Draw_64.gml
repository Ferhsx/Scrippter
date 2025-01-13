draw_set_font(FT_menu);
draw_set_color(c_white);


//define posição mouse
var px_mouse = device_mouse_x_to_gui(0);
var py_mouse = device_mouse_y_to_gui(0);

var gui_largura = display_get_gui_width();
var gui_altura = display_get_gui_height();

var x1= gui_largura/2;
var y1= gui_altura/2;

var dist = 45;

//desenho do titulo do jogo
draw_text_transformed((x1), (y1-22.5),opc_menu[0], 1.5, 1.5 ,1);

//desenho das opções
for(var i = 1; i < op_max; i++){
	//desenha
	draw_text(x1,y1 +(dist*i),opc_menu[i]);
	
	//verifica a posição
	var psc_y = y1+(dist*i);
	var larg_text = draw_get_text_width(opc_menu[i])/2;
	var alt_text = 15;
	
	//mostrar seleção do menu com teclado e mouse
	if(px_mouse >= x1 - larg_text && px_mouse <= x1 + larg_text && 
	py_mouse >= psc_y - alt_text/2 && py_mouse <= psc_y + alt_text/2){
		draw_set_color(c_purple);
	}else{
		draw_set_color(c_white);
	}
	
	
	//centraliza
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text(x1, psc_y, opc_menu);
	
	
	
	

}

draw_set_font(-1);