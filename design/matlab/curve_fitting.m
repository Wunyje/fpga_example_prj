clc;
clear all;
% 离散自变量区间，分辨率为2^(-14)
x_atan = (0:1/2^14:1-1/2^14);
x_sqrt = (0:1/2^14:1-1/2^14);

% 目标函数生成
y_sqrt = sqrt(x_sqrt);
y_atan = atan(x_atan);

% 平方根函数线性插值
interp_num = 1024; % 1024段
x_sqrt_interp = x_sqrt(1:round(length(x_sqrt)/(interp_num)):length(x_sqrt));
if x_sqrt_interp(end) ~= x_sqrt(end)
    x_sqrt_interp = [x_sqrt_interp, x_sqrt(end)];
end
[y_sqrt_interp_ext, y_sqrt_interp, SSE_sqrt_interp, RMSE_sqrt_interp,max_err_sqrt_interp]= my_linear_interp(x_sqrt, y_sqrt, x_sqrt_interp);

figure(1)
plot(x_sqrt, y_sqrt, 'co', x_sqrt, y_sqrt_interp_ext, '--');
title('平方根函数和线性插值')
xlabel('0 < x < 1') 
ylabel('0 < y < 1') 
legend({'y = sqrt(x)','y = interp-of-sqrt(x)'},'Location','southeast')

%% 导出各段直线斜率与截距
k_sqrt_interp = zeros(1, length(x_sqrt_interp)-1);
b_sqrt_interp = zeros(1, length(x_sqrt_interp)-1);
for i = 1:length(x_sqrt_interp)-1
    k_sqrt_interp(i) = (y_sqrt_interp(i+1) - y_sqrt_interp(i))/(x_sqrt_interp(i+1) - x_sqrt_interp(i));
    b_sqrt_interp(i) = x_sqrt_interp(i)*(y_sqrt_interp(i+1) - y_sqrt_interp(i))/(x_sqrt_interp(i+1) - x_sqrt_interp(i));
end
fid = fopen('../../txt/mat_k_sqrt_interp.txt', 'w');
fid2 = fopen('../../txt/mat_b_sqrt_interp.txt', 'w');
for iloop=1:length(k_sqrt_interp)
    fprintf(fid, '%3.10f \n', k_sqrt_interp(iloop));
    fprintf(fid2, '%3.10f \n', b_sqrt_interp(iloop));
end
fclose(fid);
fclose(fid2);

%% 反正切函数线性插值
x_atan_interp = x_atan(1:round(length(x_atan)/(interp_num-1)):length(x_atan));
[y_atan_interp_ext, y_atan_interp, SSE_atan_interp, RMSE_atan_interp,max_err_atan_interp]= my_linear_interp(x_atan, y_atan, x_atan_interp);
figure(2)
plot(x_atan, y_atan, 'co',x_atan, y_atan_interp_ext, '--');
title('反正切函数和线性插值')
xlabel('0 < x < 1') 
ylabel('0 < y < 0.79') 
legend({'y = atan(x)','y = interp-of-atan(x)'},'Location','southeast')

%% 反正切函数二阶拟合
P = polyfit(x_atan, y_atan, 2);    % 2阶多项式拟合
y_atan_poly = polyval(P, x_atan);  % 求对应y值
SSE_atan_poly = sum((y_atan_poly - y_atan).^2);
RMSE_atan_poly = sqrt(mean((y_atan_poly - y_atan).^2));
max_err_atan_poly = max(abs(y_atan_poly - y_atan));
figure(3)
plot(x_atan, y_atan, 'co',x_atan, y_atan_poly, '--');
title('反正切函数和二阶拟合')
xlabel('0 < x < 1') 
ylabel('0 < y < 0.79') 
legend({'y = atan(x)','y = poly-of-atan(x)'},'Location','southeast')
