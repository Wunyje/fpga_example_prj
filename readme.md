# FPGA算法设计范例工程
此范例来自2022级集成电路学院集成电路工程系课程，FPGA和ASIC算法设计，为该课程最终考核课设。结合该课程内容及实验室编程规范要求创建此范例工程，以提供FPGA算法设计的思路参考，并结合反馈保持更新，保证内容的有效。

## FPGA工程文件结构
推荐目录结构如下所示，`example_prj`下为设计源文件等，并用git进行版本管理和协同开发，`x_example_prj`下为Vivado工程文件，包括综合，实现结果等等。
```bash
project_direcroty/
├─ example_prj/
│  ├─ constr/
│  ├─ design/
│  │  ├─ bd/
│  │  ├─ C/
│  │  ├─ hdl/
│  │  ├─ ip/
│  │  └─ ...
│  ├─ docs/
│  ├─ readme.md
│  ├─ tb/
│  └─ ...
└─ x_example_prj
   ├─ x_example_prj.runs
   ├─ x_example_prj.sim
   └─ ...
```

## 编程风格要求
Python和Verilog的编程风格保持一致。
1. 函数名和.py文件名还是采用驼峰命名法，比如ElementwiseProductMod；
2. 变量采用小写字母_分隔，比如current_list；
3. 常数采用大写字母_分隔，比如DATA_WIDTH；


