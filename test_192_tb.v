module test_192_tb();
reg [191:0] in;
wire [191:0] out;
reg [31:0] rcon;

test_192 t1(
.in(in),
.rcon(rcon),
.out(out)
);
initial begin 

in=192'h8E73B0F7DA0E6452C810F32B809079E562F8EAD2522C6B7B;
rcon=32'h01000000;
#5 $finish;
end 
endmodule  