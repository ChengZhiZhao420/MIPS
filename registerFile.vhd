--ChengZhi Zhao
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity registerFile is
	port(readR1 , readR2, writeR :in std_logic_vector(4 downto 0);
	writeData :in std_logic_vector(31 downto 0);
	RegWrite, clk :in std_logic;
	ReadData1, ReadData2 :out std_logic_vector(31 downto 0));
end registerFile;

architecture behavior of registerFile is
type registerMemory is array(0 to 25) of std_logic_vector(31 downto 0);
signal registerArray : registerMemory :=(
		x"00000000", --$zero
		x"FF122111", --$at
		x"ABC22222", --$v0
		x"333BC333", --$v1
		x"4DC24444", --$a0
		x"34255355", --$a1
		x"60000006", --$a2
		x"00000007", --$a3
		x"80008888", --$t0
		x"99000099", --$t1
		x"aa0000a2", --$t2
		x"00bbbbbb", --$t3
		x"0000cccc", --$t4
		x"2333dddd", --$t5
		x"533444ee", --$t6
		x"f23f522f", --$t7
		x"00444000", --$s0
		x"11511111", --$s1
		x"22312222", --$s2
		x"34522333", --$s3
		x"44534352", --$s4
		x"ABDF2555", --$s5
		x"66641686", --$s6
		x"7FFFFFF7", --$s7
		x"88231288", --$t8
		x"9512312F" --$t9
	);
begin
	process(clk)
	begin
		if(RegWrite = '1') then
			registerArray(to_integer(unsigned(writeR))) <= writeData;
		end if;
		
		if(rising_edge(clk)) then
			readData1 <= registerArray(to_integer(unsigned(readR1)));
			readData2 <= registerArray(to_integer(unsigned(readR2)));
		end if;
	end process;
end behavior;