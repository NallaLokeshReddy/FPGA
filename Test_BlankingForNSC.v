`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: IIT Madras
// Engineer: Nalla Lokesh
//
// Create Date:   12:50:34 11/25/2020
// Design Name:   BlankingForNSC
// Module Name:   E:/Lokesh/Hardware/FPGA/ISE experiments/Verilog_or_VHDL/Test_BlankingForNSC.v
// Project Name:  Verilog_or_VHDL
// Target Device:  Cmod - S6
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BlankingForNSC
//
// Dependencies:
// 
// Revision: 0.01
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_BlankingForNSC;

	// Inputs
	reg Sau;
	reg Sam;
	reg Sal;
	reg Sbu;
	reg Sbm;
	reg Sbl;
	reg Scu;
	reg Scm;
	reg Scl;
	reg Sfu;
	reg Sfm;
	reg Sfl;
	reg clk;

	// Outputs
	wire Sauo;
	wire Samo;
	wire Salo;
	wire Sbuo;
	wire Sbmo;
	wire Sblo;
	wire Scuo;
	wire Scmo;
	wire Sclo;
	wire Sfuo;
	wire Sfmo;
	wire Sflo;

	// Instantiate the Unit Under Test (UUT)
	BlankingForNSC uut (
		.Sau(Sau), 
		.Sam(Sam), 
		.Sal(Sal), 
		.Sbu(Sbu), 
		.Sbm(Sbm), 
		.Sbl(Sbl), 
		.Scu(Scu), 
		.Scm(Scm), 
		.Scl(Scl), 
		.Sfu(Sfu), 
		.Sfm(Sfm), 
		.Sfl(Sfl), 
		.clk(clk), 
		.Sauo(Sauo), 
		.Samo(Samo), 
		.Salo(Salo), 
		.Sbuo(Sbuo), 
		.Sbmo(Sbmo), 
		.Sblo(Sblo), 
		.Scuo(Scuo), 
		.Scmo(Scmo), 
		.Sclo(Sclo), 
		.Sfuo(Sfuo), 
		.Sfmo(Sfmo), 
		.Sflo(Sflo)
	);

	initial begin
		// Initialize Inputs
		
		clk = 1;
		
			Sau = 0; Sam = 1; Sal = 1;
			Sbu = 1; Sbm = 1; Sbl = 0;
			Scu = 1; Scm = 0; Scl = 1;
			Sfu = 0; Sfm = 1; Sfl = 0;

#50000	// After 50,000 ns 
			Sau = 1; Sam = 0; Sal = 0;
			Sbu = 0; Sbm = 0; Sbl = 1;
			Scu = 0; Scm = 1; Scl = 0;
			Sfu = 1; Sfm = 0; Sfl = 1;

#50000 	Sau = 0; Sam = 1; Sal = 1;
			Sbu = 1; Sbm = 1; Sbl = 0;
			Scu = 1; Scm = 0; Scl = 1;
			Sfu = 0; Sfm = 1; Sfl = 0;
			
#50000 	Sau = 1; Sam = 0; Sal = 0;
			Sbu = 0; Sbm = 0; Sbl = 1;
			Scu = 0; Scm = 1; Scl = 0;
			Sfu = 1; Sfm = 0; Sfl = 1;
			
#50000;

$finish;

		end
      
		always #10 clk = ~ clk;    // For every 10 ns, slope of pulse rising edge changes
		// It means clock pulse time period is 20 ns.
		
      
endmodule

