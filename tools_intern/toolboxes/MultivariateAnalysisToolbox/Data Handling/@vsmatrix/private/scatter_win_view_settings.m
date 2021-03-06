function scatter_win_view_settings(ud)

% SCATTER_WIN_VIEW_SETTINGS opens a window for selecting view settings (scatter).
% -----------------------------
% scatter_win_view_settings(ud)
% -----------------------------
% Description: opens a window for selecting view settings (scatter).
% Input:       {ud} userdata of parent window.

% � Liran Carmel
% Classification: Visualization
% Last revision date: 10-Jan-2005

% open window
fig = figure('menubar','none','position',[300 300 200 360],...
    'numbertitle','off','name','View Settings');

% define editable text
delta = 1/16;
yy = 1 - delta;
height = 0.8*delta;
uicontrol(fig,'style','text','horizontal','left',...
    'units','normalized','position',[0.05 yy 0.9 height],...
    'string','View Data','background',[0.8 0.8 0.8]);
yy = yy - delta;
uicontrol(fig,'style','text','string','marker size:',...
    'units','normalized','position',[0.15 yy 0.6 height],...
    'background',[0.8 0.8 0.8],'horizontal','left');
h_ed(1) = uicontrol(fig,'style','edit','string',num2str(64),...
    'units','normalized','position',[0.75 yy 0.2 height],...
    'background',[0.8 0.8 0.8],'horizontal','left');
yy = yy - delta;
h_ch(6) = uicontrol(fig,'style','check','horizontal','left',...
    'units','normalized','position',[0.15 yy 0.8 height],...
    'string','Plot point edges','background',[0.8 0.8 0.8]);
yy = yy - delta;
h_ch(7) = uicontrol(fig,'style','check','horizontal','left',...
    'units','normalized','position',[0.15 yy 0.8 height],...
    'string','Randomize points order','background',[0.8 0.8 0.8]);
yy = yy - delta;
h_ch(1) = uicontrol(fig,'style','check','horizontal','left',...
    'units','normalized','position',[0.05 yy 0.9 height],...
    'string','View Grouping','background',[0.8 0.8 0.8],...
    'callback','scatter(vsmatrix,301)');
yy = yy - delta;
h_ch(2) = uicontrol(fig,'style','check','horizontal','left',...
    'units','normalized','position',[0.15 yy 0.8 height],...
    'string','View Legend','background',[0.8 0.8 0.8]);
yy = yy - delta;
h_ch(3) = uicontrol(fig,'style','check','horizontal','left',...
    'units','normalized','position',[0.05 yy 0.9 height],...
    'string','View Centroids','background',[0.8 0.8 0.8],...
    'callback','scatter(vsmatrix,302)');
yy = yy - delta;
h_txt(1) = uicontrol(fig,'style','text','string','marker size:',...
    'units','normalized','position',[0.15 yy 0.6 height],...
    'background',[0.8 0.8 0.8],'horizontal','left');
h_ed(2) = uicontrol(fig,'style','edit','string',num2str(64),...
    'units','normalized','position',[0.75 yy 0.2 height],...
    'background',[0.8 0.8 0.8],'horizontal','left');
yy = yy - delta;
h_ch(4) = uicontrol(fig,'style','check','horizontal','left',...
    'units','normalized','position',[0.15 yy 0.8 height],...
    'string','View Ellipses','background',[0.8 0.8 0.8],...
    'callback','scatter(vsmatrix,303)');
yy = yy - delta;
h_txt(2) = uicontrol(fig,'style','text','string','# STDs:',...
    'units','normalized','position',[0.25 yy 0.5 height],...
    'background',[0.8 0.8 0.8],'horizontal','left');
h_ed(3) = uicontrol(fig,'style','edit','string',num2str(1),...
    'units','normalized','position',[0.75 yy 0.2 height],...
    'background',[0.8 0.8 0.8],'horizontal','left');
yy = yy - delta;
h_txt(3) = uicontrol(fig,'style','text','string','# points:',...
    'units','normalized','position',[0.25 yy 0.5 height],...
    'background',[0.8 0.8 0.8],'horizontal','left');
h_ed(4) = uicontrol(fig,'style','edit','string',num2str(40),...
    'units','normalized','position',[0.75 yy 0.2 height],...
    'background',[0.8 0.8 0.8],'horizontal','left');
yy = yy - delta;
h_txt(4) = uicontrol(fig,'style','text','string','line width:',...
    'units','normalized','position',[0.25 yy 0.5 height],...
    'background',[0.8 0.8 0.8],'horizontal','left');
h_ed(5) = uicontrol(fig,'style','edit','string',num2str(0.5),...
    'units','normalized','position',[0.75 yy 0.2 height],...
    'background',[0.8 0.8 0.8],'horizontal','left');
yy = yy - delta;
h_ch(5) = uicontrol(fig,'style','check','horizontal','left',...
    'units','normalized','position',[0.05 yy 0.9 height],...
    'string','View Axes','background',[0.8 0.8 0.8],...
    'callback','scatter(vsmatrix,304)');
yy = yy - delta;
h_txt(5) = uicontrol(fig,'style','text','string','line width:',...
    'units','normalized','position',[0.15 yy 0.6 height],...
    'background',[0.8 0.8 0.8],'horizontal','left');
h_ed(6) = uicontrol(fig,'style','edit','string',num2str(1),...
    'units','normalized','position',[0.75 yy 0.2 height],...
    'background',[0.8 0.8 0.8],'horizontal','left');

% define OK and Cancel buttons
uicontrol(fig,'style','push','string','O.K.',...
    'units','normalized','position',[0.125 0.5*delta 0.3 1.5*height],...
    'callback','scatter(vsmatrix,305)');
uicontrol(fig,'style','push','string','Cancel',...
    'units','normalized','position',[0.575 0.5*delta 0.3 1.5*height],...
    'callback','close(gcf)');

% initialize window to previos selection
set(h_ed(1),'string',num2str(ud.mark_size(1)));
set(h_ch(1),'value',ud.grp_view);
set(h_ch(2),'value',ud.leg_view);
if ~length(ud.data.groupings)   % no grouping information
    set(h_ch([1 3 7]),'enable','off');
end
if ~ud.grp_view
    set(h_ch(2),'enable','off');
end
set(h_ch(3),'value',ud.cent_view);
if ~ud.cent_view
    set(h_ed(2:5),'enable','off');
    set(h_ch(4),'enable','off');
    set(h_txt(1:4),'enable','off');
end
set(h_ed(2),'string',num2str(ud.mark_size(2)));
set(h_ch(4),'value',ud.ell_view);
if ~ud.ell_view
    set(h_ed(3:5),'enable','off');
    set(h_txt(2:4),'enable','off');
end
set(h_ed(3),'string',num2str(ud.std_ell));
set(h_ed(4),'string',num2str(ud.nop_ell));
set(h_ed(5),'string',num2str(ud.lw_ell));
set(h_ch(5),'value',ud.ax_view);
if ~ud.ax_view
    set(h_ed(6),'enable','off');
    set(h_txt(5),'enable','off');
end
set(h_ed(6),'string',num2str(ud.lw_ax));
set(h_ch(6),'value',ud.edges);
set(h_ch(7),'value',ud.randomize);
 
% define userdata
ud = struct('h_ed',h_ed,'h_ch',h_ch,'h_txt',h_txt,'main_fig',ud.main_fig);
set(gcf,'userdata',ud);