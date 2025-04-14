# 🎮 Projeto Godot - Game SMD 

Este é um projeto feito em **Godot 4.4.1** com foco em **comunicação entre personagens e HUD** usando o **Observer Pattern (Padrão Observador)**. A lógica implementada permite que a interface seja atualizada automaticamente sempre que o personagem coleta um item (chave), sem acoplamento direto entre os scripts.

---

## 📁 Estrutura de Pastas

```plaintext
.
├── .godot/             # Configurações internas da engine
├── assets/             # Arquivos externos, modelos, HDRIs, etc.
├── interfaces/         # Scripts e cenas da interface (HUD, menus)
├── scenes/             # Cenas principais do jogo
├── scripts/            # Scripts de lógica do jogo (personagem, itens, etc.)
├── .gitattributes      # Regras de atributos do Git
├── .gitignore          # Arquivos ignorados pelo controle de versão
├── icon.svg            # Ícone do projeto
├── icon.svg.import     # Arquivo auxiliar do ícone
├── project.godot       # Arquivo de configuração principal da Godot
└── README.md           # Documentação do projeto (você está lendo agora)
```
---

## 🔧 Funcionalidades Implementadas

- ✅ Controle de personagem 3D com física
- ✅ Animações de pulo, corrida, queda e idle
- ✅ Sistema de coleta de chaves
- ✅ Atualização automática da interface com número de chaves
- ✅ Uso do padrão Observer para desacoplamento entre lógica de personagem e interface

---

## 📚 Para Estudar e Melhorar

### 🌐 Sites úteis
 
