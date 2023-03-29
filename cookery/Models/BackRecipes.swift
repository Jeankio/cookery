import Foundation

extension Recipe {
  static let backRecipes: [Recipe] = [
    //Recipe 1
    Recipe(recipeBasicInfo: RecipeBasicInfo(
                            titulo: "Puré de Papas",
                            descripcion: "Puré de Papas muy antojable!",
                            cooker: "Jean Karel",
                            category: .cena,
                            foodtype: .vegano),
           
           ingredientes: [
                Ingrediente(nombre: "Potatoes", cantidad: 454, medida: .g),
                Ingrediente(nombre: "Soy Butter", cantidad: 1, medida: .tbs),
                Ingrediente(nombre: "Soy Milk", cantidad: 0.5, medida: .cups),
                Ingrediente(nombre: "Salt", cantidad: 2, medida: .tsp)
           ],
           
           preparaciones:  [
                Preparacion(paso: "Paso 1: Put peeled potatoes in water and bring to boil ~15 min (once you can cut them easily.", opcional: false),
                Preparacion(paso: "Paso 2: In the meantime, Soften the butter by heading in a microwave for 30 seconds.", opcional: false),
                Preparacion(paso: "Paso 3: Drain the now soft potatoes.", opcional: false),
                Preparacion(paso: "Paso 4: Mix vigorously with milk, salt, and butter.", opcional: false)
           ]
           
    ),
    
    // Recipe 2
    Recipe(recipeBasicInfo: RecipeBasicInfo(
                            titulo: "Ensalada de Manzanas",
                            descripcion: "Light and refreshing summer salad made of beets, apples and fresh mint",
                            cooker: "Soshaina Michaela",
                            category: .cena,
                            foodtype: .fitness),
           
           ingredientes: [
                Ingrediente(nombre: "Large beets chopped into a large dice", cantidad: 3, medida: .not),
                Ingrediente(nombre: "Large apples chopped into a large dice", cantidad: 2, medida: .not),
                Ingrediente(nombre: "Lemon zest", cantidad: 0.5, medida: .tbs),
                Ingrediente(nombre: "Lemon juice", cantidad: 1.5, medida: .tbs),
                Ingrediente(nombre: "Olive Oil", cantidad: 1, medida: .tsp),
                Ingrediente(nombre: "Salt and Pepper to taste", cantidad: 1, medida: .not)
           ],
           
           preparaciones:  [
                Preparacion(paso: "Cook the beets", opcional: false),
                Preparacion(paso: "Sous vide the beets - To accomplish this, add beets to food safe plastic storage bags with apples, tsp of course stal and teaspoon of ground black pepper", opcional: true),
                Preparacion(paso: "Then vacuum seal the bag of beets and submerge into 185F water until tender; if no vacuum seal, weigh them down so they submerge", opcional: true),
                Preparacion(paso: "Alternately, you can steam the beets until tender or roast them in a 400F oven until tender", opcional: false),
                Preparacion(paso: "Once cooked, the skins will come off quite easily (gloves are preferred)", opcional: false),
                Preparacion(paso: "Wait until cooled completely, then cut beets into a medium dice", opcional: false),
                Preparacion(paso: "Peel and medium dice the apples", opcional: false),
                Preparacion(paso: "Chiffonade the mint", opcional: false),
                Preparacion(paso: "Combine all ingredients with lemon juice and olive oil and serve", opcional: false)
           ]
    ),
    
    //Recipe 3
    Recipe(recipeBasicInfo: RecipeBasicInfo(
                            titulo: "Brisket a las brasas",
                            descripcion: "Un Cortesito Brisket que te mueres!",
                            cooker: "Camilita Quiroz",
                            category: .almuerzo,
                            foodtype: .sinRestricciones),
           ingredientes: [
                Ingrediente(nombre: "Brisket", cantidad: 1815, medida: .g),
                Ingrediente(nombre: "Large red onion", cantidad: 1, medida: .not),
                Ingrediente(nombre: "Garlic, minced", cantidad: 6, medida: .not),
                Ingrediente(nombre: "Large Carrot", cantidad: 1, medida: .not),
                Ingrediente(nombre: "Parsnip", cantidad: 1, medida: .not),
                Ingrediente(nombre: "Stalks Celery", cantidad: 3, medida: .not),
                Ingrediente(nombre: "Caul, Duck, or Chicken Fat", cantidad: 3, medida: .tbs),
                Ingrediente(nombre: "Bay Leaves", cantidad: 2, medida: .not),
                Ingrediente(nombre: "Apple Cider Vinegar", cantidad: 0.33, medida: .cups),
                Ingrediente(nombre: "Red Wine", cantidad: 1, medida: .cups),
                Ingrediente(nombre: "Jar/Can of Tomato Paste", cantidad: 1, medida: .not),
                Ingrediente(nombre: "Spoonful of Honey", cantidad: 1, medida: .not),
                Ingrediente(nombre: "Chicken Stock", cantidad: 30, medida: .ml),
               ],
           
           preparaciones:  [
                Preparacion(paso: "In a small bowl, combine the honey, tomato paste and wine, and mix into paste", opcional: false),
                Preparacion(paso: "In an oval dutch oven, melt the fat over a medium to high heat.", opcional: false),
                Preparacion(paso: "Sear the brisket on both side then remove the heat", opcional: false),
                Preparacion(paso: "Add a bit more fat or vegetable oil and sear the vegetables until the onions become translucent", opcional: false),
                Preparacion(paso: "Add the wine mixture, return the beef to the pot, add the chicken stock until it come 1/2 way up the beef", opcional: false),
                Preparacion(paso: "Close the lid and bake at 250 until fork tender (4-6 hrs)", opcional: false)
               ]
    ),
    
    //Recipe 4
    Recipe(recipeBasicInfo: RecipeBasicInfo(
                            titulo: "Pollo a la parmesana",
                            descripcion: "Pollo y parmesano nacieron para estar juntos!",
                            cooker: "Annita la Huerfanita",
                            category: .almuerzo,
                            foodtype: .lowCarb),
           ingredientes: [
                Ingrediente(nombre: "Brisket", cantidad: 1815, medida: .g),
                Ingrediente(nombre: "Large red onion", cantidad: 1, medida: .not),
                Ingrediente(nombre: "Garlic, minced", cantidad: 6, medida: .not),
                Ingrediente(nombre: "Large Carrot", cantidad: 1, medida: .not),
                Ingrediente(nombre: "Parsnip", cantidad: 1, medida: .not),
                Ingrediente(nombre: "Stalks Celery", cantidad: 3, medida: .not),
                Ingrediente(nombre: "Caul, Duck, or Chicken Fat", cantidad: 3, medida: .tbs),
                Ingrediente(nombre: "Bay Leaves", cantidad: 2, medida: .not),
                Ingrediente(nombre: "Apple Cider Vinegar", cantidad: 0.33, medida: .cups),
                Ingrediente(nombre: "Red Wine", cantidad: 1, medida: .cups),
                Ingrediente(nombre: "Jar/Can of Tomato Paste", cantidad: 1, medida: .not),
                Ingrediente(nombre: "Spoonful of Honey", cantidad: 1, medida: .not),
                Ingrediente(nombre: "Chicken Stock", cantidad: 30, medida: .ml),
               ],
           
           preparaciones:  [
                Preparacion(paso: "In a small bowl, combine the honey, tomato paste and wine, and mix into paste", opcional: false),
                Preparacion(paso: "In an oval dutch oven, melt the fat over a medium to high heat.", opcional: false),
                Preparacion(paso: "Sear the brisket on both side then remove the heat", opcional: false),
                Preparacion(paso: "Add a bit more fat or vegetable oil and sear the vegetables until the onions become translucent", opcional: false),
                Preparacion(paso: "Add the wine mixture, return the beef to the pot, add the chicken stock until it come 1/2 way up the beef", opcional: false),
                Preparacion(paso: "Close the lid and bake at 250 until fork tender (4-6 hrs)", opcional: false)
               ]
    ),
    
    //Recipe 5
    Recipe(recipeBasicInfo: RecipeBasicInfo(
                            titulo: "Salchipapa costeña",
                            descripcion: "No solo son papas y salchichas, receta Epica!",
                            cooker: "Chimera Ant",
                            category: .cena,
                            foodtype: .sinRestricciones),
           ingredientes: [
                Ingrediente(nombre: "Brisket", cantidad: 1815, medida: .g),
                Ingrediente(nombre: "Large red onion", cantidad: 1, medida: .not),
                Ingrediente(nombre: "Garlic, minced", cantidad: 6, medida: .not),
                Ingrediente(nombre: "Large Carrot", cantidad: 1, medida: .not),
                Ingrediente(nombre: "Parsnip", cantidad: 1, medida: .not),
                Ingrediente(nombre: "Stalks Celery", cantidad: 3, medida: .not),
                Ingrediente(nombre: "Caul, Duck, or Chicken Fat", cantidad: 3, medida: .tbs),
                Ingrediente(nombre: "Bay Leaves", cantidad: 2, medida: .not),
                Ingrediente(nombre: "Apple Cider Vinegar", cantidad: 0.33, medida: .cups),
                Ingrediente(nombre: "Red Wine", cantidad: 1, medida: .cups),
                Ingrediente(nombre: "Jar/Can of Tomato Paste", cantidad: 1, medida: .not),
                Ingrediente(nombre: "Spoonful of Honey", cantidad: 1, medida: .not),
                Ingrediente(nombre: "Chicken Stock", cantidad: 30, medida: .ml),
               ],
           
           preparaciones:  [
                Preparacion(paso: "In a small bowl, combine the honey, tomato paste and wine, and mix into paste", opcional: false),
                Preparacion(paso: "In an oval dutch oven, melt the fat over a medium to high heat.", opcional: false),
                Preparacion(paso: "Sear the brisket on both side then remove the heat", opcional: false),
                Preparacion(paso: "Add a bit more fat or vegetable oil and sear the vegetables until the onions become translucent", opcional: false),
                Preparacion(paso: "Add the wine mixture, return the beef to the pot, add the chicken stock until it come 1/2 way up the beef", opcional: false),
                Preparacion(paso: "Close the lid and bake at 250 until fork tender (4-6 hrs)", opcional: false)
               ]
    ),
    
    //Recipe 6
    Recipe(recipeBasicInfo: RecipeBasicInfo(
                            titulo: "Mini tamales Tolimenses",
                            descripcion: "Los tradicionales de Tolima pero minis",
                            cooker: "Chefecito Lite",
                            category: .desayuno,
                            foodtype: .sinRestricciones),
           ingredientes: [
                Ingrediente(nombre: "Brisket", cantidad: 1815, medida: .g),
                Ingrediente(nombre: "Large red onion", cantidad: 1, medida: .not),
                Ingrediente(nombre: "Garlic, minced", cantidad: 6, medida: .not),
                Ingrediente(nombre: "Large Carrot", cantidad: 1, medida: .not),
                Ingrediente(nombre: "Parsnip", cantidad: 1, medida: .not),
                Ingrediente(nombre: "Stalks Celery", cantidad: 3, medida: .not),
                Ingrediente(nombre: "Caul, Duck, or Chicken Fat", cantidad: 3, medida: .tbs),
                Ingrediente(nombre: "Bay Leaves", cantidad: 2, medida: .not),
                Ingrediente(nombre: "Apple Cider Vinegar", cantidad: 0.33, medida: .cups),
                Ingrediente(nombre: "Red Wine", cantidad: 1, medida: .cups),
                Ingrediente(nombre: "Jar/Can of Tomato Paste", cantidad: 1, medida: .not),
                Ingrediente(nombre: "Spoonful of Honey", cantidad: 1, medida: .not),
                Ingrediente(nombre: "Chicken Stock", cantidad: 30, medida: .ml),
               ],
           
           preparaciones:  [
                Preparacion(paso: "In a small bowl, combine the honey, tomato paste and wine, and mix into paste", opcional: false),
                Preparacion(paso: "In an oval dutch oven, melt the fat over a medium to high heat.", opcional: false),
                Preparacion(paso: "Sear the brisket on both side then remove the heat", opcional: false),
                Preparacion(paso: "Add a bit more fat or vegetable oil and sear the vegetables until the onions become translucent", opcional: false),
                Preparacion(paso: "Add the wine mixture, return the beef to the pot, add the chicken stock until it come 1/2 way up the beef", opcional: false),
                Preparacion(paso: "Close the lid and bake at 250 until fork tender (4-6 hrs)", opcional: false)
               ]
    ),
    
    //Recipe 7
    Recipe(recipeBasicInfo: RecipeBasicInfo(
                            titulo: "Arroz con coco y guiso criollo",
                            descripcion: "Exquisito arroz tipico con salsita",
                            cooker: "Antulast Cabbakie",
                            category: .almuerzo,
                            foodtype: .sinRestricciones),
           ingredientes: [
                Ingrediente(nombre: "Brisket", cantidad: 1815, medida: .g),
                Ingrediente(nombre: "Large red onion", cantidad: 1, medida: .not),
                Ingrediente(nombre: "Garlic, minced", cantidad: 6, medida: .not),
                Ingrediente(nombre: "Large Carrot", cantidad: 1, medida: .not),
                Ingrediente(nombre: "Parsnip", cantidad: 1, medida: .not),
                Ingrediente(nombre: "Stalks Celery", cantidad: 3, medida: .not),
                Ingrediente(nombre: "Caul, Duck, or Chicken Fat", cantidad: 3, medida: .tbs),
                Ingrediente(nombre: "Bay Leaves", cantidad: 2, medida: .not),
                Ingrediente(nombre: "Apple Cider Vinegar", cantidad: 0.33, medida: .cups),
                Ingrediente(nombre: "Red Wine", cantidad: 1, medida: .cups),
                Ingrediente(nombre: "Jar/Can of Tomato Paste", cantidad: 1, medida: .not),
                Ingrediente(nombre: "Spoonful of Honey", cantidad: 1, medida: .not),
                Ingrediente(nombre: "Chicken Stock", cantidad: 30, medida: .ml),
               ],
           
           preparaciones:  [
                Preparacion(paso: "In a small bowl, combine the honey, tomato paste and wine, and mix into paste", opcional: false),
                Preparacion(paso: "In an oval dutch oven, melt the fat over a medium to high heat.", opcional: false),
                Preparacion(paso: "Sear the brisket on both side then remove the heat", opcional: false),
                Preparacion(paso: "Add a bit more fat or vegetable oil and sear the vegetables until the onions become translucent", opcional: false),
                Preparacion(paso: "Add the wine mixture, return the beef to the pot, add the chicken stock until it come 1/2 way up the beef", opcional: false),
                Preparacion(paso: "Close the lid and bake at 250 until fork tender (4-6 hrs)", opcional: false)
           ]
        )
    ]
}
