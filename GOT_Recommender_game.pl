%=============================================================================
% 1. MARRIAGE & ROMANTIC RELATIONSHIP RECOMMENDATIONS
%=============================================================================

% Historical Canon Relationships (Reference Database)
canon_relationship(jon_snow, ygritte, romantic, wildling_love).
canon_relationship(jon_snow, daenerys_targaryen, romantic_political, aunt_nephew_tragedy).
canon_relationship(jaime_lannister, cersei_lannister, romantic, twin_forbidden_love).
canon_relationship(jaime_lannister, brienne_of_tarth, romantic, honor_redemption).
canon_relationship(tyrion_lannister, sansa_stark, arranged_marriage, political_alliance).
canon_relationship(samwell_tarly, gilly, romantic, true_love).
canon_relationship(gendry, arya_stark, romantic, young_love).
canon_relationship(jorah_mormont, daenerys_targaryen, unrequited_love, loyal_devotion).
canon_relationship(robb_stark, talisa_stark, romantic, war_time_love).
canon_relationship(eddard_stark, catelyn_stark, arranged_marriage, honor_marriage).
canon_relationship(robert_baratheon, cersei_lannister, arranged_marriage, political_disaster).
canon_relationship(stannis_baratheon, selyse_baratheon, arranged_marriage, duty_marriage).

% Comprehensive Marriage Suitability Analysis
marriage_suitability(Person1, Person2, SuitabilityScore, Factors) :-
    status(Person1, alive),
    status(Person2, alive),
    dif(Person1, Person2),
    gender_compatible(Person1, Person2),
    \+ blood_incompatible(Person1, Person2),
    \+ culturally_incompatible(Person1, Person2),
    findall(Factor, marriage_compatibility_factor(Person1, Person2, Factor), FactorList),
    length(FactorList, Score),
    marriage_score_rating(Score, SuitabilityScore),
    Factors = FactorList.

gender_compatible(Person1, Person2) :-
    ((male(Person1), female(Person2)) ; (female(Person1), male(Person2))).

blood_incompatible(Person1, Person2) :-
    (sibling(Person1, Person2) ;
     parent(Person1, Person2) ;
     parent(Person2, Person1) ;
     stark_raised_siblings(Person1, Person2) ;
     aunt(Person1, Person2) ; aunt(Person2, Person1) ;
     uncle(Person1, Person2) ; uncle(Person2, Person1)).

stark_raised_siblings(jon_snow, sansa_stark).
stark_raised_siblings(jon_snow, arya_stark).
stark_raised_siblings(jon_snow, bran_stark).
stark_raised_siblings(sansa_stark, arya_stark).
stark_raised_siblings(sansa_stark, bran_stark).
stark_raised_siblings(arya_stark, bran_stark).
stark_raised_siblings(X, Y) :- stark_raised_siblings(Y, X).

culturally_incompatible(Person1, Person2) :-
    age_inappropriate(Person1, Person2).

age_inappropriate(_, sam_jr). % Child protection
age_inappropriate(sam_jr, _).

% Marriage Compatibility Factors
marriage_compatibility_factor(Person1, Person2, house_alliance) :-
    house_member(Person1, House1),
    house_member(Person2, House2),
    dif(House1, House2),
    beneficial_house_alliance(House1, House2).

marriage_compatibility_factor(Person1, Person2, regional_unity) :-
    controls_region(Person1, Region1),
    controls_region(Person2, Region2),
    dif(Region1, Region2),
    complementary_regions(Region1, Region2).

marriage_compatibility_factor(Person1, Person2, personality_match) :-
    personality_compatibility(Person1, Person2, _).

marriage_compatibility_factor(Person1, Person2, political_stability) :-
    title(Person1, _),
    title(Person2, _).

marriage_compatibility_factor(Person1, Person2, strategic_value) :-
    survival_assessment(Person1, high, _),
    survival_assessment(Person2, high, _).

marriage_compatibility_factor(Person1, Person2, mutual_respect) :-
    trait(Person1, honorable),
    trait(Person2, honorable).

marriage_compatibility_factor(Person1, Person2, intellectual_bond) :-
    trait(Person1, intelligent),
    trait(Person2, intelligent).

marriage_compatibility_factor(Person1, Person2, complementary_skills) :-
    trait(Person1, diplomatic),
    trait(Person2, brave).

marriage_compatibility_factor(Person1, Person2, no_previous_conflict) :-
    \+ historical_enemies(Person1, Person2).

% Define beneficial house alliances
beneficial_house_alliance(stark, baratheon).
beneficial_house_alliance(stark, tarly).
beneficial_house_alliance(lannister, tyrell).
beneficial_house_alliance(greyjoy, stark).
beneficial_house_alliance(X, Y) :- beneficial_house_alliance(Y, X).

complementary_regions(the_north, stormlands).
complementary_regions(the_north, reach).
complementary_regions(six_kingdoms, iron_islands).
complementary_regions(X, Y) :- complementary_regions(Y, X).

historical_enemies(sansa_stark, tyrion_lannister). % Previous marriage complications

marriage_score_rating(Score, excellent) :- Score >= 7.
marriage_score_rating(Score, very_good) :- Score >= 5, Score < 7.
marriage_score_rating(Score, good) :- Score >= 3, Score < 5.
marriage_score_rating(Score, fair) :- Score >= 2, Score < 3.
marriage_score_rating(Score, poor) :- Score < 2.

% Best Marriage Matches (Top 3 for each person)
best_marriage_matches(Person, TopMatches) :-
    findall([Score, Partner, Factors], 
            marriage_suitability(Person, Partner, Score, Factors), 
            AllMatches),
    sort(1, @>=, AllMatches, SortedMatches),
    (take(3, SortedMatches, TopMatches) ; TopMatches = SortedMatches).

take(N, List, Result) :-
    length(Prefix, N),
    append(Prefix, _, List),
    Result = Prefix.

%=============================================================================
% 2. POLITICAL ALLIANCE RECOMMENDATIONS
%=============================================================================

% Comprehensive Alliance Analysis
alliance_recommendation(Person1, Person2, AllianceType, Benefits, Risks) :-
    status(Person1, alive),
    status(Person2, alive),
    dif(Person1, Person2),
    potential_alliance_type(Person1, Person2, AllianceType),
    findall(Benefit, alliance_benefit_factor(Person1, Person2, Benefit), BenefitList),
    findall(Risk, alliance_risk_factor(Person1, Person2, Risk), RiskList),
    Benefits = BenefitList,
    Risks = RiskList,
    length(BenefitList, BenefitCount),
    length(RiskList, RiskCount),
    BenefitCount > RiskCount. % Only recommend if benefits outweigh risks

% Alliance Types
potential_alliance_type(Person1, Person2, military_alliance) :-
    (trait(Person1, skilled_fighter) ; controls_military_region(Person1)),
    (trait(Person2, skilled_fighter) ; controls_military_region(Person2)).

potential_alliance_type(Person1, Person2, economic_alliance) :-
    controls_economic_region(Person1),
    controls_economic_region(Person2).

potential_alliance_type(Person1, Person2, defensive_pact) :-
    threat_level(Person1, Level1),
    threat_level(Person2, Level2),
    (Level1 = high ; Level2 = high).

potential_alliance_type(Person1, Person2, marriage_alliance) :-
    marriage_suitability(Person1, Person2, Rating, _),
    member(Rating, [good, very_good, excellent]).

potential_alliance_type(Person1, Person2, trade_agreement) :-
    controls_region(Person1, Region1),
    controls_region(Person2, Region2),
    trade_beneficial(Region1, Region2).

potential_alliance_type(Person1, Person2, intelligence_sharing) :-
    trait(Person1, intelligent),
    trait(Person2, intelligent),
    (title(Person1, _) ; title(Person2, _)).

% Regional Classifications
controls_military_region(Person) :-
    controls_region(Person, Region),
    military_region(Region).

controls_economic_region(Person) :-
    controls_region(Person, Region),
    economic_region(Region).

military_region(the_north).
military_region(stormlands).
military_region(iron_islands).

economic_region(reach).
economic_region(six_kingdoms).

trade_beneficial(the_north, reach). % Food for military support
trade_beneficial(iron_islands, six_kingdoms). % Naval for economic
trade_beneficial(stormlands, the_north). % Military cooperation
trade_beneficial(X, Y) :- trade_beneficial(Y, X).

% Alliance Benefits
alliance_benefit_factor(Person1, Person2, territorial_security) :-
    controls_region(Person1, _),
    controls_region(Person2, _).

alliance_benefit_factor(Person1, Person2, military_strength) :-
    trait(Person1, skilled_fighter),
    trait(Person2, skilled_fighter).

alliance_benefit_factor(Person1, Person2, economic_prosperity) :-
    controls_economic_region(Person1),
    controls_economic_region(Person2).

alliance_benefit_factor(Person1, Person2, political_legitimacy) :-
    title(Person1, _),
    title(Person2, _).

alliance_benefit_factor(Person1, Person2, shared_values) :-
    trait(Person1, honorable),
    trait(Person2, honorable).

alliance_benefit_factor(Person1, Person2, intelligence_advantage) :-
    trait(Person1, intelligent),
    trait(Person2, intelligent).

