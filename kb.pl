

% Building Locations
% (from, to, direction)

build_loc('reception', 'oc', north).
build_loc('oc', 'reception', north).
build_loc('oc', 'nc', west).
build_loc('nc', 'oc', north).
build_loc('oc', 'audi', east).
build_loc('audi', 'oc', west).
build_loc('oc', 'gym', south).
build_loc('gym', 'oc', north).
build_loc('gym', 'xc', east).
build_loc('gym', 'xc_cafe', south).
build_loc('xc_cafe', 'gym', south).
build_loc('xc', 'gym', west).
build_loc('xc', 'xc_cafe', west).
build_loc('xc_cafe', 'xc', east).

% Find route b/w buildings
% If adjacent:
%route(Building1, Building2, R) :-
%    build_loc(Building1, Building2, X) ,
%    append([X],R).
% If not adjacent
%route(Building1, Building2) :-
%   build_loc(Building1, Y, R), route(Y, Building2).

route(A, B, [A, B], D) :-
    build_loc(A, B, D).

%route(A, B, [A | D]) :-
%    build_loc(A, C, X), route(C, B, D).

route(A, B, [RAB], D) :-
    build_loc(A, C, X),
    route(C, B, RCB, [DCB]),
    RAB = [A | RCB],
    D is [X, DCB] .

% Rooms
% (code, building, floor, status)

room(xc1, xc, 0, 0).
room(xc2, xc, 0, 0).
room(xc3, xc, 0, 0).
room(xc4, xc, 0, 0).
room(xc5, xc, 0, 0).
room(xc6, xc, 0, 0).
room(xc7, xc, 0, 0).
room(xc9, xc, 0, 0).
room(xc10, xc, 0, 0).
room(xc11, xc, 1, 0).
room(xc12, xc, 1, 0).
room(xc13, xc, 1, 0).
room(xc14, xc, 1, 0).
room(xc15, xc, 1, 0).
room(xc16, xc, 1, 0).
room(xc17, xc, 1, 0).
room(xc18, xc, 1, 0).
room(xc19, xc, 1, 0).
room(xc20, xc, 2, 0).
room(xc21, xc, 2, 0).
room(xc22, xc, 2, 0).
room(xc23, xc, 2, 0).
room(xc24, xc, 2, 0).
room(xc25, xc, 2, 0).
room(xc26, xc, 2, 0).
room(xc27, xc, 2, 0).
room(xc28, xc, 2, 0).
room(xc29, xc, 2, 0).
room(gpclab1, xc, 2, 0).




room(nc1, nc,0,0).
room(nc2, nc,0,0).
room(nc3, nc,0,0).
room(nc4, nc,0,0).
room(nc5, nc,0,0).
room(nc6, nc,0,0).
room(nc7, nc,0,0).
room(nc8, nc,1,0).
room(nc9, nc,1,0).
room(nc10,nc,1,0).
room(nc11,nc,1,0).
room(nc12,nc,1,0).
room(nc13,nc,1,0).
room(nc14,nc,1,0).
room(nc15,nc,2,0).
room(nc16,nc,2,0).
room(nc17,nc,2,0).
room(nc18,nc,2,0).
room(nc19,nc,2,0).
room(nc20,nc,2,0).
room(nc21,nc,2,0).
room(nc22,nc,3,0).
room(nc23,nc,3,0).
room(nc24,nc,3,0).
room(nc25,nc,3,0).
room(nc26,nc,3,0).
room(nc27,nc,3,0).
room(nc28,nc,3,1).
room(library,nc,4,0).

room(oc1, oc,0,0).
room(oc2, oc,0,0).
room(oc3, oc,0,0).
room(oc4, oc,0,0).
room(oc5, oc,0,0).
room(oc6, oc,0,0).
room(oc7, oc,0,0).
room(oc8, oc,0,0).
room(oc9, oc,0,0).
room(oc10, oc,0,0).
room(oc11, oc,0,0).
room(oc12, oc,0,0).
room(oc13, oc,0,0).
room(oc14, oc,0,0).
room(oclab1, oc,1,0).
room(oclab2, oc,1,0).
room(oclab3, oc,1,0).
room(oclab4, oc,1,0).









