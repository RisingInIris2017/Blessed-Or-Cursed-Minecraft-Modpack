#loader contenttweaker
//Pack Imports
import mods.contenttweaker.VanillaFactory;
// import crafttweaker.item.IMutableItemStack;
var abyssIngot = mods.contenttweaker.VanillaFactory.createItem("abyssal_ingot");
abyssIngot.creativeTab = <creativetab:acitems>;
abyssIngot.rarity = "epic";
abyssIngot.glowing = true;
abyssIngot.maxStackSize = 64;
abyssIngot.register();