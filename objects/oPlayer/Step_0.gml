/// @description physics

//inputs
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space); //pressed prevents multiple activation

//movement
var _move = key_right - key_left; //var means local | 0 - 0, 0 - 1, 1 - 0, 1 - 1
h_sp = _move * walk_sp;
v_sp = v_sp + grav;

//collision
if( place_meeting(x,y+1,oTile) && (key_jump) )
{
	v_sp = -jump_sp;
}

if( place_meeting(x+h_sp,y,oTile) )
{
	while( !place_meeting(x+sign(h_sp),y,oTile) ) //moves by pixel for flush collision
	{
		x = x + sign(h_sp);
	}
	h_sp = 0;
}
x = x + h_sp;

if( place_meeting(x,y+v_sp,oTile) )
{
	while( !place_meeting(x,y+sign(v_sp),oTile) )
	{
		y = y + sign(v_sp);
	}
	v_sp = 0;
}
y = y + v_sp;

//animation
if( _move == 0 )
{
	sprite_index = sPlayer;
}
if( _move == -1 )
{
	sprite_index = sPlayerSpinR;
}
if( _move == 1 )
{
	sprite_index = sPlayerSpin;
}