#lang curr/lib

@title{Leçon 1. Jeux vidéos et coordonnées cartésiennes}


@unit-overview/auto[#:lang-table (list (list "" @code{} ""))]{
  @unit-descr{Students discuss the components of their favorite videogames, and discover that they can be reduced to a series of coordinates. They then explore coordinates in Cartesian space, and identify the coordinates for the characters in a game at various points in time. Once they are comfortable with coordinates, they brainstorm their own games and create sample coordinate lists for different points in time in their own game.}
}
@unit-lessons{
@lesson/studteach[
     #:title "Intro"
     #:duration "5 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[@item{Des ordinateurs pour chaque élève ou groupe de deux, avec WeScheme ou DrRacket et le teachpack 
                                   bootstrap-teachpack}
                           @item{Les @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "livrets"] des élèves avec de quoi écrire, des marqueurs ou des craies neuves pour les professeurs}
                            @item{Les posters (règles de vie de classe, compétences de base, planning du projet)}
                           @item{Cutouts of  @resource-link[#:path "images/ninjacat.png" #:label "NinjaCat"],  @resource-link[#:path "images/dog.png" #:label "Dog"]
                                 and the  @resource-link[#:path "images/ruby.png" #:label "Ruby"]}
                                 @item{Un vidéoprojecteur}]

     #:preparation @itemlist[@item{OPTIONAL: Hand out @(hyperlink "https://docs.google.com/document/d/1USFPXkeO5AbGOzm_U0tMv4NV3RrxTMTyg-bqIKUf4q4/edit?usp=sharing" "Warmup activity sheet")}
     
                             @item{"NinjaCat" [NinjaCat.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] (If using DrRacket) | @(hyperlink "http://www.wescheme.org/view?publicId=sggzRzgU5T" "WeScheme")] preloaded on students' machines}
                              @item{OPTIONAL: @(hyperlink "https://quizizz.com/admin/quiz/5a146afd3b4ad115000fcb57?from=quizEditor" "Quizizz Unit 1 Review Quiz")}
                             @item{OPTIONAL: @(hyperlink "https://teacher.desmos.com/activitybuilder/custom/5a15e2388c08800a6024c091" "Desmos Activity: Unit 1 Review - Circles of Evalation & Code Practice")}
                             @item{OPTIONAL: @(hyperlink "https://teacher.desmos.com/activitybuilder/custom/5a1c805bbfc8c40614d3904a" "Desmos Activity: Circles of Evaluation & Code Practice(Blank Template)")}
                              ]
     
     
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
             @point{@student[#:title "Bienvenue !"]{@noSlideText{Bienvenue ! Bootstrap !? Qu’est-ce que c’est ?} Ici, tu vas apprendre un @vocab{langage de programmation} : un moyen de donner des instructions à un ordinateur pour qu’il fasse ce que l’on veut ! @noSlideText{Or, tout comme le français, l’anglais, l’italien ou le japonais, un langage de programmation possède son propre vocabulaire et sa grammaire, qu’il nous faudra apprendre. Mais heureusement, le langage que nous allons utiliser a beaucoup en commun avec des maths que nous connaissons déjà !}}
                     @teacher{Set expectations and rules for the class.
                              
                              Connect the material to come with things students already know:
                              @itemlist[@item{What makes a language? Do some students already speak more than one language?}
                                         @item{Programming is very much a language, with its own syntax, semantics, etc}
                                         @item{Ask students about their favorite videogames. Be open about the scale of a modern game: they cost millions of dollars, are built by huge teams of programmers and artists, and are developed over years.}
                                         @item{Set expectations about what can be accomplished in a single, introductory programming class.}]}
                     }
              ]
         }

