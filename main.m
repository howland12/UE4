clear all;
close all;
clc;

nof_towns = 50;
seed = 62;
plot_over_temperature = false;
plot_over_t_sweeps = true;

town_distribution = generate_town_distrbution(nof_towns, seed);

E_start = get_path_energy(town_distribution);

%---------------- optimization parameters ---------------------------------
temperature_start = 1;
N_cooling_steps = 1e2;
q = 1;
enable_plot = true;


[ town_distribution_new, E_mean_vec, E_var_vec, E_min_vec, temperature_vec ] = traveling_optimization( town_distribution, temperature_start, N_cooling_steps, q, enable_plot );
E_end = get_path_energy(town_distribution_new);


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
