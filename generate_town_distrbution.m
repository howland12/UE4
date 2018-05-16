function [ town_distribution ] = generate_town_distribution( nof_towns, seed_number )
% generate town distributin for traveling salesman problem

    rand('seed',seed_number);
    town_distribution = rand(nof_towns, 2);

end

