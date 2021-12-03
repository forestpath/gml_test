/// @description physics

//float
displace = displace + 1;
if( floating )
{
	if( displace <= 160 )
	{
		grav_on = 1;
		antigrav_on = 0;
	}
	if(	displace > 160 )
	{
		grav_on = 0;
		antigrav_on = 1;
	
	}
	if( displace > 319 )
	{
		displace = 0;
		float_sp = 0;
	}
}


//death
if( place_meeting(x,y,oPlayer) )
{
	grav_on = 1;
	antigrav_on = 0;
	floating = 0;
}

//gravity
if( grav_on )
{
	float_sp = jelly_grav;
	
}
if( antigrav_on )
{
	float_sp = -1 * jelly_grav;
}
y = y + float_sp;