# Amazing Robot Battle
Game Design Document

## Autores

Arthur Vieira, NUSP: 6482041

Carlos Molano: NUSP: 10950510

Guilherme Yambanis: NUSP:  8041265

Luiz Girotto, NUSP: 8941189

Mathias Menck, NUSP: 4343470

# Índice
1. Índice

2. Postmortem

3. Game Design
	* Resumo
	* Gameplay
	* Mindset
4. Técnico
	* Telas
	* Controles
	* Mecânicas
5. Desenvolvimento
	* Classes Abstratas
	* Classes Derivadas
6. Gráficos
	* Estilo
	* Gráficos necessários
7. Música e Sons
	* Estilo
	* Sons necessários
	* Música necessária


#Postmortem
> Iniciamos o projeto com discussões sobre que tipo de jogo iríamos desenvolver, passando por várias idéias vindas do vídeo dado como base. Eventualmente, em uma discussão em grupo, notamos que das ideias que tinhamos a que mais se destacou foi a de montar o personagem do jogador, e resolvemos que o conceito básico do jogo revolveria nesse conceito. A partir disso e de um gosto pessoal por jogos de luta, decidimos no jogo final.
> Usamos a Godot para desenvolver o jogo tanto pela recomendação do professor quanto por ja termos experiência com a ferramenta. Isso foi um acerto, visto que a qualidade modular de projetos na Godot coube bem com a ideia de um robo montável pelo jogador, com cada peça específica sendo a própria subclasse.
> Tivemos problemas com algumas interações necessárias, como um robô empurrar o outro, mas conseguimos corrigí-las.
> O maior inimigo do desenvolvimento do projeto, foi, no fim, a falta de tempo. Devido ao período em que desenvolvemos o projeto, quando quase todos os componentes do grupo estavam em um período de entrega e provas para várias outras matérias, acabamos dedicando ao jogo menos tempo que o planejado. Com isso não conseguímos fazer mais do que 3 "sets" de peças para o jogador usar, e os backgrounds do jogo são simples e monocromáticos. Também não conseguimos balancear propriamente os atributos de cada peça ou outras partes do jogo, como o tamanho do estágio.
> Apesar disso acreditamos que conseguimos criar o jogo proposto inicialmente, mesmo que num estado mais simples e com menos conteúdo que inicialmente previsto.

# Game Design

## Resumo
> Batalha de Robôs: Dois robôs se enfrentam em uma arena, existindo duas condições de vitória: Empurrar o adversário para fora da arena ou deixar seu hp em 0.

## Gameplay
> O jogo baseia-se nos famosos brawlers 2D mas com características únicas, notadamente, personagens customizáveis, permitindo muita variabilidade de habilidade e a mecânica de _sumô_, com a eliminação por sair da área de combate e a inexistência da capacidade de saltar.

## Mindset
> A intenção do jogo é ser frenético, com partidas muito rápidas. A penalidade por saída da área de combate exige enfrentamento entre os jogadores, fazendo com que o embate seja inevitável e exista pouco espaço e tempo para deliberações. Além disso, ênfase especial foi dada na montagem dos robôs, permitindo que, aliada com tempo curto de partida, muitos batalhas em sequência ocorram, baseadas na variabilidade de poderes e na sensação de _revanche_ criada entre os competidores.

# Técnico
## Telas

## 1. Menu de seleção de peças

![selec](build.png)

## 2. Combate

![comb](stage.png)


## Controles
> Os controles possíveis para os jogadores são:

1. Movimentação do robô
	* esquerda
	* direita

2. Atacar
	* braço esquerdo
	* braço direito

3. Defender

## Mecânicas
> Uma das partes mais interessantes do jogo se dá antes mesmo da batalha: a seleção das peças.
Como cada peça possui atributos diferentes (peso, dano causado, pontos de vida...), a montagem do robô pode ser visto como um jogo em si, já que é possível definir estratégias diferentes baseadas nas peças que são escolhidas e até mesmo existir um _meta game_ entre os jogadores, para tentar contrabalancear as escolhas do adversário. Ainda mais considerando que, nas peças disponíveis, as mais pesadas proporcionam causar mais dano, mas as mais leves tem movimento mais rápido e ataques mais velozes.


# Desenvolvimento
## Classes Abstratas
BasePhysics

BasePlayer

BaseEnemy

BaseObject

BaseObstacle

BaseInteractable

(example)


## Classes Derivadas
BasePlayer

PlayerMain

PlayerUnlockable

BaseEnemy

EnemyWolf

EnemyGoblin

EnemyGuard (may drop key)

EnemyGiantRat

EnemyPrisoner

BaseObject

ObjectRock (pick-up-able, throwable)

ObjectChest (pick-up-able, throwable, spits gold coins with key)

ObjectGoldCoin (cha-ching!)

ObjectKey (pick-up-able, throwable)

BaseObstacle

ObstacleWindow (destroyed with rock)

ObstacleWall

ObstacleGate (watches to see if certain buttons are pressed)

BaseInteractable

InteractableButton

(example)


# Gráficos
## Estilo
O estilo escolhido foi um estilo simples e cartunizado. Isso permitiu a criação de _sprites_ mais facil e rápidamente e também foi útil para atenuar um possível desconforto do jogador com o combate.


## Gráficos Necessários

## 1. Cabeças

   * Modelo 1

![cabeca](../character/parts/heads/presser/head.png)

   * Modelo 2

![cabeca](../character/parts/heads/thinker/head.png)

   * Modelo 3

![cabeca](../character/parts/heads/wood/head.png)


## 2. Torsos

   * Modelo 1

![torso](../character/parts/torsos/presser/torso.png)

   * Modelo 2

![torso](../character/parts/torsos/thinker/torso.png)

   * Modelo 3

![torso](../character/parts/torsos/wood/torso.png)


## 3. Pernas

   * Modelo 1

![perna](../character/parts/legs/presser/leg.png)

   * Modelo 2

![perna](../character/parts/legs/thinker/leg.png)

   * Modelo 3

![perna](../character/parts/legs/wood/leg.png)


## 4. Braços

   * Modelo 1

![braços](../character/parts/arms/presser/upper_arm.png)

![braços](../character/parts/arms/presser/lower_arm.png)

   * Modelo 2

![braços](../character/parts/arms/thinker/upper_arm.png)

![braços](../character/parts/arms/thinker/lower_arm.png)

   * Modelo 3

![braços](../character/parts/arms/wood/upper_arm.png)

![braços](../character/parts/arms/wood/lower_arm.png)


# Música e Sons
## Estilo
> Os sons implementados foram básicos, a fim de criar um experiência mais sinestésica para o jogador. O som no menu de seleção e ao acertar o golpe são importantes, para passar uma maior idéia de ação ao jogador.


## Sons Necessários
_plop_ => menu de seleção

_player ready_ => voice over indicando status do jogador no menu de seleção

_clang_ => efeito ao acertar ataque

_fight_ => voice over para indicar início da partida

_winner_ => efeito para indicar fim da partida




