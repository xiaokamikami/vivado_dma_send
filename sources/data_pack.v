`timescale 1ns / 1ps

module data_pack(
    input        m_axis_c2h_aclk,                        //axi
    input        m_axis_c2h_aresetn, 
    input out_enable,
    input data_next,
    input en,
    input [4063:0] out_io_data,
    output   [4071:0] data,
    output   [799:0] outdata1,
    output   [799:0] outdata2,
    output data_valid,
    output  [7:0] data_num_wire,
    output  Hbreak
    );
    
    reg reg_data_valid;
    reg isbreak=0;
    reg isnext;
    reg [4071:0] reg_data;
    reg [7:0] data_num=0;
    assign data_valid=reg_data_valid;
    assign data_num_wire=data_num;
    assign data=reg_data;
    assign outdata1=out_io_data[799:0];
    assign outdata2=reg_data[3999:3200];
    assign Hbreak=(isbreak+out_enable)==2?1:0;

    reg last_enable;
  
    always @(posedge m_axis_c2h_aclk or negedge m_axis_c2h_aresetn  ) begin
      if(!m_axis_c2h_aresetn) begin
        isbreak<=1;
        reg_data<=0;
        isnext<=1;
        reg_data_valid<=0;
        last_enable <= 0;
      end else if(en) begin
        data_num<= 0;
        isbreak<=1;
        reg_data<=0;
        isnext<=1;
        reg_data_valid<=0;
        last_enable <= 0;
      end else begin
            if(isnext) begin
               if(!last_enable &&  out_enable) begin
                 reg_data_valid<=1;
                 reg_data<={out_io_data, data_num};
                 isnext<=0;
                end
                last_enable <= out_enable;
                isbreak<=1;
            end else if(data_next) begin
                isbreak<=0;
                data_num<=data_num+1;
                isnext<=1;
                last_enable <= 0;
            end else  begin
              reg_data_valid<=0;
              isbreak<=1;
            end
      end
  end
endmodule
