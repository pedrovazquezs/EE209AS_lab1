%First step is to load the robot
irb120;

T1=transl(0.3,0,0)*troty(pi/2); %First position
T2=transl(-0.3,0,0)*troty(pi/2)*transl(0,-0.3,0); %Last position

p1=irb120_ikine(T1,[0 0 0 0 0 0]) %Point A
p2=irb120_ikine(T2,[0 0 0 0 0 0]) %Point B

t=[0:0.05:2];%Time vector
qa=jtraj(p1,p2,t); %jtraj gets the trajectory between A and B

%%%%Trajectory%%%%
figure(1)
irb120.plot(qa) 

figure(2) 
plot(t,qa);grid on;title('Trajectories');
legend('q1','q2','q3','q4','q5','q6');