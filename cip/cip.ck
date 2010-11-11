public class bus
{
    static Gain @ chan[4];
}
new Gain[4] @=> bus.chan;

//CIP v0.9

<<< "CIP v0.9 : Chuck Instrument Processing">>>;
<<< "@scotthewitt cip.ablelemon.co.uk">>>;

//basic audio routing
adc => bus.chan[0] => blackhole;
bus.chan[1] => blackhole;
bus.chan[2] => blackhole;
bus.chan[3] => dac;


//GUI interface
//labels for sliders
["0","1","2","3","4","5","6","7"] @=> string label[];

MAUI_View cip_gui;
cip_gui.name( "CIP v0.9" );
cip_gui.size( 250, 250 );

MAUI_Gauge gauge[4];
MAUI_Slider slider[4];

//setup gauge
function void lev_mon (int a){
    while (true){
        bus.chan[a].last() * 100.0 => gauge[a].value;
        20::ms => now;
    }
}

//await slider movment
function void slid_event (int b){
    while (true){
        slider[b] => now;
        slider[b].value() => bus.chan[b].gain;
    }
}

//setup interface for each bus
for(0 => int i; i < 4; i++ ){
    cip_gui.addElement (gauge[i]);
    gauge[i].position(0,(i * 60));
    cip_gui.addElement (slider[i]);
    label[i] => slider[i].name;
    slider[i].position(0,(i * 60));
    spork ~ lev_mon(i);
    spork ~ slid_event(i);
    0 => bus.chan[i].gain;
}

//draw display    
cip_gui.display();

//live forever
while(true) {
    1::hour => now;
}