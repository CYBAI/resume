# cybai's resume

This is my resume, based on [this](https://github.com/wusyong/resume), [this](https://github.com/ice1000/resume.git) and [this template](https://github.com/billryan/resume).
There's a [Haskell script](Resume.hs) to generate the TeX source files.

# Build

To build this resume, install texlive-full and GHC toolchain first.<br/>
Then:

```bash
# Generate the TeX files
runghc Main.hs en > latex/resume.tex
runghc Main.hs zh > latex/resume-zh.tex
runghc Main.hs elab > latex/resume-elab.tex

# Build the TeX files
cd latex
make
cp *.pdf ..
cd ..
```

# Download

- [English one-page version (pdf)](./resume.pdf)
- [English complete version (pdf)](./resume-elab.pdf)
