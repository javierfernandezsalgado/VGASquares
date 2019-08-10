`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       Javier Fernandez Salgado
// 
// Create Date:    11:52:18 08/10/2019 
// Design Name: 
// Module Name:    square 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module square(
	input CLK_DRAW,
	input CLK_MOVE,
	input [9:0] x,
   input [9:0] y,
	output reg [4:0] RED,
   output reg [5:0] GREEN,
   output reg [4:0] BLUE
    );
	 
	 parameter XDIMENSIONS = 50;
	 parameter YDIMENSIONS = 50;
	 parameter COLOR = 0;
	 
	 parameter XINIT = 1;
	 parameter YINIT = 1;
	 
	 parameter FASTER = 1;
	 
	 reg [9:0]x_pos ;	
    initial begin
	   x_pos = XINIT;
   end
	 
	 reg [9:0]y_pos;
   initial begin
	   y_pos = YINIT;
   end
	 
	 
	 
	 reg x_address = 0;
	 /*initial begin
	   x_address = $urandom_range(1);
    end*/
	 reg y_address =0 ;
	 /*initial begin
	   y_address= $urandom_range(1);
    end*/
	 

always @(posedge CLK_MOVE)
begin
 if (x_address == 0 )
  begin
	x_pos <= x_pos+FASTER;
  end
 else
  begin
   x_pos <= x_pos-FASTER;
  end
 if (y_address == 0)
 begin
   y_pos <= y_pos + FASTER ;
 end
 else
  begin
   y_pos <= y_pos -FASTER;
  end
end

always @(posedge CLK_MOVE)
begin

  if ((x_pos+XDIMENSIONS) > 640 )
  begin
	x_address <= 1;
  end
  if (x_pos <= FASTER)
  begin
   x_address <= 0;
  end
  if ((y_pos+YDIMENSIONS)  > 480)
  begin
  y_address<=1;
  end
  if (y_pos <= FASTER)
  begin
  y_address <= 0;
  end
end

always @(posedge CLK_DRAW)
begin
if (x > x_pos & x < (x_pos+XDIMENSIONS) & y> y_pos & y < (y_pos + YDIMENSIONS) )
begin
if (COLOR == 0)
begin
  RED <= 24;
  GREEN <=0;
  BLUE <=0;

end

if (COLOR ==1)
begin
RED <= 0;
  GREEN <=31;
  BLUE <=0;

end

if (COLOR ==2)
begin
  RED <= 0;
  GREEN <=0;
  BLUE <=63;
 
end

end
else
begin
RED <=0;
GREEN <=0;
BLUE<=0;
end
end


endmodule
