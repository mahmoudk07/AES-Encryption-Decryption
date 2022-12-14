module inv_mix_columns(
input [127:0]in,
output [127:0]out
);



assign out[127:120] = mul14(in[127:120])^mul11(in[119:112])^mul13(in[111:104])^mul9(in[103:96]);
assign out[95:88] =  mul14(in[95:88])^mul11(in[87:80])^mul13(in[79:72])^mul9(in[71:64]);
assign out[63:56] =  mul14(in[63:56])^mul11(in[55:48])^mul13(in[47:40])^mul9(in[39:32]);
assign out[31:24] =  mul14(in[31:24])^mul11(in[23:16])^mul13(in[15:8])^mul9(in[7:0]);

assign out[119:112] = mul9(in[127:120])^mul14(in[119:112])^mul11(in[111:104])^mul13(in[103:96]);
assign out[87:80] = mul9(in[95:88])^mul14(in[87:80])^mul11(in[79:72])^mul13(in[71:64]);
assign out[55:48] = mul9(in[63:56])^mul14(in[55:48])^mul11(in[47:40])^mul13(in[39:32]);
assign out[23:16] = mul9(in[31:24])^mul14(in[23:16])^mul11(in[15:8])^mul13(in[7:0]);

assign out[111:104] = mul13(in[127:120])^mul9(in[119:112])^mul14(in[111:104])^mul11(in[103:96]);
assign out[79:72] = mul13(in[95:88])^mul9(in[87:80])^mul14(in[79:72])^mul11(in[71:64]);
assign out[47:40] = mul13(in[63:56])^mul9(in[55:48])^mul14(in[47:40])^mul11(in[39:32]);
assign out[15:8] =mul13(in[31:24])^mul9(in[23:16])^mul14(in[15:8])^mul11(in[7:0]);

assign out[103:96] = mul11(in[127:120])^mul13(in[119:112])^mul9(in[111:104])^mul14(in[103:96]);
assign out[71:64] = mul11(in[95:88])^mul13(in[87:80])^mul9(in[79:72])^mul14(in[71:64]);
assign out[39:32] = mul11(in[63:56])^mul13(in[55:48])^mul9(in[47:40])^mul14(in[39:32]);
assign out[7:0] = mul11(in[31:24])^mul13(in[23:16])^mul9(in[15:8])^mul14(in[7:0]);


function [7:0]mul2;
input [7:0]i;
begin
if(i[7]==0)
mul2 = {i[6:0],1'b0};
else
mul2 = {i[6:0],1'b0}^8'h1b;
end
endfunction


function [7:0]mul4;
input [7:0]i;
reg var1;
reg [7:0] var2;
begin
var1=i[6];
if(i[7]==0)
var2 = {i[5:0],2'b00};
else
var2 = {i[5:0],2'b00}^8'h36;
if(var1==1)
mul4=var2^8'h1b;
else
mul4=var2;
end
endfunction


function [7:0]mul8;
input [7:0]i;
reg var1,var2;
reg [7:0] var3;
begin
var1=i[6];
var2=i[5];

if(i[7]==0)
var3 = {i[4:0],3'b000};
else
var3 = {i[4:0],3'b000}^8'h6c;

if(var1==1)
var3=var3^8'h36;
else
var3=var3;

if(var2==1)
mul8=var3^8'h1b;
else
mul8=var3;

end
endfunction

function [7:0]mul9;
input [7:0]j;
reg [7:0] var1;
begin
var1=mul8(j);
var1=var1^j[7:0];
mul9=var1;
end
endfunction

function [7:0]mul11;
input [7:0]j;
reg [7:0] var1,var2,var3;
begin
var1=mul8(j);
var2=mul2(j);
var3=var1^var2^j[7:0];
mul11=var3;
end
endfunction

function [7:0]mul13;
input [7:0]j;
reg [7:0] var1,var2,var3;
begin
var1=mul8(j);
var2=mul4(j);
var3=var1^var2^j[7:0];
mul13=var3;
end
endfunction



function [7:0]mul14;
input [7:0]j;
reg [7:0] var1,var2,var3,var4;
begin
var1=mul8(j);
var2=mul4(j);
var3=mul2(j);
var4=var1^var2^var3;
mul14=var4;
end
endfunction







endmodule 