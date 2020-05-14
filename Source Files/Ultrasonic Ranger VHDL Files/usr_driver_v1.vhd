----------------------------------------------------------------------------
-- VHDL driver for Grove ultrasonic ranger
-- EE315 group B
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity usr_driver_v1 is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface distmm
		C_distmm_DATA_WIDTH	: integer	:= 32;
		C_distmm_ADDR_WIDTH	: integer	:= 4;

		-- Parameters of Axi Slave Bus Interface refresh_freq
		C_refresh_freq_DATA_WIDTH	: integer	:= 32;
		C_refresh_freq_ADDR_WIDTH	: integer	:= 4
	);
	port (
		-- Users to add ports here
		clk : in std_logic;
		sig_in : in std_logic;
		sig_out : out std_logic;
		sig_tx_enable : out std_logic;
		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface distmm
		distmm_aclk	: in std_logic;
		distmm_aresetn	: in std_logic;
		distmm_awaddr	: in std_logic_vector(C_distmm_ADDR_WIDTH-1 downto 0);
		distmm_awprot	: in std_logic_vector(2 downto 0);
		distmm_awvalid	: in std_logic;
		distmm_awready	: out std_logic;
		distmm_wdata	: in std_logic_vector(C_distmm_DATA_WIDTH-1 downto 0);
		distmm_wstrb	: in std_logic_vector((C_distmm_DATA_WIDTH/8)-1 downto 0);
		distmm_wvalid	: in std_logic;
		distmm_wready	: out std_logic;
		distmm_bresp	: out std_logic_vector(1 downto 0);
		distmm_bvalid	: out std_logic;
		distmm_bready	: in std_logic;
		distmm_araddr	: in std_logic_vector(C_distmm_ADDR_WIDTH-1 downto 0);
		distmm_arprot	: in std_logic_vector(2 downto 0);
		distmm_arvalid	: in std_logic;
		distmm_arready	: out std_logic;
		distmm_rdata	: out std_logic_vector(C_distmm_DATA_WIDTH-1 downto 0);
		distmm_rresp	: out std_logic_vector(1 downto 0);
		distmm_rvalid	: out std_logic;
		distmm_rready	: in std_logic;

		-- Ports of Axi Slave Bus Interface refresh_freq
		refresh_freq_aclk	: in std_logic;
		refresh_freq_aresetn	: in std_logic;
		refresh_freq_awaddr	: in std_logic_vector(C_refresh_freq_ADDR_WIDTH-1 downto 0);
		refresh_freq_awprot	: in std_logic_vector(2 downto 0);
		refresh_freq_awvalid	: in std_logic;
		refresh_freq_awready	: out std_logic;
		refresh_freq_wdata	: in std_logic_vector(C_refresh_freq_DATA_WIDTH-1 downto 0);
		refresh_freq_wstrb	: in std_logic_vector((C_refresh_freq_DATA_WIDTH/8)-1 downto 0);
		refresh_freq_wvalid	: in std_logic;
		refresh_freq_wready	: out std_logic;
		refresh_freq_bresp	: out std_logic_vector(1 downto 0);
		refresh_freq_bvalid	: out std_logic;
		refresh_freq_bready	: in std_logic;
		refresh_freq_araddr	: in std_logic_vector(C_refresh_freq_ADDR_WIDTH-1 downto 0);
		refresh_freq_arprot	: in std_logic_vector(2 downto 0);
		refresh_freq_arvalid	: in std_logic;
		refresh_freq_arready	: out std_logic;
		refresh_freq_rdata	: out std_logic_vector(C_refresh_freq_DATA_WIDTH-1 downto 0);
		refresh_freq_rresp	: out std_logic_vector(1 downto 0);
		refresh_freq_rvalid	: out std_logic;
		refresh_freq_rready	: in std_logic
	);
end usr_driver_v1;

architecture arch_imp of usr_driver_v1 is

	-- component declaration
	component usr_driver_v1_distmm is
		generic (
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 4
		);
		port (
		dist_data : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);		
		S_AXI_ACLK	: in std_logic;
		S_AXI_ARESETN	: in std_logic;
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		S_AXI_AWVALID	: in std_logic;
		S_AXI_AWREADY	: out std_logic;
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WVALID	: in std_logic;
		S_AXI_WREADY	: out std_logic;
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		S_AXI_BVALID	: out std_logic;
		S_AXI_BREADY	: in std_logic;
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		S_AXI_ARVALID	: in std_logic;
		S_AXI_ARREADY	: out std_logic;
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		S_AXI_RVALID	: out std_logic;
		S_AXI_RREADY	: in std_logic
		);
	end component usr_driver_v1_distmm;

	component usr_driver_v1_refresh_freq is
		generic (
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 4
		);
		port (
		refresh_freq_data : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);		
		S_AXI_ACLK	: in std_logic;
		S_AXI_ARESETN	: in std_logic;
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		S_AXI_AWVALID	: in std_logic;
		S_AXI_AWREADY	: out std_logic;
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WVALID	: in std_logic;
		S_AXI_WREADY	: out std_logic;
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		S_AXI_BVALID	: out std_logic;
		S_AXI_BREADY	: in std_logic;
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		S_AXI_ARVALID	: in std_logic;
		S_AXI_ARREADY	: out std_logic;
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		S_AXI_RVALID	: out std_logic;
		S_AXI_RREADY	: in std_logic
		);
	end component usr_driver_v1_refresh_freq;
	
	-- signal to make ultrasonic ranger pulse at correct frequency
	-- clk in 1MHz - we want to have pulse period = 10ms
	signal refresh_cycles : integer := 100000;
	constant pulse_cycles : integer := 100;	
    signal cycle_count : integer := 0;
    
	-- signal to connect to axi-lite slave interface
	signal dist_sig : std_logic_vector(31 downto 0);
	signal refresh_freq : std_logic_vector(31 downto 0);