alliance_benefit_factor(Person1, Person2, diplomatic_influence) :-
    trait(Person1, diplomatic),
    trait(Person2, diplomatic).

alliance_benefit_factor(Person1, Person2, mutual_protection) :-
    survival_assessment(Person1, Level1, _),
    survival_assessment(Person2, Level2, _),
    member(Level1, [medium, high]),
    member(Level2, [medium, high]).

% Alliance Risks
alliance_risk_factor(Person1, Person2, historical_conflict) :-
    historical_house_conflict(Person1, Person2).

alliance_risk_factor(Person1, Person2, personality_clash) :-
    trait(Person1, ruthless),
    trait(Person2, honorable).

alliance_risk_factor(Person1, Person2, competing_interests) :-
    controls_region(Person1, Region),
    controls_region(Person2, Region). % Same region control

alliance_risk_factor(Person1, Person2, reliability_concern) :-
    trait(Person1, ambitious),
    trait(Person2, cautious).

alliance_risk_factor(Person1, Person2, external_pressure) :-
    threat_level(Person1, high),
    threat_level(Person2, low).

% Historical conflicts
historical_house_conflict(Person1, Person2) :-
    house_member(Person1, stark),
    house_member(Person2, lannister).

historical_house_conflict(Person1, Person2) :-
    house_member(Person1, baratheon),
    house_member(Person2, targaryen).

%=============================================================================
% 3. LEADERSHIP & CAREER RECOMMENDATIONS
%=============================================================================

% Comprehensive Leadership Assessment
leadership_recommendation(Person, Position, QualificationScore, Requirements, Development) :-
    status(Person, alive),
    available_position(Position),
    findall(Req, position_requirement(Position, Req), RequirementList),
    findall(Met, (member(Req, RequirementList), meets_requirement(Person, Req)), MetRequirements),
    length(RequirementList, TotalReqs),
    length(MetRequirements, MetCount),
    QualificationScore is (MetCount / TotalReqs) * 100,
    QualificationScore >= 60, % Minimum 60% qualification
    Requirements = RequirementList,
    findall(Dev, development_need(Person, Position, Dev), DevelopmentList),
    Development = DevelopmentList.

% Available Leadership Positions
available_position('Hand of the King').
available_position('Master of War').
available_position('Master of Coin').
available_position('Grand Maester').
available_position('Lord Commander of Kingsguard').
available_position('Master of Ships').
available_position('Master of Whispers').
available_position('Regional Governor').
available_position('Military Commander').
available_position('Diplomatic Envoy').
available_position('Trade Minister').
available_position('Justice Minister').

% Position Requirements
position_requirement('Hand of the King', intelligent).
position_requirement('Hand of the King', diplomatic).
position_requirement('Hand of the King', political).
position_requirement('Hand of the King', loyal).

position_requirement('Master of War', brave).
position_requirement('Master of War', skilled_fighter).
position_requirement('Master of War', intelligent).

position_requirement('Master of Coin', intelligent).
position_requirement('Master of Coin', cautious).

position_requirement('Grand Maester', intelligent).
position_requirement('Grand Maester', wise).

position_requirement('Lord Commander of Kingsguard', honorable).
position_requirement('Lord Commander of Kingsguard', skilled_fighter).
position_requirement('Lord Commander of Kingsguard', loyal).

position_requirement('Master of Ships', brave).
position_requirement('Master of Ships', intelligent).

position_requirement('Master of Whispers', intelligent).
position_requirement('Master of Whispers', cautious).

position_requirement('Regional Governor', political).
position_requirement('Regional Governor', diplomatic).

position_requirement('Military Commander', brave).
position_requirement('Military Commander', skilled_fighter).

position_requirement('Diplomatic Envoy', diplomatic).
position_requirement('Diplomatic Envoy', intelligent).

position_requirement('Trade Minister', intelligent).
position_requirement('Trade Minister', diplomatic).

position_requirement('Justice Minister', honorable).
position_requirement('Justice Minister', intelligent).

% Requirement Checking
meets_requirement(Person, Requirement) :-
    trait(Person, Requirement).

meets_requirement(Person, experienced) :-
    title(Person, _).

meets_requirement(Person, trustworthy) :-
    \+ trait(Person, ruthless).

% Development Needs
development_need(Person, Position, leadership_training) :-
    position_requirement(Position, political),
    \+ trait(Person, political).

development_need(Person, Position, combat_training) :-
    position_requirement(Position, skilled_fighter),
    \+ trait(Person, skilled_fighter).

development_need(Person, Position, diplomatic_education) :-
    position_requirement(Position, diplomatic),
    \+ trait(Person, diplomatic).

development_need(Person, Position, strategic_planning) :-
    member(Position, ['Master of War', 'Hand of the King']),
    \+ trait(Person, intelligent).

% Career Path Recommendations
career_progression(Person, CurrentRole, NextSteps) :-
    (title(Person, CurrentRole) ; CurrentRole = none),
    findall([Position, Score], 
            leadership_recommendation(Person, Position, Score, _, _), 
            Opportunities),
    sort(2, @>=, Opportunities, SortedOpportunities),
    take(3, SortedOpportunities, NextSteps).

%=============================================================================
% 4. STRATEGIC MILITARY RECOMMENDATIONS
%=============================================================================

% Military Strategy Assessment
military_strategy_recommendation(Leader, Strategy, Effectiveness, Resources) :-
    status(Leader, alive),
    (title(Leader, _) ; trait(Leader, skilled_fighter)),
    available_strategy(Strategy),
    strategy_effectiveness(Leader, Strategy, Effectiveness),
    required_resources(Strategy, Resources),
    can_implement(Leader, Resources).

available_strategy(defensive_fortification).
available_strategy(naval_expansion).
available_strategy(alliance_military).
available_strategy(guerrilla_warfare).
available_strategy(diplomatic_solution).
available_strategy(economic_warfare).
available_strategy(intelligence_network).

% Strategy Effectiveness Calculation
strategy_effectiveness(Leader, Strategy, Effectiveness) :-
    findall(Factor, strategy_advantage(Leader, Strategy, Factor), Advantages),
    findall(Weakness, strategy_weakness(Leader, Strategy, Weakness), Weaknesses),
    length(Advantages, AdvCount),
    length(Weaknesses, WeakCount),
    Total is AdvCount + WeakCount,
    (Total > 0 -> Effectiveness is (AdvCount / Total) * 100; Effectiveness = 50).

strategy_advantage(Leader, defensive_fortification, regional_knowledge) :-
    controls_region(Leader, _).

strategy_advantage(Leader, naval_expansion, coastal_access) :-
    controls_region(Leader, iron_islands).

strategy_advantage(Leader, alliance_military, diplomatic_skill) :-
    trait(Leader, diplomatic).

strategy_advantage(Leader, guerrilla_warfare, local_support) :-
    controls_region(Leader, the_north).

strategy_advantage(Leader, diplomatic_solution, negotiation_skill) :-
    trait(Leader, diplomatic).

strategy_advantage(Leader, economic_warfare, resource_control) :-
    controls_economic_region(Leader).

strategy_advantage(Leader, intelligence_network, information_access) :-
    trait(Leader, intelligent).

strategy_weakness(Leader, Strategy, insufficient_resources) :-
    required_resources(Strategy, Resources),
    \+ can_implement(Leader, Resources).

strategy_weakness(Leader, defensive_fortification, limited_mobility) :-
    \+ trait(Leader, brave).

strategy_weakness(Leader, naval_expansion, land_vulnerability) :-
    \+ controls_region(Leader, stormlands).

% Resource Requirements
required_resources(defensive_fortification, [manpower, materials, time]).
required_resources(naval_expansion, [ships, sailors, ports]).
required_resources(alliance_military, [diplomatic_capital, trust, mutual_benefit]).
required_resources(guerrilla_warfare, [local_knowledge, mobility, supplies]).
required_resources(diplomatic_solution, [negotiation_skill, credibility, incentives]).
required_resources(economic_warfare, [trade_control, wealth, market_access]).
required_resources(intelligence_network, [spies, information, communication]).

can_implement(Leader, Resources) :-
    forall(member(Resource, Resources), has_resource(Leader, Resource)).

has_resource(Leader, manpower) :- controls_region(Leader, _).
has_resource(Leader, materials) :- controls_economic_region(Leader).
has_resource(Leader, ships) :- controls_region(Leader, iron_islands).
has_resource(Leader, diplomatic_capital) :- trait(Leader, diplomatic).
has_resource(Leader, local_knowledge) :- controls_region(Leader, _).
has_resource(Leader, negotiation_skill) :- trait(Leader, diplomatic).
has_resource(Leader, wealth) :- controls_economic_region(Leader).
has_resource(Leader, spies) :- trait(Leader, intelligent).

%=============================================================================
% 5. SURVIVAL & THREAT MITIGATION RECOMMENDATIONS
%=============================================================================

