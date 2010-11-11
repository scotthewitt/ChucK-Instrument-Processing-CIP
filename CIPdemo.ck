//invoke classes

CIPDelay i;
CIPRz r;
CIPRev rv;

//change defaults
i.delaylength(8000);

//route audio
//class.chipping(busin, busout)
spork ~ i.chipping(0, 1);
spork ~ r.chipping(1, 2);
spork ~ rv.chipping(2, 3);

//setup exit
i.exitevent => now;