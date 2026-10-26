module vending_machine(
  input clk,
  input rst,
  input coin5,
  input coin10,
  output reg dispense,
  output reg change);
  
  parameter idle = 2'b00;
  parameter five = 2'b01;
  parameter ten = 2'b10;
  
  reg[1:0] state, next_state;
  //state logic
  always@(posedge clk or posedge rst) begin
    if(rst) 
      state <= idle;
    else
      state <= next_state;
  end
//working
  always@(*) begin
    case(state)
      
      idle:
        if(coin5)
          next_state = five;
        else if(coin10)
          next_state = ten;
        else
          next_state = idle;
      
      five:
          if(coin5)
            next_state = ten;
          else if(coin10)
            next_state = ten;
          else
            next_state = five;
      
      ten:
            next_state = idle;
      
      default: next_state = idle;
      
    endcase
  end
 //output 
    always@(*) begin
      change = 1'b0;
      dispense = (state == ten);
      
  //change
  if ((state == five) && coin10)
    change = 1'b1;
    else
      change = 1'b0;
      end
endmodule
