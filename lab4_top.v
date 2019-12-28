//define these 5 state numbers 
`define Seven 7'b1111000
`define Three 7'b0110000
`define Two   7'b0100100
`define Five  7'b0010010
`define Eight 7'b0000000
module lab4_top(SW,KEY,HEX0);
   //all the inputs
  input [9:0] SW;
  input [3:0] KEY;
  output [6:0] HEX0;
  wire clk;
  reg [6:0]present_state;
  //let clk be key[0] in this case
  assign clk=KEY[0];
  //the output hex0 is just the state
  assign HEX0=present_state;
  
  always @(posedge clk)begin
     //if it's reset, then set to 7
     if(KEY[1]==0)
	    present_state=7'b1111000;
     else 
	   case(present_state)
	     `Seven:   if(SW[0]==1)
		           present_state=`Three;//if sw0 is 1 then go forward to 3
				   else
				   present_state=`Eight;//if not go backward to 8
				 
	     `Three:   if(SW[0]==1)
		           present_state=`Two;//if sw0 is 1 then go forward to 2
				  else
				   present_state=`Seven;//if not then go backward to 7
				 
	     `Two:     if(SW[0]==1)
		           present_state=`Five;//if sw0 is 1 then go forward to 5
				 else
				   present_state=`Three;//if not then go backward to 3
				 
	     `Five:    if(SW[0]==1)
		           present_state=`Eight;//if sw0 is 1 then go forward to 8
				 else
				   present_state=`Two;//if not then go backward to 2
				 
		 `Eight:   if(SW[0]==1)
		           present_state=`Seven;//if sw0 is 1 then go forward to 7
				 else
				   present_state=`Five;//if not then go backward to 5
				 
	      default: present_state=7'bxxxxxxx;//set default

	   endcase
	end
 
endmodule



