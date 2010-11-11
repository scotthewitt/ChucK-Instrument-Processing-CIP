public class CIPDSPexample extends Interface
{
    //DSP chain begins with 'in' and ends with out 
    in => Delay d => out;
    //name of effect    
    "Delay" => effecttype_name;
    
    //effect value setup
    4000::ms => d.max;
    
    //functions to change set values
    function void delaylength(dur dd)
    {
        dd => d.max;
    }
    
    //link slider event (range 0.00 - 1.00) to value
    function void slid_event (MAUI_Slider s){
        while (true){
            s => now;
            <<<s.value(), "del length">>>;
            s.value() * d.max() => d.delay;
        }  
    }
    
    //main called function
    function void chipping(int a, int b)
    {
        connect(a, b);
        spork ~ slid_event(effectinterface("Slider Name"));
        cip_eff_gui.size(500, (numberofsliders * 100)+ 100);
        exitevent => now;
    }   
}