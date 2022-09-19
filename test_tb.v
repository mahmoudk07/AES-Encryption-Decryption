module test_tb(
input [127:0] in,
output [127:0] out,
input [31:0] rcon
);
key_expansion key(.key_in(in),.rcon(rcon),.key_out(out));

endmodule 