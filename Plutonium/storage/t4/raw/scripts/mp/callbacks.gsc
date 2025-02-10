#include common_scripts\utility;
#include maps\mp\_utility;

main()
{
	level.callbackActorSpawned = ::Callback_ActorSpawned;
}

Callback_ActorSpawned()
{
/*
	PrintConsole( "Callback_ActorSpawned:" );
	PrintConsole( "self.classname: " + self.classname );
*/
}

CodeCallback_ActorSpawned()
{
	self [[level.callbackActorSpawned]]();
}
