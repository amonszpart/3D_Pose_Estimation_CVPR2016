function bool = feature_BD_bool_footCrossover(mot, varargin)

input_params = { 'threshold_dist1' };

if( ~(nargin == 1 || nargin == 2) ) error('Wrong number of arguments.'); end


threshold_dist1 = 0;
for i = 1:length(varargin);
    if(~isempty(varargin{i})) 
        eval([input_params{i} ' = varargin{i};']) ;
    end 
end 
humerus_length = sqrt(sum((mot.jointTrajectories{trajectoryID(mot,'lshoulder')}(:,1) - mot.jointTrajectories{trajectoryID(mot,'lelbow')}(:,1)).^2));

bool =  feature_BD_distPointNormalPlane( mot, 'lhip', 'rhip', 'lhip', 'lankle' ) - feature_BD_distPointNormalPlane( mot, 'lhip', 'rhip', 'lhip', 'rankle' ) > threshold_dist1* humerus_length ;