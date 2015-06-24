LIBRARY ieee;
	USE ieee.std_logic_1164.ALL;
	USE ieee.numeric_std.ALL;
	USE work.controller_parameter.ALL;
	
ENTITY input_shift_reg IS
	PORT(
		data_clk :  IN  STD_LOGIC;
		data_latch :  IN  STD_LOGIC;
		shift_data :  IN  STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
		data_out0 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0):=(OTHERS=>'0');
		data_out1 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0):=(OTHERS=>'0');
		data_out2 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0):=(OTHERS=>'0');
		data_out3 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0):=(OTHERS=>'0');
		data_out4 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0):=(OTHERS=>'0');
		data_out5 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0):=(OTHERS=>'0');
		data_out6 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0):=(OTHERS=>'0');
		data_out7 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0):=(OTHERS=>'0');
		data_out8 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0):=(OTHERS=>'0');
		data_out9 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0):=(OTHERS=>'0');
		data_out10 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0):=(OTHERS=>'0');
		data_out11 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0):=(OTHERS=>'0');
		data_out12 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0):=(OTHERS=>'0');
		data_out13 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0):=(OTHERS=>'0');
		data_out14 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0):=(OTHERS=>'0');
		data_out15 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0):=(OTHERS=>'0');
		data_out16 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0):=(OTHERS=>'0');
		data_out17 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0):=(OTHERS=>'0')
	);
END ENTITY;

ARCHITECTURE behavior of input_shift_reg IS
	SIGNAL internal_register : STD_LOGIC_VECTOR (((output_resolution*18)-1) DOWNTO 0) := (OTHERS=>'0');
