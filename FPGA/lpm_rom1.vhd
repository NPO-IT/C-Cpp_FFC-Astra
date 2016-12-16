-- megafunction wizard: %LPM_ROM%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: lpm_rom 

-- ============================================================
-- File Name: lpm_rom1.vhd
-- Megafunction Name(s):
-- 			lpm_rom
--
-- Simulation Library Files(s):
-- 			lpm
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 7.1 Build 156 04/30/2007 SJ Full Version
-- ************************************************************


--Copyright (C) 1991-2007 Altera Corporation
--Your use of Altera Corporation's design tools, logic functions 
--and other software and tools, and its AMPP partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Altera Program License 
--Subscription Agreement, Altera MegaCore Function License 
--Agreement, or other applicable license agreement, including, 
--without limitation, that your use is for the sole purpose of 
--programming logic devices manufactured by Altera and sold by 
--Altera or its authorized distributors.  Please refer to the 
--applicable agreement for further details.


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY lpm;
USE lpm.all;

ENTITY lpm_rom1 IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (6 DOWNTO 0);
		q		: OUT STD_LOGIC_VECTOR (5 DOWNTO 0)
	);
END lpm_rom1;


ARCHITECTURE SYN OF lpm_rom1 IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (5 DOWNTO 0);



	COMPONENT lpm_rom
	GENERIC (
		intended_device_family		: STRING;
		lpm_address_control		: STRING;
		lpm_file		: STRING;
		lpm_outdata		: STRING;
		lpm_type		: STRING;
		lpm_width		: NATURAL;
		lpm_widthad		: NATURAL
	);
	PORT (
			address	: IN STD_LOGIC_VECTOR (6 DOWNTO 0);
			q	: OUT STD_LOGIC_VECTOR (5 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
	q    <= sub_wire0(5 DOWNTO 0);

	lpm_rom_component : lpm_rom
	GENERIC MAP (
		intended_device_family => "FLEX10K",
		lpm_address_control => "UNREGISTERED",
		lpm_file => "Mif1.mif",
		lpm_outdata => "UNREGISTERED",
		lpm_type => "LPM_ROM",
		lpm_width => 6,
		lpm_widthad => 7
	)
	PORT MAP (
		address => address,
		q => sub_wire0
	);



END SYN;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: ADDRESSSTALL_A NUMERIC "0"
-- Retrieval info: PRIVATE: AclrAddr NUMERIC "0"
-- Retrieval info: PRIVATE: AclrByte NUMERIC "0"
-- Retrieval info: PRIVATE: AclrOutput NUMERIC "0"
-- Retrieval info: PRIVATE: BYTE_ENABLE NUMERIC "0"
-- Retrieval info: PRIVATE: BYTE_SIZE NUMERIC "8"
-- Retrieval info: PRIVATE: BlankMemory NUMERIC "0"
-- Retrieval info: PRIVATE: CLOCK_ENABLE_INPUT_A NUMERIC "0"
-- Retrieval info: PRIVATE: CLOCK_ENABLE_OUTPUT_A NUMERIC "0"
-- Retrieval info: PRIVATE: Clken NUMERIC "0"
-- Retrieval info: PRIVATE: IMPLEMENT_IN_LES NUMERIC "0"
-- Retrieval info: PRIVATE: INIT_FILE_LAYOUT STRING "PORT_A"
-- Retrieval info: PRIVATE: INIT_TO_SIM_X NUMERIC "0"
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "FLEX10K"
-- Retrieval info: PRIVATE: JTAG_ENABLED NUMERIC "0"
-- Retrieval info: PRIVATE: JTAG_ID STRING "NONE"
-- Retrieval info: PRIVATE: MAXIMUM_DEPTH NUMERIC "0"
-- Retrieval info: PRIVATE: MIFfilename STRING "Mif1.mif"
-- Retrieval info: PRIVATE: NUMWORDS_A NUMERIC "128"
-- Retrieval info: PRIVATE: OutputRegistered NUMERIC "0"
-- Retrieval info: PRIVATE: RAM_BLOCK_TYPE NUMERIC "0"
-- Retrieval info: PRIVATE: RegAdd NUMERIC "0"
-- Retrieval info: PRIVATE: RegAddr NUMERIC "0"
-- Retrieval info: PRIVATE: RegOutput NUMERIC "0"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
-- Retrieval info: PRIVATE: SingleClock NUMERIC "1"
-- Retrieval info: PRIVATE: UseDQRAM NUMERIC "0"
-- Retrieval info: PRIVATE: WidthAddr NUMERIC "7"
-- Retrieval info: PRIVATE: WidthData NUMERIC "6"
-- Retrieval info: PRIVATE: rden NUMERIC "0"
-- Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "FLEX10K"
-- Retrieval info: CONSTANT: LPM_ADDRESS_CONTROL STRING "UNREGISTERED"
-- Retrieval info: CONSTANT: LPM_FILE STRING "Mif1.mif"
-- Retrieval info: CONSTANT: LPM_OUTDATA STRING "UNREGISTERED"
-- Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_ROM"
-- Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "6"
-- Retrieval info: CONSTANT: LPM_WIDTHAD NUMERIC "7"
-- Retrieval info: USED_PORT: address 0 0 7 0 INPUT NODEFVAL address[6..0]
-- Retrieval info: USED_PORT: q 0 0 6 0 OUTPUT NODEFVAL q[5..0]
-- Retrieval info: CONNECT: @address 0 0 7 0 address 0 0 7 0
-- Retrieval info: CONNECT: q 0 0 6 0 @q 0 0 6 0
-- Retrieval info: LIBRARY: lpm lpm.lpm_components.all
-- Retrieval info: GEN_FILE: TYPE_NORMAL lpm_rom1.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL lpm_rom1.inc FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL lpm_rom1.cmp TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL lpm_rom1.bsf TRUE FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL lpm_rom1_inst.vhd FALSE
-- Retrieval info: LIB_FILE: lpm
