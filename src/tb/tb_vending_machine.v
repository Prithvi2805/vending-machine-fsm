module tb_vending_machine;
  
  reg clk;
  reg rst;
  reg coin5;
  reg coin10;
  wire dispense;
  wire change;
  
vending_machine v1(.clk(clk),
                   .rst(rst),
                   .coin5(coin5),
                   .coin10(coin10),
                   .dispense(dispense),
                   .change(change)
                  );
  
  always #5 clk = ~clk;
    
  initial begin
    $monitor("time = %0d | coin5 = %b | coin10 = %b | dispense = %b | change = %b", $time, coin5, coin10, dispense, change);

    clk = 0;
    rst = 0;
    coin5 = 0;
    coin10 = 0;
    
    #10 rst = 1;
    #5
    rst = 0;
    
    //test 1 exact value 5+5
    #10 coin5 = 1;
    #10 coin5 = 0;
    
    #10 coin5 = 1;
    #10 coin5 = 0;
    
    //test 2 ten rs coin
    #10 coin10 = 1;
    #10 coin10 = 0;
    
    //test 3 overpaid
    #10 coin5 = 1;
    #10 coin5 = 0;
    
    #10 coin10 = 1;
    #10 coin10 = 0;
    
    #20 $finish;
  end
endmodule
