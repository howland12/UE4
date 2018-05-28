clearvars;
close all;
clc;

nof_towns = 23;
seed = 62;
plot_over_temperature = false;
plot_over_t_sweeps = true;

town_distribution = generate_town_distrbution(nof_towns, seed);

E_start = get_path_energy(town_distribution);

%---------------- optimization parameters ---------------------------------
temperature_start = [1 0.5 1/3 1/4];
N_cooling_steps_max = 5000;
q = 0.98;
enable_plot = true;
accuracy = 1e-6;
nof_values_for_convergence = 30;


for i = 1 : length(temperature_start)   
    [town_distribution_new, E_mean_vec, E_var_vec, E_min_vec, E_end_vec, temperature_vec ] = traveling_optimization( town_distribution, temperature_start(i), q, accuracy, nof_values_for_convergence, N_cooling_steps_max, enable_plot );
end


if plot_over_temperature

    figure();
    plot(temperature_vec, E_mean_vec);
    xlabel('temperature');
    ylabel('<E>')


    figure();
    plot(temperature_vec, E_var_vec);
    xlabel('temperature');
    ylabel('var(E)');


    figure();
    plot(temperature_vec, E_min_vec);
    xlabel('temperature');
    ylabel('min(E)');


    figure();
    plot(temperature_vec, E_mean_vec - E_min_vec);
    xlabel('temperature');
    ylabel('<E> - min(E)');
    
end

if plot_over_t_sweeps
    
    figure();
    plot(1:length(temperature_vec), E_mean_vec);
    xlabel('sweep');
    ylabel('<E>')


    figure();
    plot(1:length(temperature_vec), E_var_vec);
    xlabel('sweep');
    ylabel('var(E)');


    figure();
    plot(1:length(temperature_vec), E_min_vec);
    xlabel('sweep');
    ylabel('min(E)');


    figure();
    plot(1:length(temperature_vec), E_mean_vec - E_min_vec);
    xlabel('sweep');
    ylabel('<E> - min(E)');
end
