library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity reciver is
        port ( rx : in std_logic;
                        clk : in std_logic;
                        data_out : out std_logic_vector (5 downto 0); 
						RX_VALID: out std_logic);
end reciver;

architecture rx of reciver is
signal count : std_logic;
--signal counter : integer range 0 to 4;
--signal counter2 : integer range 0 to 4;
begin

process (clk)
variable state : integer range 0 to 7 := 0;
variable data : std_logic_vector (5 downto 0);
variable rx_p : std_logic;
variable counter : integer range 0 to 4 := 0;
variable counter2 : integer range 0 to 4 := 0;
begin
if (clk'event and clk = '1') then

case (counter2) is
when 0 => counter2:=1;
when 1 => counter2:=2;
when 2 => counter2:=3;
when 3 => counter2:=4;
when 4 => counter2:=0;
end case;


RX_VALID <= '0';
if (rx_p = '1' and rx = '0') then       -- определяем старт
        count <= '1';
        rx_p := rx;
                                                                                           
else rx_p := rx;
end if;



if (count = '1') then
case (counter) is
when 0 => counter:=1;
when 1 => counter:=2;
when 2 => counter:=3;
when 3 => counter:=4;
when 4 => counter:=0;
end case;

end if;


if (counter = 1) then
case (state) is
        when 0 =>
                        if (rx = '0') then      -- проверяем старт-бит
                                state := 1;     
                        else state := 0;
                                count <= '0';                                                   
                        end if;
        when 1 => data(0) := rx;        -- запоминаем бит
                                state := 2;
        when 2 => data(1) := rx;
                                state := 3;
        when 3 => data(2) := rx;
                                state := 4;
        when 4 => data(3) := rx;
                                state := 5;
        when 5 => data(4) := rx;
                                state := 6;
        when 6 => data(5) := rx;
                                state := 7;
        when 7 => state := 0;
                        count <= '0';                                                           
                        if (rx = '1') then              -- проверяем стоп-бит
                                data_out <= data;       -- выводим данные
counter:=4;
								RX_VALID <= '1';
                        end if;
end case;
end if;

end if;
end process;

end architecture;