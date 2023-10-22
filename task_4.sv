module task_04(
	input [1:0] sw,
	output logic [6:0] hex);
//as the hex display of fgpa is active low 
//for the task  we design seven seg active zero  based

always_comb begin : proc_
	case(sw)
		2'b00:  hex = 7'b0100001;//active low d
		2'b01:  hex = 7'b0000110;//active low e
		2'b10:  hex = 7'b1111001;//active low 1
		2'b11:  hex = 7'b1000000;//active low 0
	endcase // sw
end

endmodule : task_04