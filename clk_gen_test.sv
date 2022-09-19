module m;
	timeunit 1ns;
	timeprecision 1fs;
  bit clk_10M,clk_100M,clk_1G,clk_10G,clk_1K,clk_10K, clk_def;
 // int frequency =10;
  parameter real u_10MHZ =10;
  parameter real u_100MHZ =100;
  parameter real u_1GHZ =1000;
  parameter real u_10GHZ =10000;
  parameter real u_1kHZ =0.001;
  parameter real u_10kHZ =0.0001;
  
  ivl_uvm_ovl_clk_gen #(.FREQ_IN_MHZ(10)) clk_10MHZ(clk_10M);
  ivl_uvm_ovl_clk_gen #(.FREQ_IN_MHZ(100)) clk_100MHZ (clk_100M);
  ivl_uvm_ovl_clk_gen #(.FREQ_IN_MHZ(1000)) clk_1GHZ (clk_1G);
  ivl_uvm_ovl_clk_gen #(.FREQ_IN_MHZ(10000)) clk_10GHZ (clk_10G);
  ivl_uvm_ovl_clk_gen #(.FREQ_IN_MHZ(0.001)) clk_1kHZ (clk_1K);
  ivl_uvm_ovl_clk_gen #(.FREQ_IN_MHZ(0.0001)) clk_10kHZ (clk_10K);
  
  ivl_uvm_ovl_clk_gen u_def (clk_def);
  
  
  
  initial begin
		#100 $finish();
	end
 initial begin 
       //enable wave dump
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
  
//----------clk 10MHZ --------------
  int frequency_10M =10;
  realtime clk_period_10M =1000.0/frequency_10M;
  
property T_clk(int clk_period);
time current_time;
  (('1,current_time=$realtime) |=>(clk_period == $realtime-current_time));
endproperty
 
 assert_period:assert property (@(posedge clk_10M)T_clk(clk_period_10M))
  $info("%t TB_INFO : clk is correct --> frq = %d MHZ",$realtime,frequency_10M);
else
$warning("%t TB_INFO : clk not correct",$realtime);
//------------- clk 10MHZ -------------   
    
 //----------clk 100MHZ --------------
    int frequency_100M =100;
  realtime clk_period_100M =1000.0/frequency_100M;
   assert_period_100M:assert property (@(posedge clk_100M)T_clk(clk_period_100M))
  $info("%t TB_INFO : clk is correct --> frq = %d MHZ",$realtime,frequency_100M);
else
$warning("%t TB_INFO : clk not correct",$realtime);
//------------- clk 100MHZ -------------      
    //----------clk 1GHZ --------------
  int frequency_1G =1000;  
  realtime clk_period_1G =1000.0/frequency_1G;
  
 assert_period_1G:assert property (@(posedge clk_1G)T_clk(clk_period_1G))
   $info("%t TB_INFO : clk is correct --> frq = %d GHZ",$realtime,frequency_1G);
else
$warning("%t TB_INFO : clk not correct",$realtime);
//------------- clk 1GHZ -------------     
   //----------clk 10GHZ --------------
  int frequency_10G =10000;  
  realtime clk_period_10G =1000.0/frequency_10G;
  
  assert_period_10G:assert property (@(posedge clk_10G)T_clk(clk_period_10G))
   $info("%t TB_INFO : clk is correct --> frq = %d GHZ",$realtime,frequency_10G);
else
$warning("%t TB_INFO : clk not correct",$realtime);
//------------- clk 10GHZ -------------         
  //----------clk 1KHZ --------------
    int frequency_1K =0.001;
  realtime clk_period_1K =1000.0/frequency_1K;
     
  assert_period_1k:assert property (@(posedge clk_1K)T_clk(clk_period_1K))
   $info("%t TB_INFO : clk is correct --> frq = %d KHZ",$realtime,frequency_1K);
else
$warning("%t TB_INFO : clk not correct",$realtime);
//------------- clk 1KHZ -------------         
     //----------clk 10KHZ --------------
    int frequency_10K =0.0001;
  realtime clk_period_10k =1000.0/frequency_10K;
  
  assert_period_10k:assert property (@(posedge clk_10K)T_clk (clk_period_10k))
   $info("%t TB_INFO : clk is correct --> frq = %d KHZ",$realtime,frequency_10K);
else
$warning("%t TB_INFO : clk not correct",$realtime);
//------------- clk 10KHZ -------------         
    
endmodule : m
 