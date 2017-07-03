%%
% The MIT License (MIT)
% Copyright (c) 2017 Wu Zhiguo <wuzhiguo@bupt.edu.cn>
% 
% Permission is hereby granted, free of charge, to any person obtaining a 
% copy of this software and associated documentation files (the "Software"), 
% to deal in the Software without restriction, including without limitation 
% the rights to use, copy, modify, merge, publish, distribute, sublicense, 
% and/or sell copies of the Software, and to permit persons to whom the 
% Software is furnished to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included 
% in all copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS 
% OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
% FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
% DEALINGS IN THE SOFTWARE.
%
%CSI_Configure
% 
% Developed by Wu Zhiguo(Beijing University of Post and Telecommunication)
% QQ group for discusion: 366102075
% EMAIL:1600682324@qq.com wuzhiguo@bupt.edu.cn
% Github: https://github.com/wuzhiguocarter/Awesome-WiFi-CSI-Research
% Blog: http://www.jianshu.com/c/6e0897ba0cec [WiFi CSI Based Indoor Localization]
function CSI_Configure
%CONFIGURE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

%%
global degree2radian radian2degree twoPi LIGHTSPEED lambda
global Nrx ant_dist alpha
global paths theta tau  
global fc Nc Delta_f BW
global SNR samples
global PLOT_MUSIC_AOA PLOT_MUSIC_TOF
global SAVE_FIGURE

PLOT_MUSIC_AOA = true;
PLOT_MUSIC_TOF = true;
SAVE_FIGURE = false;

degree2radian = pi/180;             % deg -> rad
radian2degree = 180/pi;
twoPi = 2*pi;
%% �źŲ���
LIGHTSPEED = 3e8;                   % ���� 3*10^8 [m/s]
fc = 5.8e9;                         % 5.8GHz
lambda = LIGHTSPEED/fc;             % Լ3cm

Nc = 30;                            % number of subcarriers ����Ϊ2
BW = 20e6;                          % Bandwidth = 20MHz
Delta_f = BW/Nc;                    % ���ز�Ƶ�ʼ��

SNR = 10;                           % input SNR (dB) 10dB �����źŹ������������ʵ�10��,10lg10
samples = 100;                      % ������ 500�� 200

%% �ྶ���� 3·�ź�
theta = [-40 10 30];                % ����AoA[deg]
tau = [73 18 43]*1e-9;              % ����ToA[ns]
paths = length(theta);              % number of DOA

% �ྶ���� 5·�ź�
% paths = length(theta);              % number of DOA
% theta = [-40 -25 10 30 60];         % ����AoA[deg]
% tau = [10 5 50 20 70]*1e-9;         % ����ToA[ns]


%% ���в���
alpha = 2;
Nrx = floor(paths*alpha);           % ������Ԫ���������߸����� ����Ϊpaths+1
ant_dist = lambda/2;                % space = lambda/2 [m]

save 'para.mat'
global param
param = load('para.mat');
end

