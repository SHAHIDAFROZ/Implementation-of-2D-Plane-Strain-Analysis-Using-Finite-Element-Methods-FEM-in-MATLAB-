function [node, element] = rectangularMesh(Lx, Ly, nelemX, nelemY)

% element size
deltaX = Lx/nelemX;
deltaY = Ly/nelemY;

        
nodesX = nelemX+1;
nodesY = nelemY+1;
        
% nodal coordinates
node = [];
for j = 1:nodesY
    for i = 1:nodesX
        x = (i-1)*deltaX;
        y = (j-1)*deltaY;
        node = [node; x y];
    end
end
        
% connectivity
element = [];
for j = 1:nelemY
    for i = 1:nelemX
        i1 = i+(j-1)*nodesX;
        i2 = i1+1;
        i3 = i2+nodesX;
        i4 = i1+nodesX;
        element = [element; i1 i2 i3 i4];
     end
end
end   
 