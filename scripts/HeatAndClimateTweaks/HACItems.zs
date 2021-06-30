import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;

val goldenJewelEnergy = 10000;
val finalPendantEnergy = 10000;

val dimName as string[] = [
    game.localize("crafttweaker.dim51"),
    game.localize("crafttweaker.dim52")
];

// T3 Material Induction Motar
recipes.remove(<dcs_climate:dcs_mechanical>);
recipes.addShaped("induction_motor_new", <dcs_climate:dcs_mechanical> * 2,
    [
        [<twilightforest:knightmetal_ingot>,<contenttweaker:second_proudsoul_bottle>,<twilightforest:knightmetal_ingot>],
        [null,<dcs_climate:dcs_device_shaft_s_sus>, null],
        [<twilightforest:carminite>,<dcs_climate:dcs_device_shaft_s_sus>, <twilightforest:carminite>]
    ]
);
// Magic Cubes
// Variables claming
// Outputs
val blueCube = <dcs_climate:dcs_color_cube>;
val greenCube = <dcs_climate:dcs_color_cube:1>;
val redCube = <dcs_climate:dcs_color_cube:2>;
val blackCube = <dcs_climate:dcs_color_cube:3>;
val whiteCube = <dcs_climate:dcs_color_cube:4>;
// Inputs
val elestialBlock = <dcs_climate:dcs_ore_elestial>;
val HACInactiveCubes as IItemStack[] = [
    blueCube, greenCube, redCube, blackCube, whiteCube
];
val HACExtracts as IItemStack[] = [
    <dcs_climate:dcs_color:5>,
    <dcs_climate:dcs_color:6>,
    <dcs_climate:dcs_color:7>,
    <dcs_climate:dcs_color:8>,
    <dcs_climate:dcs_color:9>
];
val HACColorGems as IItemStack[][] = [
    [<dcs_climate:dcs_gem_blue:2> ,<dcs_climate:dcs_gem_blue:5>],
    [<dcs_climate:dcs_gem_green:2>, <dcs_climate:dcs_gem_green:5>],
    [<dcs_climate:dcs_gem_red:2>, <dcs_climate:dcs_gem_red:5>],
    [<dcs_climate:dcs_gem_black:2>, <dcs_climate:dcs_gem_black:5>],
    [<dcs_climate:dcs_gem_white:2>, <dcs_climate:dcs_gem_white:5>]
];
for index in 0 .. HACInactiveCubes.length
{
    var cube = HACInactiveCubes[index];
    recipes.remove(cube);
    for gemtype in 0 .. HACColorGems[0].length
    {      
        recipes.addShapeless(cube.name~"new_recipe"~gemtype, cube,
        [
            HACExtracts[index],
            elestialBlock,
            HACColorGems[index][gemtype],
            <contenttweaker:nature_shard>
        ]);
    }
}

