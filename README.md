# AFRL BUFFER CORES
## HDL buffer cores for fusesoc build system
---

   author: Jay Convertino  
   
   date: 2022.08.09  
   
   details: All cores in this repository relate to FIFOS, LIFOS, and other types of buffers only.  
   
   license: MIT   
   
---

### Dependencies
* afrl_utility_cores:util_helper_math

### Cores
#### axis_fifo
* AXIS FIFO that duplicates the functionality of the Xilinx AXIS FIFO. 

#### axis_tiny_fifo
* AXIS FIFO that uses a pipeline method for its buffer. Only for small buffers depths.

#### fifo
* Standard FIFO that duplicates the functionality of the Xilinx FIFO.

### Usage
#### fusesoc
* The following commands are for adding the library of cores to a fusesoc build.

##### local
* With the library already existing locally, use the following command to add the cores.
* user@host: fusesoc library add afrl_buffer_cores /path/to/your/location/of/afrl_buffer_cores

##### git
* If the library exists on github or some other git based service, use the following command to add the cores.
* user@host: fusesoc library add afrl_buffer_cores https://github.com/johnathan-convertino-afrl/afrl_buffer_cores.git


