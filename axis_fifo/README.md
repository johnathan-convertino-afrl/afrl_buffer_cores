# AXIS FIFO
## FIFO for AXI streaming
---

   author: Jay Convertino  
   
   date: 2021.06.29  
   
   details: Verilog AXIS FIFO provides a dual clock FIFO capable of async or sync clocks.  
   
   license: MIT   
   
---

![rtl image](./rtl.png)

### IP USAGE
#### Parameters

* FIFO_DEPTH : Depth of the fifo, must be a power of two number(divisable aka 256 = 2^8). Any non-power of two will be rounded up to the next closest.
* COUNT_WIDTH: Data count output width in bits. Should be the same power of two as fifo depth(256 for fifo depth... this should be 8).
* BUS_WIDTH  : Width of the axis data bus input/output in bytes.
* USER_WIDTH : Width of the axis user bus input/output in bits.
* DEST_WIDTH : Width of the axis dest bus input/output in bits.
* RAM_TYPE   : RAM type setting.
* PACKET_MODE: Set axis fifo to wait for tlast before allowing a read on master port output.
* COUNT_DELAY: Delay count by one clock cycle of the data count clock. Set this to 0 to disable (only disable if read/write/data_count are on the same clock domain!). 

### COMPONENTS
#### SRC

* util_axis_fifo_ctrl.v
  * controls axis fifo behavior.
* util_axis_fifo.v
  * Wrapper for axis fifo components.
  
#### TB

* tb_axi.v

  
### fusesoc

* Simulations are fixed at the moment.