% Comprehensive Survival Strategy
survival_strategy_recommendation(Person, Strategies, Priority) :-
    status(Person, alive),
    threat_level(Person, ThreatLevel),
    survival_assessment(Person, SurvivalLevel, _),
    findall([Strategy, Effectiveness], 
            survival_strategy_option(Person, Strategy, Effectiveness), 
            StrategyOptions),
    sort(2, @>=, StrategyOptions, SortedStrategies),
    Strategies = SortedStrategies,
    survival_priority(ThreatLevel, SurvivalLevel, Priority).

survival_strategy_option(Person, lay_low, Effectiveness) :-
    trait(Person, cautious),
    Effectiveness = 80.

survival_strategy_option(Person, build_alliances, Effectiveness) :-
    trait(Person, diplomatic),
    findall(_, alliance_recommendation(Person, _, _, _, _), Alliances),
    length(Alliances, AllianceCount),
    Effectiveness is min(90, 60 + (AllianceCount * 5)).

survival_strategy_option(Person, military_preparation, Effectiveness) :-
    trait(Person, skilled_fighter),
    Effectiveness = 70.

survival_strategy_option(Person, political_maneuvering, Effectiveness) :-
    trait(Person, political),
    title(Person, _),
    Effectiveness = 85.

survival_strategy_option(Person, economic_independence, Effectiveness) :-
    controls_economic_region(Person),
    Effectiveness = 75.

survival_strategy_option(Person, information_gathering, Effectiveness) :-
    trait(Person, intelligent),
    Effectiveness = 65.

survival_strategy_option(Person, seek_protection, Effectiveness) :-
    \+ title(Person, _),
    findall(_, (alliance_recommendation(Person, Protector, _, Benefits, _), 
                member(mutual_protection, Benefits)), Protectors),
    length(Protectors, ProtectorCount),
    Effectiveness is min(85, 40 + (ProtectorCount * 15)).

survival_priority(high, low, critical).
survival_priority(high, medium, urgent).
survival_priority(medium, low, important).
survival_priority(medium, medium, moderate).
survival_priority(low, _, routine).

%=============================================================================
% 6. ECONOMIC & TRADE RECOMMENDATIONS  
%=============================================================================

% Economic Strategy Recommendations
economic_recommendation(Person, Strategy, PotentialGain, Requirements) :-
    status(Person, alive),
    economic_strategy(Strategy),
    economic_viability(Person, Strategy, PotentialGain),
    strategy_requirements(Strategy, Requirements),
    PotentialGain >= 60. % Minimum viability threshold

economic_strategy(trade_route_development).
economic_strategy(resource_monopoly).
economic_strategy(taxation_optimization).
economic_strategy(infrastructure_investment).
economic_strategy(merchant_partnerships).
economic_strategy(agricultural_development).
economic_strategy(naval_commerce).

economic_viability(Person, trade_route_development, Gain) :-
    controls_region(Person, Region),
    trade_hub_potential(Region, BasePotential),
    (trait(Person, intelligent) -> Bonus = 20; Bonus = 0),
    Gain is BasePotential + Bonus.

economic_viability(Person, resource_monopoly, Gain) :-
    controls_region(Person, Region),
    resource_rich(Region, Resource),
    resource_value(Resource, Value),
    (trait(Person, political) -> Multiplier = 1.2; Multiplier = 1.0),
    Gain is Value * Multiplier.

economic_viability(Person, taxation_optimization, Gain) :-
    title(Person, _),
    controls_region(Person, Region),
    population_density(Region, Density),
    (trait(Person, diplomatic) -> Efficiency = 0.8; Efficiency = 0.6),
    Gain is Density * Efficiency * 10.

trade_hub_potential(six_kingdoms, 85).
trade_hub_potential(reach, 75).
trade_hub_potential(iron_islands, 70).
trade_hub_potential(the_north, 55).
trade_hub_potential(stormlands, 60).

resource_rich(the_north, timber).
resource_rich(iron_islands, fish).
resource_rich(reach, grain).
resource_rich(six_kingdoms, gold).
resource_rich(stormlands, stone).

resource_value(gold, 90).
resource_value(grain, 80).
resource_value(fish, 70).
resource_value(timber, 65).
resource_value(stone, 60).

population_density(six_kingdoms, 9).
population_density(reach, 8).
population_density(the_north, 6).
population_density(stormlands, 7).
population_density(iron_islands, 5).

strategy_requirements(trade_route_development, [diplomatic_relations, security, infrastructure]).
strategy_requirements(resource_monopoly, [military_control, political_power]).
strategy_requirements(taxation_optimization, [administrative_skill, popular_support]).

%=============================================================================
% 7. INTEGRATED RECOMMENDATION ENGINE
%=============================================================================

% Master Recommendation System
comprehensive_recommendations(Person, AllRecommendations) :-
    status(Person, alive),
    findall([Category, Recommendations], 
            recommendation_category(Person, Category, Recommendations), 
            AllRecommendations).

recommendation_category(Person, marriage, Recommendations) :-
    best_marriage_matches(Person, Recommendations).

recommendation_category(Person, alliances, Recommendations) :-
    findall([Partner, Type, Benefits, Risks], 
            alliance_recommendation(Person, Partner, Type, Benefits, Risks), 
            Recommendations).

recommendation_category(Person, leadership, Recommendations) :-
    findall([Position, Score, Requirements, Development], 
            leadership_recommendation(Person, Position, Score, Requirements, Development), 
            Recommendations).

recommendation_category(Person, military, Recommendations) :-
        findall([Strategy, Effectiveness, Resources], 
            military_strategy_recommendation(Person, Strategy, Effectiveness, Resources), 
            Recommendations).

recommendation_category(Person, survival, Recommendations) :-
    survival_strategy_recommendation(Person, Strategies, Priority),
    Recommendations = [strategies(Strategies), priority(Priority)].

recommendation_category(Person, economic, Recommendations) :-
    findall([Strategy, Gain, Requirements], 
            economic_recommendation(Person, Strategy, Gain, Requirements), 
            Recommendations).

% Priority-Based Recommendation Filtering
urgent_recommendations(Person, UrgentRecs) :-
    threat_level(Person, ThreatLevel),
    survival_assessment(Person, SurvivalLevel, _),
    comprehensive_recommendations(Person, AllRecs),
    filter_by_urgency(ThreatLevel, SurvivalLevel, AllRecs, UrgentRecs).

filter_by_urgency(high, low, AllRecs, UrgentRecs) :-
    findall([Category, Recs], 
            (member([Category, Recs], AllRecs), 
             member(Category, [survival, alliances, military])), 
            UrgentRecs).

filter_by_urgency(high, medium, AllRecs, UrgentRecs) :-
    findall([Category, Recs], 
            (member([Category, Recs], AllRecs), 
             member(Category, [survival, alliances])), 
            UrgentRecs).

filter_by_urgency(medium, _, AllRecs, UrgentRecs) :-
    findall([Category, Recs], 
            (member([Category, Recs], AllRecs), 
             member(Category, [alliances, leadership, military])), 
            UrgentRecs).

filter_by_urgency(low, high, AllRecs, UrgentRecs) :-
    findall([Category, Recs], 
            (member([Category, Recs], AllRecs), 
             member(Category, [leadership, economic, marriage])), 
            UrgentRecs).

% Recommendation Scoring & Ranking
score_recommendation(Person, Category, Recommendation, Score) :-
    base_score(Category, BaseScore),
    urgency_multiplier(Person, Category, Multiplier),
    feasibility_score(Person, Recommendation, Feasibility),
    Score is BaseScore * Multiplier * Feasibility.

base_score(survival, 100).
base_score(alliances, 85).
base_score(military, 80).
base_score(leadership, 75).
base_score(economic, 70).
base_score(marriage, 65).

urgency_multiplier(Person, Category, Multiplier) :-
    threat_level(Person, ThreatLevel),
    urgency_factor(ThreatLevel, Category, Multiplier).

urgency_factor(high, survival, 1.5).
urgency_factor(high, alliances, 1.3).
urgency_factor(high, military, 1.4).
urgency_factor(medium, leadership, 1.2).
urgency_factor(low, economic, 1.1).
urgency_factor(low, marriage, 1.0).
urgency_factor(_, _, 1.0). % Default

feasibility_score(Person, Recommendation, Score) :-
    recommendation_complexity(Recommendation, Complexity),
    person_capability(Person, Capability),
    Score is min(1.0, Capability / Complexity).

recommendation_complexity([Strategy, Effectiveness, Resources], Complexity) :-
    length(Resources, ResourceCount),
    Complexity is ResourceCount * 10 + (100 - Effectiveness).

recommendation_complexity([Position, QualScore, Requirements, Development], Complexity) :-
    length(Requirements, ReqCount),
    length(Development, DevCount),
    Complexity is ReqCount * 5 + DevCount * 10 + (100 - QualScore).

recommendation_complexity(_, 50). % Default complexity

person_capability(Person, Capability) :-
    findall(Trait, trait(Person, Trait), Traits),
    length(Traits, TraitCount),
    (title(Person, _) -> TitleBonus = 20; TitleBonus = 0),
    (controls_region(Person, _) -> RegionBonus = 15; RegionBonus = 0),
    Capability is min(100, TraitCount * 8 + TitleBonus + RegionBonus).

%=============================================================================
% 8. SPECIALIZED RECOMMENDATION QUERIES
%=============================================================================

