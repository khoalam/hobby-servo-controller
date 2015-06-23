LIBRARY ieee;
	USE ieee.std_logic_1164.ALL;
	USE ieee.numeric_std.ALL;
	USE ieee.math_real.ALL;
	
--Edit this file only for desire resolution and freq

PACKAGE controller_parameter IS

	--Change these value for desire operation parameter
	CONSTANT input_clk: INTEGER := 50000000;		--Input Freq in Hz
	CONSTANT output_resolution: INTEGER := 16;	--Output resolution in bits
	CONSTANT pwm_period: REAL := 0.025;				--PWM period
	
	--Start Calculation section
	CONSTANT temp : REAL := REAL(input_clk)/(1.0/(pwm_period/2**REAL(output_resolution)));
	CONSTANT prescaler_counter_range : INTEGER := INTEGER(FLOOR(LOG2(temp)));
	CONSTANT compare_value : INTEGER := INTEGER(FLOOR(temp));
	--End Calculation section
END PACKAGE;