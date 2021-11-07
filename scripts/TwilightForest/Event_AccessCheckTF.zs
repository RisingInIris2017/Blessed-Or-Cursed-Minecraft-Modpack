#loader crafttweaker reloadableevents
import crafttweaker.event.PlayerPickupItemEvent;
import crafttweaker.event.EntityTravelToDimensionEvent;

import crafttweaker.player.IPlayer;
import crafttweaker.text.ITextComponent;
// Gain access by picking up the Infused Key
events.onPlayerPickupItem(function(event as PlayerPickupItemEvent){
    for value in kachingMap{
        if(event.item.item.definition.id == "contenttweaker:magic_infused_key")
        {
            event.player.update({PlayerPersisted: {HasCraftedInfusedKey: 1}});
        }
    }
});
// Access Checker
events.onEntityTravelToDimension(
    function(event as EntityTravelToDimensionEvent) {
        // IEntity convert to IPlayer
        if(event.entity instanceof IPlayer)
        {
            var player as IPlayer = event.entity;
            if (
                (!player.world.remote) &&
                (event.dimension == 7) &&
                (
                    (isNull(player.data)) ||
                    (isNull(player.data.PlayerPersisted)) ||
                    (isNull(player.data.PlayerPersisted.HasCraftedInfusedKey))
                )
            )
            {
                event.cancel();
                player.sendRichTextMessage(ITextComponent.fromTranslation("crafttweaker.cannot_go_to_tf"));
            }   
        }
    }
);