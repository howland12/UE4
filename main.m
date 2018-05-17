clear all;
close all;
clc;

nof_towns = 23;
seed = 62;
town_distribution = generate_town_distrbution(nof_towns, seed);

E_start = get_path_energy(town_distribution);

%---------------- optimization parameters ---------------------------------
temperature_start = 1;
N_cooling_steps = 1e2;
q = 1;
enable_plot = true;


[ town_distribution_new, E_mean_vec, E_var_vec, E_min_vec, temperature_vec ] = traveling_optimization( town_distribution, temperature_start, N_cooling_steps, q, enable_plot );
E_end = get_path_energy(town_distribution_new);

figure();
plot(temperature_vec, E_mean_vec);
xlabel('beta');
ylabel('<E>')


figure();
plot(temperature_vec, E_var_vec);
xlabel('beta');
ylabel('var(E)');


figure();
plot(temperature_vec, E_min_vec);
xlabel('beta');
ylabel('min(E)');


figure();
plot(temperature_vec, E_mean_vec - E_min_vec);
xlabel('beta');
ylabel('<E> - min(E)');
