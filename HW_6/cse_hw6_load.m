function [Pa1,Pa2,Pa3,Pa4,Rewards] = cse_hw6_load()
% function [Pa1,Pa2,Pa3,Pa4] = cse_hw6_load()
% load the transition matrices, pai corresponding to the transition matrix
% of action ai

S=81;

Rewards = importdata('rewards.txt');

A1 = importdata('prob_a1.txt');
A2 = importdata('prob_a2.txt');
A3 = importdata('prob_a3.txt');
A4 = importdata('prob_a4.txt');

spA1 = spconvert(A1);
spA2 = spconvert(A2);
spA3 = spconvert(A3);
spA4 = spconvert(A4);

Pa1 = full(spA1);
Pa2 = full(spA2);
Pa3 = full(spA3);
Pa4 = full(spA4);






