package adder

import chisel3._
import chisel3.tester._
import chiseltest.WriteVcdAnnotation
import org.scalatest.FreeSpec
import scala.util.Random
import chisel3.stage.ChiselGeneratorAnnotation
import chiseltest._
import firrtl.options.TargetDirAnnotation
import org.scalatest.freespec.AnyFreeSpec

import chisel3.stage.ChiselStage

/**
 * This is a trivial example of how to run this Specification
 * From within sbt use:
 * {{{
 * testOnly gcd.GcdDecoupledTester
 * }}}
 * From a terminal shell use:
 * {{{
 * sbt 'testOnly gcd.GcdDecoupledTester'
 * }}}
 */
class AdderTest extends FreeSpec with ChiselScalatestTester {
  "Gcd should calculate proper greatest common denominator" in {
    test(new Head_Adder8).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      println("test pass")
    }
  }
}

class SC007GTV extends AnyFreeSpec with ChiselScalatestTester {
  (new chisel3.stage.ChiselStage).execute(
    Array("-X", "verilog"),
    Seq(ChiselGeneratorAnnotation(() => new Head_Adder8()), TargetDirAnnotation("Verilog"))
  )
}
