module bcd_to_excess3(a,b,c,d,w,x,y,z);
  input a,b,c,d;
  output w,x,y,z;
  assign z=~d;
  assign y=(c&d)|(~(c+d));
  assign x=(~b&c)|(~b&d)|(b&~c&~d);
  assign w=a|(b&c)|(b&d);
endmodule
