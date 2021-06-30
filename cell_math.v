`define bit_size(x, y)  ($clog2((x+y)/2)-1)
`define bit_cells       `bit_size(C_NUM_OF_CELLS_X, C_NUM_OF_CELLS_Y)
`define bit_rxy         `bit_size(C_CELL_WIDTH, C_CELL_HEIGHT)

module cell_math #(
    parameter C_CELL_WIDTH      = 5,
    parameter C_CELL_HEIGHT     = 5,
    parameter C_NUM_OF_CELLS_X  = 5,
    parameter C_NUM_OF_CELLS_Y  = 5
)(
    input [9:0] ivga_x,
    input [9:0] ivga_y,

    output [`bit_cells:0]   line,
    output [`bit_cells:0]   column,
    output [`bit_rxy:0]     rx,
    output [`bit_rxy:0]     ry
);
    
    assign line = ivga_y / C_CELL_HEIGHT;
    assign column = ivga_x / C_CELL_WIDTH;
    
    assign ry = ivga_y % C_CELL_HEIGHT;
    assign rx = ivga_x % C_CELL_WIDTH;
endmodule