pragma circom 2.0.0;

 

template RoopCircuit () {  
//signals inputs

signal input a;
signal input b;

//signals from gates
signal X;
signal Y;

//final signal output

signal output Q;

//component gates used to create custom circuit

component ANDgate=AND();
component NOTgate=NOT();
component ORgate=OR();

//logic of the circuit

 ANDgate.a <== a;
 ANDgate.b <== b;
 X <== ANDgate.out;

 NOTgate.in <== b;
 Y <== NOTgate.out;

 ORgate.c <==X;
 ORgate.d <==Y;
 Q <== ORgate.out;

 
log(Q);
}

 template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}



template OR() {
    signal input c;
    signal input d;
    signal output out;

    out <== c + d - c*d;
}

component main = RoopCircuit();