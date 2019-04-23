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

	python main.py \
	--policy_name "DDPG" \
	--env_name "Hopper-v1" \
	--seed $i \
	--start_timesteps 1000 \
	--expert_path "dataset/hopper.npz"

	python main.py \
	--policy_name "DDPG" \
	--env_name "Walker2d-v1" \
	--seed $i \
	--start_timesteps 1000
    --expert_path "dataset/walker.npz"

	python main.py \
	--policy_name "DDPG" \
	--env_name "Ant-v1" \
	--seed $i \
	--start_timesteps 10000 \
	--max_timesteps 2e6 \
	--eval_freq 2e3 \
	--expert_path "dataset/ant.npz"
done