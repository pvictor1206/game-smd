# 🎮 Projeto Godot - Game SMD (Socorro Meu Deus)

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

