// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Wed Apr  2 21:12:19 2025
// Host        : DESKTOP-D35OAN4 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/_local_files/prjs/util_prj/example_prj/design/ip/co_B_rom/co_B_rom_sim_netlist.v
// Design      : co_B_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xa7a12tcpg238-2I
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "co_B_rom,blk_mem_gen_v8_4_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module co_B_rom
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [15:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.3548 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "co_B_rom.mem" *) 
  (* C_INIT_FILE_NAME = "co_B_rom.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "16" *) 
  (* C_READ_WIDTH_B = "16" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
  (* C_XDEVICEFAMILY = "aartix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  co_B_rom_blk_mem_gen_v8_4_6 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[15:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[15:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
aMT3usC6uizzcwnzOCX4OsS16Ob+YxFcsGovFpFklbnaIaD1S0lVdxenTwHPp6ByIEi+ehwr6Rgg
z/3AlTheI5NFTM8ihiMA18/wmUxI7EbaftJACA1LykUKCuj5myy0T+DACuv3sGYIZS38TZTZnnBC
FGAlvTZmRWs+JzneH3o=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lR9ZerhYSAb39nzEkeYvhnwEs5t9y/+yTDf8KuoUtR1BGeHZq8pA/YxtjzQLtaOW1R1IQUb0FtSI
e3CYAb7WHYbIjcpw3vKHvW1SqcGn9CMGa556CYKmD2oF12Kow8xRaFvMSBUVxX7HsHxNWnRd+PU1
+C0YayU2KFIY/7Yl6cZ5luAzhw/6SW3PFYUIyyqWy5MCIXweHOwQR2IpQEdlDur5nluN7i7BeB+i
fxwwHh8TU/g7T4mhZFkiTuBKdLAtQOjxWxzqTMxgcuAjlTylY16FgMFOASdvvSbqBZJjbxMdVloU
rYjS8O/8rWktv8GXcaIdBJ2BRj01q7jsChsbwA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Qvl63GHz9mq2xOB7elt/vAQ7URLGdD1Lkcz7f3Wtw31dwjjjbP62Ny/Jr6OmBIheWlgejx38qxAT
TrHiiEyjKmGcnPn1Tn2n+cH4RAxCbOFnCI9n6+YsYMTe9JkplGhGGr39SkFgJz0I2IKpPsuqTjCj
rhf49TAryNMQeRpREJA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MA+9Ro+dh339m0iZrkKbqTKN8gQ5xkxN/SPCfhkOn+5jjgCTS5IOKLHil+HsZDjX333ebxnornwG
MOBxyEdFfLM8SA+bs2r41J/j0af2VVMmCM3hOh8JmZxB4X9Jg/glegNCbvwzqxMbOQNEy+zt7j5t
TFVD82RtPFmYVVYZZyll/WvAA+0aVpyjzLCIM1GznFky0RWLv65Wp4MJJnNRRrtG3muMznVO/u2s
tACsJ9jzv9M0IlMYjYH9BixhG6cZX02I4LEXXaPkhdOINlMMhsbArXtc9NphzmS4bY1/1yF1D6YD
EKLyS2Sr3HDl0O/lefN+jvfG8iKuVl55PNNrVQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
wpMTg7STjFkUDhOqdNPa0FHXTnHQgKmhvqDv+rRVBvMiQ8O7u8oj7ibITq3o+jugJsMJ60B410gQ
JFTcqCJKYmYJvqi8rPLLOYDmFG6ZLP/Ixr3n62IyIaCeDltBahi3yV009QN0X+iuzuFCL+Y7g9ff
IvAgyBly+Z3Itv2H9EJMZPMl17Sa7IkgjmWqzVXIKNMKn0iDVYsQw6ZgzQDYQ8N8IvTIEggU3/lh
6Nf0hV0ev3qOv/2P+4w0U766Ux3yLuzPJSI7bKm3/ip9NjhOytxOiKKqVXhKG8dzbbuS5u3EE/eq
q6YxkL7gpvNltVqqBnJB6vHSyWrD6+MqsCtR9A==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Q7Q4SSp70lxFryaopuic9VVP/Ire0pSsPEIMYdURBAczC7ShkuYeV02U7L3BlAiyBE4vBKcwYSQd
cWiaj8sVP7q4kxoRHKxLV1R5PIO6l4DsLWE2E+1MLyUPME0w5KTular/oX8EPCJ5n/8VCtW7x4Vf
dpeyki1/IAPJkAyi3zVZKHzgKhEwnZaZZtZYuMWoPZMt4V38sAcE42Raf+7yfFWG5HO74JY6iEnW
gJeRk58K+avB/XLF2/j2RQZfjTYizrprT2tUMBK6e7DRWZZtk8AOcsMhUikev44IFGNbNXjP8BXC
0J3y3P7pCFT6l+saU83nRwi/H25fSA34diJtNw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
a/8ooC+s+6nfvfa1+oBhsvYWLJjFgp83DI1kNyOi5Am+ugPbGRmgGZudfyo6yw6Yd5gGbLm5aToQ
5G4cGF5HaXD5TU6A0ZZFMTIbzFLE76JMjjIxX8JcaJIZpSmrXqlru8l5gDINUEAmwUY3mRQnjcGJ
0Z+kMRH8iAEF+gEviPiFZSBbJeOPqivIS217kimQJX3BeNbNPQTP+GUidcRywpGMh5avxtA0kDRO
F9SoCSyTm9hr2v9hsK1IUAYQLb7n2/R+z5YNKNzt1oN4qgJH1wZfdI8if2K8+ohyOdnxrrgJOWdj
cOqr7cGqEOYfBMTIQeHVZzb7NGWVN+9B8XSUaQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
FLPvOUNRWNW2GU+FEGmt2XWthOT5bY/31DRbol2cUmEGNF6b2XzpCosNKGx/o2n6sQvGP39KRFCs
nJu0ihe2dUGee9nEZZUcpwPjnEfXVI3yJaRVYy8iL+rm59lXq0jX4sjAPieDvv8shgAnoXLTZGlq
K+2c1JhaHt+nFi27TDrYar/+P8nP1MhocOS7BjzCvSs0foEXj92/qD+71Sm/LqGr8cjlH2qTJJ8B
ynxoH6iT+bksVA2VbtPT9o6h1kJ/zwP4wcsL9l+qSlJhd4GI11JPux26DlNyIi41WmufQcfiT0PB
r6O9+0E9lV9ODwKdjaxfZRK29rjKeq2yr0jWhMV38XKKqHAJli7MIypGRXcCo+u89H87KgYt+ebw
s3foIqCe0JKR57WzI8VD6XdNtOL8eBxK539oemx4vkE0cGYECZKYru6A2hPeZOYDD5eyWSUlQl1R
EciK49WM8HnssyRVcmE6di6bISMbVi0TZG/v98bz+9UZa8DtqMVYH0tz

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fphquQOeFuqByo36Gh2C1zEC1J6u9swSMbMzsKldIvLm+SZ6/hr/N8KJ/G2vBABzX6UtbVuP1ZXx
AxdftP4Aqis1B3Bs6989aQG9eo0SOHA7r6aFLtFb3qoD5Pvqw4aVNU4z4EtTpFpn/jCWD21lKROf
q5X32HRfFq1jwqod+9vIbUNRRzz5y9VHvXfacZlxDazSPmcCF4hxB1KqWqT44KmYVkDedgkgnYgb
ZGidHnTb3W7C8tSqC9ac4kNJCL429QndtddweESJNlpX+65pt9Irok9pkOodwoj0QScswOIFjhBZ
/GrzZLQcFWiD3gXRU4DazzxQnGdRH4qEIRWziw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
1lUYYHPCt1BUJOvcBbgMU2GSQiqfxItz4ntieMaenjrtsE9SLwaU6xB0tBl8Atw5yP/RRNww1kX/
9uZbTz5He3r9mPVt+mGxB4N3f9BbCrQRb4USVPgKO/+vWUfMQERGklScy0+fz75WuxH74CjRUoDI
8iyssb2cUNnfDe13jIoI8gM1w4w/Pkxkmb6Mef53QMxacHAWEZeytcH3fuL/adO263D8P90U3XJv
vBXJmbjkRVi9qzjBzfMxuOy2KbZaZgR3BLzaffIfFnMwg/Rb8sGls5pQsZv5jL2wk3+Bj3OXBYdd
pDyjGoalJBzObKzd/t15kNHwY4FXYFcZLQPncw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YRmSEzaa2WFVvMH1BwWc1TIUpVbzSEIP0VbI6n0sEgct/X4PiTfMQmK1jBVCaISIzwBxscKQwZOt
mb/nmINGg6I7ih39LSbBMtx6cdCUiyaLkPeRbqfyPpKhvnUIFmdKVvTd1dYzxeOeuDnhSVaBaAcN
3lngSg7lIbmhLIGjC29yQrBTiLArbVZi6IRGronMK51e3UrYa6GspsznhiuRcXjEb4bHKrJ2CM5Z
BUwA+E9949sQgyOagFZbLVle2ESbwBaoxcAPn2gxfRHlT0leqyLgUGDZLsfArzGzw9BTGzyEG2TR
XOrKFNYRfMXMrnGsBM7acIelY4LdAMgsKgDH/A==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18256)
`pragma protect data_block
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
x7fFvCJ+eNK8A+NRj4qqhA==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