// HAC Magic Jewels
// HAC Rings exclude the golden ones, for T3
val HACRings as IItemStack[] = [
    <dcs_climate:dcs_color_ring>,
    <dcs_climate:dcs_color_ring:1>,
    <dcs_climate:dcs_color_ring:2>,
    <dcs_climate:dcs_color_ring:3>,
    <dcs_climate:dcs_color_ring:4>,
];
// HAC Golden Jewels, for T4
val HACGoldenJewels as IItemStack[] = [
    <dcs_climate:dcs_color_ring2:2>,
    <dcs_climate:dcs_color_ring2:3>,
    <dcs_climate:dcs_color_pendant2>,
    <dcs_climate:dcs_color_pendant2:2>,
    <dcs_climate:dcs_color_pendant2:3>,
    <dcs_climate:dcs_color_pendant2:4>
];
// HAC Pendants, for last stage
val HACPendants as IItemStack[] = [
    <dcs_climate:dcs_color_pendant>,
    <dcs_climate:dcs_color_pendant:2>,
    <dcs_climate:dcs_color_pendant:3>,
    <dcs_climate:dcs_color_pendant:4>
];
// Items only for Infinite Heart
val InfiniteHeartItem as IItemStack[] = [
    // 5 Badges
    <dcs_climate:dcs_color_badge>,
    <dcs_climate:dcs_color_badge:1>,
    <dcs_climate:dcs_color_badge:2>,
    <dcs_climate:dcs_color_badge:3>,
    <dcs_climate:dcs_color_badge:4>,
    // HAC Other final items
    <dcs_climate:dcs_sword_toolsteel>
];
// remove all jewels' recipes
val HACJewels as IItemStack[][] = [HACRings, HACGoldenJewels, HACPendants, InfiniteHeartItem];
for jeweltype in HACJewels{for jewel in jeweltype{recipes.remove(jewel);}}
val HACMagicCubes as IItemStack[] = [
    <dcs_climate:dcs_color_cube:5>,
    <dcs_climate:dcs_color_cube:6>,
    <dcs_climate:dcs_color_cube:7>,
    <dcs_climate:dcs_color_cube:8>,
    <dcs_climate:dcs_color_cube:9>  
];
val fieryMaterial = <twilightforest:fiery_blood>|<twilightforest:fiery_tears>;
// HAC T3 Rings recipes
var index = 0;
for ring in HACRings
{
    recipes.addShaped("hac_t3_rings_recipe"~index, ring,
        [
            [<contenttweaker:third_killcount_token>, HACMagicCubes[index], <contenttweaker:second_proudsoul_bottle>],
            [fieryMaterial, <twilightforest:trophy:*>, fieryMaterial],
            [<dcs_climate:dcs_ingot:18>, <twilightforest:knightmetal_ring>, <dcs_climate:dcs_ingot:18>]
        ]
    );
    index += 1;
}
// HAC T4 Golden Jewels recipes
// Golden Pendants
index = 0;
val HACGoldenPendantsCubes as IItemStack[] = [
    <dcs_climate:dcs_color_cube:5>,
    <dcs_climate:dcs_color_cube:7>,
    <dcs_climate:dcs_color_cube:8>,
    <dcs_climate:dcs_color_cube:9>
];
val HACGoldenPendants as IItemStack[] = [
    <dcs_climate:dcs_color_pendant2>,
    <dcs_climate:dcs_color_pendant2:2>,
    <dcs_climate:dcs_color_pendant2:3>,
    <dcs_climate:dcs_color_pendant2:4>
];
for golden_pendant in HACGoldenPendants
{
    // Unused AC Ritual
    // mods.abyssalcraft.CreationRitual.addRitual(
    //     "golden_pendant_ritual"~index,
    //     2, 2, 10000, true,
    //     golden_pendant,
    //     [
    //         <futuremc:netherite_ingot>,
    //         <futuremc:netherite_ingot>,
    //         <futuremc:netherite_ingot>,
    //         <futuremc:netherite_ingot>,
    //         <forge:bucketfilled>.withTag({FluidName: "liquidantimatter", Amount: 1000}),
    //         <forge:bucketfilled>.withTag({FluidName: "dcs.mazai", Amount: 1000}),
    //         <forge:bucketfilled>.withTag({FluidName: "dcs.nitrogen", Amount: 1000}),
    //         <contenttweaker:abyssal_ingot>,
    //         HACGoldenPendantsCubes[index]
    //     ],
    //     true
    // );
    recipes.addShapeless(
    // 配方名称
    "golden_pendant"~index,
    // 输出物品
    golden_pendant,
    // 输入材料
    [
        <abyssalcraft:necronomicon_dre>.marked("book").transformNew
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
                    return item.updateTag({PotEnergy : max(0, bookEnergy - goldenJewelEnergy)});
                }
            }
        ),
        <futuremc:netherite_ingot>,
        <futuremc:netherite_ingot>,
        <futuremc:netherite_ingot>,
        <forge:bucketfilled>.withTag({FluidName: "liquidantimatter", Amount: 1000}),
        <forge:bucketfilled>.withTag({FluidName: "dcs.mazai", Amount: 1000}),
        <forge:bucketfilled>.withTag({FluidName: "dcs.nitrogen", Amount: 1000}),
        <contenttweaker:abyssal_ingot>,
        HACGoldenPendantsCubes[index]

    ],
    // 配方函数
    function(out,ins,info)
    {
        var bookNBT as IData = ins.book.tag;
        if(isNull(bookNBT)||isNull(bookNBT.PotEnergy))
        {
            return null;
        }
        else if(info.player.world.dimension != 51)
        {
            info.player.sendMessage(game.localize("crafttweaker.dim_is_incorrect")~dimName[0]);
            return null;
        }
        else
        {
            var bookPotEnergy as int = bookNBT.PotEnergy.asInt();
            if(bookPotEnergy >= goldenJewelEnergy)
            {
                return out;
            }
            else
            {
                info.player.sendMessage(game.localize("crafttweaker.energy_not_enough_0")~ins.book.displayName~game.localize("crafttweaker.energy_not_enough_1")~goldenJewelEnergy~game.localize("crafttweaker.energy_not_enough_2"));
                return null;
            }
        }
    },
    // 配方动作
    null
    );
    index += 1;
}
// Golden Rings
index = 0;
val HACGoldenRingsCubes as IItemStack[] = [
    <dcs_climate:dcs_color_cube:7>,
    <dcs_climate:dcs_color_cube:8>
];
val HACGoldenRings as IItemStack[] = [
    <dcs_climate:dcs_color_ring2:2>,
    <dcs_climate:dcs_color_ring2:3>
];
for golden_ring in HACGoldenRings
{
    // Unused AC Ritual
    // mods.abyssalcraft.CreationRitual.addRitual(
    // "golden_ring_ritual"~index,
    // 2, 51, 10000, true,
    // golden_ring,
    // [
    //     HACGoldenRingsCubes[index],
    //     <futuremc:netherite_ingot>,
    //     <futuremc:netherite_ingot>,
    //     <futuremc:netherite_ingot>,
    //     <forge:bucketfilled>.withTag({FluidName: "liquidantimatter", Amount: 1000}),
    //     <forge:bucketfilled>.withTag({FluidName: "dcs.mazai", Amount: 1000}),
    //     <forge:bucketfilled>.withTag({FluidName: "dcs.nitrogen", Amount: 1000}),
    //     <contenttweaker:abyssal_ingot>,
    //     <twilightforest:knightmetal_ring>
    // ]);
    recipes.addShapeless(
    // 配方名称
    "golden_ring"~index,
    // 输出物品
    golden_ring,
    // 输入材料
    [
        <abyssalcraft:necronomicon_dre>.marked("book").transformNew
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
                    return item.updateTag({PotEnergy : max(0, bookEnergy - goldenJewelEnergy)});
                }
            }
        ),
        <futuremc:netherite_ingot>,
        <futuremc:netherite_ingot>,
        <twilightforest:knightmetal_ring>,
        <forge:bucketfilled>.withTag({FluidName: "liquidantimatter", Amount: 1000}),
        <forge:bucketfilled>.withTag({FluidName: "dcs.mazai", Amount: 1000}),
        <forge:bucketfilled>.withTag({FluidName: "dcs.nitrogen", Amount: 1000}),
        <contenttweaker:abyssal_ingot>,
        HACGoldenPendantsCubes[index]

    ],
    // 配方函数
    function(out,ins,info)
    {
        var bookNBT as IData = ins.book.tag;
        if(isNull(bookNBT)||isNull(bookNBT.PotEnergy))
        {
            return null;
        }
        else if(info.player.world.dimension != 51)
        {
            info.player.sendMessage(game.localize("crafttweaker.dim_is_incorrect")~dimName[0]);
            return null;
        }
        else
        {
            var bookPotEnergy as int = bookNBT.PotEnergy.asInt();
            if(bookPotEnergy >= goldenJewelEnergy)
            {
                return out;
            }
            else
            {
                info.player.sendMessage(game.localize("crafttweaker.energy_not_enough_0")~ins.book.displayName~game.localize("crafttweaker.energy_not_enough_1")~goldenJewelEnergy~game.localize("crafttweaker.energy_not_enough_2"));
                return null;
            }
        }
    },
    // 配方动作
    null
    );
    index += 1;
}
// Final Pendants
index = 0;
for final_pendant in HACPendants
{
    // Unused AC Ritual
    // mods.abyssalcraft.CreationRitual.addRitual(
    // "final_pendant_ritual"~index,
    // 3, 52, 10000, true,
    // final_pendant,
    // [
    //     <futuremc:netherite_ingot>,
    //     <futuremc:netherite_ingot>,
    //     <futuremc:netherite_ingot>,
    //     <contenttweaker:fourth_killcount_token>,
    //     <forge:bucketfilled>.withTag({FluidName: "dcs.mazai", Amount: 1000}),
    //     <forge:bucketfilled>.withTag({FluidName: "dcs.mazai", Amount: 1000}),
    //     <contenttweaker:abyssal_ingot>,
    //     <contenttweaker:abyssal_ingot>,
    //     HACGoldenPendants[index],
    // ],
    // true);
    recipes.addShapeless(
    // 配方名称
    "final_pendant"~index,
    // 输出物品
    final_pendant,
    // 输入材料
    [
        <abyssalcraft:necronomicon_omt>.marked("book").transformNew
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
                    return item.updateTag({PotEnergy : max(0, bookEnergy - finalPendantEnergy)});
                }
            }
        ),
        <futuremc:netherite_ingot>,
        <futuremc:netherite_ingot>,
        <contenttweaker:fourth_killcount_token>,
        <forge:bucketfilled>.withTag({FluidName: "dcs.mazai", Amount: 1000}),
        <forge:bucketfilled>.withTag({FluidName: "dcs.mazai", Amount: 1000}),
        <contenttweaker:abyssal_ingot>,
        <contenttweaker:abyssal_ingot>,
        HACGoldenPendants[index],

    ],
    // 配方函数
    function(out,ins,info)
    {
        var bookNBT as IData = ins.book.tag;
        if(isNull(bookNBT)||isNull(bookNBT.PotEnergy))
        {
            return null;
        }
        else if(info.player.world.dimension != 52)
        {
            info.player.sendMessage(game.localize("crafttweaker.dim_is_incorrect")~dimName[1]);
            return null;
        }
        else
        {
            var bookPotEnergy as int = bookNBT.PotEnergy.asInt();
            if(bookPotEnergy >= finalPendantEnergy)
            {
                return out;
            }
            else
            {
                info.player.sendMessage(game.localize("crafttweaker.energy_not_enough_0")~ins.book.displayName~game.localize("crafttweaker.energy_not_enough_1")~finalPendantEnergy~game.localize("crafttweaker.energy_not_enough_2"));
                return null;
            }
        }
    },
    // 配方动作
    null
    );
    index += 1;
}