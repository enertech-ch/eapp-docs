# LexDocs - End User Documentation for  [Lexgate](https://lexgate.ch)

## Installation

After cloning the repo, make sure you also install the submodules (the theme is a submodule) by running:

    git submodule update --init --recursive

To start the dev server inside Docker container

    bash ldo up
    
Server is available on host http://localhost:1313/. It will automatically watch for file changes and publish them to your local server.

Tear down dev server
    
    bash ldo down
    
If you make changes in CSS, JS oder some assets, the filewatcher might not work. You can rebuild the application manually bs using

    bash ldo build

you can extend watch and build with more arguments, for example build with drafts:

    bash ldo build -D
[CLI Docs](https://gohugo.io/commands/hugo/)

Update dependencies (Template) with

    bash ldo update