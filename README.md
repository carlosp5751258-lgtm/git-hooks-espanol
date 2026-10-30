# Git hooks en español (gratis)

🇬🇧 [Read in English](README.en.md)

Hooks de git en bash, sin dependencias, que validan tus commits y frenan secretos antes de que lleguen a GitHub.

**Gratis y de código abierto (MIT).** Úsalo en tus proyectos y en los de tus clientes.

## Qué incluye

- `commit-msg`: valida Conventional Commits
- `pre-commit`: bloquea llaves de AWS, GitHub, Stripe y Slack, `.env`, llaves privadas y archivos grandes
- `instalar-hooks.sh`: los activa con un comando

## Instalación

```bash
git clone https://github.com/carlosp5751258-lgtm/git-hooks-espanol.git
cp -r git-hooks-espanol/.githooks .
bash git-hooks-espanol/instalar-hooks.sh
```



## ¿Quieres la versión completa?

Esta es la versión gratis y funciona sola. La **versión Pro** añade:

- Hook `pre-push` que corre tus tests (npm, pytest, go o make)
- 3 presets de pre-commit: Python, JS/TS y multilenguaje
- Configuración de husky + commitlint + lint-staged para Node

👉 [Ver la versión Pro](https://claudecodees.gumroad.com/l/git-hooks-precommit) · paga lo que quieras desde 2 USD. Comprarla también ayuda a que sigamos publicando recursos gratis.

## Licencia

MIT: puedes usarlo, modificarlo y compartirlo, también en proyectos comerciales. Ver [LICENSE](LICENSE).

---
Parte de **[Ctrl+IA](https://ctrlia.dev/)**: recursos en español para programar con IA. Hecho por Carlos P.
