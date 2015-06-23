LIBRARY ieee;
	USE ieee.std_logic_1164.ALL;
	USE ieee.numeric_std.ALL;
	USE work.controller_parameter.ALL;

ENTITY servo_controller IS 
	PORT
	(
		pwm_ena :  IN  STD_LOGIC;
		data_clk :  IN  STD_LOGIC;
		data_latch :  IN  STD_LOGIC;
		pwm_clk :  IN  STD_LOGIC;
		shift_data :  IN  STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
		P0 :  OUT  STD_LOGIC;
		P1 :  OUT  STD_LOGIC;
		P2 :  OUT  STD_LOGIC;
		P3 :  OUT  STD_LOGIC;
		P4 :  OUT  STD_LOGIC;
		P5 :  OUT  STD_LOGIC;
		P6 :  OUT  STD_LOGIC;
		P7 :  OUT  STD_LOGIC;
		P8 :  OUT  STD_LOGIC;
		P9 :  OUT  STD_LOGIC;
		P10 :  OUT  STD_LOGIC;
		P11 :  OUT  STD_LOGIC;
		P12 :  OUT  STD_LOGIC;
		P13 :  OUT  STD_LOGIC;
		P14 :  OUT  STD_LOGIC;
		P15 :  OUT  STD_LOGIC;
		P16 :  OUT  STD_LOGIC;
		P17 :  OUT  STD_LOGIC
	);
END ENTITY;

ARCHITECTURE structure OF servo_controller IS 

COMPONENT pwm_gen
	PORT(pwm_clk : IN STD_LOGIC;
		 pwm_ena : IN STD_LOGIC;
		 pwm_duty : IN STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
		 pwm_out : OUT STD_LOGIC
	);
END COMPONENT;



COMPONENT pwm_prescaler
	PORT(prescaler_clkin : IN STD_LOGIC;
		 prescaler_clkout : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT input_shift_reg IS
	PORT(
		data_clk :  IN  STD_LOGIC;
		data_latch :  IN  STD_LOGIC;
		shift_data :  IN  STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
		data_out0 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
		data_out1 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
		data_out2 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
		data_out3 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
		data_out4 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
		data_out5 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
		data_out6 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
		data_out7 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
		data_out8 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
		data_out9 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
		data_out10 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
		data_out11 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
		data_out12 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
		data_out13 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
		data_out14 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
		data_out15 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
		data_out16 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
		data_out17 : OUT STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0)
	);
END COMPONENT;

SIGNAL internal_clk : STD_LOGIC;
SIGNAL data_out0 : STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
SIGNAL data_out1 : STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
SIGNAL data_out2 : STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
SIGNAL data_out3 : STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
SIGNAL data_out4 : STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
SIGNAL data_out5 : STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
SIGNAL data_out6 : STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
SIGNAL data_out7 : STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
SIGNAL data_out8 : STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
SIGNAL data_out9 : STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
SIGNAL data_out10 : STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
SIGNAL data_out11 : STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
SIGNAL data_out12 : STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
SIGNAL data_out13 : STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
SIGNAL data_out14 : STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
SIGNAL data_out15 : STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
SIGNAL data_out16 : STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);
SIGNAL data_out17 : STD_LOGIC_VECTOR(output_resolution-1 DOWNTO 0);

BEGIN 

	prescaler : pwm_prescaler PORT MAP(
		prescaler_clkin => pwm_clk,
		prescaler_clkout => internal_clk
	);
	
	input: input_shift_reg PORT MAP(data_clk, data_latch, shift_data, data_out0, data_out1, data_out2, data_out3, data_out4, data_out5, data_out6, data_out7, data_out8, data_out9, data_out10, data_out11, data_out12, data_out13, data_out14, data_out15, data_out16, data_out17);
	
	pwm0: pwm_gen PORT MAP(
		pwm_clk => internal_clk,
		pwm_ena => pwm_ena,
		pwm_duty => data_out0,
		pwm_out => P0
	);
	pwm1: pwm_gen PORT MAP(
		pwm_clk => internal_clk,
		pwm_ena => pwm_ena,
		pwm_duty => data_out1,
		pwm_out => P1
	);
	pwm2: pwm_gen PORT MAP(
		pwm_clk => internal_clk,
		pwm_ena => pwm_ena,
		pwm_duty => data_out2,
		pwm_out => P2
	);
	pwm3: pwm_gen PORT MAP(
		pwm_clk => internal_clk,
		pwm_ena => pwm_ena,
		pwm_duty => data_out3,
		pwm_out => P3
	);
	pwm4: pwm_gen PORT MAP(
		pwm_clk => internal_clk,
		pwm_ena => pwm_ena,
		pwm_duty => data_out4,
		pwm_out => P4
	);
	pwm5: pwm_gen PORT MAP(
		pwm_clk => internal_clk,
		pwm_ena => pwm_ena,
		pwm_duty => data_out5,
		pwm_out => P5
	);
	pwm6: pwm_gen PORT MAP(
		pwm_clk => internal_clk,
		pwm_ena => pwm_ena,
		pwm_duty => data_out6,
		pwm_out => P6
	);
	pwm7: pwm_gen PORT MAP(
		pwm_clk => internal_clk,
		pwm_ena => pwm_ena,
		pwm_duty => data_out7,
		pwm_out => P7
	);
	pwm8: pwm_gen PORT MAP(
		pwm_clk => internal_clk,
		pwm_ena => pwm_ena,
		pwm_duty => data_out8,
		pwm_out => P8
	);
	pwm9: pwm_gen PORT MAP(
		pwm_clk => internal_clk,
		pwm_ena => pwm_ena,
		pwm_duty => data_out9,
		pwm_out => P9
	);
	pwm10: pwm_gen PORT MAP(
		pwm_clk => internal_clk,
		pwm_ena => pwm_ena,
		pwm_duty => data_out10,
		pwm_out => P10
	);
	pwm11: pwm_gen PORT MAP(
		pwm_clk => internal_clk,
		pwm_ena => pwm_ena,
		pwm_duty => data_out11,
		pwm_out => P11
	);
	pwm12: pwm_gen PORT MAP(
		pwm_clk => internal_clk,
		pwm_ena => pwm_ena,
		pwm_duty => data_out12,
		pwm_out => P12
	);
	pwm13: pwm_gen PORT MAP(
		pwm_clk => internal_clk,
		pwm_ena => pwm_ena,
		pwm_duty => data_out13,
		pwm_out => P13
	);
	pwm14: pwm_gen PORT MAP(
		pwm_clk => internal_clk,
		pwm_ena => pwm_ena,
		pwm_duty => data_out14,
		pwm_out => P14
	);
	pwm15: pwm_gen PORT MAP(
		pwm_clk => internal_clk,
		pwm_ena => pwm_ena,
		pwm_duty => data_out15,
		pwm_out => P15
	);
	pwm16: pwm_gen PORT MAP(
		pwm_clk => internal_clk,
		pwm_ena => pwm_ena,
		pwm_duty => data_out16,
		pwm_out => P16
	);
	pwm17: pwm_gen PORT MAP(
		pwm_clk => internal_clk,
		pwm_ena => pwm_ena,
		pwm_duty => data_out17,
		pwm_out => P17
	);

END ARCHITECTURE;