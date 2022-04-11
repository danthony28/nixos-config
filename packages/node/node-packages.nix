# This file has been generated by node2nix 1.9.0. Do not edit!

{nodeEnv, fetchurl, fetchgit, nix-gitignore, stdenv, lib, globalBuildInputs ? []}:

let
  sources = {
    "@tootallnate/once-1.1.2" = {
      name = "_at_tootallnate_slash_once";
      packageName = "@tootallnate/once";
      version = "1.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/@tootallnate/once/-/once-1.1.2.tgz";
        sha512 = "RbzJvlNzmRq5c3O09UipeuXno4tA1FE6ikOjxZK0tuxVv3412l64l5t1W5pj4+rJq9vpkm/kwiR07aZXnsKPxw==";
      };
    };
    "abab-2.0.5" = {
      name = "abab";
      packageName = "abab";
      version = "2.0.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/abab/-/abab-2.0.5.tgz";
        sha512 = "9IK9EadsbHo6jLWIpxpR6pL0sazTXV6+SQv25ZB+F7Bj9mJNaOc4nCRabwd5M/JwmUa8idz6Eci6eKfJryPs6Q==";
      };
    };
    "acorn-7.4.1" = {
      name = "acorn";
      packageName = "acorn";
      version = "7.4.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/acorn/-/acorn-7.4.1.tgz";
        sha512 = "nQyp0o1/mNdbTO1PO6kHkwSrmgZ0MT/jCCpNiwbUjGoRN4dlBhqJtoQuCnEOKzgTVwg0ZWiCoQy6SxMebQVh8A==";
      };
    };
    "acorn-8.7.0" = {
      name = "acorn";
      packageName = "acorn";
      version = "8.7.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/acorn/-/acorn-8.7.0.tgz";
        sha512 = "V/LGr1APy+PXIwKebEWrkZPwoeoF+w1jiOBUmuxuiUIaOHtob8Qc9BTrYo7VuI5fR8tqsy+buA2WFooR5olqvQ==";
      };
    };
    "acorn-globals-6.0.0" = {
      name = "acorn-globals";
      packageName = "acorn-globals";
      version = "6.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/acorn-globals/-/acorn-globals-6.0.0.tgz";
        sha512 = "ZQl7LOWaF5ePqqcX4hLuv/bLXYQNfNWw2c0/yX/TsPRKamzHcTGQnlCjHT3TsmkOUVEPS3crCxiPfdzE/Trlhg==";
      };
    };
    "acorn-walk-7.2.0" = {
      name = "acorn-walk";
      packageName = "acorn-walk";
      version = "7.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/acorn-walk/-/acorn-walk-7.2.0.tgz";
        sha512 = "OPdCF6GsMIP+Az+aWfAAOEt2/+iVDKE7oy6lJ098aoe59oAmK76qV6Gw60SbZ8jHuG2wH058GF4pLFbYamYrVA==";
      };
    };
    "agent-base-6.0.2" = {
      name = "agent-base";
      packageName = "agent-base";
      version = "6.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/agent-base/-/agent-base-6.0.2.tgz";
        sha512 = "RZNwNclF7+MS/8bDg70amg32dyeZGZxiDuQmZxKLAlQjr3jGyLx+4Kkk58UO7D2QdgFIQCovuSuZESne6RG6XQ==";
      };
    };
    "asynckit-0.4.0" = {
      name = "asynckit";
      packageName = "asynckit";
      version = "0.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/asynckit/-/asynckit-0.4.0.tgz";
        sha1 = "c79ed97f7f34cb8f2ba1bc9790bcc366474b4b79";
      };
    };
    "browser-process-hrtime-1.0.0" = {
      name = "browser-process-hrtime";
      packageName = "browser-process-hrtime";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/browser-process-hrtime/-/browser-process-hrtime-1.0.0.tgz";
        sha512 = "9o5UecI3GhkpM6DrXr69PblIuWxPKk9Y0jHBRhdocZ2y7YECBFCsHm79Pr3OyR2AvjhDkabFJaDJMYRazHgsow==";
      };
    };
    "combined-stream-1.0.8" = {
      name = "combined-stream";
      packageName = "combined-stream";
      version = "1.0.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/combined-stream/-/combined-stream-1.0.8.tgz";
        sha512 = "FQN4MRfuJeHf7cBbBMJFXhKSDq+2kAArBlmRBvcvFE5BB1HZKXtSFASDhdlz9zOYwxh8lDdnvmMOe/+5cdoEdg==";
      };
    };
    "cssom-0.3.8" = {
      name = "cssom";
      packageName = "cssom";
      version = "0.3.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/cssom/-/cssom-0.3.8.tgz";
        sha512 = "b0tGHbfegbhPJpxpiBPU2sCkigAqtM9O121le6bbOlgyV+NyGyCmVfJ6QW9eRjz8CpNfWEOYBIMIGRYkLwsIYg==";
      };
    };
    "cssom-0.4.4" = {
      name = "cssom";
      packageName = "cssom";
      version = "0.4.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/cssom/-/cssom-0.4.4.tgz";
        sha512 = "p3pvU7r1MyyqbTk+WbNJIgJjG2VmTIaB10rI93LzVPrmDJKkzKYMtxxyAvQXR/NS6otuzveI7+7BBq3SjBS2mw==";
      };
    };
    "cssstyle-2.3.0" = {
      name = "cssstyle";
      packageName = "cssstyle";
      version = "2.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/cssstyle/-/cssstyle-2.3.0.tgz";
        sha512 = "AZL67abkUzIuvcHqk7c09cezpGNcxUxU4Ioi/05xHk4DQeTkWmGYftIE6ctU6AEt+Gn4n1lDStOtj7FKycP71A==";
      };
    };
    "data-urls-2.0.0" = {
      name = "data-urls";
      packageName = "data-urls";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/data-urls/-/data-urls-2.0.0.tgz";
        sha512 = "X5eWTSXO/BJmpdIKCRuKUgSCgAN0OwliVK3yPKbwIWU1Tdw5BRajxlzMidvh+gwko9AfQ9zIj52pzF91Q3YAvQ==";
      };
    };
    "debug-4.3.4" = {
      name = "debug";
      packageName = "debug";
      version = "4.3.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/debug/-/debug-4.3.4.tgz";
        sha512 = "PRWFHuSU3eDtQJPvnNY7Jcket1j0t5OuOsFzPPzsekD52Zl8qUfFIPEiswXqIvHWGVHOgX+7G/vCNNhehwxfkQ==";
      };
    };
    "decimal.js-10.3.1" = {
      name = "decimal.js";
      packageName = "decimal.js";
      version = "10.3.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/decimal.js/-/decimal.js-10.3.1.tgz";
        sha512 = "V0pfhfr8suzyPGOx3nmq4aHqabehUZn6Ch9kyFpV79TGDTWFmHqUqXdabR7QHqxzrYolF4+tVmJhUG4OURg5dQ==";
      };
    };
    "deep-is-0.1.4" = {
      name = "deep-is";
      packageName = "deep-is";
      version = "0.1.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/deep-is/-/deep-is-0.1.4.tgz";
        sha512 = "oIPzksmTg4/MriiaYGO+okXDT7ztn/w3Eptv/+gSIdMdKsJo0u4CfYNFJPy+4SKMuCqGw2wxnA+URMg3t8a/bQ==";
      };
    };
    "delayed-stream-1.0.0" = {
      name = "delayed-stream";
      packageName = "delayed-stream";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/delayed-stream/-/delayed-stream-1.0.0.tgz";
        sha1 = "df3ae199acadfb7d440aaae0b29e2272b24ec619";
      };
    };
    "domexception-2.0.1" = {
      name = "domexception";
      packageName = "domexception";
      version = "2.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/domexception/-/domexception-2.0.1.tgz";
        sha512 = "yxJ2mFy/sibVQlu5qHjOkf9J3K6zgmCxgJ94u2EdvDOV09H+32LtRswEcUsmUWN72pVLOEnTSRaIVVzVQgS0dg==";
      };
    };
    "escodegen-2.0.0" = {
      name = "escodegen";
      packageName = "escodegen";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/escodegen/-/escodegen-2.0.0.tgz";
        sha512 = "mmHKys/C8BFUGI+MAWNcSYoORYLMdPzjrknd2Vc+bUsjN5bXcr8EhrNB+UTqfL1y3I9c4fw2ihgtMPQLBRiQxw==";
      };
    };
    "esprima-4.0.1" = {
      name = "esprima";
      packageName = "esprima";
      version = "4.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/esprima/-/esprima-4.0.1.tgz";
        sha512 = "eGuFFw7Upda+g4p+QHvnW0RyTX/SVeJBDM/gCtMARO0cLuT2HcEKnTPvhjV6aGeqrCB/sbNop0Kszm0jsaWU4A==";
      };
    };
    "estraverse-5.3.0" = {
      name = "estraverse";
      packageName = "estraverse";
      version = "5.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/estraverse/-/estraverse-5.3.0.tgz";
        sha512 = "MMdARuVEQziNTeJD8DgMqmhwR11BRQ/cBP+pLtYdSTnf3MIO8fFeiINEbX36ZdNlfU/7A9f3gUw49B3oQsvwBA==";
      };
    };
    "esutils-2.0.3" = {
      name = "esutils";
      packageName = "esutils";
      version = "2.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/esutils/-/esutils-2.0.3.tgz";
        sha512 = "kVscqXk4OCp68SZ0dkgEKVi6/8ij300KBWTJq32P/dYeWTSwK41WyTxalN1eRmA5Z9UU/LX9D7FWSmV9SAYx6g==";
      };
    };
    "fast-levenshtein-2.0.6" = {
      name = "fast-levenshtein";
      packageName = "fast-levenshtein";
      version = "2.0.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/fast-levenshtein/-/fast-levenshtein-2.0.6.tgz";
        sha1 = "3d8a5c66883a16a30ca8643e851f19baa7797917";
      };
    };
    "form-data-3.0.1" = {
      name = "form-data";
      packageName = "form-data";
      version = "3.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/form-data/-/form-data-3.0.1.tgz";
        sha512 = "RHkBKtLWUVwd7SqRIvCZMEvAMoGUp0XU+seQiZejj0COz3RI3hWP4sCv3gZWWLjJTd7rGwcsF5eKZGii0r/hbg==";
      };
    };
    "html-encoding-sniffer-2.0.1" = {
      name = "html-encoding-sniffer";
      packageName = "html-encoding-sniffer";
      version = "2.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/html-encoding-sniffer/-/html-encoding-sniffer-2.0.1.tgz";
        sha512 = "D5JbOMBIR/TVZkubHT+OyT2705QvogUW4IBn6nHd756OwieSF9aDYFj4dv6HHEVGYbHaLETa3WggZYWWMyy3ZQ==";
      };
    };
    "http-proxy-agent-4.0.1" = {
      name = "http-proxy-agent";
      packageName = "http-proxy-agent";
      version = "4.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/http-proxy-agent/-/http-proxy-agent-4.0.1.tgz";
        sha512 = "k0zdNgqWTGA6aeIRVpvfVob4fL52dTfaehylg0Y4UvSySvOq/Y+BOyPrgpUrA7HylqvU8vIZGsRuXmspskV0Tg==";
      };
    };
    "https-proxy-agent-5.0.0" = {
      name = "https-proxy-agent";
      packageName = "https-proxy-agent";
      version = "5.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/https-proxy-agent/-/https-proxy-agent-5.0.0.tgz";
        sha512 = "EkYm5BcKUGiduxzSt3Eppko+PiNWNEpa4ySk9vTC6wDsQJW9rHSa+UhGNJoRYp7bz6Ht1eaRIa6QaJqO5rCFbA==";
      };
    };
    "iconv-lite-0.4.24" = {
      name = "iconv-lite";
      packageName = "iconv-lite";
      version = "0.4.24";
      src = fetchurl {
        url = "https://registry.npmjs.org/iconv-lite/-/iconv-lite-0.4.24.tgz";
        sha512 = "v3MXnZAcvnywkTUEZomIActle7RXXeedOR31wwl7VlyoXO4Qi9arvSenNQWne1TcRwhCL1HwLI21bEqdpj8/rA==";
      };
    };
    "is-potential-custom-element-name-1.0.1" = {
      name = "is-potential-custom-element-name";
      packageName = "is-potential-custom-element-name";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-potential-custom-element-name/-/is-potential-custom-element-name-1.0.1.tgz";
        sha512 = "bCYeRA2rVibKZd+s2625gGnGF/t7DSqDs4dP7CrLA1m7jKWz6pps0LpYLJN8Q64HtmPKJ1hrN3nzPNKFEKOUiQ==";
      };
    };
    "jsdom-16.7.0" = {
      name = "jsdom";
      packageName = "jsdom";
      version = "16.7.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/jsdom/-/jsdom-16.7.0.tgz";
        sha512 = "u9Smc2G1USStM+s/x1ru5Sxrl6mPYCbByG1U/hUmqaVsm4tbNyS7CicOSRyuGQYZhTu0h84qkZZQ/I+dzizSVw==";
      };
    };
    "levn-0.3.0" = {
      name = "levn";
      packageName = "levn";
      version = "0.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/levn/-/levn-0.3.0.tgz";
        sha1 = "3b09924edf9f083c0490fdd4c0bc4421e04764ee";
      };
    };
    "lodash-4.17.21" = {
      name = "lodash";
      packageName = "lodash";
      version = "4.17.21";
      src = fetchurl {
        url = "https://registry.npmjs.org/lodash/-/lodash-4.17.21.tgz";
        sha512 = "v2kDEe57lecTulaDIuNTPy3Ry4gLGJ6Z1O3vE1krgXZNrsQ+LFTGHVxVjcXPs17LhbZVGedAJv8XZ1tvj5FvSg==";
      };
    };
    "mime-db-1.52.0" = {
      name = "mime-db";
      packageName = "mime-db";
      version = "1.52.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/mime-db/-/mime-db-1.52.0.tgz";
        sha512 = "sPU4uV7dYlvtWJxwwxHD0PuihVNiE7TyAbQ5SWxDCB9mUYvOgroQOwYQQOKPJ8CIbE+1ETVlOoK1UC2nU3gYvg==";
      };
    };
    "mime-types-2.1.35" = {
      name = "mime-types";
      packageName = "mime-types";
      version = "2.1.35";
      src = fetchurl {
        url = "https://registry.npmjs.org/mime-types/-/mime-types-2.1.35.tgz";
        sha512 = "ZDY+bPm5zTTF+YpCrAU9nK0UgICYPT0QtT1NZWFv4s++TNkcgVaT0g6+4R2uI4MjQjzysHB1zxuWL50hzaeXiw==";
      };
    };
    "ms-2.1.2" = {
      name = "ms";
      packageName = "ms";
      version = "2.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/ms/-/ms-2.1.2.tgz";
        sha512 = "sGkPx+VjMtmA6MX27oA4FBFELFCZZ4S4XqeGOXCv68tT+jb3vk/RyaKWP0PTKyWtmLSM0b+adUTEvbs1PEaH2w==";
      };
    };
    "nwsapi-2.2.0" = {
      name = "nwsapi";
      packageName = "nwsapi";
      version = "2.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/nwsapi/-/nwsapi-2.2.0.tgz";
        sha512 = "h2AatdwYH+JHiZpv7pt/gSX1XoRGb7L/qSIeuqA6GwYoF9w1vP1cw42TO0aI2pNyshRK5893hNSl+1//vHK7hQ==";
      };
    };
    "opsh-0.1.1" = {
      name = "opsh";
      packageName = "opsh";
      version = "0.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/opsh/-/opsh-0.1.1.tgz";
        sha512 = "QgY/o2PTLXH1tmitBnz+dmzq4jwSOi5hd1QZoPNCI/8xgYcB5OaC+Zf8Cn4Pn9qtmzQb0CKYaYqwB7Be9XgEnA==";
      };
    };
    "optionator-0.8.3" = {
      name = "optionator";
      packageName = "optionator";
      version = "0.8.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/optionator/-/optionator-0.8.3.tgz";
        sha512 = "+IW9pACdk3XWmmTXG8m3upGUJst5XRGzxMRjXzAuJ1XnIFNvfhjjIuYkDvysnPQ7qzqVzLt78BCruntqRhWQbA==";
      };
    };
    "parse5-6.0.1" = {
      name = "parse5";
      packageName = "parse5";
      version = "6.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/parse5/-/parse5-6.0.1.tgz";
        sha512 = "Ofn/CTFzRGTTxwpNEs9PP93gXShHcTq255nzRYSKe8AkVpZY7e1fpmTfOyoIvjP5HG7Z2ZM7VS9PPhQGW2pOpw==";
      };
    };
    "prelude-ls-1.1.2" = {
      name = "prelude-ls";
      packageName = "prelude-ls";
      version = "1.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/prelude-ls/-/prelude-ls-1.1.2.tgz";
        sha1 = "21932a549f5e52ffd9a827f570e04be62a97da54";
      };
    };
    "psl-1.8.0" = {
      name = "psl";
      packageName = "psl";
      version = "1.8.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/psl/-/psl-1.8.0.tgz";
        sha512 = "RIdOzyoavK+hA18OGGWDqUTsCLhtA7IcZ/6NCs4fFJaHBDab+pDDmDIByWFRQJq2Cd7r1OoQxBGKOaztq+hjIQ==";
      };
    };
    "punycode-2.1.1" = {
      name = "punycode";
      packageName = "punycode";
      version = "2.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/punycode/-/punycode-2.1.1.tgz";
        sha512 = "XRsRjdf+j5ml+y/6GKHPZbrF/8p2Yga0JPtdqTIY2Xe5ohJPD9saDJJLPvp9+NSBprVvevdXZybnj2cv8OEd0A==";
      };
    };
    "qsx-3.3.0" = {
      name = "qsx";
      packageName = "qsx";
      version = "3.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/qsx/-/qsx-3.3.0.tgz";
        sha512 = "VAWXpdwF6aUvAm0niufGlVoX+9QyjAjsbtC+dAXthveUO4IDE2nFSK5+wYHnLudjPofv5+garAiCmaSoGd8sHA==";
      };
    };
    "safer-buffer-2.1.2" = {
      name = "safer-buffer";
      packageName = "safer-buffer";
      version = "2.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/safer-buffer/-/safer-buffer-2.1.2.tgz";
        sha512 = "YZo3K82SD7Riyi0E1EQPojLz7kpepnSQI9IyPbHHg1XXXevb5dJI7tpyN2ADxGcQbHG7vcyRHk0cbwqcQriUtg==";
      };
    };
    "saxes-5.0.1" = {
      name = "saxes";
      packageName = "saxes";
      version = "5.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/saxes/-/saxes-5.0.1.tgz";
        sha512 = "5LBh1Tls8c9xgGjw3QrMwETmTMVk0oFgvrFSvWx62llR2hcEInrKNZ2GZCCuuy2lvWrdl5jhbpeqc5hRYKFOcw==";
      };
    };
    "source-map-0.6.1" = {
      name = "source-map";
      packageName = "source-map";
      version = "0.6.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/source-map/-/source-map-0.6.1.tgz";
        sha512 = "UjgapumWlbMhkBgzT7Ykc5YXUT46F0iKu8SGXq0bcwP5dz/h0Plj6enJqjz1Zbq2l5WaqYnrVbwWOWMyF3F47g==";
      };
    };
    "symbol-tree-3.2.4" = {
      name = "symbol-tree";
      packageName = "symbol-tree";
      version = "3.2.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/symbol-tree/-/symbol-tree-3.2.4.tgz";
        sha512 = "9QNk5KwDF+Bvz+PyObkmSYjI5ksVUYtjW7AU22r2NKcfLJcXp96hkDWU3+XndOsUb+AQ9QhfzfCT2O+CNWT5Tw==";
      };
    };
    "tough-cookie-4.0.0" = {
      name = "tough-cookie";
      packageName = "tough-cookie";
      version = "4.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/tough-cookie/-/tough-cookie-4.0.0.tgz";
        sha512 = "tHdtEpQCMrc1YLrMaqXXcj6AxhYi/xgit6mZu1+EDWUn+qhUf8wMQoFIy9NXuq23zAwtcB0t/MjACGR18pcRbg==";
      };
    };
    "tr46-2.1.0" = {
      name = "tr46";
      packageName = "tr46";
      version = "2.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/tr46/-/tr46-2.1.0.tgz";
        sha512 = "15Ih7phfcdP5YxqiB+iDtLoaTz4Nd35+IiAv0kQ5FNKHzXgdWqPoTIqEDDJmXceQt4JZk6lVPT8lnDlPpGDppw==";
      };
    };
    "type-check-0.3.2" = {
      name = "type-check";
      packageName = "type-check";
      version = "0.3.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/type-check/-/type-check-0.3.2.tgz";
        sha1 = "5884cab512cf1d355e3fb784f30804b2b520db72";
      };
    };
    "universalify-0.1.2" = {
      name = "universalify";
      packageName = "universalify";
      version = "0.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/universalify/-/universalify-0.1.2.tgz";
        sha512 = "rBJeI5CXAlmy1pV+617WB9J63U6XcazHHF2f2dbJix4XzpUF0RS3Zbj0FGIOCAva5P/d/GBOYaACQ1w+0azUkg==";
      };
    };
    "w3c-hr-time-1.0.2" = {
      name = "w3c-hr-time";
      packageName = "w3c-hr-time";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/w3c-hr-time/-/w3c-hr-time-1.0.2.tgz";
        sha512 = "z8P5DvDNjKDoFIHK7q8r8lackT6l+jo/Ye3HOle7l9nICP9lf1Ci25fy9vHd0JOWewkIFzXIEig3TdKT7JQ5fQ==";
      };
    };
    "w3c-xmlserializer-2.0.0" = {
      name = "w3c-xmlserializer";
      packageName = "w3c-xmlserializer";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/w3c-xmlserializer/-/w3c-xmlserializer-2.0.0.tgz";
        sha512 = "4tzD0mF8iSiMiNs30BiLO3EpfGLZUT2MSX/G+o7ZywDzliWQ3OPtTZ0PTC3B3ca1UAf4cJMHB+2Bf56EriJuRA==";
      };
    };
    "webidl-conversions-5.0.0" = {
      name = "webidl-conversions";
      packageName = "webidl-conversions";
      version = "5.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/webidl-conversions/-/webidl-conversions-5.0.0.tgz";
        sha512 = "VlZwKPCkYKxQgeSbH5EyngOmRp7Ww7I9rQLERETtf5ofd9pGeswWiOtogpEO850jziPRarreGxn5QIiTqpb2wA==";
      };
    };
    "webidl-conversions-6.1.0" = {
      name = "webidl-conversions";
      packageName = "webidl-conversions";
      version = "6.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/webidl-conversions/-/webidl-conversions-6.1.0.tgz";
        sha512 = "qBIvFLGiBpLjfwmYAaHPXsn+ho5xZnGvyGvsarywGNc8VyQJUMHJ8OBKGGrPER0okBeMDaan4mNBlgBROxuI8w==";
      };
    };
    "whatwg-encoding-1.0.5" = {
      name = "whatwg-encoding";
      packageName = "whatwg-encoding";
      version = "1.0.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/whatwg-encoding/-/whatwg-encoding-1.0.5.tgz";
        sha512 = "b5lim54JOPN9HtzvK9HFXvBma/rnfFeqsic0hSpjtDbVxR3dJKLc+KB4V6GgiGOvl7CY/KNh8rxSo9DKQrnUEw==";
      };
    };
    "whatwg-mimetype-2.3.0" = {
      name = "whatwg-mimetype";
      packageName = "whatwg-mimetype";
      version = "2.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/whatwg-mimetype/-/whatwg-mimetype-2.3.0.tgz";
        sha512 = "M4yMwr6mAnQz76TbJm914+gPpB/nCwvZbJU28cUD6dR004SAxDLOOSUaB1JDRqLtaOV/vi0IC5lEAGFgrjGv/g==";
      };
    };
    "whatwg-url-8.7.0" = {
      name = "whatwg-url";
      packageName = "whatwg-url";
      version = "8.7.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/whatwg-url/-/whatwg-url-8.7.0.tgz";
        sha512 = "gAojqb/m9Q8a5IV96E3fHJM70AzCkgt4uXYX2O7EmuyOnLrViCQlsEBmF9UQIu3/aeAIp2U17rtbpZWNntQqdg==";
      };
    };
    "word-wrap-1.2.3" = {
      name = "word-wrap";
      packageName = "word-wrap";
      version = "1.2.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/word-wrap/-/word-wrap-1.2.3.tgz";
        sha512 = "Hz/mrNwitNRh/HUAtM/VT/5VH+ygD6DV7mYKZAtHOrbs8U7lvPS6xf7EJKMF0uW1KJCl0H701g3ZGus+muE5vQ==";
      };
    };
    "ws-7.5.7" = {
      name = "ws";
      packageName = "ws";
      version = "7.5.7";
      src = fetchurl {
        url = "https://registry.npmjs.org/ws/-/ws-7.5.7.tgz";
        sha512 = "KMvVuFzpKBuiIXW3E4u3mySRO2/mCHSyZDJQM5NQ9Q9KHWHWh0NHgfbRMLLrceUK5qAL4ytALJbpRMjixFZh8A==";
      };
    };
    "xml-name-validator-3.0.0" = {
      name = "xml-name-validator";
      packageName = "xml-name-validator";
      version = "3.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/xml-name-validator/-/xml-name-validator-3.0.0.tgz";
        sha512 = "A5CUptxDsvxKJEU3yO6DuWBSJz/qizqzJKOMIfUJHETbBw/sFaDxgd6fxm1ewUaM0jZ444Fc5vC5ROYurg/4Pw==";
      };
    };
    "xmlchars-2.2.0" = {
      name = "xmlchars";
      packageName = "xmlchars";
      version = "2.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/xmlchars/-/xmlchars-2.2.0.tgz";
        sha512 = "JZnDKK8B0RCDw84FNdDAIpZK+JuJw+s7Lz8nksI7SIuU3UXJJslUthsi+uWBUYOwPFwW7W7PRLRfUKpxjtjFCw==";
      };
    };
  };
