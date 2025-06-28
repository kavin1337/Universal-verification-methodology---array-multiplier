module array_multiplier_4bit (
    input [3:0] A, B,
    output [7:0] P
);
    wire [7:0] pp0, pp1, pp2, pp3;

    assign pp0 = {4'b0000, (A & {4{B[0]}})};       // Shift by 0
    assign pp1 = {3'b000,  (A & {4{B[1]}}), 1'b0}; // Shift by 1
    assign pp2 = {2'b00,   (A & {4{B[2]}}), 2'b00}; // Shift by 2
    assign pp3 = {1'b0,    (A & {4{B[3]}}), 3'b000}; // Shift by 3

    assign P = pp0 + pp1 + pp2 + pp3;
endmodule
