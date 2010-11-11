public class CIPDelay extends Interface
{
    in => Delay d => out;    
    "Delay" => effecttype_name;
    
    4000 => int maxdelaytime;
    maxdelaytime * 1::ms => d.max;
    
    function void slid_event (MAUI_Slider s){
        while (true){
            s => now;
            s.value() * 1::ms => d.delay;
            <<<s.value(), "del length">>>;
        }  
    }
    
    function void delaylength(int dd)
    {
        dd => maxdelaytime;
        maxdelaytime * 1::ms => d.max;
    }
    
    function void chipping(int a, int b)
    {
        connect(a, b);
        spork ~ slid_event(effectinterface("Delay Length", 0.0, maxdelaytime));
        cip_eff_gui.size(500, (numberofsliders * 100)+ 100);
        exitevent => now;
        disconnect(a, b);
    }   
}