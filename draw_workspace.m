function draw_workspace(workspace)
% draws the workspace which consists of obstacle polygons and point
% targets.


%hold on;


% plot obstacles
for idx = 1:length(workspace.obstacles)
    
    if idx == length(workspace.obstacles)
        plot(workspace.obstacles(idx),'FaceColor','k','FaceAlpha',0.2); hold on;
    else
        plot(workspace.obstacles(idx),'FaceColor','k','FaceAlpha',0.5); hold on;
    end
end

% plot targets
% plot(workspace.targets(1,:),workspace.targets(2,:),'go',...
%     'MarkerFaceColor','g');



end




