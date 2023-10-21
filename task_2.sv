module task_2(
  input [9:0]SW,
  output [9:0]LEDR
);
  localparam WIDTH =4;
  
  wire [WIDTH-1:0]X;
  wire [WIDTH-1:0]Y;
  wire [WIDTH-1:0]M;
  wire sel ;
  
  assign X = SW[0+:WIDTH];
  assign Y = SW[4+:WIDTH];
  assign sel=SW[9];
  assign M = LEDR[0+:WIDTH];
  
  //simple implementaion 
  M = sel? Y : X;
 
//   // usong generate loop
  
//   genvar a_gv; 
//   generate
//     for( a_gv = 0 ; a_gv < WIDTH ;a_gv)
//       begin
//         assign M[a_gv] = sel ? Y[a_gv]? X[a_gv];
//       end
//     endgenerate 
  
endmodule