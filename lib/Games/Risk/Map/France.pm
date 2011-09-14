use 5.010;
use strict;
use warnings;

package Games::Pandemic::Map::France;
# ABSTRACT: France

use Moose;
use Games::Pandemic::I18n qw{ T };
extends 'Games::Pandemic::Map';


# -- attribute builders

sub _build_name        { "france" }
sub _build_title       { T("France") }
sub _build_author      { "Thierry Baldo" }

sub _raw_continents {
return (
# id, name, bonus, color
#   0, T('Europe'), 5, blue
[1, T("Bretagne"), 3, "col1"],
[2, T("Basse Normandie"), 2, "col2"],
[3, T("Haute Normandie"), 2, "col3"],
[4, T("Picardie"), 2, "col4"],
[5, T("Nord Pas de Calais"), 5, "col5"],
[6, T("Champagne Ardenne"), 2, "col6"],
[7, T("Lorraine"), 3, "col7"],
[8, T("Alsace"), 2, "col8"],
[9, T("Franche Comte"), 2, "col9"],
[10, T("Rhone Alpes"), 6, "col10"],
[11, T("Provence Alpes Cote d Azur"), 5, "col11"],
[12, T("Corse"), 1, "col12"],
[13, T("Languedoc Roussillon"), 3, "col13"],
[14, T("Midi Pyrenees"), 3, "col14"],
[15, T("Aquitaine"), 3, "col15"],
[16, T("Poitou Charente"), 2, "col16"],
[17, T("Pays de la Loire"), 4, "col17"],
[18, T("Centre"), 3, "col18"],
[19, T("Ile de France"), 11, "col19"],
[20, T("Bourgogne"), 2, "col20"],
[21, T("Auvergne"), 2, "col21"],
[22, T("Limousin"), 1, "col22"],
);
}


# -- raw map information

