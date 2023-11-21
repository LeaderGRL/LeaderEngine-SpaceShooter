#include <SFML/Graphics.hpp>
#include <iostream>
#include <LeaderEngine\Application.h>
#include "Player.h"


int main()
{
    LeaderEngine::Application app;
	Player player;
	player.Init();
	app.Run();
	return 0;
}