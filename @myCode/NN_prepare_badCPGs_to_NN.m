function [results,sampl,targ] = NN_prepare_badCPGs_to_NN(obj,N)
% this function takes 'N' CPG's that are not oscillatory and outputs the
% results structure and 'sampl' and 'targ' for 'NN_GA_perf' function
% testing.

% get the periods:
periods = obj.sim_periods(1,:);

% find NOT oscilatorry
not_osc_ids = find(isnan(periods)); 

if length(not_osc_ids) >= N 
    cpg_toUse = randsample(not_osc_ids,N);
else
    disp(['the number of bad CPGs is ',num2str(length(not_osc_ids))]);
    disp(['but, we wanted ',num2str(N)]);
    error('not enougth bad CPGs');
end

results = obj.sim_results(:);

[sampl,targ] = obj.prepareData_to_NN(results,...
    periods,cpg_toUse);


end
