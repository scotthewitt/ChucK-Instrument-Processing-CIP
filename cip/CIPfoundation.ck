public class CIPpatch
{
    UGen in;
    UGen out;
    
    //exit button event
    Event exitevent;
    
    //name for window top
    string effecttype_name;
    
    //GUI
    MAUI_View cip_eff_gui;
    
    //input signal meter
    MAUI_Gauge gaugemaster;
    cip_eff_gui.addElement (gaugemaster);
    gaugemaster.position(0,0);    
    
    //input gain slider
    MAUI_Slider input_gain_fader;
    cip_eff_gui.addElement (input_gain_fader);
    "Input Volume" => input_gain_fader.name;
    0.0 => input_gain_fader.value;
    input_gain_fader.position(0,20);
    
    0.0 => in.gain;
    
    //effect quit button
    MAUI_Button exitbutton;
    exitbutton.pushType();
    exitbutton.name("Exit");
    cip_eff_gui.addElement (exitbutton);
    exitbutton.position(325, 0);
    
    //input monitor
    function void lev_mon(){
        while (true){
            in.last() * 100.0 => gaugemaster.value;
            20::ms => now;
            //<<<"i work">>>;
        }
    }
    
    //input slider
    function void inputgain (){
        while (true){
            input_gain_fader => now;
            input_gain_fader.value() => in.gain;
        }
    }
    
    //exit button event
    function void exitbutton_event (){
        while (true){
            exitbutton => now;
            cip_eff_gui.name("dead");
            exitevent.broadcast();
        }
    }
    
    //spork interface elements
    spork ~ lev_mon();
    spork ~ inputgain();
    spork ~ exitbutton_event();
    
    //audio in and out of effect
    function void connect(int u, int k)
    {
        bus.chan[u] => in;
        out => bus.chan[k];
        cip_eff_gui.name( "bus.chan["+Std.itoa(u)+"] => "+effecttype_name+"=> bus.chan[" + Std.itoa(k) +"]" );
    }

    //audio disconnect
    function void disconnect(int u, int k)
    {
        bus.chan[u] =< in;
        out =< bus.chan[k];
        cip_eff_gui.name( "Disconnected => "+effecttype_name+"=> Disconnected" );
    }
    
}