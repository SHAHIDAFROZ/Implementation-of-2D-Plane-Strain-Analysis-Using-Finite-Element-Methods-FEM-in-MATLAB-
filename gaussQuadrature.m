function [weights,locations] = gaussQuadrature(~)
% Gauss quadrature for 2D elements
% locations: Gauss point locations
% weights: Gauss point weights
locations = [ -0.577350269189626 -0.577350269189626;
               0.577350269189626 -0.577350269189626;
               0.577350269189626  0.577350269189626;
              -0.577350269189626  0.577350269189626];
weights = [1;1;1;1];
        
   
end  