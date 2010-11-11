public class CIPRz extends Interface
{
    in => ResonZ rz => out;    
    "ResonZ" => effecttype_name;  
    
    function void slid_event (MAUI_Slider s){
        while (true){
            s => now;
            s.value() => rz.freq;
            <<<rz.freq(), "RZ freq">>>;
        }  
    }
    
    function void slid_eventQ (MAUI_Slider s){
        while (true){
            s => now;
            s.value() => rz.Q;
            <<<rz.Q(), "RZ Q">>>;
        }  
    }
    
    function void chipping(int a, int b)
    {
        connect(a, b);
        spork ~ slid_event(effectinterface("Rz freq", 100, 2000));
        spork ~ slid_eventQ(effectinterface("Rz Q", 0 , 5));
        cip_eff_gui.size(500, (numberofsliders * 100)+ 100);
        exitevent => now;
        disconnect(a, b);
    }   
}