in
{
  hred = nodeEnv.buildNodePackage {
    name = "hred";
    packageName = "hred";
    version = "1.4.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/hred/-/hred-1.4.0.tgz";
      sha512 = "jAoCwkVNXmTu1cl6ceyJJdPDDOcCodkZfzK8y8EjOtLKlJU4t/+RG66sbJi22QRnHTppeMLywz7USzMT/d1Zjg==";
    };
    dependencies = [
      sources."@tootallnate/once-1.1.2"
      sources."abab-2.0.5"
      sources."acorn-8.7.0"
      (sources."acorn-globals-6.0.0" // {
        dependencies = [
          sources."acorn-7.4.1"
        ];
      })
      sources."acorn-walk-7.2.0"
      sources."agent-base-6.0.2"
      sources."asynckit-0.4.0"
      sources."browser-process-hrtime-1.0.0"
      sources."combined-stream-1.0.8"
      sources."cssom-0.4.4"
      (sources."cssstyle-2.3.0" // {
        dependencies = [
          sources."cssom-0.3.8"
        ];
      })
      sources."data-urls-2.0.0"
      sources."debug-4.3.4"
      sources."decimal.js-10.3.1"
      sources."deep-is-0.1.4"
      sources."delayed-stream-1.0.0"
      (sources."domexception-2.0.1" // {
        dependencies = [
          sources."webidl-conversions-5.0.0"
        ];
      })
      sources."escodegen-2.0.0"
      sources."esprima-4.0.1"
      sources."estraverse-5.3.0"
      sources."esutils-2.0.3"
      sources."fast-levenshtein-2.0.6"
      sources."form-data-3.0.1"
      sources."html-encoding-sniffer-2.0.1"
      sources."http-proxy-agent-4.0.1"
      sources."https-proxy-agent-5.0.0"
      sources."iconv-lite-0.4.24"
      sources."is-potential-custom-element-name-1.0.1"
      sources."jsdom-16.7.0"
      sources."levn-0.3.0"
      sources."lodash-4.17.21"
      sources."mime-db-1.52.0"
      sources."mime-types-2.1.35"
      sources."ms-2.1.2"
      sources."nwsapi-2.2.0"
      sources."opsh-0.1.1"
      sources."optionator-0.8.3"
      sources."parse5-6.0.1"
      sources."prelude-ls-1.1.2"
      sources."psl-1.8.0"
      sources."punycode-2.1.1"
      sources."qsx-3.3.0"
      sources."safer-buffer-2.1.2"
      sources."saxes-5.0.1"
      sources."source-map-0.6.1"
      sources."symbol-tree-3.2.4"
      sources."tough-cookie-4.0.0"
      sources."tr46-2.1.0"
      sources."type-check-0.3.2"
      sources."universalify-0.1.2"
      sources."w3c-hr-time-1.0.2"
      sources."w3c-xmlserializer-2.0.0"
      sources."webidl-conversions-6.1.0"
      sources."whatwg-encoding-1.0.5"
      sources."whatwg-mimetype-2.3.0"
      sources."whatwg-url-8.7.0"
      sources."word-wrap-1.2.3"
      sources."ws-7.5.7"
      sources."xml-name-validator-3.0.0"
      sources."xmlchars-2.2.0"
    ];
    buildInputs = globalBuildInputs;
    meta = {
      description = "![hred](./.github/hred.svg)";
      homepage = "https://github.com/danburzo/hred#readme";
      license = "MIT";
    };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };
}
