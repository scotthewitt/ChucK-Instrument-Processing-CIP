4 => int maxchannels;

public class bus
{
    static Gain @ chan[maxchannels];
}
new Gain[maxchannels] @=> bus.chan;

//CIP v2

<<< "CIP v2 : Chuck Instrument Processing">>>;
<<< "@scotthewitt cip.ablelemon.co.uk">>>;

//basic audio routing
adc => bus.chan[0] => blackhole;
bus.chan[1] => blackhole;
bus.chan[2] => blackhole;
bus.chan[3] => dac;

//live forever
while(true) {
    1::hour => now;
}
