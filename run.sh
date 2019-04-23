#!/bin/bash

# Script to reproduce results

for ((i=0;i<5;i+=1))
do
	python main.py \
	--policy_name "DDPG" \
	--env_name "HalfCheetah-v1" \
	--seed $i \
	--start_timesteps 10000

	python main.py \
	--policy_name "DDPG" \
	--env_name "Hopper-v1" \
	--seed $i \
	--start_timesteps 1000

	python main.py \
	--policy_name "DDPG" \
	--env_name "Walker2d-v1" \
	--seed $i \
	--start_timesteps 1000

	python main.py \
	--policy_name "DDPG" \
	--env_name "Ant-v1" \
	--seed $i \
	--start_timesteps 10000 \
	--max_timesteps 2e6 \
	--eval_freq 2e3
done