% Best Overall Strategy for a Character
optimal_strategy(Person, Strategy) :-
    comprehensive_recommendations(Person, AllRecs),
    findall([Score, Cat, Rec], 
            (member([Cat, Recs], AllRecs),
             member(Rec, Recs),
             score_recommendation(Person, Cat, Rec, Score)), 
            ScoredRecs),
    sort(1, @>=, ScoredRecs, [BestScore, BestCategory, BestRec|_]),
    Strategy = [category(BestCategory), recommendation(BestRec), score(BestScore)].

% Character Development Recommendations
character_development_plan(Person, DevelopmentPlan) :-
    findall([Area, Actions], development_area(Person, Area, Actions), DevelopmentPlan).

development_area(Person, leadership_skills, Actions) :-
    \+ trait(Person, political),
    Actions = [gain_political_experience, study_governance, build_network].

development_area(Person, combat_abilities, Actions) :-
    \+ trait(Person, skilled_fighter),
    Actions = [military_training, weapons_practice, battle_experience].

development_area(Person, diplomatic_relations, Actions) :-
    \+ trait(Person, diplomatic),
    Actions = [negotiation_training, cultural_studies, alliance_building].

development_area(Person, strategic_thinking, Actions) :-
    \+ trait(Person, intelligent),
    Actions = [strategic_education, mentor_guidance, decision_analysis].

% Relationship Conflict Resolution
resolve_relationship_conflict(Person1, Person2, Solutions) :-
    relationship_conflict(Person1, Person2, Conflict),
    findall(Solution, conflict%_).
%=============================================================================
% 9. CRISIS MANAGEMENT RECOMMENDATIONS
%=============================================================================

% Emergency Response Recommendations
crisis_management(Person, CrisisType, ResponsePlan) :-
    status(Person, alive),
    crisis_scenario(CrisisType),
    crisis_assessment(Person, CrisisType, Severity),
    generate_response_plan(Person, CrisisType, Severity, ResponsePlan).

crisis_scenario(military_invasion).
crisis_scenario(political_coup).
crisis_scenario(economic_collapse).
crisis_scenario(natural_disaster).
crisis_scenario(succession_crisis).
crisis_scenario(alliance_betrayal).
crisis_scenario(popular_uprising).

crisis_assessment(Person, CrisisType, Severity) :-
    vulnerability_factor(Person, CrisisType, VulnScore),
    resource_availability(Person, CrisisType, ResourceScore),
    support_network_strength(Person, SupportScore),
    Severity is max(1, min(10, VulnScore - ResourceScore - SupportScore + 5)).

vulnerability_factor(Person, military_invasion, Score) :-
    (controls_region(Person, _) -> RegionVuln = 3; RegionVuln = 1),
    (trait(Person, skilled_fighter) -> MilitaryVuln = -1; MilitaryVuln = 2),
    Score is RegionVuln + MilitaryVuln.

vulnerability_factor(Person, political_coup, Score) :-
    (title(Person, _) -> PositionVuln = 4; PositionVuln = 1),
    (trait(Person, political) -> PoliticalVuln = -2; PoliticalVuln = 1),
    Score is PositionVuln + PoliticalVuln.

resource_availability(Person, CrisisType, Score) :-
    findall(Resource, has_crisis_resource(Person, CrisisType, Resource), Resources),
    length(Resources, Score).

has_crisis_resource(Person, military_invasion, military_strength) :-
    trait(Person, skilled_fighter).

has_crisis_resource(Person, military_invasion, defensive_position) :-
    controls_region(Person, the_north).

has_crisis_resource(Person, political_coup, loyal_supporters) :-
    trait(Person, loyal).

has_crisis_resource(Person, economic_collapse, alternative_resources) :-
    controls_economic_region(Person).

support_network_strength(Person, Score) :-
    findall(Ally, alliance_recommendation(Person, Ally, _, _, _), Allies),
    length(Allies, AllyCount),
    (title(Person, _) -> TitleBonus = 1; TitleBonus = 0),
    Score is AllyCount + TitleBonus.

generate_response_plan(Person, CrisisType, Severity, ResponsePlan) :-
    crisis_priority_actions(CrisisType, Severity, PriorityActions),
    crisis_resource_mobilization(Person, CrisisType, ResourceActions),
    crisis_communication_strategy(Person, CrisisType, CommActions),
    ResponsePlan = [
        priority_actions(PriorityActions),
        resource_mobilization(ResourceActions),
        communication_strategy(CommActions),
        severity_level(Severity)
    ].

crisis_priority_actions(military_invasion, Severity, Actions) :-
    (Severity >= 7 -> 
        Actions = [evacuate_civilians, fortify_positions, call_allies];
        Actions = [assess_threat, prepare_defenses, diplomatic_contact]).

crisis_priority_actions(political_coup, Severity, Actions) :-
    (Severity >= 6 ->
        Actions = [secure_loyalists, control_information, negotiate_or_flee];
        Actions = [monitor_situation, strengthen_support, preemptive_measures]).

crisis_resource_mobilization(Person, CrisisType, Actions) :-
    findall(Action, resource_mobilization_action(Person, CrisisType, Action), Actions).

resource_mobilization_action(Person, military_invasion, mobilize_military) :-
    trait(Person, skilled_fighter).

resource_mobilization_action(Person, military_invasion, secure_supplies) :-
    controls_economic_region(Person).

resource_mobilization_action(Person, political_coup, rally_supporters) :-
    trait(Person, diplomatic).

crisis_communication_strategy(Person, CrisisType, Strategy) :-
    (trait(Person, diplomatic) ->
        Strategy = [public_address, ally_coordination, enemy_negotiation];
        Strategy = [trusted_messengers, selective_communication, maintain_secrecy]).

%=============================================================================
% 10. ADVANCED OPTIMIZATION ALGORITHMS
%=============================================================================

% Multi-Objective Optimization for Complex Decisions
optimize_decision(Person, DecisionType, OptimalChoice, TradeOffs) :-
    decision_options(DecisionType, Options),
    findall([Score, Option, Analysis], 
            (member(Option, Options),
             evaluate_option(Person, DecisionType, Option, Score, Analysis)), 
            EvaluatedOptions),
    sort(1, @>=, EvaluatedOptions, [BestScore, OptimalChoice, BestAnalysis|_]),
    analyze_tradeoffs(Person, DecisionType, OptimalChoice, EvaluatedOptions, TradeOffs).

decision_options(marriage_choice, Options) :-
    findall(Partner, marriage_suitability(Person, Partner, _, _), Options).

decision_options(alliance_choice, Options) :-
    findall(Partner, alliance_recommendation(Person, Partner, _, _, _), Options).

decision_options(career_choice, Options) :-
    findall(Position, leadership_recommendation(Person, Position, _, _, _), Options).

evaluate_option(Person, marriage_choice, Partner, Score, Analysis) :-
    marriage_suitability(Person, Partner, Rating, Factors),
    rating_to_score(Rating, BaseScore),
    length(Factors, FactorCount),
    Score is BaseScore + (FactorCount * 2),
    Analysis = [rating(Rating), factors(Factors)].

evaluate_option(Person, alliance_choice, Partner, Score, Analysis) :-
    alliance_recommendation(Person, Partner, Type, Benefits, Risks),
    length(Benefits, BenefitCount),
    length(Risks, RiskCount),
    Score is (BenefitCount * 15) - (RiskCount * 10),
    Analysis = [type(Type), benefits(Benefits), risks(Risks)].

evaluate_option(Person, career_choice, Position, Score, Analysis) :-
    leadership_recommendation(Person, Position, QualScore, Requirements, Development),
    length(Development, DevNeeds),
    Score is QualScore - (DevNeeds * 5),
    Analysis = [qualification_score(QualScore), development_needs(DevNeeds)].

rating_to_score(excellent, 90).
rating_to_score(very_good, 80).
rating_to_score(good, 70).
rating_to_score(fair, 60).
rating_to_score(poor, 40).

analyze_tradeoffs(Person, DecisionType, OptimalChoice, AllOptions, TradeOffs) :-
    findall([Alternative, ScoreDiff, Advantages], 
            (member([AltScore, Alternative, AltAnalysis], AllOptions),
             Alternative \= OptimalChoice,
             member([BestScore, OptimalChoice, _], AllOptions),
             ScoreDiff is BestScore - AltScore,
             find_advantages(OptimalChoice, Alternative, Advantages)), 
            TradeOffs).

find_advantages(Choice1, Choice2, Advantages) :-
    choice_advantages(Choice1, Adv1),
    choice_advantages(Choice2, Adv2),
    subtract(Adv2, Adv1, UniqueAdv2),
    Advantages = UniqueAdv2.

choice_advantages(Person, Advantages) :-
    findall(Advantage, person_advantage(Person, Advantage), Advantages).

person_advantage(Person, high_survival) :-
    survival_assessment(Person, high, _).

person_advantage(Person, strong_military) :-
    trait(Person, skilled_fighter).

person_advantage(Person, diplomatic_skill) :-
    trait(Person, diplomatic).

person_advantage(Person, economic_power) :-
    controls_economic_region(Person).

