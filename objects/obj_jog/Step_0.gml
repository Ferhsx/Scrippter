// Gravidade
if (!place_meeting(x, y + 1, obj_chao)) {
    vspeed += 0.5; // Aumenta a velocidade na direção vertical
} else {
    vspeed = 0; // Para a velocidade quando no chão
}

y += vspeed; // Move o jogador para baixo

