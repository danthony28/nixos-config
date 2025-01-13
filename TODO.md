- my.lib.removeAttrs
  ```nix
  n: s: removeAttrs s n
  ```
- Refactor 'Except' function parameters to work with pipes. Ideally:
  ```nix
  dir
  |> fnExcept except
  ```
