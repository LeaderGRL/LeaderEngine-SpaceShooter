#include "Player.h"

// TO DO => Replace this by a scriptable component

Player::Player()
{
	Init();
}

Player::~Player()
{
	
}

void Player::Init()
{
	//EntityManager::GetInstance().CreateEntity("Fighter");
	//EntityManager::GetInstance().GetEntity("Fighter")->AddComponent<Sprite2DComponent>(ResourceManager::GetInstance().getTexture("Fighter"));
	//EntityManager::GetInstance().GetEntity("Fighter")->AddComponent<BoxColliderComponent>(sf::Vector2f(64, 64));
	//EntityManager::GetInstance().GetEntity("Fighter")->setPosition(sf::Vector2f(200, 200));

	//EntityManager::GetInstance().CreateEntity("FighterEffect");
	//EntityManager::GetInstance().GetEntity("FighterEffect")->AddComponent<Sprite2DComponent>();
	//EntityManager::GetInstance().GetEntity("FighterEffect")->GetComponent<Sprite2DComponent>()->PlayAnimation("FighterEffectAnimation");
	//EntityManager::GetInstance().GetEntity("FighterEffect")->setPosition(sf::Vector2f(200, 200));

	//EventManager::GetInstance().RegisterEvent(INPUT_EVENT::KeyPressed, std::bind(&Player::OnKeyPressed, this, std::placeholders::_1));
}

//void Player::Move()
//{
//	EntityManager::GetInstance().GetEntity("Fighter")->move(sf::Vector2f(1, 0));
//}
//
//void Player::OnKeyPressed(const sf::Event& event)
//{
//	if (event.key.code == sf::Keyboard::Z)
//	{
//		Move();
//	}
//}

