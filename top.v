`define bit_size(x, y)  ($clog2((x+y)/2)-1)
`define bit_cells       `bit_size(C_NUM_OF_CELLS_X, C_NUM_OF_CELLS_Y)
`define bit_rxy         `bit_size(C_CELL_WIDTH, C_CELL_HEIGHT)

module top(
    input   isys_clk,

    output  ovga_hs,
    output  ovga_vs,

    output [5:0] R,
    output [5:0] G,
    output [5:0] B
);

    wire clk;
    wire vga_hs;
    wire vga_vs;
    wire vga_pix_en;
    wire [9:0] vga_x;
    wire [9:0] vga_y;
    wire [7:0] image_col8bit;

    wire [`bit_cells:0] cell_line;
    wire [`bit_cells:0] cell_column;

    clk_wiz inst_clk_wiz(.isys_clk(isys_clk), .oclk(clk));
 
    
    localparam C_CELL_WIDTH     = 4;
    localparam C_CELL_HEIGHT    = 4;
    localparam C_SCREEN_SIZE_H  = 1024;
    localparam C_SCREEN_SIZE_V  = 768;
    localparam C_NUM_OF_CELLS_X = C_SCREEN_SIZE_H / (C_CELL_WIDTH);
    localparam C_NUM_OF_CELLS_Y = C_SCREEN_SIZE_V / (C_CELL_HEIGHT);

    vga_sync #(
        .WIDTH      (C_SCREEN_SIZE_H),
        .HEIGHT     (C_SCREEN_SIZE_V),
        .H_FRONT    (   24),
        .H_SYNC     (  136),
        .H_BACK     (  160),
        .V_FRONT    (    3),
        .V_SYNC     (    6),
        .V_BACK     (   29)
    ) inst_vga(
        .clk        (clk),
        .hsync      (vga_hs),
        .vsync      (vga_vs), 
        .xpos       (vga_x), 
        .ypos       (vga_y), 
        .opix_en    (vga_pix_en)
    );

    cell_math #(
        .C_CELL_WIDTH        (C_CELL_WIDTH),
        .C_CELL_HEIGHT       (C_CELL_HEIGHT),
        .C_NUM_OF_CELLS_X    (C_NUM_OF_CELLS_X),
        .C_NUM_OF_CELLS_Y    (C_NUM_OF_CELLS_Y)
    ) inst_cell_math(
        .ivga_x     (vga_x),
        .ivga_y     (vga_y),
        .line       (cell_line),
        .column     (cell_column)
    );

    image #(
        .WIDTH      (C_NUM_OF_CELLS_X * C_NUM_OF_CELLS_Y)
    ) inst_image(
        .iclk       (clk),
        .iaddr_rd   (cell_line * C_NUM_OF_CELLS_X + cell_column),
        .ird_en     (vga_pix_en),
        .ocol8bit   (image_col8bit)
    );
    
    color_encoder inst_encoder(.col8bit(image_col8bit), .R(R), .G(G), .B(B));
    assign ovga_hs  = vga_hs;
    assign ovga_vs  = vga_vs;
endmodule