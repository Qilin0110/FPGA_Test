`timescale 1ns / 1ps

module testbench_multi4a();

parameter n = 4;

reg [n-1:0] mul_A;
reg [n-1:0] mul_B;
reg [n-1:0] temp[15:0];
//reg [2*n-1:0] out_temp[225:0];
wire [2*n-1:0] result;


integer i;
integer j;
integer fp;	



Appr_mult_4c testmul_multi(
	.a(mul_A),
	.b(mul_B),
	
	.prod(result)
	);


initial begin
fp = $fopen("out_result.txt","w");

$readmemb("C:/FPGAlearing/input4.txt",temp);
for(i = 0;i < 16;i = i+1)
begin
	mul_A = temp[i];
for(j = 0;j < 16;j = j+1)
begin
	mul_B = temp[j];
	#1;
	//$fdisplay(fp,"%b\n",result);
	$fwrite(fp,"%b\n\n",result);
end
end
	$fclose(fp);
end

/*
initial begin
mul_A = 4'b1111;
mul_B = 4'b1111;
end
*/
endmodule	