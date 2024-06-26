package dkwadder

import chisel3._
import chisel3.util._
import chisel3.experimental._

/////////////////////////////////////////////////////////////////////
// Bundles
class CPGBundleIn(nbit:Int) extends Bundle {
    val cp = UInt(nbit.W)
    val cg = UInt(nbit.W)
    val ci = UInt(1.W)
}

class CPGBundleOut(nbit:Int) extends Bundle {
    val co = UInt(nbit.W)
    val cp = UInt(1.W)
    val cg = UInt(1.W)
}

class FABundleIn(nbit:Int) extends Bundle {
    val a = UInt(nbit.W)
    val b = UInt(nbit.W)
    val ci = UInt(1.W)
}

class FABundleOut(nbit:Int) extends Bundle {
    val s = UInt(nbit.W)
    val cp = UInt(1.W)
    val cg = UInt(1.W)
    val co = UInt(1.W)
}
/////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////
// Modules

// 1-bit full adder with carry propagation (cp) & carry generation (cg)
class FA1PG extends Module {
    val io = IO(new Bundle {
        val in = Input(new FABundleIn(1))
        val out = Output(new FABundleOut(1))
    })
    // cp = a|b;
    // cg = a&b;
    // s = cp&~cg ^ ci
    io.out.cp := io.in.a | io.in.b
    io.out.cg := io.in.a & io.in.b
    io.out.co := io.out.cp & io.in.ci | io.out.cg
    io.out.s := io.out.cp & ~io.out.cg ^ io.in.ci
}

// n-bit carry propagation-generation (CPG) module
class CPGn(nbit:Int) extends Module {
    val io = IO(new Bundle {
        val in = Input(new CPGBundleIn(nbit))
        val out = Output(new CPGBundleOut(nbit))
    })
    val cpVec = Seq.fill(nbit)(Wire(UInt(1.W))).toVector
    val cgVec = Seq.fill(nbit)(Wire(UInt(1.W))).toVector
    val coVec = Seq.fill(nbit)(Wire(UInt(1.W))).toVector
    cpVec(0) := io.in.cp(0)
    cgVec(0) := io.in.cg(0)
    coVec(0) := io.in.cg(0) | io.in.cp(0) & io.in.ci
    for (i <- 1 until nbit) {
        cpVec(i) := cpVec(i - 1) & io.in.cp(i)
        cgVec(i) := io.in.cg(0) | cgVec(i - 1) & io.in.cp(i)
        coVec(i) := cgVec(i) | cpVec(i) & io.in.ci
    }
    io.out.cp := cpVec(nbit - 1)
    io.out.cg := cgVec(nbit - 1)
    io.out.co := coVec.reduce(_ ## _)(nbit - 2, 0)
}

// n-bit CPG module, tree-shaped, each node width <= widthCPG
class CPGTree(nbit:Int, widthCPG:Int) extends Module {
    val io = IO(new Bundle {
        val in = Input(new CPGBundleIn(nbit))
        val out = Output(new CPGBundleOut(nbit))
    })

    // number of subtree(s), width subtree(s) be in charge of, subtree(s) be equivalent or not
    private def subtreeNumWidthBalance():(Int, Int, Boolean) = {
        var cnt = nbit
        var num = 0
        var width = 1
        while (cnt > 0) {
            num = (cnt % widthCPG)
            width = width * widthCPG
            cnt = cnt / widthCPG
        }
        width = width / widthCPG
        if (num == 0) {
            num = widthCPG
        }
        val balance = (num*width==nbit)
        (num, width, balance)
    }

