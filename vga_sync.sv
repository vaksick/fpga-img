//http://tinyvga.com/vga-timing

module vga_sync(
    input           clk,
    output          hsync,
    output          vsync,
    output [9:0]    xpos,
    output [9:0]    ypos,
    output          opix_en
);

    parameter WIDTH     = 800;  //640;
    parameter HEIGHT    = 600;  //480;

    parameter H_FRONT   = 40;   //16;
    parameter H_SYNC    = 128;  //96;
    parameter H_BACK    = 88;   //48;

    parameter V_FRONT   = 1;    //10;
    parameter V_SYNC    = 4;    //2;
    parameter V_BACK    = 23;   //33;

    logic [9:0] h_cnt;// 10'h3FF;
    logic [9:0] v_cnt;// 10'h3FF;

    typedef enum bit[2:0] {init, front, sync, back, active} state_t; 

    state_t hors_state;
    state_t vert_state;
    
    assign opix_en = hors_state == active && vert_state == active;
    assign hsync = hors_state != sync;
    assign vsync = vert_state != sync;
    
    assign xpos = opix_en ? h_cnt : 0;
    assign ypos = opix_en ? v_cnt : 0;

    always @(posedge clk) begin
        h_cnt <= h_cnt + 1;
        case(hors_state)
            init:   begin
                        h_cnt <= 0;
                        v_cnt <= 0;
                        hors_state <= front;
                        vert_state <= front;
                    end
            front:  if(h_cnt == H_FRONT - 1) begin
                        h_cnt <= 0;
                        hors_state <= sync;
                    end
            sync:   if(h_cnt == H_SYNC - 1) begin
                        h_cnt <= 0;
                        case(vert_state)
                            front:  if(v_cnt == V_FRONT) begin
                                        v_cnt <= 0;
                                        vert_state <= sync;
                                    end
                            sync:   if(v_cnt == V_SYNC) begin
                                        v_cnt <= 0;
                                        vert_state <= back;
                                    end
                            back:   if(v_cnt == V_BACK) begin
                                        v_cnt <= 0;
                                        vert_state <= active;
                                    end
                            active: if(v_cnt == HEIGHT) begin
                                        v_cnt <= 0;
                                        vert_state <= front;
                                    end
                            default: vert_state <= front;
                        endcase
                        hors_state <= back;
                    end
            back:   if(h_cnt == H_BACK - 1) begin
                        h_cnt <= 0;
                        hors_state <= active;
                    end
            active: if(h_cnt == WIDTH - 1) begin
                        h_cnt <= 0;
                        v_cnt <= v_cnt + 1;
                        hors_state <= front;
                    end
            default: hors_state <= init;
        endcase
    end

endmodule