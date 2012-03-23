// Hewitt OSC Base 

public class OSCBase
{

"/hewittOscBase/notset" => string NameSpace;

10000 => int  portNumber;

// send object
OscSend xmit;

//aim osc sender
function void aim(string ipTarget, int portNumber)
        {
                xmit.setHost(ipTarget, portNumber);
        }


//set target namespace
function void SetNameSpace(string NameSpaceIn)
{
	NameSpaceIn => NameSpace;
}

function void MakeAndSendOSC(float ff)
{
	xmit.startMsg( NameSpace, "f" );
	ff => xmit.addFloat;
	<<< NameSpace, ff >>>;
}

function void MakeAndSendOSC(int ss)
{
        xmit.startMsg( NameSpace, "i" );
        ss => xmit.addInt;
        <<< NameSpace, ss >>>;
}

function void MakeAndSendOSC(int ss, int s2)
{
        xmit.startMsg( NameSpace, "i i" );
        ss => xmit.addInt;
	s2 => xmit.addInt;
        <<< NameSpace, ss, s2 >>>;
}


function void MakeAndSendOSC(string s1)
{
        xmit.startMsg( NameSpace, "s" );
        s1 => xmit.addString;
        <<< NameSpace, s1 >>>;
}  

function void MakeAndSendOSC(string s1, string s2, string s3)
{
        xmit.startMsg( NameSpace, "s, s, s" );
        s1 => xmit.addString;
s2 => xmit.addString;
s3 => xmit.addString;
        <<< NameSpace, s1, s2, s3 >>>;
}

function void MakeAndSendOSC(string s1, string s2, string s3, string s4, string s5)
{
        xmit.startMsg( NameSpace, "s, s, s, s, s" );
        s1 => xmit.addString;
s2 => xmit.addString;
s3 => xmit.addString;
s4 => xmit.addString;
s5 => xmit.addString;
        <<< NameSpace, s1, s2, s3, s4, s5 >>>;
}


//class_name.sendOSC("127.0.0.1", 10000, "/hello/letsgo", 0.5);
function void sendOSC(string s, int port, string ns, float f1)
{
aim(s, port);
SetNameSpace(ns);
MakeAndSendOSC(f1);
}

function void sendOSC(string s, int port, string ns, int i1)
{
aim(s, port);
SetNameSpace(ns);
MakeAndSendOSC(i1);
}

function void sendOSC(string s, int port, string ns, int i1, int i2)
{
aim(s, port);
SetNameSpace(ns);
MakeAndSendOSC(i1,i2);
}

function void sendOSC(string s, int port, string ns, string s1)
{
aim(s, port);
SetNameSpace(ns);
MakeAndSendOSC(s1);                
}

function void sendOSC(string s, int port, string ns, string f1, string f2, string f3)
{
aim(s, port);
SetNameSpace(ns);
MakeAndSendOSC(f1,f2,f3);
}

function void sendOSC(string s, int port, string ns, string f1, string f2, string f3, string f4, string f5)
{
aim(s, port);
SetNameSpace(ns);
MakeAndSendOSC(f1,f2,f3, f4, f5);
}

function void sendOSC(string s, int port, string ns)
{
aim(s, port);
SetNameSpace(ns);
MakeAndSendOSC(Std.rand2f(0.,1.));
}

}

//OSCBase hob;

//hob.sendOSC("127.0.0.1", 10000, "/hello/letsgo", 0.5);

//hob.sendOSC("127.0.0.1", 10000, "/hello/letsgo");

//10::ms => now;
