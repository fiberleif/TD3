#!/bin/bash

# Script to reproduce results
export CUDA_VISIBLE_DEVICES=$1
echo $CUDA_VISIBLE_DEVICES

SEEDS="0 1 2 3 4"
for i in $SEEDS
do
	python main.py \
	--policy_name "DDPG" \
	--env_name "HalfCheetah-v1" \
	--seed $i \
	--start_timesteps 10000 \
	--expert_path "dataset/half_cheetah.npz"
done