sub _raw_countries {
return (
# greyscale, name, continent id, x, y, [connections]
#   1, T('Alaska'), 1, 43, 67, [ 1,2,3,38 ]
[1, T("Ain"), 10, 343, 230, [39, 74, 73, 38, 69, 71]],
[2, T("Aisne"), 4, 290, 77, [59, 8, 51, 77, 60, 80]],
[3, T("Allier"), 21, 284, 216, [18, 58, 71, 63, 23, 42]],
[  4,  T("Alpes de Haute Provence"),  11,  381,  323,  [5, 6, 83, 13, 84, 26],],
[5, T("Hautes Alpes"), 11, 380, 301, [38, 73, 4, 26]],
[6, T("Alpes Maritimes"), 11, 414, 333, [4, 83, 96]],
[7, T("Ardeche"), 10, 324, 298, [43, 42, 26, 84, 30, 48]],
[8, T("Ardennes"), 6, 321, 71, [2, 55, 51]],
[9, T("Ariege"), 14, 226, 378, [31, 11, 66]],
[10, T("Aube"), 6, 305, 136, [51, 52, 21, 89, 77]],
[11, T("Aude"), 13, 254, 369, [81, 34, 66, 9, 31]],
[12, T("Aveyron"), 14, 261, 317, [15, 48, 30, 34, 81, 82, 46]],
[13, T("Bouches du Rhone"), 11, 354, 354, [20, 30, 84, 4, 83]],
[14, T("Calvados"), 2, 172, 97, [50, 27, 61]],
[15, T("Cantal"), 21, 256, 288, [63, 43, 48, 12, 46, 19]],
[16, T("Charente"), 16, 182, 254, [17, 79, 86, 87, 24]],
[17, T("Charente Maritime"), 16, 151, 246, [85, 79, 16, 33]],
[18, T("Cher"), 18, 258, 191, [45, 58, 3, 23, 36, 41]],
[19, T("Correze"), 22, 235, 271, [87, 23, 63, 15, 46, 24]],
[20, T("Corse du Sud"), 12, 443, 398, [96, 13, 83]],
[21, T("Cote d Or"), 20, 335, 178, [10, 52, 70, 39, 71, 58, 89]],
[22, T("Cotes d Armor"), 1, 100, 128, [29, 56, 35]],
[23, T("Creuse"), 22, 247, 237, [19, 87, 36, 18, 3, 63]],
[24, T("Dordogne"), 15, 202, 281, [87, 19, 46, 47, 33, 16]],
[25, T("Doubs"), 9, 376, 182, [70, 90, 39]],
[26, T("Drome"), 10, 342, 301, [4, 7, 42, 38, 5, 84]],
[27, T("Eure"), 3, 212, 103, [76, 95, 78, 28, 61, 14, 60]],
[  28,  T("Eure et Loire"),  18,  224,  131,  [27, 78, 91, 45, 41, 72, 61],],
[29, T("Finistere"), 1, 63, 126, [22, 56]],
[30, T("Gard"), 13, 320, 336, [48, 7, 84, 13, 34, 12]],
[31, T("Haute Garonne"), 14, 223, 351, [65, 32, 82, 81, 11, 9]],
[32, T("Gers"), 14, 195, 344, [40, 47, 82, 31, 65, 64]],
[33, T("Gironde"), 15, 155, 299, [17, 24, 47, 40]],
[34, T("Herault"), 13, 296, 346, [81, 12, 30, 11]],
[35, T("Ille et Vilaine"), 1, 131, 141, [22, 50, 53, 44, 56]],
[36, T("Indre"), 18, 233, 203, [37, 41, 18, 23, 87, 86]],
[37, T("Indre et Loire"), 18, 201, 181, [72, 41, 36, 86, 49]],
[38, T("Isere"), 10, 363, 276, [1, 73, 5, 26, 42, 69]],
[39, T("Jura"), 9, 360, 208, [1, 71, 21, 70, 25]],
[40, T("Landes"), 15, 150, 335, [33, 47, 32, 64]],
[41, T("Loire et Cher"), 18, 221, 165, [28, 45, 18, 36, 37, 72]],
[42, T("Loire"), 10, 315, 261, [69, 38, 26, 7, 43, 63, 3, 71]],
[43, T("Haute Loire"), 21, 304, 281, [42, 7, 48, 15, 63]],
[44, T("Loire Atlantique"), 17, 132, 176, [56, 35, 49, 85]],
[45, T("Loiret"), 18, 248, 155, [28, 91, 77, 89, 18, 41, 58]],
[46, T("Lot"), 14, 226, 309, [24, 19, 15, 12, 82, 47]],
[47, T("Lot et Garonne"), 15, 190, 317, [24, 46, 82, 32, 40, 33]],
[48, T("Lozere"), 13, 292, 308, [15, 43, 7, 30, 12]],
[  49,  T("Maine et Loire"),  17,  168,  175,  [44, 53, 72, 37, 86, 79, 85],],
[50, T("Manche"), 2, 143, 94, [14, 61, 53, 35]],
[51, T("Marne"), 6, 314, 106, [2, 8, 55, 52, 10, 77]],
[52, T("Haute Marne"), 6, 342, 145, [51, 55, 88, 70, 21, 10]],
[53, T("Mayenne"), 17, 161, 144, [35, 50, 61, 72, 49]],
[54, T("Meurthe et Moselle"), 7, 370, 115, [55, 57, 67, 88]],
[55, T("Meuse"), 7, 344, 99, [8, 54, 88, 52, 51]],
[56, T("Morbihan"), 1, 102, 153, [29, 22, 35, 44]],
[57, T("Moselle"), 7, 379, 94, [54, 67]],
[58, T("Nievre"), 20, 292, 191, [89, 21, 71, 3, 18, 45]],
[59, T("Nord"), 5, 274, 29, [2, 80, 62]],
[60, T("Oise"), 4, 251, 85, [2, 77, 95, 27, 76, 80]],
[61, T("Orne"), 2, 191, 117, [14, 27, 28, 72, 53, 50]],
[62, T("Pas de Calais"), 5, 262, 45, [59, 80]],
[63, T("Puy de Dome"), 21, 278, 249, [3, 42, 43, 15, 19, 23]],
[64, T("Pyrenees Atlantiques"), 15, 159, 360, [40, 32, 65]],
[65, T("Hautes Pyrenees"), 14, 187, 378, [64, 32, 31]],
[66, T("Pyrenees Orientales"), 13, 261, 395, [9, 11]],
[67, T("Bas Rhin"), 8, 410, 112, [57, 54, 68]],
[68, T("Haut Rhin"), 8, 404, 146, [67, 88, 90]],
[69, T("Rhone"), 10, 329, 250, [1, 38, 42, 71]],
[70, T("Haute Saone"), 9, 368, 160, [88, 90, 25, 21, 52, 39]],
[71, T("Saone et Loire"), 20, 323, 208, [1, 69, 42, 3, 58, 21, 39]],
[72, T("Sarthe"), 17, 190, 147, [53, 61, 28, 41, 37, 49]],
[73, T("Savoie"), 10, 388, 264, [1, 74, 38, 5]],
[74, T("Haute Savoie"), 10, 382, 236, [1, 73]],
[75, T("Paris"), 19, 49, 208, [92, 93, 94]],
[76, T("Seine Maritime"), 3, 216, 74, [80, 60, 27]],
[  77,  T("Seine et Marne"),  19,  271,  118,  [2, 60, 2, 51, 10, 89, 45, 91, 94, 93, 95],],
[78, T("Yvelines"), 19, 239, 116, [27, 95, 92, 91, 28]],
[79, T("Deux Sevres"), 16, 170, 224, [86, 16, 17, 85, 49]],
[80, T("Somme"), 4, 252, 63, [2, 62, 2, 60, 76, 59]],
[81, T("Tarn"), 14, 249, 341, [82, 12, 34, 11, 31]],
[82, T("Tarn et Garonne"), 14, 216, 330, [46, 12, 81, 31, 32, 47]],
[83, T("Var"), 11, 381, 361, [13, 84, 4, 6, 20, 96]],
[84, T("Vaucluse"), 11, 346, 333, [30, 7, 26, 4, 83, 13]],
[85, T("Vendee"), 17, 142, 211, [44, 49, 79, 17]],
[86, T("Vienne"), 16, 193, 215, [37, 36, 87, 16, 79, 49]],
[87, T("Haute Vienne"), 22, 218, 249, [23, 19, 24, 16, 86, 36]],
[88, T("Vosges"), 7, 378, 139, [54, 55, 90, 52, 68, 70]],
[89, T("Yonne"), 20, 291, 157, [10, 21, 58, 45, 77]],
[90, T("Territoire de Belfort"), 9, 395, 163, [88, 68, 25, 70]],
[91, T("Essonne"), 19, 252, 124, [78, 92, 94, 77, 45, 28]],
[92, T("Hauts de Seine"), 19, 15, 204, [75, 94, 93, 91, 78, 95]],
[93, T("Seine Saint Denis"), 19, 71, 189, [95, 77, 75, 92, 94]],
[94, T("Val de Marne"), 19, 64, 233, [75, 93, 77, 91, 92]],
[95, T("Val d Oise"), 19, 252, 101, [60, 77, 93, 92, 78, 27]],
[96, T("Haute Corse"), 12, 447, 366, [20, 83, 6]],
);
}


