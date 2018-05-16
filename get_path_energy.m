function [ E ] = get_path_energy( town_distribution )
%GET_PATH_ENERGY Summary of this function goes here
%   Detailed explanation goes here
    x_p1 = zeros( [1 length( town_distribution(:,1) ) ])';
    x_p1(1:end-1) = town_distribution(2:end,1);
    x_p1(end) = town_distribution(1,1);
    
    y_p1 = zeros([1 length( town_distribution(:,2) ) ])';
    y_p1(1:end-1) = town_distribution(2:end,2);
    y_p1(end) = town_distribution(1,2);
    
    x_p1 = (x_p1 - town_distribution(:,1)).^2; % ( x_diff^2 = x(i+1) - x(i) )^2
    y_p1 = (y_p1 - town_distribution(:,2)).^2; % ( y_diff^2 = y(i+1) - y(i) )^2
    
    E =sum(sqrt(x_p1 + y_p1));
end

