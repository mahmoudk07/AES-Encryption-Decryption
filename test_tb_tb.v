module test_tb_tb();
reg [127:0] in;
wire [127:0] out;
reg [31:0] rcon;
test_tb tb(
.in(in),
.out(out),
.rcon(rcon)
);

initial begin

in=128'h2B7E151628AED2A6ABF7158809CF4F3C;
rcon=32'h01000000;
#5 $finish;
end

endmodule 