// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Wed Apr  2 21:12:56 2025
// Host        : DESKTOP-D35OAN4 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/_local_files/prjs/util_prj/example_prj/design/ip/co_K_rom/co_K_rom_sim_netlist.v
// Design      : co_K_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xa7a12tcpg238-2I
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "co_K_rom,blk_mem_gen_v8_4_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module co_K_rom
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [19:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [19:0]douta;
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
  wire [19:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [19:0]NLW_U0_s_axi_rdata_UNCONNECTED;
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
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.4108 mW" *) 
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
  (* C_INIT_FILE = "co_K_rom.mem" *) 
  (* C_INIT_FILE_NAME = "co_K_rom.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "20" *) 
  (* C_READ_WIDTH_B = "20" *) 
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
  (* C_WRITE_WIDTH_A = "20" *) 
  (* C_WRITE_WIDTH_B = "20" *) 
  (* C_XDEVICEFAMILY = "aartix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  co_K_rom_blk_mem_gen_v8_4_6 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[19:0]),
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
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[19:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27936)
`pragma protect data_block
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
WH2dym1j
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
