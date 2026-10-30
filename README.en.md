# Git hooks (free)

🇪🇸 [Leer en español](README.md)

Bash git hooks with no dependencies that validate your commits and stop secrets before they reach GitHub.

**Free and open source (MIT).** Use it in your projects and your clients' projects. The files are commented in Spanish.

## What's included

- `commit-msg`: validates Conventional Commits
- `pre-commit`: blocks AWS, GitHub, Stripe and Slack keys, `.env`, private keys and large files
- `instalar-hooks.sh`: enables them with one command

## Installation

```bash
git clone https://github.com/carlosp5751258-lgtm/git-hooks-espanol.git
cp -r git-hooks-espanol/.githooks .
bash git-hooks-espanol/instalar-hooks.sh
```



## Want the full version?

This is the free version and it works on its own. The **Pro version** adds:

- `pre-push` hook that runs your tests (npm, pytest, go or make)
- 3 pre-commit presets: Python, JS/TS and multi-language
- husky + commitlint + lint-staged setup for Node

👉 [See the Pro version](https://claudecodees.gumroad.com/l/git-hooks-precommit) · pay what you want from 2 USD. Buying it also helps us keep publishing free resources.

## License

MIT: you can use, modify and share it, including in commercial projects. See [LICENSE](LICENSE).

---
Part of **[Ctrl+IA](https://ctrlia.dev/en/)**: resources for coding with AI. Made by Carlos P.
