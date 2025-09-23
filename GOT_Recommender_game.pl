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
status(tyene_sand, dead).

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

% Marriage Alliance Recommendations
marriage_recommendation(Person1, Person2, Reason) :-
    status(Person1, alive),
    status(Person2, alive),
    dif(Person1, Person2),
    house_member(Person1, House1),
    house_member(Person2, House2),
    dif(House1, House2),
    \+ sibling(Person1, Person2),
    \+ parent(Person1, Person2),
    \+ parent(Person2, Person1),
    Reason = political_alliance.

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

% Best match for marriage
best_marriage_match(Person, Matches) :-
    findall([Partner, Reason], marriage_recommendation(Person, Partner, Reason), Matches).

% Strategic recommendations for a character
strategic_advice(Person, Advice) :-
    findall([Action, Reason], (
        (alliance_recommendation(Person, Partner, Reason), Action = ally_with(Partner));
        (leadership_recommendation(Person, Position, Reason), Action = seek_position(Position))
    ), Advice).

% Character analysis
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
