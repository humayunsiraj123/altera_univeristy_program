module decoder_3bit(
	input [2:0] sw,
	output logic [6:0] hex);
//as the hex display of fgpa is active low 
//for the task  we design seven seg active zero  based

always_comb begin : proc_
	case(sw)
		3'b000:  hex = 7'b0100001;//active low d
		3'b001:  hex = 7'b0000110;//active low e
		3'b010:  hex = 7'b1111001;//active low 1
		3'b011:  hex = 7'b1000000;//active low 0
		3'b100:  hex = 7'b0100010;// character 2 
		default: hex = 7'b1111111; //blank
	endcase // sw
end

endmodule : decoder_3bit