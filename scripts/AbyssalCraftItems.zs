import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
// For send Messages
import crafttweaker.text.ITextComponent;

val AbyssalIngotEnergy = 300;

val firstAbyssBook = <abyssalcraft:necronomicon>.withTag({PotEnergy: 0.0 as float});
val secondAbyssBook = <abyssalcraft:necronomicon_cor>.withTag({PotEnergy: 0.0 as float});
val thirdAbyssBook = <abyssalcraft:necronomicon_dre>.withTag({PotEnergy: 0.0 as float});
val fourthAbyssBook = <abyssalcraft:necronomicon_omt>.withTag({PotEnergy: 0.0 as float});
val finalAbyssBook = <abyssalcraft:abyssalnomicon>.withTag({PotEnergy: 0.0 as float});
val allAbyssBooksWithoutNBT as IItemStack[] = [
    <abyssalcraft:necronomicon>,
    <abyssalcraft:necronomicon_cor>,
    <abyssalcraft:necronomicon_dre>,
    <abyssalcraft:necronomicon_omt>,
    <abyssalcraft:abyssalnomicon>
];
val allAbyssBooks as IItemStack[] = [
    firstAbyssBook, secondAbyssBook, thirdAbyssBook, fourthAbyssBook, finalAbyssBook
];
val inputBooks as IItemStack[] = [
    <minecraft:book>, firstAbyssBook, secondAbyssBook, thirdAbyssBook
];
val inputSkins as IItemStack[] = [
    <abyssalcraft:antiflesh>, <abyssalcraft:skin>, <abyssalcraft:skin:1>, <abyssalcraft:skin:2>
];
val AbyssalIngot = <contenttweaker:abyssal_ingot>;
// Book Recipes
for book in allAbyssBooksWithoutNBT
{
    recipes.remove(book);
}
var index = 0;
for book in allAbyssBooks
{
    if(finalAbyssBook.matches(book))
    {
        recipes.addShaped("final_ac_book", book,
        [
            [<abyssalcraft:gatekeeperessence>, <abyssalcraft:eldritchscale>, <abyssalcraft:gatekeeperessence>],
            [<abyssalcraft:eldritchscale>, fourthAbyssBook, <abyssalcraft:eldritchscale>],
            [AbyssalIngot, <abyssalcraft:ingotblock:3>, AbyssalIngot] // Ethanxium Block
        ]);
    }
    else
    {
        var bookMaterial = (firstAbyssBook.matches(book)) ? <twilightforest:giant_obsidian> : AbyssalIngot;
        recipes.addShaped("ac_book_recipe_"~index, book,
        [
            [inputSkins[index], inputSkins[index], <contenttweaker:fourth_killcount_token>],
            [inputSkins[index], inputBooks[index], bookMaterial],
            [<contenttweaker:third_proudsoul_bottle>, bookMaterial, bookMaterial]
        ]);
    }
    index += 1;
}

// Abyssal Ingot Ritual Recipe
val HACCubesArray as IItemStack[] = [
    <dcs_climate:dcs_color_cube:5>,
    <dcs_climate:dcs_color_cube:6>,
    <dcs_climate:dcs_color_cube:7>,
    <dcs_climate:dcs_color_cube:8>,
    <dcs_climate:dcs_color_cube:9>
];
val TwilightTrophysArray as IItemStack[] = [
    <twilightforest:trophy:2>,
    <twilightforest:trophy:3>,
    <twilightforest:trophy:5>
];
val HACCubes = <dcs_climate:dcs_color_cube:5>|
    <dcs_climate:dcs_color_cube:6>|
    <dcs_climate:dcs_color_cube:7>|
    <dcs_climate:dcs_color_cube:8>|
    <dcs_climate:dcs_color_cube:9>;
val TwilightTrophys = <twilightforest:trophy:2>|
    <twilightforest:trophy:3>|
    <twilightforest:trophy:5>;
index = 0;
// Unused AC Ritual recipe
// for cube in HACCubesArray
// {
//     for trophy in TwilightTrophysArray
//     {
//         mods.abyssalcraft.CreationRitual.addRitual(
//         "abyssal_ingot_ritual"~index,
//         0, -1, AbyssalIngotEnergy, true,
//         AbyssalIngot,
//         [
//             <dcs_climate:dcs_ingot:18>,
//             <twilightforest:fiery_ingot>,
//             <twilightforest:fiery_ingot>,
//             <twilightforest:fiery_ingot>,
//             <thaumcraft:ingot:1>,
//             <thaumcraft:ingot:1>,
//             <thaumcraft:ingot:1>,
//             trophy,
//             cube
//         ]);
//         index += 1;
//     }
// }

recipes.addShapeless(
    // 配方名称
    "abyssal_ingot",
    // 输出物品
    AbyssalIngot,
    // 输入材料
    [
        <abyssalcraft:necronomicon>.marked("book").transformNew
        (
            function(item)
            {
                var bookNBT as IData = item.tag;
                if(isNull(bookNBT)||isNull(bookNBT.PotEnergy))
                {
                    return item;
                }
                else
                {
                    var bookEnergy as int = bookNBT.PotEnergy.asInt();
                    return item.updateTag({PotEnergy : max(0, bookEnergy - AbyssalIngotEnergy)});
                }
            }
        ),
        <dcs_climate:dcs_ingot:18>,
        <twilightforest:fiery_ingot>,
        <twilightforest:fiery_ingot>,
        <twilightforest:fiery_ingot>,
        <thaumcraft:ingot:1>,
        <thaumcraft:ingot:1>,
        TwilightTrophys,
        HACCubes

    ],
    // 配方函数
    function(out,ins,info)
    {
        var bookNBT as IData = ins.book.tag;
        if(isNull(bookNBT)||isNull(bookNBT.PotEnergy))
        {
            return null;
        }
        else
        {
            var bookPotEnergy as int = bookNBT.PotEnergy.asInt();
            if(bookPotEnergy >= AbyssalIngotEnergy){return out;}
            else
            {
                info.player.sendRichTextMessage(
                    ITextComponent.fromTranslation("crafttweaker.energy_not_enough_0") ~
                    ITextComponent.fromTranslation("item.necronomicon.name") ~
                    ITextComponent.fromTranslation("crafttweaker.energy_not_enough_1") ~
                    ITextComponent.fromString(AbyssalIngotEnergy as string) ~
                    ITextComponent.fromTranslation("crafttweaker.energy_not_enough_2")
                );
                return null;
            }
        }
    },
    // 配方动作
    null
);