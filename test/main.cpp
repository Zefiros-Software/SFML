
#include <SFML/System/Clock.hpp>
#include <iostream>

int main( int arv, const char **argv )
{
    sf::Clock clock; // starts the clock

    sf::Time elapsed1 = clock.getElapsedTime();
    std::cout << elapsed1.asSeconds() << std::endl;
    clock.restart();

    sf::Time elapsed2 = clock.getElapsedTime();
    std::cout << elapsed2.asSeconds() << std::endl;

    return 0;
}
