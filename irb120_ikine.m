function q=irb120_ikine(T,q0)

tam=size(T)

if length(tam)==2 %If the dimension of T is not greater than 2x2, we only do once function ikine_irb120
    q=ikine_irb120(T,q0);
else %If the dimension of T is greater than 2x2, then we need to use more than once T matrix
   N=tam(3); 
   for i=1:N
       q(i,:)=ikine_irb120(T(:,:,i),q0); %Here I calculate each q of each T until T size.
       q0=q(i,:); %Here q0 is equal to the previous q.
   end
end
end
