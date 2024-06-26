package NewAdder

import chisel3._
import chisel3.util._
//achieve PG generator

class CLABundle (n:Int)extends Bundle{
  val inputC = Input(UInt(1.W))
  val inputA = Input(Vec(n,UInt(1.W)))
  val inputB = Input(Vec(n,UInt(1.W)))
  val outputS = Output(Vec(n,UInt(1.W)))
  val outputCarry = Output(UInt(1.W))
}


class CLA(n:Int) extends Module{
  val io = IO(new CLABundle(n))

  val P = Wire(Vec(n,UInt(1.W)))
  val G = Wire(Vec(n,UInt(1.W)))
  val tmpC = Wire(Vec(n+1,UInt(1.W)))
  tmpC(0) := io.inputC
  val res = AddUnit(n,io.inputA,io.inputB)
  P := res._1
  G := res._2


  for( i <- 1 until n+1 ) {
    tmpC(i) := G(i-1) | (tmpC(i-1) & P(i-1))
    io.outputS(i-1) := P(i-1) ^ tmpC(i-1)
  }
  io.outputCarry := tmpC(n)
}


class AddUnit(n:Int) extends Module{
  val io = IO(new Bundle {
    val IA = Input(Vec(n,UInt(1.W)))
    val IB = Input(Vec(n,UInt(1.W)))
    val OP = Output(Vec(n,UInt(1.W)))
    val OG = Output(Vec(n,UInt(1.W)))

  })
  for(i <- 0 until n) {
    io.OP(i) := io.IA(i) ^ io.IB(i)
    io.OG(i) := io.IA(i) & io.IB(i)
  }


}

object AddUnit {
  def apply (n:Int,IP:Vec[UInt],IQ:Vec[UInt]) = {
    val tmp = Module(new AddUnit(n))
    tmp.io.IA := IP
    tmp.io.IB := IQ
    (tmp.io.OP,tmp.io.OG)
  }
}



