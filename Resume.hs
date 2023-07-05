module Resume (resume) where

import Data.List
import TeX

basicInfo :: Resume
basicInfo =
  paragraph
    [ pure "\\basicInfo{",
      pure $ "\\email{cybai.jp@gmail.com}" ++ period,
      pure $ "\\github[cybai]{https://github.com/cybai}" ++ period,
      pure $ "\\homepage[blog.cybai.dev]{https://blog.cybai.dev}" ++ period,
      pure "\\linkedin[cybaitw]{https://www.linkedin.com/in/cybaitw}",
      pure "}"
    ]
  where
    period = "\\textperiodcentered\\"

education :: Resume
education =
  section
    "學歷"
    "Education"
    [ datedSection (date "2010" "09" ~~ date "2015" "01") $
        paragraph
          [ en "\\textbf{Yuan-Ze University}, Taiwan",
            zh "\\textbf{元智大學}, 臺灣"
          ],
      en "Bachelor: Computer Science",
      zh "學士：資訊工程學系"
    ]

autify :: Resume
autify =
  paragraph
    [ datedSection (date "2021" "08" ~~ present) $
        paragraph
          [ zh "\\textbf{Autify, Inc.}, 東京, 日本",
            en "\\textbf{Autify, Inc.}, Tokyo, Japan"
          ],
      paragraph
        [ zh "\\role{自動化測試平台}{資深前端工程師}",
          en "\\role{Test Automation Platform}{Senior Front-End Engineer}"
        ],
      itemize
        [ en "\\item Improved 50\\% team productivity by refactoring data structure for our model",
          en "\\item Improved 10\\% speed for loading scripts by caching them in runtime",
          en "\\item Improved 10\\% of performance score by utilizing webpack code splitting properly",
          en "\\item Reduced 15\\% bundle size for bundled scripts",
          en "\\item Introduced Core Web Vitals with DataDog RUM",
          en "\\item Introduced lighthouse-ci and webpack-bundle-analyzer to track performance scores and bundle size",
          en "\\item Introduced graphql-codegen to the team for TypeScript types auto-generation"
        ]
    ]

herp :: Resume
herp =
  paragraph
    [ datedSection (date "2019" "02" ~~ date "2021" "06") $
        paragraph
          [ zh "\\textbf{HERP, Inc.}, 東京, 日本",
            en "\\textbf{HERP, Inc.}, Tokyo, Japan"
          ],
      paragraph
        [ zh "\\role{招募管理平台}{軟體工程師}",
          en "\\role{Hiring Management Platform}{Software Engineer}"
        ],
      itemize
        [ en "\\item Introduced lighthouse-ci and webpack-bundle-analyzer to track performance scores and bundle size",
          en "\\item Introduced renovate.js to help the team upgrade dependencies easier",
          en "\\item Fixed dependency vulnerabilities by upgrading packages or sending PRs to OSS",
          en "\\item Reduced 80\\% build time by migrating Rollup.js to Webpack 4",
          en "\\item Reduced 3s when opening a modal by avoiding running duplicated codes",
          en "\\item Implemented back-end features in Haskell through Domain Driven Development",
          en "\\item Implemented a service of microservice and APIs to Task Management with Haskell and Amazon SQS"
        ]
    ]

rakutenTaiwan :: Resume
rakutenTaiwan =
  paragraph
    [ datedSection (date "2016" "06" ~~ date "2019" "01") $
        paragraph
          [ zh "\\textbf{台灣樂天股份有限公司}, 臺北, 臺灣",
            en "\\textbf{Rakuten Taiwan Inc.}, Taipei, Taiwan"
          ],
      paragraph
        [ zh "\\role{電商平台}{前端工程師}",
          en "\\role{E-Commerce}{Front-End Engineer}"
        ],
      itemize
        [ en "\\item Led other teammates to migrate AngularJS to React for Shipping and MyOrder pages",
          en "\\item Reduced 60\\% build time by replacing the SASS build tool",
          en "\\item Improved lighthouse score by 50\\% through reducing the JS bundle size",
          en "\\item Reduced 50\\% file size by removing unused CSS",
          en "\\item Prevented 90\\% brute force web scraping tools buying on-sale items with Google reCaptcha",
          en "\\item Fixed unexpected broken layout by introducing snapshot testing",
          en "\\item Collaborated with Tokyo team members for project handover"
        ]
    ]

webkit :: Resume
webkit =
  paragraph
    [ datedSection (date "2023" "04" ~~ present) $
        paragraph [en $ "\\textbf{" ++ webkitURL "WebKit" ++ "}"],
      itemize
        [ en $ "\\item Fixed to calculate `x` CSS unit as resolution in calc combination" ++ webkitPR 15229,
          en $ "\\item Improved error message for invalid selectors" ++ webkitPR 13880,
          en $ "\\item Fixed to always respect Content-Type from headers instead of caching it" ++ webkitPR 12376
        ]
    ]
  where
    webkitURL name = href "https://webkit.org/" ++ "{" ++ name ++ "}"
    webkitPR n = href ("https://github.com/WebKit/WebKit/pull/" ++ show n) ++ "{(\\#" ++ show n ++ ")}"

