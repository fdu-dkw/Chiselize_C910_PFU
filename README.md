# Chiselize C910 PFU 🪛

This is the repository for Chiselization of the Prefetch Unit (PFU) of Xuantie C910 processor.

Credits for Group 3 at the course of “Embedded Processor and Soc Design“.

School of Electronics @ Fudan University.

## 仓库结构

成果

- 课程设计报告：[嵌入式荣誉课程设计：数据缓存预取.pdf](./嵌入式荣誉课程设计：数据缓存预取.pdf)
- （附件）先进数据预取算法的洞察报告：[先进数据预取算法的洞察报告.pdf](./先进数据预取算法的洞察报告.pdf)

项目代码

- 原版Verilog代码：[原版Verilog代码](./原版Verilog代码/)
  - 就是从[OpenC910项目](https://github.com/XUANTIE-RV/openc910)拷贝出来的，与本项目有关的Verilog源代码。
- Chisel代码：[Chisel代码/scala](./Chisel代码/scala/)
  - 下属顶层模块、GSDB、GPFB、PMB、SDB、PFB各模块的Chisel工程文件夹。
- 最终版Verilog代码：[最终版Verilog代码](./最终版Verilog代码/)
  - 是最后用于集成测试的改版Verilog代码，其中PFB未能成功运行Coremark，原因分析见课设报告。

历次presentation材料

- Chisel加法器设计（吴柏宁、赵龙征洋、邓开文）：[pre0\_Chisel加法器设计\_吴柏宁\_赵龙征洋\_邓开文](./pre0_Chisel加法器设计_吴柏宁_赵龙征洋_邓开文/)
- 体系结构基本知识讲解（金宇坤、杜宇航）：[pre1\_体系结构基本知识讲解](./pre1_体系结构基本知识讲解/)
- C910代码学习（几乎全组参与）：[pre2\_C910代码学习](./pre2_C910代码学习/)
  - 内含读源码的同学做的笔记。
- 读顶会分享（张乐然、杜宇航、张一凡）：[pre3\_读顶会分享](./pre3_读顶会分享/)
- Chisel化报告（赵龙征洋）：[pre4\_Chisel化PFU报告\_赵龙征洋.pdf](./pre4_Chisel化PFU报告_赵龙征洋.pdf)
- 最终报告presentation（邓开文、赵龙征洋、杜宇航）：[pre5\_最终报告\_邓开文\_赵龙征洋\_杜宇航.pdf](./pre5_最终报告_邓开文_赵龙征洋_杜宇航.pdf)