BEGIN
	shift_reg: PROCESS(data_clk)
	BEGIN
		IF(RISING_EDGE(data_clk)) THEN
			--IF(data_latch = '0') THEN
				internal_register <= internal_register((internal_register'LEFT-output_resolution) DOWNTO 0) & shift_data;
			--ELSIF(data_latch = '1') THEN
--				data_out17 <= internal_register(internal_register'LEFT-output_resolution*0 DOWNTO internal_register'LEFT-output_resolution*0-(output_resolution-1));
--				data_out16 <= internal_register(internal_register'LEFT-output_resolution*1 DOWNTO internal_register'LEFT-output_resolution*1-(output_resolution-1));
--				data_out15 <= internal_register(internal_register'LEFT-output_resolution*2 DOWNTO internal_register'LEFT-output_resolution*2-(output_resolution-1));
--				data_out14 <= internal_register(internal_register'LEFT-output_resolution*3 DOWNTO internal_register'LEFT-output_resolution*3-(output_resolution-1));
--				data_out13 <= internal_register(internal_register'LEFT-output_resolution*4 DOWNTO internal_register'LEFT-output_resolution*4-(output_resolution-1));
--				data_out12 <= internal_register(internal_register'LEFT-output_resolution*5 DOWNTO internal_register'LEFT-output_resolution*5-(output_resolution-1));
--				data_out11 <= internal_register(internal_register'LEFT-output_resolution*6 DOWNTO internal_register'LEFT-output_resolution*6-(output_resolution-1));
--				data_out10 <= internal_register(internal_register'LEFT-output_resolution*7 DOWNTO internal_register'LEFT-output_resolution*7-(output_resolution-1));
--				data_out9 <= internal_register(internal_register'LEFT-output_resolution*8 DOWNTO internal_register'LEFT-output_resolution*8-(output_resolution-1));
--				data_out8 <= internal_register(internal_register'LEFT-output_resolution*9 DOWNTO internal_register'LEFT-output_resolution*9-(output_resolution-1));
--				data_out7 <= internal_register(internal_register'LEFT-output_resolution*10 DOWNTO internal_register'LEFT-output_resolution*10-(output_resolution-1));
--				data_out6 <= internal_register(internal_register'LEFT-output_resolution*11 DOWNTO internal_register'LEFT-output_resolution*11-(output_resolution-1));
--				data_out5 <= internal_register(internal_register'LEFT-output_resolution*12 DOWNTO internal_register'LEFT-output_resolution*12-(output_resolution-1));
--				data_out4 <= internal_register(internal_register'LEFT-output_resolution*13 DOWNTO internal_register'LEFT-output_resolution*13-(output_resolution-1));
--				data_out3 <= internal_register(internal_register'LEFT-output_resolution*14 DOWNTO internal_register'LEFT-output_resolution*14-(output_resolution-1));
--				data_out2 <= internal_register(internal_register'LEFT-output_resolution*15 DOWNTO internal_register'LEFT-output_resolution*15-(output_resolution-1));
--				data_out1 <= internal_register(internal_register'LEFT-output_resolution*16 DOWNTO internal_register'LEFT-output_resolution*16-(output_resolution-1));
--				data_out0 <= internal_register(internal_register'LEFT-output_resolution*17 DOWNTO internal_register'LEFT-output_resolution*17-(output_resolution-1));
			--END IF;
		END IF;
	END PROCESS;
	latching: PROCESS(data_latch)
	BEGIN
		IF(RISING_EDGE(data_latch)) THEN
			data_out17 <= internal_register(internal_register'LEFT-output_resolution*0 DOWNTO internal_register'LEFT-output_resolution*0-(output_resolution-1));
			data_out16 <= internal_register(internal_register'LEFT-output_resolution*1 DOWNTO internal_register'LEFT-output_resolution*1-(output_resolution-1));
			data_out15 <= internal_register(internal_register'LEFT-output_resolution*2 DOWNTO internal_register'LEFT-output_resolution*2-(output_resolution-1));
			data_out14 <= internal_register(internal_register'LEFT-output_resolution*3 DOWNTO internal_register'LEFT-output_resolution*3-(output_resolution-1));
			data_out13 <= internal_register(internal_register'LEFT-output_resolution*4 DOWNTO internal_register'LEFT-output_resolution*4-(output_resolution-1));
			data_out12 <= internal_register(internal_register'LEFT-output_resolution*5 DOWNTO internal_register'LEFT-output_resolution*5-(output_resolution-1));
			data_out11 <= internal_register(internal_register'LEFT-output_resolution*6 DOWNTO internal_register'LEFT-output_resolution*6-(output_resolution-1));
			data_out10 <= internal_register(internal_register'LEFT-output_resolution*7 DOWNTO internal_register'LEFT-output_resolution*7-(output_resolution-1));
			data_out9 <= internal_register(internal_register'LEFT-output_resolution*8 DOWNTO internal_register'LEFT-output_resolution*8-(output_resolution-1));
			data_out8 <= internal_register(internal_register'LEFT-output_resolution*9 DOWNTO internal_register'LEFT-output_resolution*9-(output_resolution-1));
			data_out7 <= internal_register(internal_register'LEFT-output_resolution*10 DOWNTO internal_register'LEFT-output_resolution*10-(output_resolution-1));
			data_out6 <= internal_register(internal_register'LEFT-output_resolution*11 DOWNTO internal_register'LEFT-output_resolution*11-(output_resolution-1));
			data_out5 <= internal_register(internal_register'LEFT-output_resolution*12 DOWNTO internal_register'LEFT-output_resolution*12-(output_resolution-1));
			data_out4 <= internal_register(internal_register'LEFT-output_resolution*13 DOWNTO internal_register'LEFT-output_resolution*13-(output_resolution-1));
			data_out3 <= internal_register(internal_register'LEFT-output_resolution*14 DOWNTO internal_register'LEFT-output_resolution*14-(output_resolution-1));
			data_out2 <= internal_register(internal_register'LEFT-output_resolution*15 DOWNTO internal_register'LEFT-output_resolution*15-(output_resolution-1));
			data_out1 <= internal_register(internal_register'LEFT-output_resolution*16 DOWNTO internal_register'LEFT-output_resolution*16-(output_resolution-1));
			data_out0 <= internal_register(internal_register'LEFT-output_resolution*17 DOWNTO internal_register'LEFT-output_resolution*17-(output_resolution-1));
		END IF;
	END PROCESS;
END ARCHITECTURE;