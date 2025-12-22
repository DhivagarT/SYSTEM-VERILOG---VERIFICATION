# KERNEL: -----Generator Class-----
# KERNEL: Time=10 Rst=0 Enb=1 Count=0
# KERNEL: -----Generator Class-----
# KERNEL: Time=10 Rst=1 Enb=0 Count=0
# KERNEL: -----Generator Class-----
# KERNEL: Time=10 Rst=1 Enb=1 Count=0
# KERNEL: -----Generator Class-----
# KERNEL: Time=10 Rst=0 Enb=0 Count=0
# KERNEL: -----Generator Class-----
# KERNEL: Time=10 Rst=0 Enb=0 Count=0
# KERNEL: -----Driver Class-----
# KERNEL: Time=15 Rst=0 Enb=1 Count=0
# KERNEL: -----Monitor Class-----
# KERNEL: Time=16 Rst=0 Enb=1 Count=1
# KERNEL: PASS : exp=1 dut=1
# KERNEL: -----Driver Class-----
# KERNEL: Time=25 Rst=1 Enb=0 Count=0
# KERNEL: -----Monitor Class-----
# KERNEL: Time=26 Rst=1 Enb=0 Count=0
# KERNEL: PASS : exp=0 dut=0
# KERNEL: -----Driver Class-----
# KERNEL: Time=35 Rst=1 Enb=1 Count=0
# KERNEL: -----Monitor Class-----
# KERNEL: Time=36 Rst=1 Enb=1 Count=0
# KERNEL: PASS : exp=0 dut=0
# KERNEL: -----Driver Class-----
# KERNEL: Time=45 Rst=0 Enb=0 Count=0
# KERNEL: -----Monitor Class-----
# KERNEL: Time=46 Rst=0 Enb=0 Count=7    //Wrap-around Condition
# KERNEL: PASS : exp=7 dut=7
# KERNEL: -----Driver Class-----
# KERNEL: Time=55 Rst=0 Enb=0 Count=0
# KERNEL: -----Monitor Class-----
# KERNEL: Time=56 Rst=0 Enb=0 Count=6    //Wrap-around Condition 
# KERNEL: PASS : exp=6 dut=6
# RUNTIME: Info: RUNTIME_0068 $finish called.

//Wrap-around Condition happenes because we got count=1 after may delay  we got rst=0 enb=0 which down count =0 ,
//after that if we get rst=0 enb=0 it is down counter ,so the total width of count is [2:0] = 8 bit so it reduce to 7 ,then after we get same condition it down count=6.
