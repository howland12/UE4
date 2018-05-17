function[town_distribution, energy_diff] = metropolis_city_exchange(town_distribution, temperature)

    [nof_rows, nof_columns] = size(town_distribution);
    
    exchanged_city_indices = randi([1,nof_rows],2,1);
    exchanged_city_indices = sort(exchanged_city_indices);
    
    proposed_town_distribution = town_distribution;
    proposed_town_distribution(exchanged_city_indices(1):exchanged_city_indices(2),:) = ...
        flipud(proposed_town_distribution(exchanged_city_indices(1):exchanged_city_indices(2),:));
    
    
%     temp_saved_column = proposed_town_distribution(exchanged_city_indices(1),:);
%     proposed_town_distribution(exchanged_city_indices(1),:) = proposed_town_distribution(exchanged_city_indices(2),:);
%     proposed_town_distribution(exchanged_city_indices(2),:) =  temp_saved_column;
    
    energy_diff_1 = (get_path_energy(town_distribution) - get_path_energy(proposed_town_distribution));
    if exchanged_city_indices(1) ~= 1 && exchanged_city_indices(2) ~= nof_rows && exchanged_city_indices(2) ~= 1 && exchanged_city_indices(2) ~= nof_rows
        energy_diff = abs( town_distribution(exchanged_city_indices(1)-1,:)  *  town_distribution(exchanged_city_indices(2),:)' );
        energy_diff = energy_diff + abs( town_distribution(exchanged_city_indices(1),:)  *  town_distribution(exchanged_city_indices(2)+1,:)' );
        energy_diff = energy_diff - abs( town_distribution(exchanged_city_indices(1)-1,:)  *  town_distribution(exchanged_city_indices(1),:)' );
        energy_diff = energy_diff - abs( town_distribution(exchanged_city_indices(2),:)  *  town_distribution(exchanged_city_indices(2)+1,:)' );
    else
        energy_diff = (get_path_energy(town_distribution) - get_path_energy(proposed_town_distribution));
    end
    metrop_prob = exp( (1/temperature) *  energy_diff );
                       
    rand_check = rand(1,1);
    if (metrop_prob >= 1) || (metrop_prob >= rand_check)                
        town_distribution = proposed_town_distribution;
    else
        energy_diff = 0;
    end

end
