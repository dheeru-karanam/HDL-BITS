module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output reg start_shifting);
    parameter A=3'd0, B=3'd1, C=3'd2, D=3'd3, E=3'd4;
    reg[2:0] state, next_state;
    always @(*)begin
        case(state)
            A : begin next_state = data==0?A:B; start_shifting = 0; end
            B : begin next_state = data==0?A:C; start_shifting = 0; end
            C : begin next_state = data==0?D:C; start_shifting = 0; end
            D : begin next_state = data==0?A:E; start_shifting = 0; end
            E : begin next_state = E; start_shifting = 1; end
        endcase
    end
    always @(posedge clk)begin
        if(reset)begin
            state <= A;
        end
        else begin
            state <= next_state;
        end
    end
endmodule
