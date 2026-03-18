# Snake — Love2D

Un jeu Snake classique développé en Lua avec le framework [Love2D](https://love2d.org/).

## Prérequis

- [Love2D](https://love2d.org/) 11.x ou supérieur

## Lancer le jeu

```bash
love .
```

## Contrôles

| Touche | Action |
|--------|--------|
| `↑` / `W` | Aller vers le haut |
| `↓` / `S` | Aller vers le bas |
| `←` / `A` | Aller vers la gauche |
| `→` / `D` | Aller vers la droite |
| `Entrée` / `Espace` | Rejouer (après Game Over) |
| `Échap` | Quitter |

## Règles

- Mange les pommes rouges pour faire grandir le serpent et augmenter ton score.
- Le jeu se termine si le serpent touche un mur ou se mord lui-même.

## Structure

```
snake/
└── main.lua   # Code source principal
```
