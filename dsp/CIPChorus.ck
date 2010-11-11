public class CIPChorus extends Interface
{
    //DSP chain begins with 'in' and ends with out 
    in => Chorus c => out;
    //name of effect    
    "Chorus" => effecttype_name;
    
    //effect value setup
    
    
    //link slider event (range 0.00 - 1.00) to value
    function void slid_event (MAUI_Slider s){
        while (true){
            s => now;
            <<<s.value(), "modFreq">>>;
            s.value() => c.modFreq;
        }  
    }
    
    //link slider event (range 0.00 - 1.00) to value
    function void slid_eventA (MAUI_Slider s){
        while (true){
            s => now;
            <<<s.value(), "modDepth">>>;
            s.value() => c.modDepth;
        }  
    }
    
    //main called function
    function void chipping(int a, int b)
    {
        connect(a, b);
        spork ~ slid_event(effectinterface("Mod Freq", 0.1, 400));
        spork ~ slid_eventA(effectinterface("Mod Depth", 0.1, 2));
        cip_eff_gui.size(500, (numberofsliders * 100)+ 100);
        exitevent => now;
        disconnect(a, b);
    }   
}