module mult_control(
input clk,reset_a,start,
input [1:0]count,
output 	reg done,clk_ena,sclr_n,
output 	reg[1:0]input_sel,shift_sel,
output	reg [2:0]state_out
);

localparam [2:0]Idle=3'b000;
localparam [2:0]LSB=3'b001;
localparam [2:0]MID=3'b010;
localparam [2:0]MSB=3'b011;
localparam [2:0]ICALC=3'b100;
localparam [2:0]EER=3'b101;

reg [2:0]Q_reg,Q_next;
always@(posedge clk or negedge reset_a)
begin
if(!reset_a)
Q_reg<=Idle;
else
Q_reg<=Q_next;
end

always@(*)
begin
		done=1'b0;
		clk_ena=1'b0;
		sclr_n=1'b0;
		input_sel=2'b00;
		shift_sel=2'b00;
		state_out=3'b000;
	case(Q_reg)
	Idle:
	begin
	state_out=Idle;
		if(start==1'b1)
		begin
		Q_next=LSB;
		done=1'b0;
		clk_ena=1'b1;
		sclr_n=1'b0;
		end
		else 
		begin
		Q_next=Idle;
		done=1'b0;
		clk_ena=1'b0;
		sclr_n=1'b1;
		end 
	end
	LSB:
	begin
	state_out=LSB;
		if(start==1'b0&&count==2'b00)
		begin
		Q_next=MID;
		done=1'b0;
		clk_ena=1'b1;
		sclr_n=1'b1;
		input_sel=2'b00;
		shift_sel=2'b00;
		end
		else 
		begin
		Q_next=EER;
		done=1'b0;
		clk_ena=1'b0;
		sclr_n=1'b1;
		end
	end
 
	MID:
	begin
	state_out=MID;
		if(start==1'b0&&count==2'b01)
		begin
		Q_next=MID;
		done=1'b0;
		clk_ena=1'b1;
		sclr_n=1'b1;
		input_sel=2'b01;
		shift_sel=2'b01;
		end
		else if(start==1'b0&&count==2'b10)
		begin
		Q_next=MSB;
		done=1'b0;
		clk_ena=1'b1;
		sclr_n=1'b1;
		input_sel=2'b10;
		shift_sel=2'b01;
		end
		else
		begin
		Q_next=EER;
		done=1'b0;
		clk_ena=1'b0;
		sclr_n=1'b1;		
		end
	end 
 
	MSB:
	begin
	state_out=MSB;
		if(start==1'b0&&count==2'b11)
		begin
		Q_next=ICALC;
		input_sel=2'b11;
		shift_sel=2'b10;
		done=1'b0;
		clk_ena=1'b1;
		sclr_n=1'b1;
		end
		else 
		begin
		Q_next=EER;
		done=1'b0;
		clk_ena=1'b0;
		sclr_n=1'b1;
		end 
	end 
	ICALC:
	begin
	state_out=ICALC;
		if(start==1'b0)
		begin
		Q_next=Idle;
		done=1'b1;
		clk_ena=1'b0;
		sclr_n=1'b1;
		end
		else 
		begin
		Q_next=EER;
		done=1'b0;
		clk_ena=1'b0;
		sclr_n=1'b1;
		end 
	end  
	EER:
	begin
	state_out=EER;
		if(start==1'b0)
		begin
		Q_next=EER;
		done=1'b0;
		clk_ena=1'b0;
		sclr_n=1'b1;
		end
		else 
		begin
		Q_next=LSB;
		done=1'b0;
		clk_ena=1'b1;
		sclr_n=1'b0;
		end
	end  
	default:
	begin
		state_out=Idle;
		Q_next=Q_reg;
	end  
	endcase
end
endmodule