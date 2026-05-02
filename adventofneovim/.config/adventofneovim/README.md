# Advent of Neovim config

Config made by following along with TJ DeVries' [Advent of Neovim video series](https://www.youtube.com/playlist?list=PLep05UYkc6wTyBe7kPjQFWVXTlhKeQejM). I've diverged in places.

## Tree-sitter

Rather than using a plugin, I've built parsers and placed them where they need to go Tree-sitter.

E.g., if you have a checkout of https://github.com/ionide/tree-sitter-fsharp:

```sh
cd fsharp
tree-sitter build
mv parser.so ~/.config/adventofneovim/parser/fsharp.so
cp -r queries/ ~/.config/adventofneovim/queries/fsharp/
```

.so files are large, so are gitignored.
