{ lib, pkgs, ... }:
let
  inherit (builtins) isList isAttrs isString isPath readFile;
  inherit (pkgs) resholve;

  mkShellScript = name: arg: content:
    assert isList arg || isAttrs arg;
    assert isString content || isPath content;
    let
      finalArg = {
        interpreter = "${pkgs.bash}/bin/bash";
        inputs = [ pkgs.coreutils ] ++ (if isList arg then arg else []);
      } // (if isAttrs arg then arg else {});
      finalContent = if isPath content then readFile content else content;
    in  rec {
      pkg = resholve.writeScriptBin name finalArg finalContent;
      outPath = "${pkg}/bin/${name}";
    };
in mkShellScript
