----------------------------------------------------------------------------------
-- Company: UNIVERSITY OF STRATHCLYDE
-- Engineer: GROUP B
-- 
-- Create Date: 12.04.2020 12:34:02
-- Design Name: 
-- Module Name: usr_driver_TB - usr_driver_TB_arch
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity usr_driver_TB is
--  Port ( );
end usr_driver_TB;

architecture usr_driver_TB_arch of usr_driver_TB is

	-- component declaration
	component usr_driver_v1 is
		generic (
		C_distmm_DATA_WIDTH	: integer	:= 32;
		C_distmm_ADDR_WIDTH	: integer	:= 4;
		C_refresh_freq_DATA_WIDTH	: integer	:= 32;
		C_refresh_freq_ADDR_WIDTH	: integer	:= 4
		);
		port (
		clk : in std_logic;
		sig_in : in std_logic;
		sig_out : out std_logic;
		sig_tx_enable : out std_logic;
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
	end component usr_driver_v1;
	
	signal clk : std_logic;
	signal sig_in : std_logic;
	signal sig_out : std_logic;
	signal sig_tx_enable : std_logic;
	signal dist_aclk	: std_logic;
	signal dist_aresetn	: std_logic;
	signal dist_awaddr	: std_logic_vector(4-1 downto 0);
	signal dist_awprot	: std_logic_vector(2 downto 0);
	signal dist_awvalid	: std_logic;
	signal dist_awready	: std_logic;
	signal dist_wdata	: std_logic_vector(32-1 downto 0);
	signal dist_wstrb	: std_logic_vector((32/8)-1 downto 0);
	signal dist_wvalid	: std_logic;
	signal dist_wready	: std_logic;
	signal dist_bresp	: std_logic_vector(1 downto 0);
	signal dist_bvalid	: std_logic;
	signal dist_bready	: std_logic;
	signal dist_araddr	: std_logic_vector(4-1 downto 0);
	signal dist_arprot	: std_logic_vector(2 downto 0);
	signal dist_arvalid	: std_logic;
	signal dist_arready	: std_logic;
	signal dist_rdata	: std_logic_vector(32-1 downto 0);
	signal dist_rresp	: std_logic_vector(1 downto 0);
	signal dist_rvalid	: std_logic;
	signal dist_rready	: std_logic;
	signal refresh_freq_aclk	: std_logic;
	signal refresh_freq_aresetn	: std_logic;
	signal refresh_freq_awaddr	: std_logic_vector(4-1 downto 0);
	signal refresh_freq_awprot	: std_logic_vector(2 downto 0);
	signal refresh_freq_awvalid	: std_logic;
	signal refresh_freq_awready	: std_logic;
	signal refresh_freq_wdata	: std_logic_vector(32-1 downto 0);
	signal refresh_freq_wstrb	: std_logic_vector((32/8)-1 downto 0);
	signal refresh_freq_wvalid	: std_logic;
	signal refresh_freq_wready	: std_logic;
	signal refresh_freq_bresp	: std_logic_vector(1 downto 0);
	signal refresh_freq_bvalid	: std_logic;
	signal refresh_freq_bready	: std_logic;
	signal refresh_freq_araddr	: std_logic_vector(4-1 downto 0);
	signal refresh_freq_arprot	: std_logic_vector(2 downto 0);
	signal refresh_freq_arvalid	: std_logic;
	signal refresh_freq_arready	: std_logic;
	signal refresh_freq_rdata	: std_logic_vector(32-1 downto 0);
	signal refresh_freq_rresp	: std_logic_vector(1 downto 0);
	signal refresh_freq_rvalid	: std_logic;
	signal refresh_freq_rready	: std_logic;
	
begin

    -- Instantiation of Axi Bus Interface dist
    UUT_inst : usr_driver_v1
	   generic map (
		  C_distmm_DATA_WIDTH	=> 32,
		  C_distmm_ADDR_WIDTH	=> 4,
		  C_refresh_freq_DATA_WIDTH => 32,
		  C_refresh_freq_ADDR_WIDTH => 4
	   )
	   port map (
	    clk => clk,
		sig_in => sig_in,
		sig_out => sig_out,
		sig_tx_enable => sig_tx_enable,
		distmm_aclk	=> dist_aclk,
		distmm_aresetn	=> dist_aresetn,
		distmm_awaddr	=> dist_awaddr,
		distmm_awprot	=> dist_awprot,
		distmm_awvalid	=> dist_awvalid,
		distmm_awready	=> dist_awready,
		distmm_wdata	=> dist_wdata,
		distmm_wstrb	=> dist_wstrb,
		distmm_wvalid	=> dist_wvalid,
		distmm_wready	=> dist_wready,
		distmm_bresp	=> dist_bresp,
		distmm_bvalid	=> dist_bvalid,
		distmm_bready	=> dist_bready,
		distmm_araddr	=> dist_araddr,
		distmm_arprot	=> dist_arprot,
		distmm_arvalid	=> dist_arvalid,
		distmm_arready	=> dist_arready,
		distmm_rdata	=> dist_rdata,
		distmm_rresp	=> dist_rresp,
		distmm_rvalid	=> dist_rvalid,
		distmm_rready	=> dist_rready,
	    refresh_freq_aclk	 => refresh_freq_aclk,
	    refresh_freq_aresetn  => refresh_freq_aresetn,
	    refresh_freq_awaddr	 => refresh_freq_awaddr,
	    refresh_freq_awprot	 => refresh_freq_awprot,
	    refresh_freq_awvalid => refresh_freq_awvalid,
	    refresh_freq_awready => refresh_freq_awready,
	    refresh_freq_wdata   => refresh_freq_wdata,
	    refresh_freq_wstrb	 => refresh_freq_wstrb,
	    refresh_freq_wvalid	 => refresh_freq_wvalid,
	    refresh_freq_wready  => refresh_freq_wready,
	    refresh_freq_bresp	 => refresh_freq_bresp,
	    refresh_freq_bvalid	 => refresh_freq_bvalid,
	    refresh_freq_bready	 => refresh_freq_bready,
	    refresh_freq_araddr	 => refresh_freq_araddr,
	    refresh_freq_arprot	 => refresh_freq_arprot,
	    refresh_freq_arvalid => refresh_freq_arvalid,
	    refresh_freq_arready => refresh_freq_arready,
	    refresh_freq_rdata	 => refresh_freq_rdata,
	    refresh_freq_rresp	 => refresh_freq_rresp,
	    refresh_freq_rvalid	 => refresh_freq_rvalid,
	    refresh_freq_rready  => refresh_freq_rready
	);

	clock_gen: process
	begin
	   while now < 30ms loop
	       clk <= '0';
	       wait for 5ns;
	       clk <= '1';
	       wait for 5ns;
       end loop;
       wait;
    end process clock_gen;
    
    test_stim: process
    begin
        while now < 30ms loop
            wait for 5ns;
            sig_in <= '0';          -- NO INPUT
            wait for 10us;
            sig_in <= '0';
            wait for 1000us;
            sig_in <= '1';
            wait for 2000us;
            sig_in <= '0';
            wait for 6990us;     -- after 10ms (+5ns)
            sig_in <= '0';          -- NO INPUT
            wait for 10us;
            sig_in <= '0';
            wait for 1500us;
            sig_in <= '1';
            wait for 1500us;
            sig_in <= '0';
            wait for 6990us;      -- after 20ms (+5ns)
            sig_in <= '0';          -- NO INPUT
            wait for 10us;
        end loop;
        wait;
    end process test_stim;
    
end usr_driver_TB_arch;
