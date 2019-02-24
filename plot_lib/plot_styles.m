function type_styles = plot_styles(type)
% provid various line styles as well as marker styles
% Reference: 
% [1] https://www.mathworks.com/help/matlab/ref/linespec.html
% types available:
%   'Line'      : 4 
%   'Color'     : 7
%   'Marker'    : 11
%   'ColorLine' : 7*4
%   'LineMarker': 4*11
% Nan CHU on 2018.02.24
% ******************************************************************************
if nargin == 0
  clc; close all;
  type = 'LineMarker';
end

colors  = {'Blue', 'Red', 'Green', 'Cyan', 'Yellow', 'Magenta', 'Black'};
markers = {'s', '<', 'o', '*', 'h', '+', '^', 'x', 'v', 'p', '>'};
lines   = {'-', '--', ':', '-.'};

% construct line/marker/color styles
% ------------------------------------------------------------------------------
if strcmp(type, 'Line')
  type_styles = lines;
elseif strcmp(type, 'Color')
  type_styles = colors;
elseif strcmp(type, 'Marker')
  type_styles = markers;
elseif strcmp(type, 'ColorLine')
  colorlines = {};
  k = 1;
  for i = 1:length(colors)
    for j = 1:length(lines)
      colorlines{k} = [colors{i}, ' ', lines{j}];
      k = k + 1;
    end
  end
  type_styles = colorlines;
elseif strcmp(type, 'LineMarker')
  linemarkers = {};
  k = 1;
  for i = 1:length(lines)
    for j = 1:length(markers)
      linemarkers{k} = [lines{i}, markers{j}];
      k = k + 1;
    end
  end
  type_styles = linemarkers;
end

% test the styles --------------------------------------------------------------
if nargin == 0
  x = linspace(0, 1, 15);
  y = sin(2*pi*x);
  disp('length types');
  disp(length(type_styles));
  disp(type_styles);
  figure()
  for i = 1:length(type_styles)
    % plot(x, y+i,':');%, type_styles(i));
    plot(x, y+i, type_styles{i});
    hold on;
    legs{i} = ['i = ', num2str(i)];
  end
  legend(legs);
end
end