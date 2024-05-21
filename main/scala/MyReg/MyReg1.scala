
package MyReg

import chisel3._
import chisel3.util._


class Mybundle(n: Int) extends Bundle {
  val stallIn = Input(Bool())
  val dataIn = Input(UInt(n.W))
  val dataOut = Output(UInt(n.W))

}

//MyReg1 + when/otherwise方法
class MyReg1 (n:Int) extends Module{
  val io = IO(new Mybundle(n))

  val r = Reg(UInt(n.W))
  when(io.stallIn === true.B){
    r := r
  }.otherwise{
    r := io.dataIn
  }
  io.dataOut := r
}


class MyReg2 (n : Int) extends Module{
  val io = IO (new Mybundle(n))
  val w = Wire(0.U(n.W))
  val r = RegEnable(io.dataIn,w,io.stallIn)
  w := r
  io.dataOut := r
}
