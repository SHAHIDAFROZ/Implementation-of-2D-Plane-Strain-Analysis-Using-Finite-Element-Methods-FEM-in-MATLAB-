function drawingMesh(nodeCoordinates,elementNodes,lineType)
%drawingMesh mesh representation for 1D and 2D FEs
% Input data required
%
% nodeCoordinates : Cartesian coordinates of the nodes
% elementNodes    : Element connectivity
% elementType     : Type of element (e.g. linear, quadratic, etc.)
% lineType        : Type of line for plotting purposes
%

%%

% resize the vector to suit 2d and 3d problems (beams)
if size(nodeCoordinates,2) == 2
    nodeCoordinates(end,3) = 0;
end


for k = 1:size(elementNodes,1)
    patch(nodeCoordinates(elementNodes(k,:),1),nodeCoordinates(elementNodes(k,:),2),'w','FaceColor','none','LineStyle',lineType,'EdgeColor','k')
end
end 