begin

-- Instantiation of Axi Bus Interface distmm
usr_driver_v1_distmm_inst : usr_driver_v1_distmm
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_distmm_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_distmm_ADDR_WIDTH
	)
	port map (
	    dist_data => dist_sig,
		S_AXI_ACLK	=> distmm_aclk,
		S_AXI_ARESETN	=> distmm_aresetn,
		S_AXI_AWADDR	=> distmm_awaddr,
		S_AXI_AWPROT	=> distmm_awprot,
		S_AXI_AWVALID	=> distmm_awvalid,
		S_AXI_AWREADY	=> distmm_awready,
		S_AXI_WDATA	=> distmm_wdata,
		S_AXI_WSTRB	=> distmm_wstrb,
		S_AXI_WVALID	=> distmm_wvalid,
		S_AXI_WREADY	=> distmm_wready,
		S_AXI_BRESP	=> distmm_bresp,
		S_AXI_BVALID	=> distmm_bvalid,
		S_AXI_BREADY	=> distmm_bready,
		S_AXI_ARADDR	=> distmm_araddr,
		S_AXI_ARPROT	=> distmm_arprot,
		S_AXI_ARVALID	=> distmm_arvalid,
		S_AXI_ARREADY	=> distmm_arready,
		S_AXI_RDATA	=> distmm_rdata,
		S_AXI_RRESP	=> distmm_rresp,
		S_AXI_RVALID	=> distmm_rvalid,
		S_AXI_RREADY	=> distmm_rready
	);

-- Instantiation of Axi Bus Interface refresh_freq
usr_driver_v1_refresh_freq_inst : usr_driver_v1_refresh_freq
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_refresh_freq_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_refresh_freq_ADDR_WIDTH
	)
	port map (
	    refresh_freq_data => refresh_freq,
		S_AXI_ACLK	=> refresh_freq_aclk,
		S_AXI_ARESETN	=> refresh_freq_aresetn,
		S_AXI_AWADDR	=> refresh_freq_awaddr,
		S_AXI_AWPROT	=> refresh_freq_awprot,
		S_AXI_AWVALID	=> refresh_freq_awvalid,
		S_AXI_AWREADY	=> refresh_freq_awready,
		S_AXI_WDATA	=> refresh_freq_wdata,
		S_AXI_WSTRB	=> refresh_freq_wstrb,
		S_AXI_WVALID	=> refresh_freq_wvalid,
		S_AXI_WREADY	=> refresh_freq_wready,
		S_AXI_BRESP	=> refresh_freq_bresp,
		S_AXI_BVALID	=> refresh_freq_bvalid,
		S_AXI_BREADY	=> refresh_freq_bready,
		S_AXI_ARADDR	=> refresh_freq_araddr,
		S_AXI_ARPROT	=> refresh_freq_arprot,
		S_AXI_ARVALID	=> refresh_freq_arvalid,
		S_AXI_ARREADY	=> refresh_freq_arready,
		S_AXI_RDATA	=> refresh_freq_rdata,
		S_AXI_RRESP	=> refresh_freq_rresp,
		S_AXI_RVALID	=> refresh_freq_rvalid,
		S_AXI_RREADY	=> refresh_freq_rready
	);

	-- Add user logic here
	
	-- PULSE_GENERATOR generates pulses of 10us at a period of (pulse_cycles/fclk)Hz
    pulse_generator: process(clk)
    begin
        if rising_edge(clk) then
            if refresh_freq /= std_logic_vector(to_unsigned(0,32)) and to_integer(unsigned(refresh_freq)) < 1000 then
                if cycle_count < (refresh_cycles-1) then
                    cycle_count <= cycle_count + 1;                             -- keeps track of pulse period and pulse duration
                else
                    cycle_count <= 0;
                    refresh_cycles <= 10000000 / to_integer(unsigned(refresh_freq));
                end if;
                if cycle_count < pulse_cycles then
                    sig_tx_enable <= '1';                                   -- 'sig' should be high for first 10ms - set tri-state as output    
                    sig_out <= '1';
                else
                    sig_tx_enable <= '0';                                   -- 'sig' set high impedance to wait for return signal from transducer circuitry (which will go high to indicate return pulse)
                end if;
            end if;
        end if;
    end process pulse_generator;
	
	-- DISTANCE_MEASUREMENT counts the number of cycles the return signal is high for and converts this into a distance to put on AXI-lite slave interface
    distance_measurement: process(clk)
    	variable return_sig_cycles : integer := 0;
    	variable dist : integer := 0;
    begin
        if rising_edge(clk) then
            if refresh_freq /= std_logic_vector(to_unsigned(0,32)) and to_integer(unsigned(refresh_freq)) < 1000 then
                -- only want to consider return pulse after triggering pulse has been sent
                if cycle_count > pulse_cycles then
                    if sig_in = '1' then
                        return_sig_cycles := return_sig_cycles + 1;         -- increment when return signal is high
                    end if;
                end if;
                -- compute distance value just before transducer is being re-triggered (i.e when pulse_width_count at highest value)
                if cycle_count = 0 then
                    dist := return_sig_cycles * 100 / 5800;                  -- this formula converts the length of the pulse (in cycles) to a distance assuming a 100MHz clock
                    dist_sig <= std_logic_vector(to_unsigned(dist,32));     -- copy to 32-bit signal to be placed on AXI-lite slave data read line
                    return_sig_cycles := 0;                                 -- reset counter to zero for next transducer measurement
                end if;
            else
                dist_sig <= std_logic_vector(to_signed(-1,32));  
            end if;
        end if;
    end process distance_measurement;
    
	-- User logic ends

end arch_imp;
