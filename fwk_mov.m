l1=0.290; l2=0.270; l3=0.070; l4=0.302; l5=0.072;

L(1)=Link([0 l1 0 -pi/2]);
L(2)=Link([0 0 l2 0]);
L(3)=Link([0 0 l3 -pi/2]);
L(4)=Link([0 l4 0 pi/2]);
L(5)=Link([0 0 0 -pi/2]);
L(6)=Link([0 l5 0 0]);

irb120=SerialLink (L)
irb120.offset=[0 -pi/2 0 0 0 pi];

position=input('Choose the position of the robot: 1(standing), 2(taking box), 3(placing box): ');

    if position==1
       q=[pi/2 -pi/2 pi 0 0 0];
    end
     if position==2
       q=[0 pi/4 -pi/4 0 0 0];
     end
     if position==3
       q=[-pi/2 -pi/2 pi 0 0 0];
     end

irb120.fkine(q)
irb120.plot(q)
