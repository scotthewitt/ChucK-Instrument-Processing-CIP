public class bus
{
    static Gain @ chan[4];
}
new Gain[4] @=> bus.chan;

//CIP v2

<<< "CIP v2 : Chuck Instrument Processing">>>;
<<< "@scotthewitt cip.ablelemon.co.uk">>>;

//basic audio routing
adc => bus.chan[0] => blackhole;
bus.chan[1] => blackhole;
bus.chan[2] => blackhole;
bus.chan[3] => dac;

//GUI interface
//labels for sliders
["0","1","2","3","4","5","6","7"] @=> string label[];

Object gauge[4];
Object slider[4];

public class interface
{
	//setup gauge
	function void lev_mon (int a){
	    while (true){
            	  bus.chan[a].last();
        	  20::ms => now;
    		  }
	}
		  
	//await slider movment
	//function void slid_event (int b){
	//    while (true){
	//        slider[b] => now;
	//        slider[b].value() => bus.chan[b].gain;
	//    }
	}
}

//live forever
while(true) {
    1::hour => now;
}
