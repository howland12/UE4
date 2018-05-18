function [ town_distribution, E_mean_vec, E_var_vec, E_min_vec, temperature_vec ] = traveling_optimization( town_distribution, temperature_start, N_cooling_steps, q, enable_plot )
%TRAVELING_OPTIMIZATION Summary of this function goes here
%   Detailed explanation goes here
    rng('shuffle','twister');
    
    E_mean_vec = zeros([N_cooling_steps 1]);
    E_var_vec = zeros([N_cooling_steps 1]);
    E_min_vec = zeros([N_cooling_steps 1]);
    temperature_vec = zeros([N_cooling_steps 1]);
    
    [nof_cities, nof_columns] = size(town_distribution);
    figure();
    plot(town_distribution(:,1), town_distribution(:,2), 'b-*');
    pause on
    for i = 1 : N_cooling_steps
    
       [town_distribution, E_mean_vec(i), E_var_vec(i), E_min_vec(i)] = sweep(town_distribution, temperature_start, nof_cities^2);
       temperature_start = temperature_start/ i^q;
       temperature_vec(i) = temperature_start;
       if enable_plot
            plot(town_distribution(:,1), town_distribution(:,2), 'b-*');
            pause(0.0001);
       end
    end

end

