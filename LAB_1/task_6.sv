module task_6 #(parameter NUM_DISP=8) (
  input        [         9:0]      sw      ,
  output       [         9:0]      ledr    ,
  output logic [NUM_DISP-1:0][6:0] hex_disp
);
//as the hex display of fgpa is active low
//for the task  we design seven seg active zero  based


  logic [NUM_DISP-1:0][NUM_DISP-1:0][2:0] seg_in_vec ;
  logic [NUM_DISP-1:0][         2:0]      mux_out_vec;
  localparam CNTRL_SIG_WIDTH =3



    logic [2:0] sel;
  logic [0:0] out;
  mux_M_wide_N_to_1 i_mux_M_wide_N_to_1 (.in(in), .sel(sel), .out(out)); 


  typedef enum {d,e,one,two,empty,zero} char_e;
  // 3'b000:  hex = 7'b0100001;//active low d=65
  //  3'b001:  hex = 7'b0000110;//active low e=6
  //  3'b010:  hex = 7'b1111001;//active low 1=121
  //  3'b011:  hex = 7'b1000000;//active low 0=
  //  3'b100:  hex = 7'b0100010;// character 2
  // let say 7 for empty character

  assign seg_in_vec[0] = {3'h7,3'h7,3'h7,3'h7,3'h7,3'h0,3'h1,3'h4};
  assign seg_in_vec[1] = {3'h7,3'h7,3'h7,3'h7,3'h0,3'h1,3'h4,3'h7};
  assign seg_in_vec[2] = {3'h7,3'h7,3'h7,3'h0,3'h1,3'h4,3'h7,3'h7};
  assign seg_in_vec[3] = {3'h7,3'h7,3'h0,3'h1,3'h4,3'h7,3'h7,3'h7};
  assign seg_in_vec[4] = {3'h7,3'h0,3'h1,3'h4,3'h7,3'h7,3'h7,3'h7};
  assign seg_in_vec[5] = {3'h0,3'h1,3'h4,3'h7,3'h7,3'h7,3'h7,3'h7};
  assign seg_in_vec[6] = {3'h1,3'h4,3'h7,3'h7,3'h7,3'h7,3'h7,3'h0};
  assign seg_in_vec[7] = {3'h4,3'h7,3'h7,3'h7,3'h7,3'h7,3'h0,3'h1};



// to for ledr to display the switch no is 1 or 0
  task_1 i_task_1 (
    .SW  (sw  ),
    .LEDR(ledr)
  );

  genvar a_gv;
  generate

    for(a_gv = 0 ; a_gv < 8; a_gv++)
      begin


        mux_M_wide_N_to_1 #(
          .NUM_SEL(3),
          .WIDTH  (3)
        ) i_mux_M_wide_N_to_1 (
          .in([seg_in_vec[a_gv]]),
          .sel(SW[9:7]), .out(mux_out_vec[a_gv]));

      decoder_3bit i_decoder_3bit (
        .sw (mux_out_vec[a_gv]),
        .hex(hex_disp[a_gv]   )
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

  function display_7seg(input char_e char);
    if(char == d) begin
      $display("           *");
      $display("           *");
      $display("           *");
      $display("           *");
      $display("************");
      $display("*          *");
      $display("*          *");
      $display("*          *");
      $display("************");
    end

    if(char == e) begin
      $display("**********  ");
      $display("*           ");
      $display("*           ");
      $display("*           ");
      $display("**********  ");
      $display("*           ");
      $display("*           ");
      $display("*           ");
      $display("**********  ");
    end
    if(char == one) begin
      $display("          * ");
      $display("          * ");
      $display("          * ");
      $display("          * ");
      $display("          * ");
      $display("          * ");
      $display("          * ");
      $display("          * ");
      $display("          * ");
    end
    if(char == two) begin
      $display(" ***********");
      $display("           *");
      $display("           *");
      $display("           *");
      $display(" ***********");
      $display(" *          ");
      $display(" *          ");
      $display(" *          ");
      $display(" ***********");
    end

    if(char == zero) begin
      $display(" ***********");
      $display(" *         *");
      $display(" *         *");
      $display(" *         *");
      $display(" *         *");
      $display(" *         *");
      $display(" *         *");
      $display(" *         *");
      $display(" ***********");
    end

  endfunction
endmodule : task_6

