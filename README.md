# Snake — Love2D

> Un jeu Snake classique jouable au clavier, développé en Lua avec Love2D dans le cadre d'un projet école.

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![Stack](https://img.shields.io/badge/stack-Lua%20%2F%20Love2D-informational)
![Statut](https://img.shields.io/badge/statut-en%20développement-yellow)

---

## Sommaire

- [Présentation](#présentation)
- [Prérequis](#prérequis)
- [Installation](#installation)
- [Lancement](#lancement)
- [Structure du projet](#structure-du-projet)
- [Équipe](#équipe)

---

## Présentation

Snake est un jeu vidéo 2D classique où le joueur contrôle un serpent qui grandit à chaque pomme mangée. Le projet est réalisé en Lua avec le framework Love2D. Il tourne entièrement en local, sans dépendances externes.

**Fonctionnalités principales :**

- Déplacement du serpent dans les 4 directions avec le clavier
- Génération aléatoire de nourriture sur la grille
- Détection de collision (murs et corps du serpent)
- Affichage du score et écran Game Over avec relance instantanée

---

## Prérequis

Avant de commencer, assure-toi d'avoir installé :

| Outil | Version minimale | Lien |
|---|---|---|
| Love2D | 11.x | [love2d.org](https://love2d.org/) |

---

## Installation

```bash
# 1. Cloner le dépôt
git clone https://github.com/CALUD-Alexis/snake.git
cd snake
```

> Aucune dépendance supplémentaire à installer.

---

## Lancement

```bash
# Démarrer le jeu
love .
```

**Contrôles :**

| Touche | Action |
|---|---|
| `↑` / `W` | Aller vers le haut |
| `↓` / `S` | Aller vers le bas |
| `←` / `A` | Aller vers la gauche |
| `→` / `D` | Aller vers la droite |
| `Entrée` / `Espace` | Rejouer après Game Over |
| `Échap` | Quitter |

---

## Structure du projet

```
snake/
├── main.lua    # Code source principal (logique, rendu, contrôles)
└── README.md
```

---

## Équipe

| Nom | Rôle | Contact |
|---|---|---|
| Alexis Dulac | Développeur | [CALUD-Alexis](https://github.com/CALUD-Alexis) |
| Monir Shadkani | Développeuse | [monirshadkani](https://github.com/monirshadkani) |

---

## Licence

Usage interne uniquement — projet école EPSI B3.

---

*Dernière mise à jour : 2026-03-18*
