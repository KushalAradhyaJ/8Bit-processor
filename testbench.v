`include "cpu.v"

module testbench;
    reg clk;
    reg reset;
    wire [7:0] out_port;
  
    cpu uut (
        .clk(clk),
        .reset(reset),
        .out_port(out_port)
    );
    always #5 clk = ~clk;//clk pulse

    initial begin
        clk = 0;
        reset = 1;
        #20 reset = 0; // Release reset after 2 cycles
        
        // Let it run for 200ns
        #200 $finish;
    end

    initial begin
    $dumpfile("cpu_sim.vcd");
    $dumpvars(0, testbench); 
    
    // Instead of uut.ram, we point to specific addresses:
    $dumpvars(0, uut.ram[5]);
    $dumpvars(0, uut.ram[6]); 
    $dumpvars(0, uut.ram[7]); 
end

    initial begin
        $monitor("Time: %0t | out_port: %h", $time, out_port);
end
endmodule
