module gray_code_to_binary_convertor #(parameter N = 4)( 
  input logic clk, rstn, 
  input logic[N-1:0] gray_value,
  output logic[N-1:0] binary_value);
 
  // Add code for gray code to binary conversion
	task gray_to_binary(logic [N-1:0] value);
		begin
			binary_value[N-1]=value[N-1];
			for (int i=N-1; i>0; i=i-1)
				binary_value[i-1]=binary_value[i]^value[i-1];
			end
	endtask
  
  always_ff@(posedge clk or negedge rstn) begin
	if(!rstn) begin
		binary_value<=0;
	end
	else begin
		gray_to_binary(gray_value);
	end
end
  
endmodule: gray_code_to_binary_convertor
