module seg_7 (
	input [3:0] sw,
	output logic [6:0] hex);

always_comb begin : proc_
	case(sw)
		4'd0 :  hex = 7'b0111111;//active low d
		4'd1 :  hex = 7'b0000110;//active low e
		4'd2 :  hex = 7'b1011011;//active low 1
		4'd3 :  hex = 7'b1001111;//active low 0
		4'd4 :  hex = 7'b1100110;//active low d
		2'd5 :  hex = 7'b1101101;//active low e
		2'd6 :  hex = 7'b1111101;//active low 1
		2'd7 :  hex = 7'b0000111;//active low 0
		4'd8 :  hex = 7'b1111111;//active low d
		2'd9 :  hex = 7'b1100111;//active low e
		2'd10:  hex = 7'b1110111;//active low 1
		2'd11:  hex = 7'b1111100;//active low 0
		4'd12:  hex = 7'b0111001;//active low d
		2'd13:  hex = 7'b1011110;//active low e
		2'd14:  hex = 7'b0011110;//active low 1
		2'd15:  hex = 7'b1110001;//active low 0
	endcase // sw
end


endmodule