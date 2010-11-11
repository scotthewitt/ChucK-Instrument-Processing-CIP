public class Interface extends CIPpatch
{  
    0 => int numberofsliders;
    
    // slider label, min slider value, max slider value 
    function MAUI_Slider effectinterface(string label, float min, float max)
    {       
        MAUI_Slider slider;
        cip_eff_gui.addElement (slider);
        label => slider.name;
        slider.precision(6);
        slider.range(min, max);
        slider.position(0, (numberofsliders * 100 + 100));
        min => slider.value;
        cip_eff_gui.display();
        numberofsliders++;
        return slider;
    }
}