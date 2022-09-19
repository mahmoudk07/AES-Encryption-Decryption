module wrapper 
(
input en,
input [1:0]mod,
input reset,
output reg led128,
output reg led192,
output reg led256
);
reg [127:0] in = 128'h00112233445566778899aabbccffeeff;
reg [127:0] key128 = 128'h000102030405060708090a0b0c0d0e0f;
reg [191:0] key192 =192'h000102030405060708090a0b0c0d0e0f1011121314151617;
reg [255:0] key256 = 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f; 
reg [127:0] key128dec = 128'h000102030405060708090a0b0c0d0e0f;
reg [191:0] key192dec =192'h000102030405060708090a0b0c0d0e0f1011121314151617;
reg [255:0] key256dec = 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;   
wire [127:0] en128out;
wire [127:0] en192out;
wire [127:0] en256out;
wire [127:0] dec128out;
wire [127:0] dec192out;
wire [127:0] dec256out;
encryption_layer128 el128(

.key(key128),
.in(in),
.out(en128out)
);

decryption_layer128 dl128(
.in(en128out),
.key(key128dec),
.out(dec128out)
);

encryption_layer192 el192(
.in(in),
.key(key192),
.out(en192out)
);

decryption_layer192 dl192(
.in(en192out),
.key(key192dec),
.out(dec192out)
);

encryption_layer256 el256(
.in(in),
.key(key256),
.out(en256out)
);

decryption_layer256 dl256(
.in(en256out),
.key(key256dec),
.out(dec256out)
);
always @(en or reset)
	begin
if(reset||!en)
begin
 led128=1'b0;
 led192=1'b0;
 led256=1'b0;
end
else
begin	
if(en)
begin
	if(mod==2'b00)
	begin
		if(dec128out == in)
			begin
			led128=1'b1;
			led192=1'b0;
			led256=1'b0;
			
			end
	end
	else if (mod==2'b01)
	begin
			if(dec192out == in)
			begin
			led128=1'b0;
			led192=1'b1;
			led256=1'b0;
			end
	end
	else if (mod==2'b10)
	begin 
			if(dec256out == in)
			begin
			led128=1'b0;
			led192=1'b0;
			led256=1'b1;
	      end
	end
	else 
	begin 
   led128=1'b0;
	led192=1'b0;
	led256=1'b0;
	
	end
end
end
	end
	


endmodule