%=============================================================================
% 11. RECOMMENDATION SYSTEM INTERFACES
%=============================================================================

% Master Recommendation Interface
get_all_recommendations(Person) :-
    format('~n COMPREHENSIVE RECOMMENDATIONS FOR ~w ~n', [Person]),
    format('=' * 60), nl,
    
    % Priority Assessment
    threat_level(Person, ThreatLevel),
    survival_assessment(Person, SurvivalLevel, _),
    format('Current Status: Threat Level ~w, Survival Assessment ~w~n~n', [ThreatLevel, SurvivalLevel]),
    
    % Urgent Recommendations
    urgent_recommendations(Person, UrgentRecs),
    format(' URGENT PRIORITIES:~n'),
    display_recommendations(UrgentRecs),
    
    % Complete Analysis
    comprehensive_recommendations(Person, AllRecs),
    format('~n COMPLETE ANALYSIS:~n'),
    display_recommendations(AllRecs),
    
    % Optimal Strategy
    optimal_strategy(Person, Strategy),
    format('~n OPTIMAL STRATEGY:~n'),
    format('~w~n', [Strategy]),
    
    % Development Plan
    character_development_plan(Person, DevPlan),
    format('~n DEVELOPMENT RECOMMENDATIONS:~n'),
    display_development_plan(DevPlan).

display_recommendations([]).
display_recommendations([[Category, Recs]|Rest]) :-
    format('~n--- ~w ---~n', [Category]),
    display_category_recommendations(Recs),
    display_recommendations(Rest).

display_category_recommendations([]).
display_category_recommendations([Rec|Rest]) :-
    format('  • ~w~n', [Rec]),
    display_category_recommendations(Rest).

display_development_plan([]).
display_development_plan([[Area, Actions]|Rest]) :-
    format('~w: ~w~n', [Area, Actions]),
    display_development_plan(Rest).

% Quick Recommendation Lookup
quick_recommendations(Person, Category) :-
    recommendation_category(Person, Category, Recommendations),
    format('~n~w RECOMMENDATIONS FOR ~w:~n', [Category, Person]),
    display_category_recommendations(Recommendations).

% Decision Support System
decision_support(Person, DecisionType) :-
    format('~n DECISION SUPPORT: ~w~n', [DecisionType]),
    optimize_decision(Person, DecisionType, OptimalChoice, TradeOffs),
    format('Recommended Choice: ~w~n', [OptimalChoice]),
    format('Alternative Considerations:~n'),
    display_tradeoffs(TradeOffs).

display_tradeoffs([]).
display_tradeoffs([[Alt, ScoreDiff, Advantages]|Rest]) :-
    format('  ~w (Score Difference: ~w) - Advantages: ~w~n', [Alt, ScoreDiff, Advantages]),
    display_tradeoffs(Rest).

% Interactive Recommendation Builder
build_recommendation_query(Person) :-
    format('Building personalized recommendations for ~w...~n', [Person]),
    format('Select focus area:~n'),
    format('1. Immediate Survival~n'),
    format('2. Political Advancement~n'),
    format('3. Personal Relationships~n'),
    format('4. Economic Opportunities~n'),
    format('5. Military Strategy~n'),
    format('Enter choice (1-5): '),
    read(Choice),
    handle_recommendation_choice(Person, Choice).

handle_recommendation_choice(Person, 1) :-
    survival_strategy_recommendation(Person, Strategies, Priority),
    format('~nSURVIVAL RECOMMENDATIONS:~n'),
    format('Priority Level: ~w~n', [Priority]),
    format('Recommended Strategies: ~w~n', [Strategies]).

handle_recommendation_choice(Person, 2) :-
    findall([Pos, Score], leadership_recommendation(Person, Pos, Score, _, _), Leadership),
    format('~nPOLITICAL ADVANCEMENT OPPORTUNITIES:~n'),
    display_category_recommendations(Leadership).

handle_recommendation_choice(Person, 3) :-
    best_marriage_matches(Person, Matches),
    findall([Partner, Type], alliance_recommendation(Person, Partner, Type, _, _), Alliances),
    format('~nRELATIONSHIP RECOMMENDATIONS:~n'),
    format('Marriage Options: ~w~n', [Matches]),
    format('Alliance Opportunities: ~w~n', [Alliances]).

handle_recommendation_choice(Person, 4) :-
    findall([Strategy, Gain], economic_recommendation(Person, Strategy, Gain, _), Economics),
    format('~nECONOMIC OPPORTUNITIES:~n'),
    display_category_recommendations(Economics).

handle_recommendation_choice(Person, 5) :-
    findall([Strategy, Effectiveness], 
            military_strategy_recommendation(Person, Strategy, Effectiveness, _), 
            Military),
    format('~nMILITARY STRATEGY OPTIONS:~n'),
    display_category_recommendations(Military).

handle_recommendation_choice(_, _) :-
    format('Invalid choice. Please try again.~n').

%=============================================================================
% 12. SYSTEM VALIDATION & TESTING
%=============================================================================

% Recommendation System Validation
validate_recommendations :-
    format('~n VALIDATING RECOMMENDATION SYSTEMS 🔍~n'),
    validate_marriage_system,
    validate_alliance_system,
    validate_leadership_system,
    validate_survival_system,
    format('All recommendation systems validated successfully!~n').

validate_marriage_system :-
    format('Testing marriage recommendation system...~n'),
    % Test that no inappropriate marriages are suggested
    forall((marriage_suitability(Person1, Person2, _, _)),
           (\+ blood_incompatible(Person1, Person2))),
    % Test gender compatibility
    forall((marriage_suitability(Person1, Person2, _, _)),
           (gender_compatible(Person1, Person2))),
    format('  ✓ Marriage system validation passed~n').

validate_alliance_system :-
    format('Testing alliance recommendation system...~n'),
    % Test that alliances have valid benefits
    forall((alliance_recommendation(Person1, Person2, _, Benefits, _)),
           (Benefits \= [])),
    format('  ✓ Alliance system validation passed~n').

validate_leadership_system :-
    format('Testing leadership recommendation system...~n'),
    % Test that recommendations meet minimum qualification threshold
    forall((leadership_recommendation(_, _, Score, _, _)),
           (Score >= 60)),
    format('  ✓ Leadership system validation passed~n').

validate_survival_system :-
    format('Testing survival recommendation system...~n'),
    % Test that survival strategies exist for all living characters
    forall((status(Person, alive)),
           (survival_strategy_recommendation(Person, _, _))),
    format('  ✓ Survival system validation passed~n').

% Performance Benchmarking
benchmark_recommendations :-
    format('~n⚡ BENCHMARKING RECOMMENDATION PERFORMANCE ⚡~n'),
    findall(Person, status(Person, alive), AlivePeople),
    length(AlivePeople, PersonCount),
    get_time(StartTime),
    forall(member(Person, AlivePeople), 
           comprehensive_recommendations(Person, _)),
    get_time(EndTime),
    TotalTime is EndTime - StartTime,
    AvgTime is TotalTime / PersonCount,
    format('Processed ~w characters in ~2f seconds~n', [PersonCount, TotalTime]),
    format('Average time per character: ~3f seconds~n', [AvgTime]),
    (AvgTime < 0.1 -> 
        format('Performance: EXCELLENT~n');
        format('Performance: Needs optimization~n')).

%=============================================================================
% 13. FINAL INTEGRATION & UTILITIES
%=============================================================================

% Master Help for Recommendation Systems
recommendation_help :-
    format('~n GAME OF THRONES RECOMMENDATION SYSTEMS GUIDE 📚~n'),
    format('=' * 65), nl,
    format('~n MAIN INTERFACES:~n'),
    format('get_all_recommendations(PersonName) - Complete recommendation suite~n'),
    format('quick_recommendations(PersonName, Category) - Category-specific advice~n'),
    format('decision_support(PersonName, DecisionType) - Decision optimization~n'),
    format('build_recommendation_query(PersonName) - Interactive builder~n'),
    format('~n MARRIAGE & RELATIONSHIPS:~n'),
    format('marriage_suitability(Person1, Person2, Score, Factors) - Compatibility analysis~n'),
    format('best_marriage_matches(PersonName, Matches) - Top marriage options~n'),
    format('resolve_relationship_conflict(Person1, Person2, Solutions) - Conflict resolution~n'),
    format('~n POLITICAL ALLIANCES:~n'),
    format('alliance_recommendation(Person1, Person2, Type, Benefits, Risks) - Alliance analysis~n'),
    format('strategic_alliance_recommendation(Person1, Person2, Benefit) - Strategic partnerships~n'),
    format('~n LEADERSHIP & CAREER:~n'),
    format('leadership_recommendation(Person, Position, Score, Requirements, Development) - Career advice~n'),
    format('career_progression(Person, CurrentRole, NextSteps) - Career path planning~n'),
    format('character_development_plan(Person, Plan) - Skill development recommendations~n'),
    format('~n MILITARY & STRATEGY:~n'),
    format('military_strategy_recommendation(Leader, Strategy, Effectiveness, Resources) - Military planning~n'),
    format('survival_strategy_recommendation(Person, Strategies, Priority) - Survival planning~n'),
    format('crisis_management(Person, CrisisType, ResponsePlan) - Emergency response~n'),
    format('~n ECONOMIC OPPORTUNITIES:~n'),
    format('economic_recommendation(Person, Strategy, Gain, Requirements) - Economic planning~n'),
    format('~n ADVANCED FEATURES:~n'),
    format('optimize_decision(Person, DecisionType, OptimalChoice, TradeOffs) - Decision optimization~n'),
    format('long_term_strategy(Person, TimeHorizon, Plan) - Strategic planning~n'),
    format('urgent_recommendations(Person, UrgentRecs) - Priority recommendations~n'),
    format('~n SYSTEM TOOLS:~n'),
    format('validate_recommendations - System validation~n'),
    format('benchmark_recommendations - Performance testing~n'),
    format('=' * 65), nl.

