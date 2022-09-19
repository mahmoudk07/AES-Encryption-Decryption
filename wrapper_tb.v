module wrapper_tb();
reg en;
reg [1:0]mod;
reg reset;
wire led128;
wire led192;
wire led256;
wrapper UUT
(
en,
mod,
reset,
led128,
led192,
led256
);

initial begin
en=0;
#10
mod = 2'b00;
en=1;
if(led128 == 1)
begin
$display("Test passed for 128");
end
#100
en=0;
reset = 1;
mod = 2'b01;
#100
en = 1;
#100
reset = 0;
if(led192 == 1)
begin
$display("Test passed for 192");
end
#100
en=0;
mod = 2'b10;
#100
en=1;
reset = 1;
#100
reset = 0;
if(led256 == 1)
begin
$display("Test passed for 256");
end
#100 $finish;
end
endmodule