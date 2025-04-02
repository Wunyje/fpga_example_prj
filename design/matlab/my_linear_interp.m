function [y_interp_ext,y_sqrt_interp, SSE,RMSE, max_err] = my_linear_interp(x,y,x_interp)
% my_linear_interp 此处显示有关此函数的摘要
% 线性插值，并以直线填充插值点间空档。与被插函数等长。
% linear interpolation
if x_interp(end) ~= x(end)
    x_interp = [x_interp, x(end)];
end
y_sqrt_interp = interp1(x, y, x_interp, 'linear');

% Find the indices of the selected points in the original data
[~, idx] = ismember(x_interp, x);

% Initialize the extended interpolated values to NaN
y_interp_ext = NaN(size(y));

% Replace the NaN values with the interpolated values at the selected indices
y_interp_ext(idx) = y_sqrt_interp;

% Interpolate the remaining NaN values using the linear interpolation function
y_interp_ext = interp1(x(~isnan(y_interp_ext)), y_interp_ext(~isnan(y_interp_ext)), x, 'linear');

% Calculate SSE and RMSE
SSE = sum((y_interp_ext - y).^2);
RMSE = sqrt(mean((y_interp_ext - y).^2));
max_err = max(abs(y_interp_ext - y));
end