servo :: Resume
servo =
  paragraph
    [ datedSection (date "2017" "07" ~~ present) $
        paragraph
          [ zh $ "\\textbf{" ++ servoURL "Servo 專案" ++ "}",
            en $ "\\textbf{" ++ servoURL "The Servo Project" ++ "}"
          ],
      itemize
        [ elab "\\item Invited as Technical Steering Committee member",
          en "\\item Wrote a blog series to guide more folks into the OSS contribution world with Servo",
          elab $ "\\item Helped to fix nightly wpt sync breakage" ++ servoPR 27631,
          elab $ "\\item Implemented dynamic module" ++ servoPR 27026,
          elab $ "\\item Fixed an old issue that Servo can’t load Twitter" ++ servoPR 26789,
          elab $ "\\item Implemented module script" ++ servoPR 23545,
          elab "\\item Made URLSearchParams implementation up-to-date",
          elab $ "\\item Implemented rejectionhandled event" ++ servoPR 22149,
          elab $ "\\item Implemented unhandledrejection event" ++ servoPR 20755
        ]
    ]
  where
    servoURL name = href "https://servo.org/" ++ "{" ++ name ++ "}"
    servoPR n = href ("https://github.com/servo/servo/pull/" ++ show n) ++ "{(\\#" ++ show n ++ ")}"

rustTw :: Resume
rustTw =
  paragraph
    [ datedSection (date "2018" "06" ~~ present) $
        paragraph
          [ zh $ "\\textbf{" ++ ghOrg "Rust 臺灣社群" ++ "}",
            en $ "\\textbf{" ++ ghOrg "Rust Taiwan Community" ++ "}"
          ],
      itemize
        [ en "\\item Helped to review translation for Traditional Chinese version of The Rust Book",
          en "\\item Helped to translate annual survey for the Rust Taiwan Community"
        ]
    ]
  where
    ghOrg name = href "https://github.com/rust-tw/" ++ "{" ++ name ++ "}"

programmingLanguages :: Resume
programmingLanguages =
  paragraph
    [ itemTeX "程式設計語言" "Programming Language",
      en "\\textbf{multilingual} (not limited to any specific language),",
      en $ "especially experienced in " ++ very ++ ",",
      en $ "comfortable with " ++ somehow ++ " (in random order)."
    ]
  where
    somehow = "Haskell Rust PureScript"
    very = "JavaScript TypeScript"

skills :: Resume
skills = section "技能" "Skills" . pure $ itemize [programmingLanguages]

talks :: Resume
talks =
  section "" "Presenter of Talks" . pure $
    paragraph
      [ itemize
          [ en $ "\\item Introduction to Property-Based Testing @ COSCUP 2022" ++ slides pbtIntro,
            en $ "\\item The Hitchhiker's Guide to Servo Contributor @ Rust Tokyo" ++ slides servoContribute,
            elab "\\item Introduction to Algebraic Data Types @ Autify",
            elab "\\item Introduction to Pattern Matching @ Autify",
            elab "\\item Expression Problem @ Autify",
            elab $ "\\item Introduction to Type Class @ PureScript.tw Meetup" ++ slides psmeetup13,
            elab $ "\\item Pattern Matching \\& Algebraic Data Types @ PureScript.tw Meetup" ++ slides psmeetup12,
            elab $ "\\item PureScript By Example CH1 - CH4 @ PureScript.tw Meetup" ++ slides psmeetup10,
            elab "\\item Vue.js: Introduction @ Rakuten Taiwan",
            elab "\\item ESLint: Pluggable JavaScript Linter @ Rakuten Taiwan",
            elab "\\item Promise: Let's escape from Callback Hell with Promise @ Rakuten Taiwan"
          ]
      ]
  where
    slides url = href url ++ " {(Slides)}"

    pbtIntro = "https://speakerdeck.com/cybai/introduction-to-property-based-testing-at-coscup-2022"
    servoContribute = "https://speakerdeck.com/cybai/the-hitchhikers-guide-to-servo-contributor"
    psmeetup10 = "https://speakerdeck.com/cybai/purescript-meetup-number-10"
    psmeetup12 = "https://speakerdeck.com/cybai/purescript-meetup-number-12"
    psmeetup13 = "https://speakerdeck.com/cybai/purescript-tw-meetup-number-13-introduction-to-type-class"

resume :: Resume
resume =
  paragraph
    [ pure "% !TEX TS-program = xelatex",
      pure "% This file is generated, don't manually edit!",
      -- head
      paragraph
        [ pure "\\documentclass{resume}",
          zh "\\usepackage{lastpage}",
          zh "\\usepackage{fancyhdr}",
          -- disable extra space before next section
          pure "\\usepackage{linespacing_fix}",
          -- , en   "\\usepackage{mathpazo}"
          zh "\\usepackage[fallback]{xeCJK}"
        ],
      pure "\\begin{document}",
      zh "\\renewcommand\\headrulewidth{0pt}",
      tex "name" "cybai" "Cheng-You Bai",
      basicInfo,
      section "工作經驗" "Work Experience" [autify, herp, rakutenTaiwan],
      section "社群經驗" "OSS Experience" [webkit, servo, rustTw],
      skills,
      talks,
      education,
      -- end document
      pure "\\end{document}"
    ]
