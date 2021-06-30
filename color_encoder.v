module color_encoder(
    input [7:0] col8bit,
    output [5:0] R,
    output [5:0] G,
    output [5:0] B
);

    assign R = {col8bit[7:5],3'b111};
    assign G = {col8bit[4:2],3'b111};
    assign B = {col8bit[1:0],3'b1111};

endmodule