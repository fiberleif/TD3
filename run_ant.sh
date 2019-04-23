#!/bin/bash

# Script to reproduce results
export CUDA_VISIBLE_DEVICES=$1
echo $CUDA_VISIBLE_DEVICES

SEEDS="0 1 2 3 4"
for i in $SEEDS
do
	python main.py \
	--policy_name "DDPG" \
	--env_name "Ant-v1" \
	--seed $i \
	--start_timesteps 10000 \
	--max_timesteps 2e6 \
	--eval_freq 2e3 \
	--expert_path "dataset/ant.npz"
done