% Auto-initialization for recommendation systems
:- format('Game of Thrones Recommendation Systems Loaded Successfully! ~n').
:- format('Type "recommendation_help." for the complete guide~n').
:- format('Type "get_all_recommendations(PersonName)." to start analyzing!~n~n').

% Priority-Based Recommendation Filtering
urgent_recommendations(Person, UrgentRecs) :-
    threat_level(Person, ThreatLevel),
    survival_assessment(Person, SurvivalLevel, _),
    comprehensive_recommendations(Person, AllRecs),
    filter_by_urgency(ThreatLevel, SurvivalLevel, AllRecs, UrgentRecs).

filter_by_urgency(high, low, AllRecs, UrgentRecs) :-
    findall([Category, Recs], 
            (member([Category, Recs], AllRecs), 
             member(Category, [survival, alliances, military])), 
            UrgentRecs).

filter_by_urgency(high, medium, AllRecs, UrgentRecs) :-
    findall([Category, Recs], 
            (member([Category, Recs], AllRecs), 
             member(Category, [survival, alliances])), 
            UrgentRecs).

filter_by_urgency(medium, _, AllRecs, UrgentRecs) :-
    findall([Category, Recs], 
            (member([Category, Recs], AllRecs), 
             member(Category, [alliances, leadership, military])), 
            UrgentRecs).

filter_by_urgency(low, high, AllRecs, UrgentRecs) :-
    findall([Category, Recs], 
            (member([Category, Recs], AllRecs), 
             member(Category, [leadership, economic, marriage])), 
            UrgentRecs).

% Recommendation Scoring & Ranking
score_recommendation(Person, Category, Recommendation, Score) :-
    base_score(Category, BaseScore),
    urgency_multiplier(Person, Category, Multiplier),
    feasibility_score(Person, Recommendation, Feasibility),
    Score is BaseScore * Multiplier * Feasibility.

base_score(survival, 100).
base_score(alliances, 85).
base_score(military, 80).
base_score(leadership, 75).
base_score(economic, 70).
base_score(marriage, 65).

urgency_multiplier(Person, Category, Multiplier) :-
    threat_level(Person, ThreatLevel),
    urgency_factor(ThreatLevel, Category, Multiplier).

urgency_factor(high, survival, 1.5).
urgency_factor(high, alliances, 1.3).
urgency_factor(high, military, 1.4).
urgency_factor(medium, leadership, 1.2).
urgency_factor(low, economic, 1.1).
urgency_factor(low, marriage, 1.0).
urgency_factor(_, _, 1.0). % Default

feasibility_score(Person, Recommendation, Score) :-
    recommendation_complexity(Recommendation, Complexity),
    person_capability(Person, Capability),
    Score is min(1.0, Capability / Complexity).

recommendation_complexity([Strategy, Effectiveness, Resources], Complexity) :-
    length(Resources, ResourceCount),
    Complexity is ResourceCount * 10 + (100 - Effectiveness).

recommendation_complexity([Position, QualScore, Requirements, Development], Complexity) :-
    length(Requirements, ReqCount),
    length(Development, DevCount),
    Complexity is ReqCount * 5 + DevCount * 10 + (100 - QualScore).

recommendation_complexity(_, 50). % Default complexity

person_capability(Person, Capability) :-
    findall(Trait, trait(Person, Trait), Traits),
    length(Traits, TraitCount),
    (title(Person, _) -> TitleBonus = 20; TitleBonus = 0),
    (controls_region(Person, _) -> RegionBonus = 15; RegionBonus = 0),
    Capability is min(100, TraitCount * 8 + TitleBonus + RegionBonus).
    %=============================================================================
% GAME OF THRONES COMPLETE KNOWLEDGE BASE & RECOMMENDATION SYSTEM
% Updated through Season 8 (2019) - Complete Series
% Enhanced with AI-powered recommendations and strategic analysis
%=============================================================================

%_____________________________________________________________________________
% CORE FAMILY DATABASE - ALL MAJOR HOUSES

% House Stark
parent(rickard_stark, brandon_stark).
parent(rickard_stark, eddard_stark).
parent(rickard_stark, benjen_stark).
parent(rickard_stark, lyanna_stark).
parent(unknown_mother_stark, brandon_stark).
parent(unknown_mother_stark, eddard_stark).
parent(unknown_mother_stark, benjen_stark).
parent(unknown_mother_stark, lyanna_stark).
parent(eddard_stark, robb_stark).
parent(eddard_stark, sansa_stark).
parent(eddard_stark, arya_stark).
parent(eddard_stark, bran_stark).
parent(eddard_stark, rickon_stark).
parent(catelyn_stark, robb_stark).
parent(catelyn_stark, sansa_stark).
parent(catelyn_stark, arya_stark).
parent(catelyn_stark, bran_stark).
parent(catelyn_stark, rickon_stark).
parent(lyanna_stark, jon_snow).

% House Targaryen
parent(aegon_V_targaryen, duncan_targaryen).
parent(aegon_V_targaryen, aerys_targaryen).
parent(aegon_V_targaryen, rhaella_targaryen).
parent(aegon_V_targaryen, daeron_targaryen).
parent(unknown_mother_targaryen, duncan_targaryen).
parent(unknown_mother_targaryen, aerys_targaryen).
parent(unknown_mother_targaryen, rhaella_targaryen).
parent(unknown_mother_targaryen, daeron_targaryen).
parent(aerys_targaryen, rhaegar_targaryen).
parent(aerys_targaryen, viserys_targaryen).
parent(aerys_targaryen, daenerys_targaryen).
parent(rhaella_targaryen, rhaegar_targaryen).
parent(rhaella_targaryen, viserys_targaryen).
parent(rhaella_targaryen, daenerys_targaryen).
parent(rhaegar_targaryen, rhaenys_targaryen).
parent(rhaegar_targaryen, aegon_targaryen).
parent(rhaegar_targaryen, jon_snow).

% House Lannister
parent(tytos_lannister, tywin_lannister).
parent(tytos_lannister, kevan_lannister).
parent(unknown_mother_lannister, tywin_lannister).
parent(unknown_mother_lannister, kevan_lannister).
parent(tywin_lannister, cersei_lannister).
parent(tywin_lannister, jaime_lannister).
parent(tywin_lannister, tyrion_lannister).
parent(joanna_lannister, cersei_lannister).
parent(joanna_lannister, jaime_lannister).
parent(joanna_lannister, tyrion_lannister).
parent(cersei_lannister, joffery_lannister).
parent(cersei_lannister, myrcella_lannister).
parent(cersei_lannister, tommen_lannister).
parent(jaime_lannister, joffery_lannister).
parent(jaime_lannister, myrcella_lannister).
parent(jaime_lannister, tommen_lannister).
parent(kevan_lannister, lancel_lannister).

% House Baratheon
parent(steffon_baratheon, robert_baratheon).
parent(steffon_baratheon, stannis_baratheon).
parent(steffon_baratheon, renly_baratheon).
parent(cassana_estermont, robert_baratheon).
parent(cassana_estermont, stannis_baratheon).
parent(cassana_estermont, renly_baratheon).
parent(robert_baratheon, gendry).
parent(stannis_baratheon, shireen_baratheon).
parent(selyse_baratheon, shireen_baratheon).

% House Tyrell
parent(luthor_tyrell, mace_tyrell).
parent(olenna_tyrell, mace_tyrell).
parent(mace_tyrell, margaery_tyrell).
parent(mace_tyrell, loras_tyrell).
parent(alerie_hightower, margaery_tyrell).
parent(alerie_hightower, loras_tyrell).

% House Greyjoy
parent(unknown_father_greyjoy, balon_greyjoy).
parent(unknown_father_greyjoy, euron_greyjoy).
parent(unknown_father_greyjoy, aeron_greyjoy).
parent(unknown_mother_greyjoy, balon_greyjoy).
parent(unknown_mother_greyjoy, euron_greyjoy).
parent(unknown_mother_greyjoy, aeron_greyjoy).
parent(balon_greyjoy, yara_greyjoy).
parent(balon_greyjoy, theon_greyjoy).
parent(alannys_harlaw, yara_greyjoy).
parent(alannys_harlaw, theon_greyjoy).

