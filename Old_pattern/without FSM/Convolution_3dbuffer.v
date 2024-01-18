
module Convolution(
    //input
    clk,
    rst_n,
    in_valid,
    weight_valid,
    In_IFM_1,
    In_IFM_2,
    In_IFM_3,
    In_IFM_4,
    In_IFM_5,
    In_IFM_6,
    In_IFM_7,
    In_IFM_8,
    In_IFM_9,
    In_IFM_10,
    In_IFM_11,
    In_IFM_12,
    In_IFM_13,
    In_IFM_14,
    In_IFM_15,
    In_IFM_16,
    In_IFM_17,
    In_IFM_18,
    In_IFM_19,
    In_IFM_20,
    In_IFM_21,
    In_IFM_22,
    In_IFM_23,
    In_IFM_24,
    In_IFM_25,
    In_IFM_26,
    In_IFM_27,
    In_IFM_28,
    In_IFM_29,
    In_IFM_30,
    In_IFM_31,
    In_IFM_32,

    In_Weight_1,
    In_Weight_2,
    In_Weight_3,
    In_Weight_4,
    In_Weight_5,
    In_Weight_6,
    In_Weight_7,
    In_Weight_8,
    In_Weight_9,
    In_Weight_10,
    In_Weight_11,
    In_Weight_12,
    In_Weight_13,
    In_Weight_14,
    In_Weight_15,
    In_Weight_16,
    In_Weight_17,
    In_Weight_18,
    In_Weight_19,
    In_Weight_20,
    In_Weight_21,
    In_Weight_22,
    In_Weight_23,
    In_Weight_24,
    In_Weight_25,
    In_Weight_26,
    In_Weight_27,
    In_Weight_28,
    In_Weight_29,
    In_Weight_30,
    In_Weight_31,
    In_Weight_32,

    //output
    out_valid, 
    Out_OFM
);

input clk, rst_n, in_valid, weight_valid;
input [3:0]In_IFM_1;
input [3:0]In_IFM_2;
input [3:0]In_IFM_3;
input [3:0]In_IFM_4;
input [3:0]In_IFM_5;
input [3:0]In_IFM_6;
input [3:0]In_IFM_7;
input [3:0]In_IFM_8;
input [3:0]In_IFM_9;
input [3:0]In_IFM_10;
input [3:0]In_IFM_11;
input [3:0]In_IFM_12;
input [3:0]In_IFM_13;
input [3:0]In_IFM_14;
input [3:0]In_IFM_15;
input [3:0]In_IFM_16;
input [3:0]In_IFM_17;
input [3:0]In_IFM_18;
input [3:0]In_IFM_19;
input [3:0]In_IFM_20;
input [3:0]In_IFM_21;
input [3:0]In_IFM_22;
input [3:0]In_IFM_23;
input [3:0]In_IFM_24;
input [3:0]In_IFM_25;
input [3:0]In_IFM_26;
input [3:0]In_IFM_27;
input [3:0]In_IFM_28;
input [3:0]In_IFM_29;
input [3:0]In_IFM_30;
input [3:0]In_IFM_31;
input [3:0]In_IFM_32;

input [3:0]In_Weight_1;
input [3:0]In_Weight_2;
input [3:0]In_Weight_3;
input [3:0]In_Weight_4;
input [3:0]In_Weight_5;
input [3:0]In_Weight_6;
input [3:0]In_Weight_7;
input [3:0]In_Weight_8;
input [3:0]In_Weight_9;
input [3:0]In_Weight_10;
input [3:0]In_Weight_11;
input [3:0]In_Weight_12;
input [3:0]In_Weight_13;
input [3:0]In_Weight_14;
input [3:0]In_Weight_15;
input [3:0]In_Weight_16;
input [3:0]In_Weight_17;
input [3:0]In_Weight_18;
input [3:0]In_Weight_19;
input [3:0]In_Weight_20;
input [3:0]In_Weight_21;
input [3:0]In_Weight_22;
input [3:0]In_Weight_23;
input [3:0]In_Weight_24;
input [3:0]In_Weight_25;
input [3:0]In_Weight_26;
input [3:0]In_Weight_27;
input [3:0]In_Weight_28;
input [3:0]In_Weight_29;
input [3:0]In_Weight_30;
input [3:0]In_Weight_31;
input [3:0]In_Weight_32;

output reg out_valid;
output reg [12:0] Out_OFM;

reg [3:0] IFM[0:1][0:3][0:3];
reg [3:0] Weight[0:1][0:3][0:3];

// reg [7:0] count_out;
reg current_state;
wire next_state;

integer i,j,k;

// state condition
assign next_state = (in_valid) ? 1:0;

always@(posedge clk or negedge rst_n) begin
	if(!rst_n)
		current_state <= 0;
	else
		current_state <= next_state;
end

