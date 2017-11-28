YARN
==========

<https://yarnpkg.com/>


# Install

<https://yarnpkg.com/en/docs/install>

```sh
# macOS
brew update
brew install yarn
yarn --version
```

# Migration from npm

既存projectでyarnでmigrationしたい場合にはただこれだけ

```
cd your_project_directory
yarn
```
## CLI commands comparison

<https://yarnpkg.com/en/docs/migrating-from-npm>

# add & remove

```
yarn add <pakage-name>
yarn add <pakage-name> --dev
yarn remove <pakage-name>
```

# update package

選択しながらやりたい場合

```
yarn upgrade-interactive
```

決まっている場合
```
yarn upgrade [package]
```