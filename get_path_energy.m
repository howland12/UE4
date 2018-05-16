function [ E ] = get_path_energy( town_distribution )
%GET_PATH_ENERGY Summary of this function goes here
%   Detailed explanation goes here
    x_coordinates = town_distribution(:,1);
    y_coordinates = town_distribution(:,2);

    x_p1 = zeros([1 length(x_coordinates)])';
    x_p1(1:end-1) = x_coordinates(2:end);
    x_p1(end) = x_coordinates(1);
    
    y_p1 = zeros([1 length(x_coordinates)])';
    y_p1(1:end-1) = y_coordinates(2:end);
    y_p1(end) = y_coordinates(1);
    
    x_diff_vector = (x_p1 - x_coordinates).^2;
    y_diff_vector = (y_p1 - y_coordinates).^2;
    
    modulus_vector = sqrt(x_diff_vector + y_diff_vector);
    
    E = sum(modulus_vector);
end

