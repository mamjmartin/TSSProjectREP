///@descrpitions draw an arc with a lot of lines
///@arg x
///@arg y
///@arg raduis
///@arg angle
///@arg start_angle
///@arg segments
///@arg color
///@arg width

var centerX = argument[0]
var centerY = argument[1]
var radius = argument[2]
var angle = argument[3]
var startAngle = argument[4]
var segments = argument[5]
var color = argument[6]
var width = argument[7]

var subAngle = angle/segments
for(var i = 0; i<segments; i++){
	draw_line_width_color(centerX+dcos(startAngle+i*subAngle)*radius,
		centerY-dsin(startAngle+i*subAngle)*radius,
		centerX+dcos(startAngle+(i+1)*subAngle)*radius,
		centerY-dsin(startAngle+(i+1)*subAngle)*radius, width,color,color)
}