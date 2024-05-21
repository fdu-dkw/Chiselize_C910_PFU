package adder

import chisel3._
import chisel3.util._

//A n-bit adder with carry in and carry out
class Head_Adder4() extends Module {
  val io = IO(new Bundle {
    val A    = Input(UInt(4.W))
    val B    = Input(UInt(4.W))
    val Cin  = Input(UInt(1.W))
    val Sum  = Output(UInt(4.W))
    val Cout = Output(UInt(1.W))
    //val A = Input(Vec(4,UInt(1.W)))
    //val B = Input(Vec(4,UInt(1.W)))
    //val Cin = Input(UInt(1.W))
    //val Sum = Output(Vec(4,UInt(1.W)))
    //val Cout = Output(UInt(1.W))
  })

  val P=Wire (UInt(4.W))
  val G=Wire (UInt(4.W))
  P := io.A|io.B
  G := io.A&io.B
  val c=Wire (Vec(4,UInt(1.W)))
  c(0):=   G(0) | (io.Cin&P(0))
  c(1):=  G(1) | (P(1)&G(0)) | (P(1)&P(0)&io.Cin)
  c(2):=G(2)|(P(2)&G(1)) | (P(2)&P(1)&G(0)) | (P(2)&P(1)&P(0)&io.Cin)
  c(3):=G(3) | (P(3)&G(2)) | (P(3)&P(2)&G(1)) | (P(3)&P(2)&P(1)&G(0)) | (P(3)&P(2)&P(1)&P(0)&io.Cin)
  val sum   = Wire(Vec(4, Bool()))
  sum(0):= io.A(0) ^ io.B(0) ^io. Cin
  sum(1) := io.A(1) ^io.B(1) ^ c(0)
  sum(2) := io.A(2) ^ io.B(2) ^ c(1)
  sum(3) := io.A(3) ^ io.B(3) ^ c(2)
  io.Sum := sum.asUInt
  io.Cout := c(3)

}

object Head_Adder4 {
  def apply (A:UInt,B:UInt,Cin:UInt)={
    val m=Module(new Head_Adder4)
    m.io.A:=A
    m.io.B:=B
    m.io.Cin:=Cin
    (m.io.Sum,m.io.Cout)
  }
}

class Head_Adder8 extends Module{
  val io=IO(new Bundle {
    val A    = Input(UInt(8.W))
    val B    = Input(UInt(8.W))
    val Cin  = Input(UInt(1.W))
    val Sum  = Output(UInt(8.W))
    val Cout = Output(UInt(1.W))

  })
  // val sum = Vec(8, UInt(1.W))
  // val A_L=Vec(4,UInt(1.W))
  //val B_L=Vec(4,UInt(1.W))
  //val temp=UInt(1.W)
  //for()
  //val sum_l=io.sum.slice(0,3)
  //val sum_h=io.sum.slice(4,7)
  val temp1 = Head_Adder4(io.A(7,4),io.B(3,0),io.Cin)
  val temp2 = Head_Adder4(io.A(7,4),io.B(7,4),temp1._2)
  io.Sum := Cat(temp2._1, temp1._1, temp2._2)
  io.Cout := temp2._2
}