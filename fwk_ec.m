syms q1 q2 q3 q4 q5 q6 l1 l2 l3 l4 l5 l6

A01 = MDH ([q1, l1, 0, -pi/2]);
A12 = MDH ([q2-(pi/2) 0 l2 0]);
A23 = MDH ([q3 0 l3 -pi/2]);
A34 = MDH ([q4 l4 0 pi/2]);
A45 = MDH ([q5 0 0 -pi/2]);
A56 = MDH ([q6+pi l5 0 0]);


T=A01*A12*A23*A34*A45*A56;
T=simple(T)

l1=0.290; l2=0.270; l3=0.070; l4=0.302; l5=0.072;

position=input('Choose the position of the robot: 1(standing), 2(moving box), 3(placing box): ');

    if position==1
       q1=pi/2; q2=-pi/2; q3=pi; q4=0; q5=0; q6=0;
    end
     if position==2
       q1=0; q2=pi/4; q3=-pi/4; q4=0; q5=0; q6=0;
     end
     if position==3
       q1=-pi/2; q2=-pi/2; q3=pi; q4=0; q5=0; q6=0;
     end
T_position=eval(T)