- 🌍 [HDRIs (iluminação realista)](https://ambientcg.com/list?type=hdri&sort=popular)  
- 🎥 Tutoriais recomendados:
  - [EP.02 - CRIE SEU JOGO 3D na Godot 4.2 | World Environment](https://www.youtube.com/watch?v=EXEMPLO_EP2)
  - [EP.05 - CRIE SEU JOGO 3D na Godot 4.2 | Configuração de Câmera 3D](https://www.youtube.com/watch?v=EXEMPLO_EP5)

---

## 📁 Diretórios de Assets:

- `actors/`: modelos de personagens e NPCs utilizados no jogo.
- `font/`: fontes personalizadas usadas na interface (HUD).
- `gate/`: modelos de portais ou portas que servem como obstáculos ou checkpoints.
- `key/`: modelo 3D da chave colecionável 
- `Platformer Kit/`: conjunto de elementos visuais e mecânicos estilo plataforma (baseado nos assets da Kenney).
- `sky/`: imagens HDRI e elementos de céu usados para ambientação realista (ex: [AmbientCG HDRI](https://ambientcg.com/list?type=hdri&sort=popular)).


## 🧠 Implementação do Padrão Observer no Projeto

O projeto utiliza o **Padrão Observer (Observador)** para permitir que a interface (HUD) seja **notificada automaticamente** quando o personagem coleta uma chave. Isso evita acoplamento direto e melhora a manutenção do código.

---

# 🔁 Padrão Observer no Projeto Godot 4

Este projeto utiliza o **Padrão Observer (Observador)** para atualizar automaticamente a interface (HUD) sempre que o personagem coleta uma chave. Essa abordagem desacopla os scripts, facilitando a manutenção e expansão do código.

---

## 🧩 Estrutura do Observer

### 1. Interface Observador - `KeyObserver.gd`

```gdscript
extends Control
class_name KeyObserver

func on_key_collected(new_total: int) -> void:
	pass
#Define uma interface base que qualquer componente pode implementar para ser notificado.

#O método on_key_collected() será chamado sempre que uma chave for coletada.

```
2. Observador Concreto - KeyContainer.gd
```gdscript
extends HBoxContainer
class_name KeyContainer

@onready var key_label = $key_label
@export var menu : PackedScene

func update_key(amount: int):
	key_label.text = '     ' + str(amount) + '/3'

# implementação do "Observer"
func on_key_collected(new_total: int) -> void:
	update_key(new_total)

func _on_btn_exit_pressed() -> void:
	$"../alert_fail".visible = false

func _on_btn_conf_pressed() -> void:
	get_tree().change_scene_to_packed(menu)
#Este script implementa o observador concreto.

#O método on_key_collected() é executado automaticamente quando o personagem coleta uma nova chave.

#A função update_key() atualiza o texto do HUD.

#Também inclui funções auxiliares para botões de interface.
```
3. Sujeito (Subject) - CharacterBody3D.gd
```extends CharacterBody3D

const SPEED = 300.0
const JUMP_VELOCITY = 10.0
@onready var animator = get_node("sophia/AnimationPlayer") as AnimationPlayer
@export var view : Node3D

var gravity = 0
var moviment_velocity : Vector3
var rotacion_direction : float
var keys := 0

@onready var keys_container = $HUD/key_container
var key_observers: Array[HBoxContainer] = []

func _ready():
	var observer = $HUD/key_container as HBoxContainer
	add_key_observer(observer)
#Este script representa o sujeito (Subject), ou seja, o objeto que emite notificações para os observadores.

#A variável key_observers mantém uma lista dos observadores registrados.

#No _ready(), o HUD é registrado como observador.
```
🔧 Métodos do Sujeito
Adicionar Observadores
```gdscript
func add_key_observer(observer: HBoxContainer) -> void:
	key_observers.append(observer)
#Registra o HUD (ou qualquer outro nó) como observador da coleta de chaves.

Notificar os Observadores
func notify_key_observers():
	for obs in key_observers:
		obs.on_key_collected(keys)
#Percorre todos os observadores registrados e chama o método on_key_collected() passando o número atual de chaves.

Coletar Chaves
func collect_keys():
	keys += 1
	notify_key_observers()
#Quando o personagem coleta uma chave:

#O contador keys é incrementado.
```

### 🌌 Ambiente e Céu

- ☁️ Sky stylizado (HDRI): [Godot Stylized Sky - GDQuest](https://github.com/gdquest-demos/godot-4-stylized-sky)

---

### 🏙️ Assets Gerais (formato gLTF recomendado)

- 🏗️ [City Kit - Kenney](https://www.kenney.nl/assets/city-kit-commercial)  
- 🎮 [Controles na Tela - Kenney](https://www.kenney.nl/assets/onscreen-controls)

---

### 👤 NPCs

- 🧍 [Mini personagens 3D](https://www.kenney.nl/assets/mini-characters-1)

---

### 🍔 Itens e Power-ups

- 🍕 [Food Kit (Soda, Cupcake etc.)](https://www.kenney.nl/assets/food-kit)  
  - **Cupcake:** aumenta a velocidade do personagem  
  - **Soda:** adiciona tempo extra

---

### 🚗 Veículos

- 🚙 [Car Kit - Kenney](https://www.kenney.nl/assets/car-kit)

---

### 🔑 Chaves

- 🗝️ [Modelo 3D de Chave - Free3D](https://free3d.com/pt/3d-model/key-v1--203749.html)

---

## 💡 Sugestão de Melhorias Futuras

- Adicionar sistema de som para coleta de itens
- Incluir transição de cenas após coletar as 3 chaves
- Expandir o sistema Observer para monitorar tempo ou vida do personagem
- Implementar sistema de save/load com observadores
- Adicionar múltiplos personagens com diferentes interações

---

## 🧠 Aprendizados com este Projeto

Este projeto serve como introdução prática ao uso do **Padrão Observer** na Godot Engine. É ideal para quem deseja aprender a:

- Estruturar projetos de forma modular e escalável
- Integrar interface (HUD) com lógica de jogo sem acoplamento
- Aplicar boas práticas de arquitetura e programação em GDScript
- Trabalhar com animações, física e ambiente 3D na Godot

---

