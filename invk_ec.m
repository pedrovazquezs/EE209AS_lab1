syms q1 q2 q3 q4 q5 q6 l1 l2 l3 l4 l5 l6 real
syms nmx omx amx pmx nmy omy amy pmy nmz omz amz pmz real

A01 = MDH ([q1, l1, 0, -pi/2]);
A12 = MDH ([q2-(pi/2) 0 l2 0]);
A23 = MDH ([q3 0 l3 -pi/2]);
A34 = MDH ([q4 l4 0 pi/2]);
A45 = MDH ([q5 0 0 -pi/2]);
A56 = MDH ([q6+pi l5 0 0]);


T=A01*A12*A23*A34*A45*A56;
T=simple(T);

Tm=[nmx omx amx pmx; nmy omy amy pmy; nmz omz amz pmz; 0 0 0 1];

%%%%Calculating q1%%%%
T1=inv(A01)*Tm;
T1=simple(T1);
T1=transl(T1)
M1=A12*A23*A34;
M1=transl(simple(M1))

%%%%Calculating q2,q3%%%%
T1=simple(inv(A01)*Tm);
T2=inv(A12)*T1;
T2=simple(T2);
T2=transl(T2);
M2=A23*A34;
M2=transl(simple(M2));

%%%%Calculating q4, q5 q6%%%%
A03=A01*A12*A23;
A03=simple(A03);
R03=t2r(A03);
R03=simple(R03);
R06=t2r(T);
R06=simple(R06);
A36=A34*A45*A56;
A36=simple(A36);
R36=t2r(A36);
R36=simple(A36);










