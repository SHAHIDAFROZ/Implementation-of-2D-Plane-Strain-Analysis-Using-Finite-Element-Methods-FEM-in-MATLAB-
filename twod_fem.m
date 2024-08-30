clc;
clear;

E       = 10e7;
poisson = 0.30;
C       = E/(1-poisson^2)*[1 poisson 0;poisson 1 0;0 0 (1-poisson)/2]; %elasticity matrix
P       = 1e6;
Lx      = 5;
Ly      = 1;


numberelementx = 20;
numberelementy = 10;
numberelement  = numberelementy*numberelementx;

[nodecoordinates,elementnodes] = rectangularMesh(Lx,Ly,numberelementx,numberelementy);
xx = nodecoordinates(:,1);
yy = nodecoordinates(:,2);

drawingMesh(nodecoordinates,elementnodes,'-');
numbernodes =   size(xx,1);
GDof        =   2*numbernodes;

stiffness   =   formStiffnessMass2D(GDof,numberelement,elementnodes,numbernodes,nodecoordinates,C);

%boundary condition
fixednodex    =   find(nodecoordinates(:,1)==0);
fixednodey    =   find(nodecoordinates(:,2)==0);
prescribedDof =   [fixednodex;fixednodey+numbernodes];



%force vector
force       =   zeros(GDof,1);
rightBord   =   find(nodecoordinates(:,1)==Lx);
force(rightBord)        =   P*Ly/numberelementy;
force(rightBord(1))     =   P*Ly/numberelementy/2;
force(rightBord(end))   =   P*Ly/numberelementy/2;


%solution
displacements   =   solution(GDof,prescribedDof,stiffness,force);
 
 
%displacements
disp('Displacements');
jj  =   1:GDof;format("default")
f   =   [jj;displacements'];
fprintf('node U\n')
fprintf('%3d%12.8f\n',f)
UX  =   displacements(1:numbernodes);
UY  =   displacements(numbernodes+1:GDof);
scaleFactor =   10;


%deformedshape
figure
drawingField(nodecoordinates+scaleFactor*[UX UY],elementnodes,UX);%UXX
hold on
drawingMesh(nodecoordinates+scaleFactor*[UX UY],elementnodes,'-');
drawingMesh(nodecoordinates,elementnodes,'--');
colorbar
title('Displacementfieldu_x(ondeformedshape)')
axis off









 