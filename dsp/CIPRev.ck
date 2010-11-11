public class CIPRev extends Interface
{
    //DSP chain begins with 'in' and ends with out 
    in => JCRev rev => out;
    //name of effect    
    "Reverb" => effecttype_name;
    
    
    
    //effect value setup
    0.0 => rev.mix;
    
    //link slider event (range 0.00 - 1.00) to value
    function void slid_event (MAUI_Slider s){
        while (true){
            s => now;
            <<<s.value(), "Reverb Mix">>>;
            s.value() => rev.mix;
        }  
    }
    
    //main called function
    function void chipping(int a, int b)
    {
        connect(a, b);
        spork ~ slid_event(effectinterface("Reverb", 0.0, 1.0));
        cip_eff_gui.size(500, (numberofsliders * 100)+ 100);
        exitevent => now;
        disconnect(a, b);
    }   
}