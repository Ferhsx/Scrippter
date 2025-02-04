//codigos das direções
#region CONTROLES
var key_direita = keyboard_check(ord("D")) || keyboard_check(vk_right);
var key_esquerda = keyboard_check(ord("A")) || keyboard_check(vk_left);
var key_pula = keyboard_check(ord("W")) || keyboard_check(vk_space);
var chao = place_meeting(x,y, obj_chao);

#endregion

//codigo para realizar a movimentacao
#region MOVIMENTOS
//defini gravidade
if(!chao){
    v_vlc += grvd*massa;
}

var mover = key_direita - key_esquerda;

h_vlc = mover*vlc;
v_vlc = v_vlc*grvd;

if(h_vlc != 0){
    image_xscale = sign(h_vlc); 
}

//colisão horizontal
if place_meeting(x+h_vlc,y,obj_chao){
    while(!place_meeting(x+sign(h_vlc),y,obj_chao)){
        x=x+sign(h_vlc);
    }
    h_vlc = 0;
}

x=x+h_vlc;

//colisao vertical
if place_meeting(x,y+v_vlc,obj_chao){
    while(!place_meeting(x,y+sign(v_vlc),obj_chao)){
        y=y+sign(v_vlc);
    }
    v_vlc = 0;
}

y=y+v_vlc;

//pulo
if place_meeting(x, y+1, obj_chao) and key_pula{
    v_vlc -= 15*image_yscale; // Aumentar a velocidade do pulo
}

#endregion