module clk_wiz(
    input   isys_clk,
    output  oclk
);
    clk_wiz_ip clk_wiz_ip(
        .inclk0(isys_clk),
        .c0(oclk)
    );
endmodule