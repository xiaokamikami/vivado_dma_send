`timescale 1ns / 1ps

module AXI_Write(
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
    (* mark_debug = "true" *)reg [5:0] packge_count;
    (* mark_debug = "true" *)reg [5:0] packge_datalen;
    reg [4:0] state;
    reg [511:0] reg_m_axis_c2h_tdata;
 //   reg [63:0]    reg_m_axis_c2h_tkeep_0;
    reg                  reg_m_axis_c2h_tvalid;
    reg                  reg_m_axis_c2h_tlast;
    reg                  reg_data_next;

    //DEBUG
    assign sstate =state;
    assign datalen_wire= packge_datalen;
    ////////////
    assign data_next=reg_data_next;
    assign m_axis_c2h_tdata=reg_m_axis_c2h_tdata;
    assign m_axis_c2h_tvalid=reg_m_axis_c2h_tvalid;
    assign m_axis_c2h_tkeep=64'hffffffff_ffffffff;
    assign m_axis_c2h_tlast=reg_m_axis_c2h_tlast;

    always @(posedge m_axis_c2h_aclk or negedge m_axis_c2h_aresetn  ) begin
        if(! m_axis_c2h_aresetn || en) begin
            state<=0;
            reg_m_axis_c2h_tvalid<=0;
            reg_data_next<=0;
        end else  begin
            case(state) 
            0 : begin
                if(data_valid) begin
                    mix_data<=data;
                    state<=1;
                    packge_count <= 0;
                    packge_datalen <= 0;
                end else begin
                    state<=0;
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
                    if( packge_count =='d3 && packge_datalen == 'b10011) begin
                        reg_m_axis_c2h_tlast<=1;
                        state<=2;
                    end else if(packge_count =='d3 && packge_datalen == 'b10100) begin //last xmda packge
                        state<=4;
                        reg_m_axis_c2h_tlast<=0;
                        reg_data_next<=1;
                        reg_m_axis_c2h_tvalid<=0;                    
                    end
                    else if(packge_count !='d3 && packge_datalen =='b10100) begin // once packge 
                        state<=3;
                        reg_data_next<=1;
                        reg_m_axis_c2h_tvalid<=0;
                        packge_count <= packge_count + 1'b1;
                    end else begin
                        state<=2;
                    end
                    packge_datalen <= packge_datalen + 1'b1;
                end
            else begin
                state<=2;
            end   
           end
           3: begin //wait next packge
                if(data_valid) begin
                    reg_m_axis_c2h_tvalid <= 1;
                    reg_m_axis_c2h_tdata <= data[511:0];
                    mix_data <= data >> 512;
                    state <= 2;
                    packge_datalen <= 0;
                    reg_data_next <= 0;
                end else begin
                    state<=3;
                end
           end
           4: begin
              reg_m_axis_c2h_tvalid<=0;
              reg_m_axis_c2h_tlast<=0;
              state<=0;
           end
           default :;
          endcase
        end
    end  
endmodule