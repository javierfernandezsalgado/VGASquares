`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:42:55 08/10/2019 
// Design Name: 
// Module Name:    prescalar 
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
//-- prescaler.v
//-- clk_in: señal de reloj de entrada
//-- clk_out: Señal de reloj de salida, con menor frecuencia
module prescaler(input clk_in, output clk_out);
wire clk_in;
wire clk_out;
    
//-- Numero de bits del prescaler (por defecto)
parameter N = 22;
    
//-- Registro para implementar contador de N bits
reg [N-1:0] count = 0;
    
//-- El bit más significativo se saca por la salida
assign clk_out = count[N-1];
    
//-- Contador: se incrementa en flanco de subida
always @(posedge(clk_in)) begin
  count <= count + 1;
end
    
endmodule