module image #(
    parameter WIDTH = 640*480
) (
    input               iclk,
    input  [15:0]       iaddr_rd,
    input               ird_en,
    output [7:0]        ocol8bit
);
    reg [7:0] ram[0:WIDTH-1];
    reg [7:0] pix;

    always @(posedge iclk) begin
        pix <= ram[iaddr_rd];
    end
    
    assign ocol8bit = ird_en ? pix : 0;

initial
    $readmemh("image.hex", ram);

endmodule