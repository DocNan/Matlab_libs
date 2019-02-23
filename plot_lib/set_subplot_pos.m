function set_subplot_pos(sub, ngrid, varargin)
% set the subplot positions
% ngrid(i).order=[M,N,j]
% M is total row number, N is total column number, j is order of subfigure
% python style is used: 
%   subplot(2,2,[3,4])
%   -> ngrid(i).order = [2, 2];
%   -> ngrid(i).index = [3, 4];
% left and right boarder width
%   dxy.Xedge=[0.05, 0.05];
% upper and lower boarder height
%   dxy.Yedge=[0.05, 0.05];
% set inner width distance
%   dxy.dx=0.08;
% set inner heigth distance
%   dxy.dy=0.1;
% Usage example:
% Refer to the default inputs as nargin == 0
% set_subplot_pos();
% By Nan CHU on 2019.02.22
% ******************************************************************************
if nargin == 0
  clear all;close all;clc;
  x=0:0.1:3;
  y=sin(x);

  figure('position',[0,0,800,700]);
  sub(1)=subplot(2,3,1);
  ngrid(1).order=[4,3];
  ngrid(1).index = [1, 4, 7];
  plot(x,y);
  legend('sub(1)');
  xlabel('x');
  ylabel('y');

  sub(2)=subplot(2,3,2);
  ngrid(2).order=[4,3];
  ngrid(2).index = 2;
  plot(x,y);
  legend('sub(2)');
  xlabel('x');
  ylabel('y');

  sub(3)=subplot(2,3,[3,6]);
  ngrid(3).order=[4,3];
  ngrid(3).index = [3, 6, 9];
  plot(x,y);
  legend('sub(3)');
  xlabel('x');
  ylabel('y');

  sub(4)=subplot(2,3,4);
  ngrid(4).order=[4,3];
  ngrid(4).index = [10, 11];
  plot(x,y);
  legend('sub(4)');
  xlabel('x');
  ylabel('y');

  sub(5)=subplot(2,3,5);
  ngrid(5).order=[4,3];
  ngrid(5).index=[5, 8];
  plot(x,y);
  legend('sub(5)');
  xlabel('x');
  ylabel('y');

  plot_parameters(sub);
  dxy.Xedge = [0.05, 0.05];
  dxy.Yedge = [0.05, 0.05];
  dxy.dx = 0.05;
  dxy.dy = 0.00;
elseif nargin == 2
  dxy.Xedge = [0.05, 0.05];
  dxy.Yedge = [0.05, 0.05];
  dxy.dx = 0.05;
  dxy.dy = 0.00;
elseif nargin == 3
  dxy = varargin{1};
end

Xedge = dxy.Xedge;
Yedge = dxy.Yedge;
dx = dxy.dx;
dy = dxy.dy;

for i = 1:length(ngrid)
  order = ngrid(i).order;
  M = order(1);
  N = order(2);
  index = ngrid(i).index;
  if length(index) == 1
    j = index;
    Dx = (1-sum(Xedge) - (N - 1)*dx)/N;
    Dy = (1-sum(Yedge) - (M - 1)*dy)/M;
    m = floor((j - 0.5)/N) + 1;
    n = j - N*(m - 1);
    xm_0 = Xedge(1) + (n - 1)*(Dx + dx);
    yn_0 = Yedge(1) + (M - m)*(Dy + dy);
  else
    % set the position for multi-zones
    xm_array = zeros(1, length(index));
    yn_array = zeros(1, length(index));
    Dx_array = zeros(1, length(index));
    Dy_array = zeros(1, length(index));
    for k = 1:length(index)
      j = index(k);
      Dx_array(k) = (1-sum(Xedge) - (N - 1)*dx)/N;
      Dy_array(k) = (1-sum(Yedge) - (M - 1)*dy)/M;
      m = floor((j - 0.5)/N) + 1;
      n = j - N*(m - 1);
      xm_array(k) = Xedge(1) + (n - 1)*(Dx_array(k) + dx);
      yn_array(k) = Yedge(1) + (M - m)*(Dy_array(k) + dy);
    end
    xm_0 = min(xm_array);
    Dx = (max(xm_array) - min(xm_array)) + Dx_array(1);
    yn_0 = min(yn_array);
    Dy = (max(yn_array) - min(yn_array)) + Dy_array(1);
    disp([xm_0, yn_0, Dx, Dy]);    
  end
  % set the position of each subplot figure
  set(sub(i), 'position', [xm_0, yn_0, Dx, Dy]);
end
end
