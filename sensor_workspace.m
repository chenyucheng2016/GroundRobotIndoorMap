% sensor_workspace.m
% Jake Gemerek
% 12/6/18
%
% Map contains details for a workspace, such as the workspace limits,
% target positions, and obstacle polygons.
%
classdef sensor_workspace
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    properties
        limits;
        targets;
        obstacles;
        obstacle_union;
        num_targets;
        num_obstacles;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    methods
        % -------------------------- CONSTRUCTOR ------------------------ %
        function obj = sensor_workspace(lims,T_verts,B_verts)
            obj.limits = lims;
            obj.num_targets = length(T_verts);
            obj.num_obstacles = length(B_verts);
            obj.obstacles = [];
            for m = 1:length(B_verts)
                
                obj.obstacles = ...
                    [obj.obstacles, ...
                    polyshape(B_verts{m}(1,:),B_verts{m}(2,:))];
                
                if ~isempty(obj.obstacle_union)
                    obj.obstacle_union = ...
                        union(obj.obstacle_union,obj.obstacles(end));
                else
                    obj.obstacle_union = obj.obstacles(end);
                end
            end
            obj.obstacle_union = polybuffer(obj.obstacle_union,0.01);
            % obj.obstacle_union = union(obj.obstacles(1:end-1), obj.obstacles(end));

            obj.targets = T_verts;

            
            
        end
        % --------------------------- FUNCTIONS ------------------------- %
       
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end