always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
    for(i=0;i<2;i=i+1) begin
      for(j=0;j<4;j=j+1) begin
        for(k=0; k<4; k=k+1) begin
          Weight[i][j][k] <=0;
        end
      end
    end
    end

    else if(weight_valid) begin
        Weight[0][0][0] <= In_Weight_1;
        Weight[0][0][1] <= In_Weight_2;
        Weight[0][0][2] <= In_Weight_3;
        Weight[0][0][3] <= In_Weight_4;
        Weight[0][1][0] <= In_Weight_5;
        Weight[0][1][1] <= In_Weight_6;
        Weight[0][1][2] <= In_Weight_7;
        Weight[0][1][3] <= In_Weight_8;
        Weight[0][2][0] <= In_Weight_9;
        Weight[0][2][1] <= In_Weight_10;
        Weight[0][2][2] <= In_Weight_11;
        Weight[0][2][3] <= In_Weight_12;
        Weight[0][3][0] <= In_Weight_13;
        Weight[0][3][1] <= In_Weight_14;
        Weight[0][3][2] <= In_Weight_15;
        Weight[0][3][3] <= In_Weight_16;
        Weight[1][0][0] <= In_Weight_17;
        Weight[1][0][1] <= In_Weight_18;
        Weight[1][0][2] <= In_Weight_19;
        Weight[1][0][3] <= In_Weight_20;
        Weight[1][1][0] <= In_Weight_21;
        Weight[1][1][1] <= In_Weight_22;
        Weight[1][1][2] <= In_Weight_23;
        Weight[1][1][3] <= In_Weight_24;
        Weight[1][2][0] <= In_Weight_25;
        Weight[1][2][1] <= In_Weight_26;
        Weight[1][2][2] <= In_Weight_27;
        Weight[1][2][3] <= In_Weight_28;
        Weight[1][3][0] <= In_Weight_29;
        Weight[1][3][1] <= In_Weight_30;
        Weight[1][3][2] <= In_Weight_31;
        Weight[1][3][3] <= In_Weight_32;
    end
end


always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
    for(i=0;i<2;i=i+1) begin
      for(j=0;j<4;j=j+1) begin
        for(k=0; k<4; k=k+1) begin
          IFM[i][j][k] <=0;
        end
      end
    end
    end

    else if(in_valid) begin
        IFM[0][0][0] <= In_IFM_1;
        IFM[0][0][1] <= In_IFM_2;
        IFM[0][0][2] <= In_IFM_3;
        IFM[0][0][3] <= In_IFM_4;
        IFM[0][1][0] <= In_IFM_5;
        IFM[0][1][1] <= In_IFM_6;
        IFM[0][1][2] <= In_IFM_7;
        IFM[0][1][3] <= In_IFM_8;
        IFM[0][2][0] <= In_IFM_9;
        IFM[0][2][1] <= In_IFM_10;
        IFM[0][2][2] <= In_IFM_11;
        IFM[0][2][3] <= In_IFM_12;
        IFM[0][3][0] <= In_IFM_13;
        IFM[0][3][1] <= In_IFM_14;
        IFM[0][3][2] <= In_IFM_15;
        IFM[0][3][3] <= In_IFM_16;
        IFM[1][0][0] <= In_IFM_17;
        IFM[1][0][1] <= In_IFM_18;
        IFM[1][0][2] <= In_IFM_19;
        IFM[1][0][3] <= In_IFM_20;
        IFM[1][1][0] <= In_IFM_21;
        IFM[1][1][1] <= In_IFM_22;
        IFM[1][1][2] <= In_IFM_23;
        IFM[1][1][3] <= In_IFM_24;
        IFM[1][2][0] <= In_IFM_25;
        IFM[1][2][1] <= In_IFM_26;
        IFM[1][2][2] <= In_IFM_27;
        IFM[1][2][3] <= In_IFM_28;
        IFM[1][3][0] <= In_IFM_29;
        IFM[1][3][1] <= In_IFM_30;
        IFM[1][3][2] <= In_IFM_31;
        IFM[1][3][3] <= In_IFM_32;
    end
end

always@(posedge clk or negedge rst_n) begin
    if(!rst_n)
        out_valid <= 0;
    else if(current_state)
        out_valid <= 1;
    else
        out_valid <= 0;
end



always@(posedge clk or negedge rst_n) begin
    if(!rst_n)
        Out_OFM <= 0;
    else if(current_state) begin
       Out_OFM <= IFM[0][0][0]*Weight[0][0][0]
        +IFM[0][0][1]*Weight[0][0][1]
        +IFM[0][0][2]*Weight[0][0][2]
        +IFM[0][0][3]*Weight[0][0][3]
        +IFM[0][1][0]*Weight[0][1][0]
        +IFM[0][1][1]*Weight[0][1][1]
        +IFM[0][1][2]*Weight[0][1][2]
        +IFM[0][1][3]*Weight[0][1][3]
        +IFM[0][2][0]*Weight[0][2][0]
        +IFM[0][2][1]*Weight[0][2][1]
        +IFM[0][2][2]*Weight[0][2][2]
        +IFM[0][2][3]*Weight[0][2][3]
        +IFM[0][3][0]*Weight[0][3][0]
        +IFM[0][3][1]*Weight[0][3][1]
        +IFM[0][3][2]*Weight[0][3][2]
        +IFM[0][3][3]*Weight[0][3][3]
        +IFM[1][0][0]*Weight[1][0][0]
        +IFM[1][0][1]*Weight[1][0][1]
        +IFM[1][0][2]*Weight[1][0][2]
        +IFM[1][0][3]*Weight[1][0][3]
        +IFM[1][1][0]*Weight[1][1][0]
        +IFM[1][1][1]*Weight[1][1][1]
        +IFM[1][1][2]*Weight[1][1][2]
        +IFM[1][1][3]*Weight[1][1][3]
        +IFM[1][2][0]*Weight[1][2][0]
        +IFM[1][2][1]*Weight[1][2][1]
        +IFM[1][2][2]*Weight[1][2][2]
        +IFM[1][2][3]*Weight[1][2][3]
        +IFM[1][3][0]*Weight[1][3][0]
        +IFM[1][3][1]*Weight[1][3][1]
        +IFM[1][3][2]*Weight[1][3][2]
        +IFM[1][3][3]*Weight[1][3][2];
	end
    else
        Out_OFM <= 0;
end

endmodule