LIBRARY ieee;
	USE ieee.std_logic_1164.ALL;
	USE ieee.numeric_std.ALL;
	USE work.controller_parameter.ALL;
	
ENTITY pwm_prescaler IS
	PORT(
		prescaler_clkin : IN STD_LOGIC;
		prescaler_clkout : OUT STD_LOGIC
	);
END ENTITY;

ARCHITECTURE behavior OF pwm_prescaler IS
	
BEGIN
	PROCESS(prescaler_clkin)
		VARIABLE counter : UNSIGNED (prescaler_counter_range DOWNTO 0) := (OTHERS => '0');
	BEGIN
	IF(RISING_EDGE(prescaler_clkin)) THEN
		IF(counter < TO_UNSIGNED(compare_value/2,counter'LENGTH)) THEN
			prescaler_clkout <= '1';
		ELSE
			prescaler_clkout <= '0';			
		END IF;
		counter := counter + UNSIGNED'("1");
		IF(counter = TO_UNSIGNED(compare_value,counter'LENGTH)) THEN
				counter := (OTHERS => '0');
		END IF;
	END IF;
	END PROCESS;
END ARCHITECTURE;