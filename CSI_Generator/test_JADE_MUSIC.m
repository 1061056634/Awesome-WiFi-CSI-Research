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
% Joint DoA and ToF Estimation MUSIC
% Developed by Wu Zhiguo(Beijing University of Post and Telecommunication)
% QQ group for discusion: 366102075
% EMAIL:1600682324@qq.com wuzhiguo@bupt.edu.cn
% Github: https://github.com/wuzhiguocarter/Awesome-WiFi-CSI-Research
% Blog: http://www.jianshu.com/c/6e0897ba0cec [WiFi CSI Based Indoor Localization]
%{
  ʵ����ۣ�
    - ��������������ۺ�Ӱ��AoA��ToF�ķֱ��ʡ�׼ȷ��
    - �����������������£�����ToF�����ֱ���
    - �����������������£���Ԫ��ֱ�Ӿ���AoA�ķֱ���
    - ���п׾� l = (Nrx-1)*ant_dist
    - ant_dis���ȡlambda/2
%}
clc;clear;close all;

%% ȫ�ֲ�������
CSI_Configure();

%% ����ȫ�ֲ���
global Nrx ant_dist
global paths theta tau  
global fc Nc Delta_f
global SNR samples

%% ����ྶAoA��ToF��Ϣ
fprintf('True ToF and AoA of all paths: \n');
for ipath = 1:paths
    disp(['path ' num2str(ipath) ': (AoA, ToF) = (' num2str(theta(ipath)) ...
        ' [deg], ' num2str(tau(ipath)*1e9) ' [ns])' ]);
end

%% ���ɹ۲����CSI�͵�������A
[CSI,A] = API_CSI_Generator( theta, tau, paths, ...
                            Nrx,ant_dist,samples, ...
                            fc,Nc,Delta_f,SNR);
%% ����MUSICα�ף������ӻ�,��Ϊjpeg
API_CSI_MUSIC_Visualize( CSI,samples,paths, Nrx,ant_dist, ...
                            fc,Nc,Delta_f);
