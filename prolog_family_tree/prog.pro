% Student exercise profile
:- set_prolog_flag(occurs_check, error).        % disallow cyclic terms
:- set_prolog_stack(global, limit(8 000 000)).  % limit term space (8Mb)
:- set_prolog_stack(local,  limit(2 000 000)).  % limit environment space

%
% Sex -----------------------------
%

% 	male
male(sl_savva).		% -- First generation
male(sl_nikolay).	% -- Second generation
male(mo_nurgun).	% -- Third generation
male(ku_alexey).
male(me_pavel).
male(sp_alexey).

male(mo_ersan).	% -- Fourth generation
male(mo_erchim).
male(mo_erkin).

male(ku_arthur). % it's me :)
male(ku_arian).

male(sp_kirill).


% 	female
female(sl_tatyana). % -- First generation
female(sl_nina).	% -- Second generation
female(mo_tatyana).	% -- Third generation
female(ku_diana).
female(me_ekaterina).
female(sp_alexandra).

female(me_sophia).	% -- Fourth generation
female(me_lubov).
female(sp_viktoria).

%
% Parent --------------------------
%

% First and Second generation

parent(sl_tatyana, sl_nikolay).
parent(sl_savva, sl_nikolay).


% Second and Third generation

parent(sl_nina, mo_tatyana).
parent(sl_nina, ku_diana).
parent(sl_nina, me_ekaterina).
parent(sl_nina, sp_alexandra).

parent(sl_nikolay, mo_tatyana).
parent(sl_nikolay, ku_diana).
parent(sl_nikolay, me_ekaterina).
parent(sl_nikolay, sp_alexandra).


% Third and Fourth generation

%% mo_ family
parent(mo_tatyana, mo_ersan).
parent(mo_tatyana, mo_erchim).
parent(mo_tatyana, mo_erkin).
       
parent(mo_nurgun, mo_ersan).
parent(mo_nurgun, mo_erchim).
parent(mo_nurgun, mo_erkin).


%% ku_ family (my)
parent(ku_diana, ku_arthur).  % my mother
parent(ku_diana, ku_arian).

parent(ku_alexey, ku_arthur). % my father
parent(ku_alexey, ku_arian).


%% me_ family
parent(me_ekaterina, me_sophia).
parent(me_ekatetina, me_lubov).

parent(me_pavel, me_sophia).
parent(me_pavel, me_lubov).


%% sp_ family
parent(sp_alexandra, sp_kirill).
parent(sp_alexandra, sp_viktoria).
parent(sp_alexey, sp_kirill).
parent(sp_alexay, sp_viktoria).

%
% Spouse
%

spouse(sl_tatyana, sl_savva).
spouse(sl_nina, sl_nikolay).
spouse(mo_tatyana, mo_nurgun).
spouse(ku_diana, ku_alexey).
spouse(me_ekaterina, me_pavel).
spouse(sp_alexandra, sp_alexey):- !.

% spouse(some_girl, ku_arthur) ;)

%
% Functions
%

spouse(X, Y) :- spouse(Y, X).

father(X, Y) :- male(X), parent(X, Y).
mother(X, Y) :- female(X), parent(X, Y).

sublings(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

brother(X, Y) :- male(X), sublings(X, Y).
sister(X, Y) :- female(X), sublings(X, Y).

wife(X, Y) :- spouse(X, Y), female(X).
husband(X, Y) :- spouse(X, Y), male(X).

grandparent(X, Y) :- parent(Z, Y), parent(X, Z).
grandfather(X, Y) :- male(X), grandparent(X, Y).
grandmother(X, Y) :- female(x), grandparent(X, Y).