`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT Madras	
// Engineer: Nalla Lokesh
// 
// Create Date:    11:14:49 11/25/2020 
// Design Name: 
// Module Name:    BlankingForNSC 
// Project Name: Dual-output converter based UPQC
// Target Devices: Cmod - S6
// Tool versions: ISE Design Suite 14.7
// Description: This code is wriiten for creating dead time of 1us for 12 pulses. The target device used is CMOD-S6: XC6SLX4-2CPG196
//
// Dependencies: 
//
// Revision: 0.01
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module BlankingForNSC( Sau,Sam,Sal, Sbu,Sbm,Sbl, Scu,Scm,Scl, Sfu,Sfm,Sfl, clk, 
                       Sauo,Samo,Salo, Sbuo,Sbmo,Sblo, Scuo,Scmo,Sclo, Sfuo,Sfmo,Sflo );

// ~~~~~~~~~~~~~  Terminal Declarations  ~~~~~~~~~~~~~~~~~~~~
input Sau,Sam,Sal, Sbu,Sbm,Sbl, Scu,Scm,Scl, Sfu,Sfm,Sfl, clk;
output reg Sauo,Samo,Salo, Sbuo,Sbmo,Sblo, Scuo,Scmo,Sclo, Sfuo,Sfmo,Sflo;

// ~~~~~~~~~~~~~  Variables declarations  ~~~~~~~~~~~~~~~~~~~~
integer iau = 0, iam = 0, ial =0;
integer ibu = 0, ibm = 0, ibl =0;
integer icu = 0, icm = 0, icl =0;
integer ifu = 0, ifm = 0, ifl =0;

// ~~~~~~~~~~~~~~~~~~  Functional Body ~~~~~~~~~~~~~~~~~~~~~~~

always @(posedge clk)    // clock period is decided by the external FPGA board.

	begin
// ~~~~~~~~~~~~~~~~~~~~~~~~~~    Converter Leg A ~~~~~~~~~~~~~~~~~~~~~~~~~
// ===========================================================================

// ~~~~~~~~~~~~~~~~~~~~~~~~~~    Upper Switch    ~~~~~~~~~~~~~~~~~~~~~~~~~

// 8 represents number of clock pulses times or 8 times the clock period.
// Clock speed of CMOD S6 is 8 MHz. So its period is 0.125 micro seconds.
// To achieve 1 micro second dead time number of clock pulses it takes is 8 since 8*0.125 = 1 us. 
// Therefore all iabcfu, iabcfm and iabcfl are compared with 8. This if-else loop runs once for every clock period.


		if(Sau)
			begin
				if(iau >= 8)         
					Sauo = Sau;        
				else
					begin
						Sauo = 0;
						iau = iau + 1;
					end
			end
		else
			begin
				Sauo = Sau;
				iau = 0;
			end
			
// ~~~~~~~~~~~~~~~~~~~~~~~~~~    Middle Switch    ~~~~~~~~~~~~~~~~~~~~~~~~~

		if(Sam)
			begin
				if(iam >= 8)
					Samo = Sam;
				else
					begin
						Samo = 0;
						iam = iam + 1;
					end
			end
		else
			begin
				Samo = Sam;
				iam = 0;
			end

// ~~~~~~~~~~~~~~~~~~~~~~~~~~    Lower Switch    ~~~~~~~~~~~~~~~~~~~~~~~~~

		if(Sal)
			begin
				if(ial >= 8)
					Salo = Sal;
				else
					begin
						Salo = 0;
						ial = ial + 1;
					end
			end
		else
			begin
				Salo = Sal;
				ial = 0;
			end			
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~    Converter Leg B ~~~~~~~~~~~~~~~~~~~~~~~~~
// ~~~~~~~~~~~~~~~~~~~~~~~~~~    Upper Switch    ~~~~~~~~~~~~~~~~~~~~~~~~~

		if(Sbu)
			begin
				if(ibu >= 8)
					Sbuo = Sbu;
				else
					begin
						Sbuo = 0;
						ibu = ibu + 1;
					end
			end
		else
			begin
				Sbuo = Sbu;
				ibu = 0;
			end
			
// ~~~~~~~~~~~~~~~~~~~~~~~~~~    Middle Switch    ~~~~~~~~~~~~~~~~~~~~~~~~~

		if(Sbm)
			begin
				if(ibm >= 8)
					Sbmo = Sbm;
				else
					begin
						Sbmo = 0;
						ibm = ibm + 1;
					end
			end
		else
			begin
				Sbmo = Sbm;
				ibm = 0;
			end

// ~~~~~~~~~~~~~~~~~~~~~~~~~~    Lower Switch    ~~~~~~~~~~~~~~~~~~~~~~~~~

		if(Sbl)
			begin
				if(ibl >= 8)
					Sblo = Sbl;
				else
					begin
						Sblo = 0;
						ibl = ibl + 1;
					end
			end
		else
			begin
				Sblo = Sbl;
				ibl = 0;
			end			

// ~~~~~~~~~~~~~~~~~~~~~~~~~~    Converter Leg C ~~~~~~~~~~~~~~~~~~~~~~~~~
// ~~~~~~~~~~~~~~~~~~~~~~~~~~    Upper Switch    ~~~~~~~~~~~~~~~~~~~~~~~~~

		if(Scu)
			begin
				if(icu >= 8)
					Scuo = Scu;
				else
					begin
						Scuo = 0;
						icu = icu + 1;
					end
			end
		else
			begin
				Scuo = Scu;
				icu = 0;
			end
			
// ~~~~~~~~~~~~~~~~~~~~~~~~~~    Middle Switch    ~~~~~~~~~~~~~~~~~~~~~~~~~

		if(Scm)
			begin
				if(icm >= 8)
					Scmo = Scm;
				else
					begin
						Scmo = 0;
						icm = icm + 1;
					end
			end
		else
			begin
				Scmo = Scm;
				icm = 0;
			end

// ~~~~~~~~~~~~~~~~~~~~~~~~~~    Lower Switch    ~~~~~~~~~~~~~~~~~~~~~~~~~

		if(Scl)
			begin
				if(icl >= 8)
					Sclo = Scl;
				else
					begin
						Sclo = 0;
						icl = icl + 1;
					end
			end
		else
			begin
				Sclo = Scl;
				icl = 0;
			end			

// ~~~~~~~~~~~~~~~~~~~~~~~~~~    Converter Leg F ~~~~~~~~~~~~~~~~~~~~~~~~~
// ~~~~~~~~~~~~~~~~~~~~~~~~~~    Upper Switch    ~~~~~~~~~~~~~~~~~~~~~~~~~

		if(Sfu)
			begin
				if(ifu >= 8)
					Sfuo = Sfu;
				else
					begin
						Sfuo = 0;
						ifu = ifu + 1;
					end
			end
		else
			begin
				Sfuo = Sfu;
				ifu = 0;
			end
			
// ~~~~~~~~~~~~~~~~~~~~~~~~~~    Middle Switch    ~~~~~~~~~~~~~~~~~~~~~~~~~

		if(Sfm)
			begin
				if(ifm >= 8)
					Sfmo = Sfm;
				else
					begin
						Sfmo = 0;
						ifm = ifm + 1;
					end
			end
		else
			begin
				Sfmo = Sfm;
				ifm = 0;
			end

// ~~~~~~~~~~~~~~~~~~~~~~~~~~    Lower Switch    ~~~~~~~~~~~~~~~~~~~~~~~~~

		if(Sfl)
			begin
				if(ifl >= 8)
					Sflo = Sfl;
				else
					begin
						Sflo = 0;
						ifl = ifl + 1;
					end
			end
		else
			begin
				Sflo = Sfl;
				ifl = 0;
			end			

						
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~   End   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	end
	
endmodule
