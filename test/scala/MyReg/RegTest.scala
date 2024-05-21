
package MyReg

import adder.Head_Adder8
import chisel3._
import chisel3.stage.ChiselGeneratorAnnotation
import chisel3.tester.ChiselScalatestTester
import chiseltest._
import firrtl.options.TargetDirAnnotation
import org.scalatest.FreeSpec
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.freespec.AnyFreeSpec

class RegTest extends FreeSpec with ChiselScalatestTester {
  "Gcd should calculate proper greatest common denominator" in {
    test(new MyReg1(4))
      .withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      for(rst<-0 until(1)) {
        for(stall<-0 until(1)) {
          for(a<-0 until(2)){
          dut.io.stallIn.poke(stall.B)
          dut.io.dataIn.poke(a.U)
          dut.reset.poke(rst.B)
          dut.clock.step()
          }
        }
      }
    }
  }
}
class RegTest2 extends FreeSpec with ChiselScalatestTester {
  "Gcd should calculate proper greatest common denominator" in {
    test(new MyReg2(4))
      .withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
        for(rst<-0 until(1)) {
          for(stall<-0 until(1)) {
            for(a<-0 until(2)){
              dut.io.stallIn.poke(stall.B)
              dut.io.dataIn.poke(a.U)
              dut.reset.poke(rst.B)
              dut.clock.step()
            }
          }
        }
      }
  }
}

class SC007GTV extends AnyFreeSpec with ChiselScalatestTester {
  (new chisel3.stage.ChiselStage).execute(
    Array("-X", "verilog"),
    Seq(ChiselGeneratorAnnotation(() => new MyReg1(4)), TargetDirAnnotation("Verilog"))
  )
}