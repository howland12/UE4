function [ town_distribution, E_mean_vec, E_var_vec, E_min_vec, E_end_vec, temperature_vec ] = traveling_optimization( town_distribution, temperature_start, q, accuracy, nof_values_for_convergence, N_cooling_steps_max, enable_plot )
%TRAVELING_OPTIMIZATION Summary of this function goes here
%   Detailed explanation goes here
    rng('shuffle','combRecursive');
    
    E_mean_vec = zeros([N_cooling_steps_max 1]);
    E_var_vec = zeros([N_cooling_steps_max 1]);
    E_min_vec = zeros([N_cooling_steps_max 1]);
    E_end_vec = zeros([N_cooling_steps_max 1]);
    temperature_vec = zeros([N_cooling_steps_max 1]);
    
    [nof_cities, nof_columns] = size(town_distribution);
    figure();
    plot(town_distribution(:,1), town_distribution(:,2), 'b-*');
    pause on
    
    not_converged = true;
    i = 1;
    
    while not_converged
        
       temperature_vec(i) = temperature_start / i^q;

       [town_distribution, E_mean_vec(i), E_var_vec(i), E_min_vec(i), E_end_vec(i)] = sweep(town_distribution, temperature_vec(i), nof_cities^2);
       
       if enable_plot
            plot([town_distribution(:,1);town_distribution(1,1)], [town_distribution(:,2);town_distribution(1,2)], 'b-*');
            pause(0.0001);
       end
       
       % check for convergence
       if i > nof_values_for_convergence
            if all( abs(E_end_vec(i-(nof_values_for_convergence-2):i) - E_end_vec(i-(nof_values_for_convergence-1))) < accuracy)
                not_converged = false;
            end
       end
       
       i = i+1;
       
       % check if bigger than maximum cooling steps
       if i > N_cooling_steps_max
            not_converged = false;
       end
       
    end
    
    E_mean_vec = E_mean_vec(1:i-1);
    E_var_vec  = E_var_vec(1:i-1);
    E_min_vec  = E_min_vec(1:i-1);
    E_end_vec  = E_end_vec(1:i-1);
    temperature_vec = temperature_vec(1:i-1);

end
