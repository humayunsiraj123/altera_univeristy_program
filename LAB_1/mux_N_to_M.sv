module mux_N_to_M#(parameter NUM_SEL = 3,WIDTH = 1)(
  input [2**NUM_SEL-1:0]in[WIDTH-1:0],
  input [NUM_SEL-1:0]sel,
  output  logic  [WIDTH-1:0]out
);
  
  always_comb
  begin
    //out ='0;
    out = in[sel];
  end
       
  
endmodule