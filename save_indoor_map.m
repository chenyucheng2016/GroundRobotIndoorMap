% save_indoor_map.m
% Dongheng Jing
% 1/29/2020
clear
% close all
clc

%% unmovable obstacles
B1 = [[0;0], [29;0], [29;110], [0;110]] *0.0254; % m
B2 = [[281;-35], [281;39], [249;39], [249;-35]] *0.0254;
B3 = [[281;103], [281;133], [261;133], [261;103]] *0.0254;
B4 = [[281;133], [281;195], [249;195], [249;133]] *0.0254;
B5 = [[281;195], [281;298], [266;298], [266;195]] *0.0254;
B6 = [[281;298], [281;373], [0;373], [0;298]] *0.0254;
B7 = [[37;110], [37;298], [0;298], [0;110]] *0.0254;
B8 = [[0;0], [157;0], [157;-59], [0;-59]] *0.0254;
B9 = [[227.5;-35], [281;-35], [281;-59], [227.5;-59]] *0.0254;

%% movable obstacles
% shapes and rotation
hex = @(d) d*[[1/2;0],[1/4;sqrt(3)/4],[-1/4;sqrt(3)/4],[-1/2;0],[-1/4;-sqrt(3)/4],[1/4;-sqrt(3)/4]];
rec = @(w,h) [[1/2*w;1/2*h],[-1/2*w;1/2*h],[-1/2*w;-1/2*h],[1/2*w;-1/2*h]];
r = @(theta) [cos(theta), -sin(theta); sin(theta), cos(theta)];
% walls
B10 = (rec(52,5) + [65;207.5]) *0.0254;
B11 = (r(pi/2)*rec(52,5) + [156;272]) *0.0254;
B12 = (rec(75,4) + [213;149]) *0.0254;
B13 = (r(pi/2)*rec(73,3.25) + [124;36.5]) *0.0254;
% obstacles
B14 = (r(pi/2)*rec(20,22) + [270;45]) *0.0254;
B15 = (rec(18,18) + [185;138]) *0.0254;
B16 = (rec(18,18) + [204;199]) *0.0254;
B17 = (rec(18,18) + [51;20]) *0.0254;
B18 = (rec(18,15) + [69;107.5]) *0.0254;
B19 = (r(pi/2)*rec(60,24) + [135;176]) *0.0254;
%targets
woodbox = rec(13,8);
cardbox = rec(14.5,10.25);
B20 = (r(pi/2)*cardbox + [134;265]) *0.0254; 
B21 = (r(pi/2)*cardbox + [85;226]) *0.0254;
B22 = (r(pi/2)*woodbox + [128;180]) *0.0254;
B23 = (rec(9,9) + [214;100]) *0.0254; % basketball
B24 = (rec(7,7) + [204;265]) *0.0254; % watermelon
B25 = (r(pi*75/180)*rec(7,3.5) + [96;20]) *0.0254; % book
B26 = (r(pi/2)*rec(21.5,8) + [40;64.5]) *0.0254; % monitor
B27 = (rec(4,4) + [48;167]) *0.0254; % apple
B28 = (rec(4,4) + [92;267]) *0.0254;
B29 = (rec(5,5) + [87;200]) *0.0254; % orange
B30 = (r(-pi/4)*woodbox + [230;242]) *0.0254; 

%% B_verts
B_verts = {B1,B2,B3,B4,B5,B6,B7,B8,B9,...
           B10,B11,B12,B13,B14,...
           B15,B16,B17,B18,...
           B19,B20,B21,B22,B23,B24,B25,B26,...
           B27,B28,B29,...
           B30};

%% Targets
T_verts =[[230;242], [134;265], [85;226], [128;180],...
          [214;100], [204;265],...
          [96;20], [40;64.5],...
          [48;167], [92;267], [87;200]] *0.0254;

%% worksapce
workspace = sensor_workspace([0, 281, -59, 373] *0.0254, T_verts, B_verts);
save('workspace_indoor.mat','workspace')

%% draw
figure(1)
hold on

scatter([230,128]*0.0254,[242,180]*0.0254,'rs') % wooden box
scatter([134,85]*0.0254,[265,226]*0.0254,'ks') % card box
scatter(214*0.0254,100*0.0254,'o','MarkerEdgeColor',[0.5,0.25,0.125]) % basketball
scatter(204*0.0254,265*0.0254,'go') % watermelon
scatter(96*0.0254,20*0.0254,'kd') % book
scatter(40*0.0254,64.5*0.0254,'k+') % monitor
scatter([48,92]*0.0254,[167,267]*0.0254,'g*') % apple
scatter(87*0.0254,200*0.0254,'*','MarkerEdgeColor',[1,0.5,0]) % orange

draw_workspace(workspace)
axis equal
axis(workspace.limits)

legend('wooden box','card box','basketball','watermelon',...
       'book','monitor','apple','orange','fontsize',16)
   
xlabel('m','fontsize',14)
ylabel('m','fontsize',14)