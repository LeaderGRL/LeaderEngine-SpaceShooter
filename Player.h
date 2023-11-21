#pragma once
#include <LeaderEngine\Application.h>
#include <LeaderEngine/IComponent.h>
#include <LeaderEngine/BoxColliderComponent.h>

using namespace LeaderEngine;

class Player
{
	private:
		Entity playerEntity;

	public:
		Player();
		~Player();
		
		void Init();
		void Move();
		void OnKeyPressed(const sf::Event& event);

		//void Update();
		//void Render()
};

