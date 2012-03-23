class Interface extends OSCBase
{  
	//setup gauge
	function void lev_mon (int a){
        	 bus.chan[a].last() => float f ;
		 sendOSC("127.0.0.1", 10000, "/hello/letsgo", f);
		 }
		  
	//await slider movment
	//function void slid_event (int b){
	//    while (true){
	//        slider[b] => now;
	//        slider[b].value() => bus.chan[b].gain;
	//    }
	//}
}

Interface i;

//test stuff
SinOsc s => bus.chan[2];
0.1 => s.freq;
0.9 => bus.chan[2].gain;

while(1)
{
	i.lev_mon(2);
	200::ms => now;
}

//end of test