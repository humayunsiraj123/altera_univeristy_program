module mux_M_wide_N_to_1#(parameter NUM_SEL = 3 ,WIDTH = 1 )(
  input [2**NUM_SEL-1:0][WIDTH-1:0]in,
  input [NUM_SEL-1:0]sel,
  output  logic  [WIDTH-1:0]out
);
  
  always_comb
  begin
    //out ='0;
    out = in[sel];
  end
       
  
endmodule
