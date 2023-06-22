The problem is simple, I have a huge curated music collection with this folder structure:

```
Artist/
      [Year] - Album Name/
                          Songs...
                          Cover1000x1000.jpg
```

...and so on.

I wanted to iterrate through all my Albums folder, grab the cover art, rename it by scraping the Album folder name and its parent folder (Artist). So that the album art filename looks like this:

```
Artist - Year - Album.jpg
```

And copies them to a different directory. 

## Usage
Basically it's made to fit only my usecase, but if you somehow have the same folder structure as my collection, you can use it. 
* Change the source folder directory in line 4, to where your music is
* Change the destination folder directory in line 6, preferrably to an empty folder, where you'll store all the album art

## Why
The music collection has been with me for more than 10 years, and I wanted to vizualize it, for doing that, I needed access to all the albums I have, scraping them from my local collection seemed like the best solution at that time.
I dont know how it'll help you but feel free to use it if need be.
