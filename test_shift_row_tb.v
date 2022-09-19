module test_shift_row_tb;
reg [127:0] in;
reg [255:0] key;
wire [127:0] out;
test_shift_row uut
(
.in(in),
.out(out),
.key(key)
);
initial 
begin 
key=256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
in=128'h 00112233445566778899aabbccddeeff;
#5 $finish;

end


endmodule 