module tb;
    reg clk;
    integer i;

    always #10 clk = ~clk;

    datapath uut (.clk(clk));

    initial begin
        for (i = 0; i < 32; i = i+1) begin
            uut.uDataMemory.dataMemory[i] = 32'b0;
        end
        for (i = 0; i < 32; i = i+1) begin
            uut.uVeda.RegData[i] = 32'b0;
        end
        clk = 0;
    end

    initial begin  
        #1800;
        $monitor("%0d, %0d , %0d,%0d , %0d\n", uut.uVeda.RegData[16], uut.uVeda.RegData[17],uut.uVeda.RegData[18],uut.uVeda.RegData[19],uut.uVeda.RegData[20]);
        #10;
        $finish;
    end

endmodule