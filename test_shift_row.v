module test_shift_row
(
input [127:0]in,
input [255:0] key,
output [127:0]out

);
wire [127:0] out2;
wire [127:0] out3;
wire [127:0] out4;


encryption_layer256 a3
(
.key(key[255:0]),
.in(in),
.out(out2)
);
decryption_layer256 d3
(
.in(out2),
.key(key[255:0]),
.out(out)
);








endmodule 