% House Martell
parent(lewyn_martell, doran_martell).
parent(lewyn_martell, ella_martell).
parent(lewyn_martell, oberyn_martell).
parent(unknown_mother_martell, doran_martell).
parent(unknown_mother_martell, ella_martell).
parent(unknown_mother_martell, oberyn_martell).
parent(doran_martell, trystane_martell).
parent(ella_martell, aegon_targaryen).
parent(ella_martell, rhaenys_targaryen).
parent(oberyn_martell, tyene_sand).
parent(oberyn_martell, obara_sand).
parent(oberyn_martell, nymeria_sand).

% House Tarly
parent(randyll_tarly, samwell_tarly).
parent(randyll_tarly, dickon_tarly).
parent(melessa_tarly, samwell_tarly).
parent(melessa_tarly, dickon_tarly).
parent(samwell_tarly, sam_jr).
parent(gilly, sam_jr).

%_____________________________________________________________________________
% GENDER DEFINITIONS

male(aegon_targaryen).
male(aegon_V_targaryen).
male(aeron_greyjoy).
male(aerys_targaryen).
male(balon_greyjoy).
male(benjen_stark).
male(bran_stark).
male(brandon_stark).
male(daeron_targaryen).
male(dickon_tarly).
male(doran_martell).
male(duncan_targaryen).
male(eddard_stark).
male(euron_greyjoy).
male(gendry).
male(jaime_lannister).
male(joffery_lannister).
male(jon_snow).
male(kevan_lannister).
male(lancel_lannister).
male(lewyn_martell).
male(loras_tyrell).
male(luthor_tyrell).
male(mace_tyrell).
male(oberyn_martell).
male(randyll_tarly).
male(renly_baratheon).
male(rhaegar_targaryen).
male(rickard_stark).
male(rickon_stark).
male(robb_stark).
male(robert_baratheon).
male(sam_jr).
male(samwell_tarly).
male(stannis_baratheon).
male(steffon_baratheon).
male(theon_greyjoy).
male(tommen_lannister).
male(trystane_martell).
male(tyrion_lannister).
male(tytos_lannister).
male(tywin_lannister).
male(viserys_targaryen).
male(the_hound).
male(the_mountain).
male(jorah_mormont).
male(tormund_giantsbane).

female(alannys_harlaw).
female(alerie_hightower).
female(arya_stark).
female(cassana_estermont).
female(catelyn_stark).
female(cersei_lannister).
female(daenerys_targaryen).
female(ella_martell).
female(gilly).
female(joanna_lannister).
female(lyanna_stark).
female(margaery_tyrell).
female(melessa_tarly).
female(myrcella_lannister).
female(nymeria_sand).
female(obara_sand).
female(olenna_tyrell).
female(rhaella_targaryen).
female(rhaenys_targaryen).
female(sansa_stark).
female(selyse_baratheon).
female(shireen_baratheon).
female(tyene_sand).
female(yara_greyjoy).
female(brienne_of_tarth).
female(melisandre).
female(missandei).

%_____________________________________________________________________________
% STATUS UPDATES (Through Season 8)

% SURVIVORS
status(arya_stark, alive).
status(bran_stark, alive).
status(gendry, alive).
status(jon_snow, alive).
status(sansa_stark, alive).
status(tyrion_lannister, alive).
status(yara_greyjoy, alive).
status(samwell_tarly, alive).
status(gilly, alive).
status(sam_jr, alive).
status(brienne_of_tarth, alive).
status(the_hound, alive).
status(tormund_giantsbane, alive).

% SEASON 8 DEATHS
status(cersei_lannister, dead).
status(jaime_lannister, dead).
status(daenerys_targaryen, dead).
status(theon_greyjoy, dead).
status(jorah_mormont, dead).
status(missandei, dead).
status(melisandre, dead).
status(the_mountain, dead).
status(euron_greyjoy, dead).
status(randyll_tarly, dead).
status(dickon_tarly, dead).

% PREVIOUS DEATHS
status(eddard_stark, dead).
status(catelyn_stark, dead).
status(robb_stark, dead).
status(rickon_stark, dead).
status(joffery_lannister, dead).
status(tywin_lannister, dead).
status(tommen_lannister, dead).
status(myrcella_lannister, dead).
status(robert_baratheon, dead).
status(stannis_baratheon, dead).
status(renly_baratheon, dead).
status(shireen_baratheon, dead).
status(margaery_tyrell, dead).
status(loras_tyrell, dead).
status(mace_tyrell, dead).
status(olenna_tyrell, dead).
status(oberyn_martell, dead).
status(doran_martell, dead).
status(trystane_martell, dead).
status(obara_sand, dead).
status(nymeria_sand, dead).
% Add missing character statuses
status(ygritte, dead).
status(val, unknown). % Book character

%_____________________________________________________________________________
% POLITICAL POSITIONS AND TITLES

title(bran_stark, king_of_six_kingdoms).
title(sansa_stark, queen_in_the_north).
title(jon_snow, nights_watch_commander).
title(tyrion_lannister, hand_of_the_king).
title(gendry, lord_of_storms_end).
title(yara_greyjoy, lady_of_iron_islands).
title(samwell_tarly, grand_maester).
title(brienne_of_tarth, lord_commander_kingsguard).
title(arya_stark, explorer).

%_____________________________________________________________________________
% CHARACTER TRAITS AND ATTRIBUTES

trait(jon_snow, honorable).
trait(jon_snow, brave).
trait(jon_snow, loyal).
trait(jon_snow, brooding).

trait(daenerys_targaryen, ambitious).
trait(daenerys_targaryen, ruthless).
trait(daenerys_targaryen, idealistic).
trait(daenerys_targaryen, dragon_blood).

trait(tyrion_lannister, intelligent).
trait(tyrion_lannister, witty).
trait(tyrion_lannister, diplomatic).
trait(tyrion_lannister, alcoholic).

trait(arya_stark, vengeful).
trait(arya_stark, independent).
trait(arya_stark, skilled_fighter).
trait(arya_stark, loyal).

trait(sansa_stark, political).
trait(sansa_stark, resilient).
trait(sansa_stark, diplomatic).
trait(sansa_stark, cautious).

trait(bran_stark, mystical).
trait(bran_stark, wise).
trait(bran_stark, detached).
trait(bran_stark, omniscient).

trait(cersei_lannister, ruthless).
trait(cersei_lannister, protective).
trait(cersei_lannister, paranoid).
trait(cersei_lannister, ambitious).

trait(jaime_lannister, skilled_fighter).
trait(jaime_lannister, honorable).
trait(jaime_lannister, conflicted).
trait(jaime_lannister, loyal).

%_____________________________________________________________________________
% REGION AND HOUSE CONTROL

controls_region(sansa_stark, the_north).
controls_region(bran_stark, six_kingdoms).
controls_region(yara_greyjoy, iron_islands).
controls_region(gendry, stormlands).
controls_region(samwell_tarly, reach).

house_member(jon_snow, stark).
house_member(jon_snow, targaryen).
house_member(sansa_stark, stark).
house_member(arya_stark, stark).
house_member(bran_stark, stark).
house_member(tyrion_lannister, lannister).
house_member(gendry, baratheon).
house_member(yara_greyjoy, greyjoy).
house_member(samwell_tarly, tarly).

%_____________________________________________________________________________
% BASIC RELATIONSHIPS

child(X, Y) :- parent(Y, X).
daughter(X, Y) :- parent(Y, X), female(X).
son(X, Y) :- parent(Y, X), male(X).
mother(X, Y) :- parent(X, Y), female(X).
father(X, Y) :- parent(X, Y), male(X).

sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    dif(X, Y).

sister(X, Y) :- sibling(X, Y), female(X).
brother(X, Y) :- sibling(X, Y), male(X).

aunt(X, Y) :-
    sister(X, Z),
    parent(Z, Y),
    dif(X, Z).

uncle(X, Y) :-
    brother(X, Z),
    parent(Z, Y),
    dif(X, Z).

%_____________________________________________________________________________
% SUCCESSION AND INHERITANCE

legitimate_heir(Heir, House) :-
    house_member(Heir, House),
    status(Heir, alive),
    male(Heir).

potential_ruler(Person) :-
    status(Person, alive),
    (title(Person, _); house_member(Person, _)).

%_____________________________________________________________________________
% RECOMMENDATION SYSTEMS

% CANONICAL RELATIONSHIPS AND MARRIAGES
% Historical/Canon romantic relationships
romantic_relationship(jon_snow, ygritte, love).
romantic_relationship(jon_snow, daenerys_targaryen, political_and_love).
romantic_relationship(jaime_lannister, cersei_lannister, forbidden_love).
romantic_relationship(tyrion_lannister, sansa_stark, arranged_marriage).
romantic_relationship(gendry, arya_stark, romantic_interest).
romantic_relationship(samwell_tarly, gilly, love).
romantic_relationship(jorah_mormont, daenerys_targaryen, unrequited_love).

