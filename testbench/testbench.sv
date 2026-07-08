module testbench();
  
  //inputs and outputs
  reg[3:0] bcd;
  wire[3:0] excess3;
  
  //dut
  
  bcd_to_excess3 dut(
    .a(bcd[3]),
    .b(bcd[2]),
    .c(bcd[1]),
    .d(bcd[0]),
    .w(excess3[3]),
    .x(excess3[2]),
    .y(excess3[1]),
    .z(excess3[0])
  );
  
  
  //clock and reset values
  reg clk;
  reg rst;
  
  //initial values
  initial begin
    clk=0;
    rst=1;
    #20
    rst=0;
  end
  
  //clock gen
  always begin
    #10 clk=~clk;
  end
  
  
  
  //test seq
  
  reg[3:0] i;
  
  always@(posedge clk, posedge rst) begin
    if(rst) begin
      bcd=0;
      i=0;
    end else begin
      //apply all bcd values
      bcd=i;

      
      if(i==9) begin
        #10
        $finish;
      end
      else begin
        i=i+1;
      end
      
    end
  end
  initial begin
    $monitor("%d: BCD =%b, Excess-3 =%b", $time, bcd, excess3);
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);
  end
endmodule
      
  
    
  
  
  
