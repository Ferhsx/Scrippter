draw_set_font(FT_menu);
draw_set_color(c_white);

//posição mouse
var mx1= device_mouse_x_to_gui(0);
var my1= device_mouse_y_to_gui(0);

//alinhamento
draw_set_halign(fa_center);
draw_set_valign(fa_middle);


//loop para o desenho do menu
for(var i = 1; i < op_max; i++){
	var gui_largura = display_get_gui_width();
	var gui_altura = display_get_gui_height();
	
	var x1= gui_largura/2;
	var y1= gui_altura/2;
	
	var astr= string_height(i);
	var lstr= string_width(opc_menu[i]);
	
	var x2= x1 - lstr/2;
	var y2= y1 - astr/2 +(astr*i);
	
	var x3= x1 + lstr/2;
	var y3= y1 + astr/2 +(astr*i);
	
	//interação mouse
	if(point_in_rectangle(mx1, my1, x2, y2, x3, y3)){
		esc=1.4;
		draw_set_color(c_purple);
		
		if(mouse_check_button_pressed(mb_left)){
		
			switch opc_menu[i]{
				
				case opc_menu[1]: //novo jogo
					room_goto_next();
					break
				case opc_menu[2]: //carregar jogo
					show_message("sem jogo para carregar");
					break
				case opc_menu[3]: //configs
					show_message("sem jogo para configurar");
					break
				case opc_menu[4]: //sair
					game_end();
					break;
			}
		}
		
	
	}else{
		esc=1;
		draw_set_color(c_white);
	}
	
	//desenho do titulo
	draw_text_transformed((x1), (y1-35),opc_menu[0], 5, 5 ,0);
	
	//desenho da opção
	draw_text_transformed(x1, (y1 +(astr*i)), opc_menu[i], esc, esc, 0);
}

draw_set_font(-1);