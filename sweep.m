function [town_distribution, E_mean, E_var, E_min, E_end] = sweep (town_distribution, temperature, N_exchanges_p_sweep)    
   
    energy = zeros([N_exchanges_p_sweep +1 , 1]);
    energy(1) = get_path_energy(town_distribution);
    for i = 1 : N_exchanges_p_sweep
    
        [town_distribution, delta_E] = metropolis_city_exchange(town_distribution, temperature);
        energy(i+1) = energy(i) + delta_E;
        
    end
    
    E_mean = mean(energy);
    E_var = var(energy);
    E_min = min(energy);
    E_end = energy(end);
    
end

