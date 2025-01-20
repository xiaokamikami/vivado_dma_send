
module ClockGate (
  input  wire TE,
  input  wire E,
  input  wire CK,
  output wire Q
);

  assign Q = CK;

endmodule
