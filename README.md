# scripts
Some of my favorite and most-used scripts. They could be made into seperate packages but eh.

## `genimg.sh`

This is a fun one. It generates images with your specific dimension provided via arguments, puts the image `heightXwidth` on the image itself and renames the filename to `heightXwidth.png` for easier access. Handy if you need to generate images with specific width and height in a pinch.

## `clipboard-upload-to-imgur.sh`

It does two things:

1. You copy a image in Finder, run it and it uploads the image, copies link to clipboard
2. You have a image in clipboard (Eg. ⇧+⌃+⌘ +4, or copy an image from the web), run the script and it gets uploaded to Imgur, link gets copied to Clipboard

**Dependency:** `pngpaste`, `imagemagick`. Install via `brew`.

## `imgur-upload-latest-screenshot.sh`

A very simple script to upload the latest screenshot you have to Imgur and copy the uploaded image link to clipboard.

Instruction: Grab the `last2imgur.sh` from the repo and put it in your Raycast Scripts folder. That should be all.

## `screenshot-and-imgur.sh`

Launches the native screenshot interface selection, when done, uploads the image to Imgur, copies link to clipboard.

Notes: When you run it for the first time, Raycast will ask for screensharing permission, after giving the permission, it'll start working from the second time and onwards.
