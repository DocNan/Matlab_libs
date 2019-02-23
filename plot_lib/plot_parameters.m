function plot_parameters(varargin)
% set default plot parameters of a figure. Used in a figure after plot.
% plot_parameters(axis,0) will not plot the grids, default set grid on.
% varargin{1} = i_gird
%   i_grid == 1 set grids on
%   i_grid == 0 set grids off
% varargin{2} = i_xtick
%   i_xtick == 1 display xticklabel
%   i_xtick == 0 remove xticklabel for axes(1:length(axes)-1)
% usage example:
%   plot_parameters();
%   plot_parameters(ax);
%   plot_parameters(ax, 1);
%   plot_parameters(ax, 1, 1);
% By Nan CHU on 2018.04.18
% ******************************************************************************
i_test = 0;

if i_test==1
    close all;clc;
    x=0:0.05:2;
    y=randn(size(x));
    figure();
    plot(x,y,'-');
    xlabel('x');
    ylabel('y');
    legend('leg');
    title('test');
    ax=[];
    i_grid=1;
end

if nargin==0
    ax=[];
    i_grid=1;
    i_xtick = 0;
elseif nargin==1
    ax=varargin{1};
    i_grid=1;
    i_xtick = 0;
elseif nargin==2
    ax=varargin{1};
    i_grid=varargin{2};
    i_xtick = 0;
elseif nargin == 3
    ax=varargin{1};
    i_grid=varargin{2};
    i_xtick = varargin{3};
end

% display minorticks for x and y axis
if isempty(ax) == 1
    set(gca,'XMinortick','on','YMinorTick','on','TickLength',[0.03,0.06]);
    set(gca,'FontSize',15,'LineWidth',1.5);
    set(gca,'box','on');
    if i_grid == 1
        grid on;
        set(gca,'GridLineStyle','--','GridAlpha',0.3);
    end
elseif isempty(ax) == 0
    set(ax,'XMinortick','on','YMinorTick','on','TickLength',[0.03,0.06]);
    set(ax,'FontSize',15,'LineWidth',1.5);
    set(ax,'box','on');
    if i_grid == 1
        for i=1:length(ax)
            % "grid on" must be set one by one using loop for each axis.
            grid(ax(i),'on');
        end
        set(ax,'GridLineStyle','--','GridAlpha',0.3);
    end
end

% link x axis for the subplot figures
if isempty(ax) == 1
    ax = gca();
    linkaxes(ax, 'x');
else
    linkaxes(ax, 'x');
end

% remove the 1:n-1 xticklabels for subplot
if length(ax) > 1 && i_xtick == 0
    set(ax(1:length(ax)-1), 'XTickLabel', []);
end
end
