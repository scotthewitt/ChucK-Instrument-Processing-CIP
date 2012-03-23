class Interface extends OSCBase
{  
	//setup and transmit level monitor
	function void lev_mon (int a){
        	 for(0 => int i; i < a; i++){
			bus.chan[i].last() => float f;
			"/app/cip/chan/mon" + i => string s;
		 	sendOSC("127.0.0.1", 10000, s, f);
		 	}
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

//<<< bus.chan >>>;

//test stuff
SinOsc s => bus.chan[2];
0.1 => s.freq;
0.9 => bus.chan[2].gain;

while(1)
{
	i.lev_mon(3);
	200::ms => now;
}

//end of test