@lesson/studteach[
     #:title "Dissection d’une démo"
     #:duration "10 minutes"
     #:overview "Play a simple game, then take it apart and figure out what's going on in the computer."
     #:learning-objectives @itemlist[@item{Model a simple videogame}]
     #:evidence-statements @itemlist[@item{Students will be able to identify the elements of a game and how each one changes during gameplay}]
     #:product-outcomes @itemlist[@item{In workbooks, students create a data model that describes a simple videogame}]
     #:standards (list "BS-M")

     #:preparation @itemlist[]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
          @point{@student[#:title "Dissecting a Demo"]{@noSlideText{On va commencer par examiner un petit jeu vidéo tout simple et essayer de voir comment ça marche.} Ouvre @run-link[#:public-id "sggzRzgU5T" "ce lien"]
                         et joue un peu pendant une ou deux minutes. @italic{Il faut utiliser les touches « flèches » pour bouger le chat à gauche, à droite et pour sauter. Essaie d’attraper les rubis et ne te fais pas attraper par le chien !}}
                 @teacher{[@(hyperlink "https://www.youtube.com/watch?v=KSt_3ovWfjk" "Video")] Show the kids NinjaCat, either letting them play or by demoing it in front of the class. You can move the cat up, down, left and right by using the arrow keys. 
                          Play until the students see all the characters (the clouds, the ruby, the dog and the cat), and be 
                          sure to point out the title and score as well. Give them at least 3 minutes to play with the game and listen to their observations.}
                 }
          
          @point{@student{@noSlideText{Ce jeu est fait avec des personnages et chacun d’eux a son propre comportement. Le Rubis bouge de la droite vers la gauche, tout comme le Chien. ChatNinja ne bouge que quand on appuie sur les touches « flèches » et il peut se déplacer à gauche, à droite, vers le haut ou vers le bas.} Pour comprendre comment fonctionne le jeu, on va s’intéresser aux personnages.}
                 @teacher{}
                 }
          
          @point{@student{@activity[#:forevidence (list "BS-M&1&1")]{@bitmap{images/game-table1.png} Ouvre ton cahier à la @worksheet-link[#:name "NinjaCat-Dissection"]. Il y a un tableau que nous allons compléter pour faire du reverse-engineering (rétro-ingénierie ou rétroconception en français) sur le jeu NinjaCat et voir comment il fonctionne. Remplis la première colonne avec la liste complète de tous les éléments présents dans le jeu. (Ne remplis que la première colonne ! Tu peux cacher les autres avec un papier si tu préfères.)}
                           }
                 @teacher{This can be a team activity. Solicit a few examples from students, to make sure they understand what's being listed here: nouns like "the cat", not verbs like "jumping". During this activity, walk around and see how groups are doing. 
                          This is the time to encourage expectations of community and respect - call out good teamwork when you see it! When time is up, give them a countdown: "30...10... 5... 4... 3... 2... 1... PENCILS DOWN, EYES UP HERE!" Wait for total silence and complete attention. }
                 }
          
          @point{@student{As-tu pensé aux quatre personnages qui bougent ? Qu’y a-t-il d’autre dans le jeu ? Est-ce que le décor fait partie du jeu ? Et le score ?}
                 @teacher{Have students come up to the board, and fill in the table with what they've found. If time is short, call on students and have them tell you what to write. Emphasize "Attending to Precision" with language when giving feedback.}
                 }
          
          @point{@student{@activity{@bitmap{images/game-table2.png} Il faut aussi réfléchir à ce qui @italic{change} pendant que l’on joue au jeu. Par exemple, le Rubis : est-ce qu’il grandit ? Est-ce qu’il change de couleur ? Est-ce qu’il tourne sur lui-même ? Non, la seule chose qui change avec ce Rubis, c’est sa @italic{position} ! Pour le reste, il reste identique à lui-même. Et en ce qui concerne le Chien ? le Chat ? Remplis maintenant la deuxième colonne, en énumérant tout ce qui change pour chaque personnage.}}
                 @teacher{}
                 }
                            
          @point{@student{As-tu remarqué que le Chien, le Rubis, le Nuage et le Chat changent seulement de position, et rien d’autre ? En ce qui concerne le décor, il ne change pas du tout, donc @italic{nous laissons vide la case correspondante du tableau !} As-tu remarqué que le score change ? Ça aussi, il faut le mettre dans le tableau !}
                 @teacher{Quickly fill in the second column on the board. Assign scores.}
                 }
          ]}

@lesson/studteach[
     #:title "Coordonnées cartésiennes"
     #:duration "15 minutes"
     #:overview "Students must use the Cartesian plane to describe the location of characters in a picture."
     #:learning-objectives @itemlist[@item{Understand the use of number lines in defining locations via coordinates}]
     #:evidence-statements @itemlist[@item{Students apply the number line as a tool for objectively defining location, first identifying how to apply it to 
                                           describe the position of a character onscreen in one dimension. This understanding is extended to two dimensions, 
                                           ultimately motivating the use of a coordinate grid.}]
     #:product-outcomes @itemlist[@item{Students identify the coordinates of characters in a picture}]
     #:standards (list "6.NS.5-8" "N-Q" "5.G.1-2")
  
     ;#:prerequisites (list "Dissecting a Demo")
     #:prerequisites (list "Dissection d’une démo")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{Are there locations that can be described using one coordinate system, that cannot be described 
                                                            using another? Can any valid coordinate system can be perfectly mapped to any other valid 
                                                            coordinate system?}]}
                )
        ]{
  @points[
      @point{@student[#:title "Coordinate Planes"]{@bitmap{images/number-line.png}Les ordinateurs utilisent des nombres pour décrire la position d’un personnage à l’écran,
                       à l’aide d’un axe gradué pour se donner la distance depuis le coin en bas à gauche de l’écran. Dans notre jeu, l’axe gradué sera tel que l’écran visible ira de 0
                       (à gauche) jusqu’à 640 (à droite).}
              @teacher{The key point for students here is @italic{precision} and @italic{objectivity}. There are many possible correct answers, but students
                       should understand why any solution should be accurate and unambiguous. This requires students to propose solutions that share a common
                       "zero" (the starting point of their number line) and direction (literally, the direction from which a character's position is measured).
                       Have students discuss this. If time allows, have a student leave the room and let other students come up with ways to write
                       down where the dog is on the board. Then remove the dog, call in the other student, and have the class direct them using 
                       only what they've written down.Try positioning the characters at different places on the line, and have students tell you 
                       what their coordinates are. Try giving them verbal descriptions (e.g. "The center of the screen", "Off the righthand 
                       side of the screen", etc.) and have them translate those into coordinates.}
              }
       @point{@student{On peut prendre l’image du Chien, la coller n’importe où sur la droite et mesurer la distance depuis le côté gauche.
                        N’importe qui d’autre qui disposerait de notre droite graduée pourrait retrouver la position exacte de notre Chien, seulement à partir du nombre.
                       Quel serait la coordonnée d’un Chien sur le côté droit de l’écran ? Et s’il était au milieu ? Quelle coordonnée permettrait de placer le Chien sur
                       le bord gauche de l’écran ?}
               @teacher{}
               }
      @point{@student{@bitmap{images/cat-coordinates.png}En ajoutant un second nombre, nous pouvons décrire la position d’un personnage n’importe où sur l’écran,
                       dans les deux dimensions. Le premier axe gradué est appelé l’axe des abscisses : c’est celui qui va de gauche à droite.
                       Le second, qui va de bas en haut est appelé l’axe des ordonnées. Se donner des @italic{coordonnées}, c’est avoir une abscisse (position sur le premier axe) et une ordonnée (position sur le deuxième).}
              @teacher{A coordinate represents a single point, and an image is (by definition) many points. Some students will ask whether a
                       character's coordinate refers to the center of the image, or one of the corners. In this particular program, the center 
                       serves as the coordinate - but other programs may use another location. The important point in discussion with students
                       is that there is flexibility here, @italic{as long as the convention is used consistently}.}
              }
      @point{@student{Imaginons qu’on veuille décrire où se trouve ChatNinja sur l’écran : on trouve son abscisse en faisant tomber une ligne depuis le Chat jusqu’à l’axe des abscisses et en lisant le nombre sur la graduation correspondante.
                       Pour trouver l’ordonnée, on trace une autre ligne depuis le Chat jusqu’à l’axe des ordonnées.}
              @teacher{(If time allows, invite volunteers up to the board to try placing NinjaCat and the Ruby at different locations. Have students identify the
                       coordinates at the corners of the screen. For additional practice, have students bisect each side of the screen and label
                       the midpoints.) }
             }
      @point{@student{Quand on écrit ces coordonnées, on met toujours l’abscisse avant l’ordonnée (comme dans l’ordre alphabétique !).
                       Tu verras souvent les coordonnées écrites comme ceci : (200 ; 50). Sur cet exemple, l’abscisse est 200 et l’ordonnée est 50.}
              @teacher{Here are some sample teacher notes to accompany this point}
              }

      @point{@student{Suivant la façon dont un personnage se déplace, sa position peut changer suivant l’axe des abscisses, suivant l’axe des ordonnées, ou les deux à la fois…
                     Regarde le tableau dans ton cahier (@worksheet-link[#:name "NinjaCat-Dissection"]).
                     Est-ce que ChatNinja peut monter et descendre ? Aller à gauche ou à droite ? Alors, qu’est-ce qui change, son abscisse, son ordonnée
                    ou les deux ? Et les nuages ? Est-ce qu’ils montent et descendent ? Est-ce qu’ils bougent à gauche et à droite ? Les deux ?} 
              @teacher{}
              }
      
      @point{@student{@activity[#:forevidence (list "N-Q&1&4" "5.G.1-2&1&1" "5.G.1-2&1&2")]{
                          @bitmap{images/game-table3.png}Complète le reste du tableau, en identifiant précisément ce qui change pour chaque personnage.}
                       }
              @teacher{}
              }
      
      @point{@student{@activity[#:forevidence (list "6.NS.5-8&1&2")]{Va maintenant à la @worksheet-link[#:name "NinjaCat-Coordinates"] de ton cahier et regarde le modèle
                     avec une image du jeu NinjaCat. Quelles sont les coordonnées du coin en bas à gauche
                     de l’écran ? Et en haut à droite ? Au centre ? Pour t’entraîner, écris les coordonnées du milieu de @italic{chaque côté}
                     de l’écran, puis les coordonnées de chaque personnage.}}
              @teacher{}
              }]
   }

@lesson/studteach[
     #:title "À toi !"
     #:duration "15 minutes"
     #:overview "Students select the theme and characters for their videogame"
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Students complete the Videogame Design Worksheet to design their own game}]
     #:standards (list)
     #:preparation @itemlist[]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        
        
@points[
        @point{@student{Tu trouveras @worksheet-link[#:name "Game-Design"] un projet à compléter pour concevoir ton propre jeu.
                   Tout comme nous avons listé tout ce qu’il y a dans le jeu NinjaCat, nous allons commencer par faire une liste de tout ce qu’il y a dans notre jeu.}
                @teacher{Have students put their names at the top of this page.}
                }
         
        @point{@student{Pour commencer, il faut que tu définisses les quatre éléments suivants de ton jeu :
                        @itemlist[
                                  @item{un Décor, ça peut être une forêt, une ville, l’espace intersidéral, etc ;}
                                   @item{un Joueur, qui peut se déplacer quand on appuie sur une touche ;}
                                   @item{une Cible, qui vole de la droite vers la gauche et qui permet au joueur d’obtenir des points quand il la touche ;}
                                   @item{Un Danger, qui vole aussi de droite à gauche, mais que le joueur doit éviter.}]}
                @teacher{Have students walk through some sample themes, to make sure they understand the format of the game. For example: A football 
                         game might have a quarterback for the player, a rival player for the danger, and a football as the target. A jungle game
                         might have a monkey as the player, a snake as the danger, and bananas as the target.}
                }
        
        @point{@student{@activity{Maintenant, un peu d’imagination ! Remplis la @worksheet-link[#:name "Game-Design"] du cahier
                      pour @italic{ton jeu}, avec tes propres choix de Joueur, de Danger et de Cible.}}
                @teacher{Be sure to consult with every team. A lot of students will have trouble fitting their ideas into this 
                         format, or they'll struggle with coordinates. Be clear about what can and cannot be done! (e.g. - no 
                         3d games, joysticks, multiplayer games, etc. Hint: students who have a well-worded description of their
                         images will be happier with any images you could find them. Try searching for "Person" versus "Jogger",
                         for example.}
                }
        ]}

        

@lesson/studteach[
     #:title "Priorités des opérations"
     #:duration "20 minutes"
     #:overview "Students identify the order of operations for complicated arithmetic expressions through diagramming (circles) and 
                 evaluating (the numerical answer). This lesson introduces students to the Circle of Evaluation, which is a sentence 
                 diagramming tool for arithmetic expressions. This is a powerful way to understand Order of Operations, as it forces
                 students to focus on the structure of expressions over their computed result."
     #:learning-objectives @itemlist[@item{Understand the structure of arithmetic expressions}
	                             @item{Understand order of operations in an expression}
                                     @item{Write expressions as Circles of Evaluation}
                                     @item{Translate between Circle of Evaluation and arithmetic expressions}
]
     #:evidence-statements @itemlist[@item{Students will be able to explain why arithmetic expressions require structure}
                                     @item{Students will be able to identify the order of operations in an expression that includes 
                                           adding, subtracting, multiplying and dividing}                                     
                                     @item{Given a Circle of Evaluation, students will be able translate the expression into the 
                                           arithmetic expression it represents}
                                     @item{Given an arithmetic expression, students will be able to complete a partially-finished Circle
                                           of Evaluation for the same expression}
                                     @item{Given a bank of Circles of Evaluation and arithmetic expressions, students will be able to match them}
                                     @item{Students will be able to translate the structure of an arithmetic expression into a Circle of 
                                           Evaluation}
]
     #:product-outcomes @itemlist[@item{Students convert several arithmetic expressions between multiple representations}]
     #:standards (list "A-SSE.1-2" "BS-CE" "5.OA.1-2")
     #:exercises (list (make-exercise-locator "Order-of-Operations" "complete-coe-from-arith1")
                       (make-exercise-locator "Order-of-Operations" "complete-coe-from-arith2")
                       (make-exercise-locator "Order-of-Operations" "arith-to-coe1")
                       (make-exercise-locator "Order-of-Operations" "arith-to-coe2")
                       (make-exercise-locator "Order-of-Operations" "arith-to-coe3")
                       (make-exercise-locator "Order-of-Operations" "coe-to-arith1")
                       (make-exercise-locator "Order-of-Operations" "coe-to-arith2")
                       (make-exercise-locator "Order-of-Operations" "match-arith-coe1")
                       (make-exercise-locator "Order-of-Operations" "coe-to-math-answer1")
                       (make-exercise-locator "Order-of-Operations" "coe-to-math-answer2"))


     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{Have students practice translating very simple (one-operation) expressions into 
                                                              simple (one-circle) Circles of Evaluation. By choosing the numbers in these 
                                                              examples carefully, you can gradually introduce nesting by replacing a number 
                                                              in one expression with the Circle of Evaluation for another expression that 
                                                              evaluates to the same number. @italic{Replace the 7 in @code{7+5} with the 
                                                                                                                     Circle for @code{10-3}.}}]}
                @pacing[#:type "misconception"]{@itemlist[@item{This is the first opportunity to expose students to core vocabulary words, 
                                                                so be sure to use words like @bold{function}, @bold{value} and @bold{expression} 
                                                                carefully and consistently. Ask students to identify the parts of a Circle of 
                                                                Evaluation, and push them to use the vocabulary as well.}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
                @point{@student{Les maths forment un langage, comme l’anglais, l’espagnol ou n’importe quelle autre langue. En français, nous utilisons des noms comme « pain », « tomate », « moutarde »
                                ou « fromage » pour décrire des objets. En mathématiques, nous avons des @vocab{valeurs}, comme les nombres @math{1}, @math{2} et @math{3}, pour décrire des quantités.} 

                        @teacher{Students should begin to look at math as a @italic{language}.  To help them with this, you can discuss syntax 
                                 and grammar of math, and its potential for ambiguity in the absence of a fixed order of operations.  Help 
                                 students see that math is a way to communicate calculations among people.}
                        }
                 @point{@student{Les hommes utilisent aussi des verbes comme « jeter », « courir », « construire » ou « bondir » pour décrire des opérations sur ces noms. En mathématiques, nous avons des
                                 @vocab{fonctions}, comme l’addition ou la soustraction, qui sont des opérations effectuées sur ces valeurs. Tout comme on peut « couper une tranche de pain »,
                                 on peut  « additionner quatre et cinq ».}
                         @teacher{}
                        }
                 @point{@student{Une @vocab{expression numérique} est comme une phrase : c’est une instruction pour faire quelque chose.
                                 L’expression @math{4+5} nous dit d’additionner 4 et 5. Pour @vocab{évaluer} cette expression, on suit les instructions qui figurent dedans.
                                 L’expression @math{4+5} @vocab{est évaluée à} @math{9}.}
                       @teacher{}
                       }
                 @point{@student{@activity{À combien s’évalue @math{8 \times 4} ? Et à combien est évalué @math{20-16} ? Et pour @math{16-20} ?}}
                         @teacher{}
                        }
                 @point{@student{Parfois, on a besoin de plusieur expressions pour accomplir une tâche. Si tu devais écrire une série d’instructions pour faire un sandwich,
                                 il faudrait faire attention à ce qu’on fait en premier : étaler le beurre, couper le pain, étaler la mayonnaise, etc.
                                 En maths aussi, l’ordre des opérations compte. Si quelqu’un te dit : « quatre plus deux moins un », cela pourrait vouloir dire plusieurs choses…
                                @itemlist[@item{Additionner quatre et deux, puis ôter un : @math{(4 + 2) - 1)}}
                                          @item{Additionner quatre au résultat de la soustraction de un à deux : @math{4 + (2-1)}}]
                        @activity{Écris une expression de ton choix qui peut avoir plusieurs sens.}}
                        @teacher{}
                        }
                 
                 @point{@student{Suivant la façon dont on lit l’expression, on peut obtenir des résultats très différents ! C’est un problème,
                                 car on utilise souvent les mathématiques pour partager des calculs avec d’autres personnes. Par exemple, il faut se mettre d’accord avec son opérateur de téléphonie
                                 sur une formule de calcul pour savoir combien on paiera pour les SMS et les appels. S’il y plusieurs résultats possibles,
                                 on risque de ne pas être d’accord avec la facture.}
                         @teacher{}}
                 @point{@student{On évite ces problèmes en se mettant d’accord sur l’ordre dans lequel il faut effectuer les différentes opérations dans une expression. Il y a deux façons de faire :
                               @itemlist[#:style 'ordered
                                         @item{on se met tous d’accord sur l’ordre des priorités ;}
                                         @item{on ajoute suffisamment de détails aux expressions pour donner l’ordre des opérations.}]
                          @activity{Écris une bonne raison pour laquelle il faut avoir des règles sur les priorités d’opérations.}}
                         @teacher{}
                        }
                  @point{@student{@bitmap{images/PEMDASTriangle.png} Il a fallu un peu de temps aux mathématiciens pour se mettre d’accord sur un ordre de priorités des opérations, mais maintenant c’est fait. 
                                   La pyramide ci-contre résume les règles.
                                   Pour évaluer une expression, on commence par les opérations en haut de la pyramide (multiplication et division).
                                   C’est seulement après qu’elles ont toutes été effectuées que l’on descend au niveau inférieur.
                                   Si les deux opérations sont présentes (comme dans @math{4+2-1}), on lit l’expression de gauche à droite
                                   et on effectue les opérations dans l’ordre dans lequel elles apparaissent.}
                                   ;@vocab{apply}ing the operations
                         @teacher{This item covers PEMDAS (order of operations in ambiguous expressions).  You can skip this item if you
                                  do not need to cover PEMDAS.}
                         }
                  @point{@student{ @activity[#:forevidence (list "A-SSE.1-2&1&3" "5.OA.1-2&1&2")]{Dans quel ordre doit-on effectuer les opérations sur cet exemple ?
                                    @math{19 \div 2 \times 11 - 7 + 8}
                                    @itemlist[#:style 'ordered
                                              @item{@math{+ \div \times - }}
                                              @item{@math{\div \times - +}}
                                              @item{@math{\div \times + -}}
                                              @item{@math{\times \div + -}}]}}
                          @teacher{}
                         }
                @point{@student{@bitmap{images/FixedCircle.png} Pour préciser dans quel ordre faire les opérations, on peut faire un schéma. Nous appellerons un tel diagramme un @vocab{cercle d’évaluation}
                                 Voici un exemple de cercle d’évaluation pour l’expression @math{4-5}.}
                        @teacher{[@(hyperlink "https://www.youtube.com/watch?v=AMFaPKHp3Mg" "Video")] This section benefits enormously from visual aids, diagrams, etc. Make sure you have plenty of board space to 
                         draw examples!}
                        }
                @point{@student{@noSlideText{Les cercles d’évaluation montrent la structure d’une expression, ce qu’il y a à l’intérieur.} Tous les cercles d’évaluation obéissent à deux règles :
                                @bannerline{Règle des cercles n° 1 : chaque cercle contient une fonction, qui s’écrit en haut du cercle.}
                                @bannerline{Règle des cercles n° 2 : les nombres sont écrits dessous, dans l’ordre de gauche à droite.}
                       @activity[#:forevidence "BS-CE&1&1"]{@bitmap{images/CircleBug.png}Quelle règle ce cercle d’évaluation fautif ne suit-il pas ?}}
                        @teacher{}
                        }
                @point{@student{@activity[#:forevidence (list "BS-CE&1&1" "5.OA.1-2&1&1")]{Essaie de tracer les cercles d’évaluation pour chacune de ces expressions :
                                          @itemlist[#:style 'ordered
                                                    @item{@math{6*4}}
                                                    @item{@math{7-10}}
                                                    @item{@math{5 + 8}}
                                                    @item{@math{\frac{351}{-1} }}]
                                          }
                                 @bitmap{images/FixedCircle.png} Chaque cercle d’évaluation @vocab{s’évalue} au résultat de
                                 l’expression correspondante. @noSlideText{Ainsi, ce cercle à droite s’évalue à -1, parce que le cercle nous dit d’utiliser la soustraction (c’est la fonction ou opération qui est écrite en haut) sur les nombres dans l’ordre : (4 - 5).}}
                        @teacher{It's important for students to view the Circles of Evaluation as "just another way of writing arithmetic". 
                                 Have students discuss whether associativity and commutativity still matter here (they do).}
                        }
                @point{@student{@bitmap{images/Nesting.png}Pour utiliser plusieurs opérations dans une même expression, on peut combiner des
                                 cercles d’évaluation. Regarde celui que nous avons écrit pour @math{351 / -1}. Nous savons déjà
                                 que le cercle pour @math{4 - 5} va s’évaluer à @math{-1}, nous pouvons donc @italic{remplacer ce
                                 nombre par l’expression.} Est-ce que cela change quelque chose au résultat ?}
                        @teacher{From this point forward, the Circles of Evaluation are your assessment tool for Order of Operations. 
                                 Quizzing students by asking them to correctly evaluate an expression is fraught with false negatives,
                                 as many student might get the order right but may still have problems with basic calculations. This 
                                 method is also vulnerable to Commutativity, since a student will correctly evaluate @math{1*2+2} 
                                 even if they get the order of operations wrong! Circles of Evaluation have neither of these flaws,
                                 as they put the emphasis where it should be: exercising a student's ability to see the structure 
                                 inside the arithmetic.}
                        }
                @point{@student{@activity[#:forevidence (list "BS-CE&1&2" "5.OA.1-2&1&1")]{
                                      @bitmap{images/fill-in-circle.png}Complète ce cercle d’évaluation,
                                       afin qu’il représente @math{(23 + 7) * (13 - 5)}.}}
                        @teacher{}
                       }
                @point{@student{@bitmap{images/NestedCircle.png}À quoi s’évalue ce cercle d’évaluation ? Revoyons comment faire :
                                 @itemlist[@item{On sait qu’il faut multiplier car c’est la fonction en haut du cercle.} 
                                           @item{Le nombre @math{6} est le premier facteur dans la multiplication, car c’est celui qui est écrit à gauche.}
                                           @item{Le deuxième nombre à multiplier doit être écrit à droite. Mais à cet emplacement,
                                                 il y un autre cercle, il faut donc @vocab{évaluer} le nombre produit par ce cercle.
                                                 Ce second nombre est @italic{le résultat de l’addition de 4 et 5}.}
                                           @item{@math{4 + 5} (le cercle intérieur) est évalué à @math{9}, et @math{6 * 9} (le cercle extérieur)
                                                  est évalué à @math{54}. C’est le résultat de l’évaluation du grand cercle.}]
                        @activity[#:forevidence (list "BS-CE&1&3" "A-SSE.1-2&1&3" "5.OA.1-2&1&1")]{
                               @bitmap{images/NestedCircle2.png}Convertis ce cercle d’évaluation en une expression arithmétique.}
                        }
                        @teacher{Work through several of these examples with students, asking them to come up with arithmetic
                                 expressions and then convert them into Circles, or giving them Circles and having them 
                                 translate them back into arithmetic.  When you talk about Circles, be sure to consistently use
                                 the term @italic{function} for what's on top, rather than similar terms like "operation", "symbol",
                                 "procedure", "name", etc. The Circles of Evaluation will help students see the similarity between
                                 arithmetic functions (like @math{+}) and algebraic functions (like @math{f}) if you use 
                                 terminology carefully.}
                        }
                @point{@student{@activity[#:forevidence (list "BS-CE&1&3" "A-SSE.1-2&1&3" "5.OA.1-2&1&1")]{
                              Fais correspondre ces expressions numériques avec leurs cercles d’évaluation.
                                  @(circeval-matching-exercise/math 
				    (list (math "9 * (4 - 3)")
					  (math "(9 * 4) - 3")
					  (math "(9 - 3) * 4")
					  (math "(2 + 4) / (6 - 3)")
					  (math "-5 * 2"))
				    (list "(/ (+ 2 4) (- 6 3))"
					  "(- (* 9 4) 3)"
					  "(* -5 2)"
					  "(* 9 (- 4 3))"
					  "(* (- 9 3) 4)"))}
                        }
                        @teacher{}
                        }
             ]
         }



