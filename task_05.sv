module task_05 (
	input        [9:0] sw   ,
	output       [9:0] ledr ,
	output logic [6:0] hex_0,
	output logic [6:0] hex_1,
	output logic [6:0] hex_2,
	output logic [6:0] hex_3
);
//as the hex display of fgpa is active low
//for the task  we design seven seg active zero  based


	wire [3:0][9:0] seg_in_vec ;
	wire [3:0][1:0] mux_out_vec;
	wire [3:0][6:0] seg_out_vec;


	assign seg_in_vec[0] = sw;
	assign seg_in_vec[1] = {sw[9:8],sw[5:0],sw[7:6]};//for pattern  2
	assign seg_in_vec[2] = {sw[9:8],sw[3:0],sw[7:6],sw[5:4]};//for pattern  2
	assign seg_in_vec[3] = {sw[9:8],sw[1:0],sw[7:6],sw[5:4],sw[3:2]};//for pattern  2
	assign hex_0         = seg_out_vec[0];
	assign hex_1         = seg_out_vec[1];
	assign hex_2         = seg_out_vec[2];
	assign hex_3         = seg_out_vec[3];


// to for ledr to display the switch no is 1 or 0
	task_1 i_task_1 (
		.SW  (sw  ),
		.LEDR(ledr)
	);

	genvar a_gv;
	generate

		for(a_gv = 0 ; a_gv < 4; a_gv++)
			begin
				task_3 i_task_3 (
					.SW(seg_in_vec[a_gv]),
					.LEDR(mux_out_vec[a_gv])
				);

			task_04 i_task_04 (
				.sw (mux_out_vec[a_gv]),
				.hex(seg_out_vec[a_gv])
			);


			end

	endgenerate

/*task_3 seg0 (
	.SW(SW),
	.LEDR(mux_out));
task_3 seg0 (
	.SW(SW),
	.LEDR(mux_out));
task_3 seg0 (
	.SW(SW),
	.LEDR(mux_out));
task_3 seg0 (
	.SW(SW),
	.LEDR(mux_out));*/

//passed only 2 bits so lower 2 bits of ledr shows result of  mux out we use that mux out for decoder

/*task_04 _task_04 (.sw(mux_out), .hex(hex_3));
task_04 i_task_04 (.sw(mux_out), .hex(hex_3));
task_04 i_task_04 (.sw(mux_out), .hex(hex_3));
task_04 i_task_04 (.sw(mux_out), .hex(hex_3));
*/

endmodule : task_05