    if (nbit <= widthCPG) { // too narrow i/o
        val cpg = Module(new CPGn(nbit))
        cpg.io.in <> io.in
        io.out <> cpg.io.out
    } else { // too wide i/o, split into subtrees
        val t = subtreeNumWidthBalance()
        val numSubtree = t._1
        val widthSubtree = t._2
        val balanceSubtree = t._3
        if (balanceSubtree) {
            val cpg = Module(new CPGn(numSubtree))
            val subtreeVec = Seq.fill(numSubtree)(Module(new CPGTree(widthSubtree, widthCPG))).toVector
            io.out.cp := cpg.io.out.cp
            io.out.cg := cpg.io.out.cg
            io.out.co := subtreeVec.map(_.io.out.co).reverse.reduce(_ ## _)
            cpg.io.in.ci := io.in.ci
            cpg.io.in.cp := subtreeVec.map(_.io.out.cp).reverse.reduce(_ ## _)
            cpg.io.in.cg := subtreeVec.map(_.io.out.cg).reverse.reduce(_ ## _)
            for (i <- 0 until numSubtree) {
                subtreeVec(i).io.in.cp := io.in.cp((i + 1) * widthSubtree - 1, i * widthSubtree)
                subtreeVec(i).io.in.cg := io.in.cg((i + 1) * widthSubtree - 1, i * widthSubtree)
                if (i == 0) {
                    subtreeVec(i).io.in.ci := io.in.ci
                } else {
                    subtreeVec(i).io.in.ci := cpg.io.out.co(i - 1)
                }
            }
        } else {
            val cpg = Module(new CPGn(numSubtree + 1))
//            val subtreeVec = Vec(numSubtree, Module(new CPGTree(widthSubtree, widthCPG)))
            val subtreeVec = Seq.fill(numSubtree)(Module(new CPGTree(widthSubtree, widthCPG))).toVector
            val smallSubtree = Module(new CPGTree(nbit - numSubtree * widthSubtree, widthCPG))
            io.out.cp := cpg.io.out.cp
            io.out.cg := cpg.io.out.cg
            io.out.co := smallSubtree.io.out.co ## subtreeVec.map(_.io.out.co).reverse.reduce(_ ## _)
            cpg.io.in.ci := io.in.ci
            cpg.io.in.cp := smallSubtree.io.out.cp ## subtreeVec.map(_.io.out.cp).reverse.reduce(_ ## _)
            cpg.io.in.cg := smallSubtree.io.out.cg ## subtreeVec.map(_.io.out.cg).reverse.reduce(_ ## _)
            for (i <- 0 until numSubtree) {
                subtreeVec(i).io.in.cp := io.in.cp((i + 1) * widthSubtree - 1, i * widthSubtree)
                subtreeVec(i).io.in.cg := io.in.cg((i + 1) * widthSubtree - 1, i * widthSubtree)
                if (i == 0) {
                    subtreeVec(i).io.in.ci := io.in.ci
                } else {
                    subtreeVec(i).io.in.ci := cpg.io.out.co(i - 1)
                }
            }
            smallSubtree.io.in.cp := io.in.cp(nbit - 1, numSubtree * widthSubtree)
            smallSubtree.io.in.cg := io.in.cg(nbit - 1, numSubtree * widthSubtree)
            smallSubtree.io.in.ci := cpg.io.out.co(numSubtree)
        }
    }
}

class FAn(nbit:Int, widthCPG:Int) extends Module {
    // n位超前进位全加器
    // 参数：nbit：操作数宽度
    //      widthCPG：单个超前进位模块的最大宽度
    // 输入：.io.in.a：操作数1（宽度由nbit指定）
    //      .io.in.b：操作数2（宽度由nbit指定）
    //      .io.in.ci：前级进位
    // 输出：.io.out.s：求和（宽度由nbit指定）
    //      .io.out.co：进位信号
    //      .io.out.cp：（扩展）进位传播信号
    //      .io.out.cg：（扩展）进位产生信号
    val io = IO(new Bundle {
        val in = Input(new FABundleIn(nbit))
        val out = Output(new FABundleOut(nbit))
    })
    val fa1Vec = Seq.fill(nbit)(Module(new FA1PG)).toVector
    val tree = Module(new CPGTree(nbit, widthCPG))
    for (i <- 0 until nbit) {
        fa1Vec(i).io.in.a := io.in.a(i)
        fa1Vec(i).io.in.b := io.in.b(i)
        if (i == 0) {
            fa1Vec(i).io.in.ci := io.in.ci
        } else {
            fa1Vec(i).io.in.ci := tree.io.out.co(i - 1)
        }
    }
    tree.io.in.cp := fa1Vec.map(_.io.out.cp).reverse.reduce(_ ## _)
    tree.io.in.cg := fa1Vec.map(_.io.out.cg).reverse.reduce(_ ## _)
    tree.io.in.ci := io.in.ci
    io.out.s := fa1Vec.map(_.io.out.s).reverse.reduce(_ ## _)
    io.out.cp := tree.io.out.cp
    io.out.cg := tree.io.out.cg
    io.out.co := tree.io.out.cp | tree.io.out.cg
}
/////////////////////////////////////////////////////////////////////