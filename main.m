nof_towns = 23;
seed = 62;
town_distribution = generate_town_distrbution(nof_towns, seed);

E = get_path_energy(town_distribution);

plot(town_distribution(:,1), town_distribution(:,2), '*');