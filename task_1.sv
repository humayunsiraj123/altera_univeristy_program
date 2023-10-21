// Code your design here
module task_1(
  input [9:0]SW,
  output [9:0]LEDR
);
 assign LEDR = SW;
  
endmodule
  
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


module task_3(
  input [9:0]SW,
  output [9:0]LEDR
);
  localparam WIDTH =2;
  
  wire [WIDTH-1:0]u;
  wire [WIDTH-1:0]v;
  wire [WIDTH-1:0]w;
  wire [WIDTH-1:0]x;
  
  wire [WIDTH-1:0]m;
  wire sel ;
  
  assign u = SW[0+:WIDTH];
  assign v = SW[2+:WIDTH];
  assign w = SW[4+:WIDTH];
  assign x = SW[6+:WIDTH];
  assign sel=SW[9-:WIDTH];
  assign m = SW[0+:WIDTH];
  
  //simple implementaion 
  M = sel[1] ?(sel[0] ? x : w)  :  (sel[0] ? v : u);

 // case implmentation/
  always_comb
    begin
      case(sel)
        2'b00 ;m = u;
        2'b01 ;m = v;
        2'b10 ;m = w;
        2'b11 ;m = x;   
      endcase
    end
    
   always_comb
    begin
      if(sel == 2'b11)
        m = x;
      else if(sel == 2'b10)
         m = w;
      else if(sel == 2'b01)
        2'b10 ;m = v;
      else 
        2'b11 ;m = u;
    end
        
  
endmodule