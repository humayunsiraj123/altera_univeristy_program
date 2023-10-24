module task_3#(parameter WIDTH =2)(
  input [9:0]SW,
  output [9:0]LEDR
);
  
  
  wire [WIDTH-1:0]u;
  wire [WIDTH-1:0]v;
  wire [WIDTH-1:0]w;
  wire [WIDTH-1:0]x;
  
  wire [WIDTH-1:0]m;
  wire [WIDTH-1:0]sel ;
  
  assign u = SW[0+:WIDTH];
  assign v = SW[2+:WIDTH];
  assign w = SW[4+:WIDTH];
  assign x = SW[6+:WIDTH];
  assign sel=SW[9-:WIDTH];
  assign LEDR[0+:WIDTH] = m;
  
  //simple implementaion 
  assign m = sel[1] ?(sel[0] ? x : w)  :  (sel[0] ? v : u);

 // case implmentation/
  //always_comb
   // begin
   //   case(sel)
   //     2'b00 ;m = u;
   //     2'b01 ;m = v;
   //     2'b10 ;m = w;
   //     2'b11 ;m = x;   
   //   endcase
   // end
   // using if with priorty  

//always_comb
  //  begin
   //   if(sel == 2'b11)
   //     m = x;
   //   else if(sel == 2'b10)
   //     m = w;
   //   else if(sel == 2'b01)
   //     m = v;
   //   else 
  //      m = u;
  //  end
        
  
endmodule