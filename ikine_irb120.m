function q=ikine_irb120(T,q0)
syms q1 q2 q3 q4 q5 q6 l1 l2 l3 l4 l5 real
syms nx ox ax px ny oy ay py nz oz az pz real

l1=0.290;
l2=0.270;
l3=0.070;
l4=0.302;
l5=0.072;

A01=MDH([q0(1) l1 0 -pi/2]);
A12=MDH([q0(2)-pi/2 0 l2 0]);
A23=MDH([q0(3) 0 l3 -pi/2]);
A34=MDH([q0(4) l4 0 pi/2]);
A45=MDH([q0(5) 0 0 -pi/2]);
A56=MDH([q0(6)+pi l5 0 0]);

Tm=[nx ox ax px; ny oy ay py; nz oz az pz; 0 0 0 1];

pm=T*[0 0 -l5 1]'; %I assign a random value to the robot's wrist
pmx=pm(1);
pmy=pm(2);
pmz=pm(3);

%Getting q1
T1=inv(A01)*Tm;
T1=simple(T1);

q1_possibles=[atan2(pmy,pmx) atan2(-pmy,-pmx)];
q1_diffs=abs([angdiff(q1_possibles(1),q0(1)) angdiff(q1_possibles(2),q0(1))]);
[minimum,index]=min(q1_diffs);
q1=q1_possibles(index);

%Getting A, B, beta and t

A=pmx*cos(q1)+pmy*sin(q1);
B=pmz-l1;
beta=atan(l3/l4);
t=((l2^2)+(l3^2)+(l4^2)-(A^2)-(B^2))/(2*l2*sqrt((l3^2)+(l4^2)));

%Getting q3

q3_possibles=[atan2(t,sqrt(1-t^2))+beta atan2(t,-sqrt(1-t^2))+beta];
q3_diffs=abs([angdiff(q3_possibles(1),q0(3)) angdiff(q3_possibles(2),q0(3))]);
[minimum3,index3]=min(q3_diffs);
q3=q3_possibles(index3);

    
%Getting q2
            
K1=(l2+(l3*cos(q3))-(l4*sin(q3)))/((l4*cos(q3))+(l3*sin(q3)));
q2=atan2((A*K1)-B,A+(B*K1));

%Getting q4, q5 and q6

R06=t2r(T);
A01=MDH([q1 l1 0 -pi/2]);
A12=MDH([q2-pi/2 0 l2 0]);
A23=MDH([q3 0 l3 -pi/2]);
A03=A01*A12*A23;

R03=t2r(A03);
R36=inv(R03)*R06; 

A36=A34*A45*A56;

%Getting q5
q5=acos(R36(3,3));
q5_possibles=[q5 -q5];
q5_diffs=abs([angdiff(q5_possibles(1),q0(5)) angdiff(q5_possibles(2),q0(5))]);
[minimum5,index5]=min(q5_diffs);
q5=q5_possibles(index5);

%Getting q4 and q6

if q5==0
    q46=atan2(R36(1,2),-R36(2,2));
    q4=q0(4);
    q6=angdiff(q46,q4);
else
    q4=atan(R36(2,3)/R36(1,3));
    if(R36(1,3)/-sin(q5))<0
    q4=angdiff(q4+pi);
    end
    q6=atan((R36(3,2))/(-R36(3,1)));
    if(R36(1,3)/-sin(q5))<0 
    q6=angdiff(q6+pi);
    end
end

q=[q1 q2 q3 q4 q5 q6];    
    
end