% Marriage Alliance Recommendations (Canon-compliant)
marriage_recommendation(Person1, Person2, Reason) :-
    status(Person1, alive),
    status(Person2, alive),
    dif(Person1, Person2),
    % Must be different genders
    ((male(Person1), female(Person2)) ; (female(Person1), male(Person2))),
    % Cannot be close family
    \+ sibling(Person1, Person2),
    \+ parent(Person1, Person2),
    \+ parent(Person2, Person1),
    \+ aunt(Person1, Person2),
    \+ aunt(Person2, Person1),
    \+ uncle(Person1, Person2),
    \+ uncle(Person2, Person1),
    % Must be from different houses (for political alliances)
    house_member(Person1, House1),
    house_member(Person2, House2),
    dif(House1, House2),
    % Additional canon checks
    \+ too_close_relatives(Person1, Person2),
    Reason = political_alliance.

% Define what constitutes "too close" relatives (Stark "siblings")
too_close_relatives(jon_snow, arya_stark).
too_close_relatives(jon_snow, sansa_stark).
too_close_relatives(jon_snow, bran_stark).
too_close_relatives(arya_stark, jon_snow).
too_close_relatives(sansa_stark, jon_snow).
too_close_relatives(bran_stark, jon_snow).
too_close_relatives(arya_stark, sansa_stark).
too_close_relatives(arya_stark, bran_stark).
too_close_relatives(sansa_stark, bran_stark).
too_close_relatives(sansa_stark, arya_stark).
too_close_relatives(bran_stark, arya_stark).
too_close_relatives(bran_stark, sansa_stark).

% Canonical marriage possibilities for Jon Snow specifically
jon_marriage_options(daenerys_targaryen, political_and_romantic) :- 
    status(daenerys_targaryen, dead). % Historical relationship
jon_marriage_options(ygritte, true_love) :- 
    status(ygritte, dead). % Historical relationship

% Strategic Alliance Recommendations
alliance_recommendation(Person1, Person2, Reason) :-
    controls_region(Person1, Region1),
    controls_region(Person2, Region2),
    dif(Region1, Region2),
    dif(Person1, Person2),
    Reason = territorial_strength.

% Character Compatibility (based on traits)
compatible_characters(Person1, Person2, Compatibility) :-
    status(Person1, alive),
    status(Person2, alive),
    dif(Person1, Person2),
    trait(Person1, honorable),
    trait(Person2, honorable),
    Compatibility = high_honor_match.

compatible_characters(Person1, Person2, Compatibility) :-
    status(Person1, alive),
    status(Person2, alive),
    dif(Person1, Person2),
    trait(Person1, intelligent),
    trait(Person2, intelligent),
    Compatibility = intellectual_match.

% Leadership Recommendations
leadership_recommendation(Person, Position, Reason) :-
    status(Person, alive),
    trait(Person, intelligent),
    trait(Person, diplomatic),
    \+ title(Person, _),
    Position = advisor,
    Reason = diplomatic_skills.

leadership_recommendation(Person, Position, Reason) :-
    status(Person, alive),
    trait(Person, skilled_fighter),
    trait(Person, brave),
    Position = military_commander,
    Reason = combat_skills.

% Survival Probability (based on traits and current status)
survival_probability(Person, high) :-
    status(Person, alive),
    trait(Person, cautious),
    trait(Person, intelligent).

survival_probability(Person, medium) :-
    status(Person, alive),
    trait(Person, brave),
    trait(Person, skilled_fighter).

survival_probability(Person, low) :-
    status(Person, alive),
    trait(Person, ruthless),
    trait(Person, ambitious),
    \+ trait(Person, cautious).

%_____________________________________________________________________________
% ADVANCED QUERIES

% Who survived the Game of Thrones?
final_survivors(Survivors) :-
    findall(X, status(X, alive), Survivors).

% Most powerful remaining houses
powerful_house(House) :-
    house_member(Person, House),
    status(Person, alive),
    title(Person, _).

% Canon-compliant marriage query for specific characters
canonical_marriage_options(jon_snow, Partner, Reason) :-
    (Partner = ygritte, Reason = true_love, status(ygritte, dead));
    (Partner = daenerys_targaryen, Reason = political_and_romantic, status(daenerys_targaryen, dead));
    (Partner = val, Reason = political_alliance, status(val, unknown)). % Book only

% Realistic current marriage options (alive characters only)
realistic_marriage_options(Person, Partner, Reason) :-
    status(Person, alive),
    status(Partner, alive),
    dif(Person, Partner),
    % Gender compatibility
    ((male(Person), female(Partner)) ; (female(Person), male(Partner))),
    % No close blood relations
    \+ too_close_relatives(Person, Partner),
    \+ sibling(Person, Partner),
    \+ parent(Person, Partner),
    \+ parent(Partner, Person),
    % Different houses for political benefit
    house_member(Person, House1),
    house_member(Partner, House2),
    dif(House1, House2),
    Reason = political_alliance.

% Strategic recommendations for a character
strategic_advice(Person, Advice) :-
    findall([Action, Reason], (
        (alliance_recommendation(Person, Partner, Reason), Action = ally_with(Partner));
        (leadership_recommendation(Person, Position, Reason), Action = seek_position(Position))
    ), Advice).

% Best match for marriage (canon-compliant)
best_marriage_match(Person, Matches) :-
    findall([Partner, Reason], realistic_marriage_options(Person, Partner, Reason), Matches).
character_profile(Person) :-
    status(Person, Status),
    format('~w - Status: ~w~n', [Person, Status]),
    (title(Person, Title) -> format('Title: ~w~n', [Title]); true),
    findall(Trait, trait(Person, Trait), Traits),
    (Traits \= [] -> format('Traits: ~w~n', [Traits]); true),
    (house_member(Person, House) -> format('House: ~w~n', [House]); true),
    survival_probability(Person, Probability),
    format('Survival Probability: ~w~n', [Probability]).

% Game outcome analysis
analyze_endgame :-
    format('=== GAME OF THRONES FINAL OUTCOME ANALYSIS ===~n'),
    title(bran_stark, Title1),
    format('Ultimate Winner: Bran Stark (~w)~n', [Title1]),
    title(sansa_stark, Title2),
    format('Northern Independence: Sansa Stark (~w)~n', [Title2]),
    final_survivors(Survivors),
    length(Survivors, Count),
    format('Total Survivors: ~w~n', [Count]),
    format('Key Survivors: ~w~n', [Survivors]).

% Recommendation engine
get_recommendations(Person) :-
    format('=== RECOMMENDATIONS FOR ~w ===~n', [Person]),
    best_marriage_match(Person, Marriages),
    (Marriages \= [] -> format('Marriage Options: ~w~n', [Marriages]); true),
    strategic_advice(Person, Advice),
    (Advice \= [] -> format('Strategic Advice: ~w~n', [Advice]); true),
    findall([Partner, Reason], compatible_characters(Person, Partner, Reason), Compatible),
    (Compatible \= [] -> format('Compatible Characters: ~w~n', [Compatible]); true).

%_____________________________________________________________________________
% GAME STATISTICS

% House power ranking
house_power_score(House, Score) :-
    findall(Person, (house_member(Person, House), status(Person, alive)), Members),
    length(Members, MemberCount),
    findall(Person, (house_member(Person, House), status(Person, alive), title(Person, _)), TitledMembers),
    length(TitledMembers, TitleCount),
    Score is MemberCount + (TitleCount * 3).

% Most successful house
most_successful_house(House) :-
    findall([Score, H], house_power_score(H, Score), Scores),
    max_member([MaxScore, House], Scores).

% Trait analysis
most_common_trait(Trait) :-
    findall(T, (trait(_, T), status(Person, alive)), Traits),
    msort(Traits, Sorted),
    mode(Sorted, Trait).

%_____________________________________________________________________________
% UTILITY PREDICATES

mode([H|T], Mode) :- mode(T, H, 1, H, 1, Mode).
mode([], _, _, Mode, _, Mode).
mode([H|T], H, Count, TempMode, MaxCount, Mode) :-
    Count1 is Count + 1,
    (Count1 > MaxCount -> 
        mode(T, H, Count1, H, Count1, Mode) ; 
        mode(T, H, Count1, TempMode, MaxCount, Mode)).
mode([H|T], Current, Count, TempMode, MaxCount, Mode) :-
    H \= Current,
    mode(T, H, 1, TempMode, MaxCount, Mode).

% Unknown status rule
status(X, unknown) :-
    \+ status(X, alive),
    \+ status(X, dead),
    !.

%_____________________________________________________________________________
% INTERACTIVE SYSTEM

start_game :-
    format('~n=== WELCOME TO THE GAME OF THRONES KNOWLEDGE BASE ===~n'),
    format('Type "help." for available commands~n'),
    format('Type "analyze_endgame." to see the final outcome~n'),
    format('Type "character_profile(PersonName)." for character info~n~n').

help :-
    format('~n=== AVAILABLE COMMANDS ===~n'),
    format('character_profile(Name) - Get detailed character information~n'),
    format('get_recommendations(Name) - Get strategic recommendations~n'),
    format('analyze_endgame - View final Game of Thrones outcome~n'),
    format('final_survivors(X) - List all survivors~n'),
    format('most_successful_house(X) - Find the most powerful house~n'),
    format('marriage_recommendation(X,Y,Z) - Find marriage suggestions~n'),
    format('alliance_recommendation(X,Y,Z) - Find alliance opportunities~n'),
    format('survival_probability(Name, X) - Check survival chances~n~n').

% Auto-start when loaded
:- start_game.
