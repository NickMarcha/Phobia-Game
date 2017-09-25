/// @description Insert description here
// You can write your code in this editor
object_player.Health = min(object_player.Health + 20, object_player.maxHealth);
instance_destroy(self);