sub _raw_cards {
return (
# type, id_country
#   artillery, 2
#   wildcard
["infantry", 1],
["artillery", 2],
["infantry", 3],
["infantry", 4],
["cavalry", 5],
["cavalry", 6],
["cavalry", 7],
["artillery", 8],
["artillery", 9],
["artillery", 10],
["cavalry", 11],
["artillery", 12],
["infantry", 13],
["infantry", 14],
["artillery", 15],
["artillery", 16],
["cavalry", 17],
["cavalry", 18],
["infantry", 19],
["cavalry", 20],
["infantry", 21],
["infantry", 22],
["cavalry", 23],
["artillery", 24],
["artillery", 25],
["infantry", 26],
["artillery", 27],
["cavalry", 28],
["cavalry", 29],
["infantry", 30],
["artillery", 31],
["infantry", 32],
["artillery", 33],
["cavalry", 34],
["infantry", 35],
["artillery", 36],
["infantry", 37],
["cavalry", 38],
["cavalry", 39],
["cavalry", 40],
["artillery", 41],
["infantry", 42],
["infantry", 43],
["infantry", 44],
["infantry", 45],
["infantry", 46],
["infantry", 47],
["infantry", 48],
["cavalry", 49],
["cavalry", 50],
["cavalry", 51],
["cavalry", 52],
["cavalry", 53],
["cavalry", 54],
["artillery", 55],
["artillery", 56],
["artillery", 57],
["artillery", 58],
["artillery", 59],
["artillery", 60],
["joker", undef],
["joker", undef],
);
}


sub _raw_missions {
return (
# id player to destroy, nb coutnry to occupy + min armies, 3 x id of continents to occupy, description
#   0, 0,0,5,2,0,T("Conquer the continents of ASIA and SOUTH AMERICA.")
#   0, 0,0,3,6,*,T("Conquer the continents of EUROPE and AUSTRALIA and a third continent of your choice.")
#   0,18,2,0,0,0,T("Occupy 18 countries of your choice and occupy each with at least 2 armies.")
#   0,24,1,0,0,0,T("Occupy 24 countries of your choice and occupy each with at least 1 army.")
#   1,24,1,0,0,0,T("Destroy all of PLAYER1's TROOPS. If they are yours or they have already been destroyed by another player then your mission is: Occupy 24 countries.")

);
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
__END__

=head1 DESCRIPTION

France by Thierry Baldo.
