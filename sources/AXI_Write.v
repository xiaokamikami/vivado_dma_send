`timescale 1ns / 1ps

module AXI_Write(
  input        core_clk,
  input        m_axis_c2h_aclk,                        //axi
  input        m_axis_c2h_aresetn,                     //axi
  
  input  en,

  output  [511:0]         m_axis_c2h_tdata,
  output  [63:0]              m_axis_c2h_tkeep,
  output                      m_axis_c2h_tlast,
  input                       m_axis_c2h_tready,
  output                      m_axis_c2h_tvalid,

  input data_valid,
  output data_next,
  output [4:0]   sstate,
  output [5:0] datalen_wire,
  input  [4071:0] data
);

    reg [4071:0] mix_data;
    reg [5:0] datalen;
   // reg [7:0] data_num;
    reg [4:0] state;
    reg [511:0]  reg_m_axis_c2h_tdata;
 //   reg [63:0]    reg_m_axis_c2h_tkeep_0;
    reg                  reg_m_axis_c2h_tvalid;
    reg                  reg_m_axis_c2h_tlast;
    reg                  reg_data_next;

    assign data_next=reg_data_next;
    assign  sstate =state;
    assign m_axis_c2h_tdata=reg_m_axis_c2h_tdata;
    assign m_axis_c2h_tvalid=reg_m_axis_c2h_tvalid;
    assign m_axis_c2h_tkeep=64'hffffffff_ffffffff;
    assign m_axis_c2h_tlast=reg_m_axis_c2h_tlast;
    //assign data_num_wire =data_num;
    assign  datalen_wire= datalen;
    wire [3:0]core_50M_count = 'd3;
    wire [3:0]core_10M_count = 'd7;
    (* mark_debug = "true" *) reg [3:0]core_en_last_count;
    wire core_data_sampling_en = core_en_last_count == core_50M_count;
    always @(posedge m_axis_c2h_aclk) begin
        if (data_valid) begin
            core_en_last_count <= core_en_last_count + 'b1;
        end else begin
            core_en_last_count <= 'b0;
        end
    end
    
    always @(posedge m_axis_c2h_aclk or negedge m_axis_c2h_aresetn  ) begin
        if(! m_axis_c2h_aresetn || en) begin
            mix_data<=0;
            state<=0;
            reg_m_axis_c2h_tvalid<=0;
            reg_m_axis_c2h_tlast<=0;
            datalen<=0;
            reg_data_next<=0;
        end else  begin
            case(state) 
            0 : begin
                if(core_data_sampling_en) begin
                    mix_data<=data;
                    state<=1;
                    datalen <= 0;
                    reg_data_next <= 0;
                end else begin
                    state<=0;
                    datalen <= 0;
                end
            end
           1:begin
                reg_m_axis_c2h_tvalid<=1;
                reg_m_axis_c2h_tdata<=mix_data[511:0];
                mix_data<=mix_data>>512;
                state<=2;     
           end 
           2:begin
            if(m_axis_c2h_tready && reg_m_axis_c2h_tvalid) begin
                    reg_m_axis_c2h_tdata<=mix_data[511:0];
                    mix_data<=mix_data>>512;
                    if( datalen=='b10010) begin
                        reg_m_axis_c2h_tlast<=1;
                        state<=2;
                    end else if(datalen=='b10011) begin
                        state<=3;
                        reg_m_axis_c2h_tlast<=0;
                        reg_data_next<=1;
                        reg_m_axis_c2h_tvalid<=0;
                    end else begin
                        state<=2;
                    end
                    datalen<=datalen+1'b1;
                end
                 else begin
                state<=2;
                end   
           end
           3: begin
              reg_m_axis_c2h_tvalid<=0;
              reg_m_axis_c2h_tlast<=0;
              state<=0;
           end
          endcase
        end
    end  
endmodule