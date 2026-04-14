module cpu(
    input clk,
    input reset,
    output reg [7:0] out_port
);

    reg [7:0] pc;
    reg [7:0] acc;      
    reg [7:0] ir;       
    reg state;          

    reg [7:0] ram [0:255];
    
    initial begin
        $readmemh("program.mem", ram);
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pc <= 8'h00;
            acc <= 8'h00;
            out_port <= 8'h00;
            state <= 0;
        end else begin
            case (state)
                0: begin // FETCH
                    ir <= ram[pc];
                    pc <= pc + 1;
                    state <= 1;
                end

                1: begin // EXECUTE
                    case (ir[7:4]) 
                        4'h1: acc <= ram[ir[3:0]];       // LOAD from the storage
                        4'h2: acc <= acc + ram[ir[3:0]];  // ADD 
                        4'h3: out_port <= acc;            // OUT 
                        4'h4: pc <= pc;                   // HALT 
                        4'h5: ram[ir[3:0]] <= acc;        // STORE the value to the storage
                        4'h7: pc <= ir[3:0];
                    endcase
                    state <= 0; 
                end
            endcase
        end
    end
endmodule