@lesson/studteach[
     #:title "Une introduction à la programmation"
     #:duration "15 minutes"
     #:overview "Students are introduced to the programming environment"
     #:learning-objectives @itemlist[@item{Convert Circles of Evaluation into code}
                                     @item{Enter and evaluate code expressions for arithmetic on the computer}
                                     @item{Understand the goal of error messages from the computer}]
     #:evidence-statements @itemlist[@item{Students will be able to identify the Interactions and Definitions areas}
                                     @item{Students will be able to enter and evaluate simple arithmetic expressions in the Interactions area}
                                     @item{Students will be able to convert Circles of Evaluation into correctly-formed programs}
                                     @item{Students will be able to explain an 'unbounded identifier' error message}
                                     @item{Students will be able to explain the purpose of error messages}
                                     @item{Given a Circle of Evaluation, students will be able to complete a partially-written program}
                                     @item{Given a bank of Circles of Evaluation and programs, students will be able to match them}]
     #:product-outcomes @itemlist[]
     #:standards (list "A-SSE.1-2" "N-Q" "BS-CE" "BS-PL.1" "BS-IDE")
     #:preparation @itemlist[]
     #:prerequisites (list "Order of Operations")
     #:exercises (list (make-exercise-locator "Intro-to-Programming" "complete-code-from-coe1")
                       (make-exercise-locator "Intro-to-Programming" "coe-to-code1")
                       (make-exercise-locator "Intro-to-Programming" "coe-to-code2")
                       (make-exercise-locator "Intro-to-Programming" "coe-code-matching1")
                       )
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
                @point{@student{Ouvre l’environnement de programmation de ton choix : si tu as installé DrRacket, double-clique sur son icône pour le lancer. Si tu utilises le service en ligne, @login-link["clique ici pour te connecter"]. Entre ton identifiant et ton mot de passe, puis clique sur : « Start a new program ».}
                        @teacher{Have the students look at the editor on their computers. Refer to overhead 
                                 projector as necessary.}
                        }
                 
                @point{@student{@bitmap{images/wireframeIDE.png}Cet écran est l’@vocab{éditeur},  et il se présente à peu près comme sur la figure ci-contre.
                                 Il y a quelques boutons vers le haut, mais l’essentiel de la place est prise par deux grandes zones :
                                 la @vocab{fenêtre des définitions} à gauche
                                 et la @vocab{fenêtre des interactions} à droite.}
                        @teacher{The Definitions area is where programmers define values and functions in their program, 
                                 while the Interactions area allows them to experiment with those values and functions. 
                                 This is analogous to writing a series of function definitions on a blackboard, and having 
                                 student evaluate expressions using those function on scrap paper. As students are not yet 
                                 defining values of their own, it is not important that students understand this distinction 
                                 right now.  For now, we will work only with the Interactions area.}
                        }
                
                @point{@student{Un programme est une @vocab{expression autorisée} si elle produit une valeur quand elle est évaluée. En fait,
                                               tu écris des programmes utilisant des expressions mathématiques depuis que tu as appris
                                               à compter ! @noSlideText{Tout comme en français, il y a des règles pour déterminer si une phrase a un sens. Avec les programmes aussi, il y a des règles ! Un programme peut être très compliqué, mais pas forcément : les plus simples programmes sont tout bonnement les nombres.}}
                        @teacher{Draw students' attention to the Language Table (see Lesson Overview for Unit 1),
                                 which currently sits empty. Add "Numbers" to the Types section of the language 
                                 table.}
                        }
                @point{@student{@bannerline{Règle de codage n° 1 : toutes les valeurs sont des expressions autorisées.}
                                 @activity[#:forevidence "BS-IDE&1&1"]{À quoi, selon toi, va s’évaluer @code{4} ?
                                                                       @noSlideText[@editor-link[#:interactions-text "4"
                                                                                    "Clique ici pour le vérifier."]]}
                                              @itemlist[@item{Entre 4 dans la fenêtre des Interactions et appuie sur « Entrée ». Tu
                                                              vois apparaître la valeur @code{4} sur la ligne suivante dans 
                                                              la fenêtre des interactions..}
                                                        @item{Tape 10 dans la fenêtre des Interactions et appuie sur « Entrée ». Maintenant
                                                              la valeur @code{10} apparaît dans la fenêtre des interactions.}
                                                         @item{Essaie d’évaluer des nombres, comme @code{10345017}, ou
                                                               des nombres négatifs, comme @code{-2}. Y-a-t-il une limite à la taille de ces nombres ?
                                                               Que se passe-t-il si tu écris un nombre décimal ? Et que se passe-t-il si tu cliques sur un décimal,
                                                               comme @code{0.75} ? Tu obtiens un nouveau type de nombre,
                                                               une fraction : @code{3/4}.}]
                                }
                        @teacher{The editing environment evaluates all fractions and returns them as decimals by default. This can be
                                 surprising to students at first, so you may want to take a moment to explain what's going on, and 
                                 show them that these decimals can be converted back to fractions just by clicking on them. The 
                                 environment uses standard annotations for repeating, non-terminating decimal expressions and 
                                 properly handles expressions like @math{(\sqrt -1)}.  If you want to work with those kinds of 
                                 numbers in your class, enter them to get familiar with how they appear in the Interactions area.}
                        }
           
                
                @point{@student{@activity[#:forevidence "BS-IDE&1&2"]{De toute évidence, l’ordinateur connaît les nombres (Numbers), mais que se passera-t-il
                                                                      si l’on tape quelque chose qu’il @italic{ne connaît pas} ? 
                                                                      Va-t-il se plaindre ? Planter ? Deviner ?
                                                                      @editor-link[#:interactions-text "chien" "Essaye"] 
                                                                      d’évaluer @code{chien} dans la fenêtre des interactions.}
                                 Ces messages d’erreur sont très utiles pour les programmeurs. @noSlideText{Plutôt que de dire : « Ce programme ne marche pas », l’ordinateur fait de son mieux pour nous dire ce qui ne va pas et nous donner le plus d’informations possibles afin de nous aider à résoudre le problème.} Tu dois toujours lire ces messages bien attentivement !
                                 }
                        @teacher{The error message uses the term "variable".  Don't worry if your students don't already know this 
                                 term; we will teach it to them shortly.  For now, students just need to get used to error messages 
                                 and the kinds of problems that they catch in programs.}
                        }
                
                @point{@student{Les cercles d’évaluation sont faciles à convertir en programmes informatiques. Pour traduire un cercle d’évaluation
                                en programme, on commence par une parenthèse ouvrante @code{(}, puis le nom de la fonction qui est écrit en haut du cercle. Ensuite on écrit les entrées de la gauche vers la droite et on termine par
                                                                                                              une parenthèse fermante @code{)}. Voilà donc une nouvelle règle de codage pour les @vocab{expressions} :
                                @bannerline{Règle de codage n° 2 : chaque parenthèse ouvrante est suivie du nom d’une fonction, puis par
                                            une ou plusieurs expressions correctes, et se termine par une parenthèse fermante.}
                                 @bitmap{images/FixedCircle.png}Voici le code correspondant à ce cercle d’évaluation : @code{(- 4 5)}
                                 @activity[#:forevidence "BS-PL.1&1&2"]{

                                    @editor-link[#:interactions-text "(- 4 5)" "Regarde ce qui se passe"] quand ce code est entré @code{(- 4 5)} dans la fenêtre des interactions.
                                    Appuie sur « Entrée » pour évaluer le programme.
                                    @noSlideText{Tu devrais obtenir -1 en résultat.}
                                 }
                        }
                        
                        @teacher{Have students practice converting simple Circles of Evaluation into code.  If you want to help students 
                                 understand when to use the parentheses, here are two explanations that we find useful.  First, the
                                 parens look like the Circle, and the Circle encloses the function name and its inputs.  Second, we
                                 use a more visual description of an ant eating its way through the expression.  The ant eats into the 
                                 Circle (an open paren), then goes to the function at the top, then to the arguments from left to right,
                                 then finally out of the Circle (a close paren).  If the ant encounters another Circle while writing 
                                 down the arguments, it needs another open paren, etc.}
                        }   
                @point{@student{@bitmap{images/NestedCircle.png}Quand un cercle d’évaluation contient d’autres cercles à l’intérieur de lui-même,
                                 la traduction obéit aux mêmes règles. Ainsi chaque cercle requiert des parenthèses :
                                 @code{(* 6 (+ 4 5))}
                                 @activity[#:forevidence "BS-PL.1&1&2"]{@itemlist[@item{Essaie d’entrer ce code dans la fenêtre des interactions. À quoi devrait s’évaluer ce programme quand on appuie sur Entrée ?}
                                                     @item{Entraîne-toi à convertir en programmes d’autres cercles d’évaluation que tu auras toi-même écrits.}]}}
                        @teacher{[@(hyperlink "https://www.youtube.com/watch?v=vgkahOzFH2Q" "Video on Roles in Pair Programming.")]
                                  Scaffolding for Pair Programming: Talk to students about the roles of @italic{Driver} 
                                  and @italic{Navigator}. The Driver is the student with their hands on the keyboard - they're 
                                  in charge of typing, using the mouse, etc. The Navigator should be telling the Driver what to
                                  type, and pointing out mistakes or suggesting things. It's important to clarify what these 
                                  roles are (perhaps reinforcing them with a visual), to ensure that both partners are active 
                                  and talking to one another about the task at hand.  The linked video does a great job discussing these roles.}
                        }
               
                @point{@student{@bannerline{Toutes les expressions qui suivent le nom de la fonction sont appelées les @vocab{paramètres}, ou parfois les arguments de la
                                            fonction. Le diagramme suivant explique comment doit se présenter une expression qui utilise une fonction.
                                            @bitmap{images/expressionDiagram-fr.png}}
                                @activity[#:forevidence (list "BS-CE&1&2" "BS-CE&1&4")]{
                                        Pour t’entraîner, va à la @worksheet-link[#:name "Circle-of-Evaluation-Practice"]
                                        dans le livret. Pour chaque expression mathématique, dessine le cercle correspondant puis convertis-le en code Racket.}}
                        @teacher{}
                        }
                @point{@student{Quand les expressions ne suivent pas les règles, l’ordinateur nous signale qu’il y a un problème.
                                Il nous donne aussi de quoi nous aider à le résoudre. On appelle cela un
                                @vocab{message d’erreur}. @noSlideText{Nous en reparlerons plus tard. Pour l’instant, nous allons juste t’en montrer quelques-uns pour que tu saches à quoi t’attendre.}
                       @activity[#:forevidence "BS-IDE&1&2"]{Saisis chacune des expressions incorrectes suivantes dans la fenêtre des interactions
                                                             et fais bien attention au message d’erreur ou au comportement de l’ordinateur.
                                 @itemlist[@item{@code{(5 * 6)} [On a mis la fonction au milieu au lieu de la mettre au début.]}
                                           @item{@code{(*5 6)}  [Il manque une espace après la fonction.]}
                                           @item{@code{* 5 6)}  [Oubli de la parenthèse ouvrante.]}
                                           @item{@code{(* 5 6}  [Oubli de la parenthèse fermante.]}
                                          ]}}
                       @teacher{At this point, the goal is simply to have students @italic{see} error messages.  Students are not 
                                expected to be experts at reading error messages this early 
                                (you will drill this later).  NOTE: When a close parenthesis is missing, hitting return will do nothing, 
                                because the computer is waiting for the parenthesis.  When an open parenthesis is missing, WeScheme
                                does nothing and waits for the programmer 
                                to add the parens.  If students hit enter and "nothing happens", they should check their parentheses. 
                                Also note that if you do this sequence of exercises with @code{+} instead of @code{*}, the error 
                                appears differently, because @code{+5} is a perfectly valid number (just like @code{-5}).}
                      }
                ]}

@lesson/studteach[
     #:title "Bilan"
     #:duration "5 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Nous avons vu beaucoup de choses dans cette première leçon !
                                @itemlist[@item{Tu as analysé un jeu pour voir comment le décomposer en ses différentes parties.}
					  @item{Tu as conçu ton jeu, celui que tu vas faire !}
                                          @item{Tu t’es entraîné à utiliser des coordonnées pour placer des personnages sur l’écran.}
                                          @item{Tu as étudié les priorités des opérations, les cercles d’évaluation,
                                                comment traduire ces cercles d’évaluation en programmes et comment exécuter ces programmes pour obtenir des résultats.}]
                        Dans la prochaine leçon, nous commencerons à écrire des programmes pour faire des choses un peu plus intéressantes que de l’arithmétique.}
                        @teacher{Make sure student names are on the Game Design page. Take this page, or take photos of it, to prep game images for a later Unit. }}
               ]
         }


}
