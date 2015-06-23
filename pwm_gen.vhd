LIBRARY ieee;
	USE ieee.std_logic_1164.ALL;
	USE ieee.numeric_std.ALL;
	USE work.controller_parameter.ALL;
	
ENTITY pwm_gen IS
	PORT(
		pwm_clk : IN STD_LOGIC;
		pwm_duty : IN STD_LOGIC_VECTOR((output_resolution-1) DOWNTO 0);
		pwm_ena : IN STD_LOGIC;
		pwm_out : OUT STD_LOGIC
		);
END ENTITY;

ARCHITECTURE behavior OF pwm_gen IS
BEGIN
	PROCESS(pwm_ena,pwm_clk)
		VARIABLE counter : UNSIGNED ((output_resolution-1) DOWNTO 0) := (OTHERS => '0');
	BEGIN
		IF(pwm_ena = '1') THEN
			IF(RISING_EDGE(pwm_clk)) THEN
				IF(counter <= UNSIGNED(pwm_duty)) THEN
					pwm_out <= '1';
				ELSE
					pwm_out <= '0';
				END IF;
				counter := counter + UNSIGNED'("1");
			END IF;
		ELSE
			pwm_out <= 'Z';
			counter := (OTHERS => '0');
		END IF;
	END PROCESS;
END ARCHITECTURE;