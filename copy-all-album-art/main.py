import os
import shutil

source_directory = '/mnt/d/Media/Music/Audio/'

destination_directory = '/mnt/d/Media/Art/'

# Iterate through each artist folder
for artist_folder in os.listdir(source_directory):
    artist_path = os.path.join(source_directory, artist_folder)
    if not os.path.isdir(artist_path):
        continue

    # Iterate through each album folder within the artist folder
    for album_folder in os.listdir(artist_path):
        album_path = os.path.join(artist_path, album_folder)
        if not os.path.isdir(album_path):
            continue

        # Look for album art photo files within the album folder
        for file in os.listdir(album_path):
            file_path = os.path.join(album_path, file)
            if file.lower().endswith(('.jpg', '.jpeg', '.png', '.bmp')):

                # Extract artist name, year, and album name from the folder structure
                artist_name = artist_folder
                year = album_folder.split()[0].strip('[]')
                album_name = album_folder.split()[1:]

                # Create the new filename
                new_filename = f"{artist_name} - {year} {' '.join(album_name)}{os.path.splitext(file)[1]}"

                # copy operation
                destination_path = os.path.join(destination_directory, new_filename)
                shutil.copyfile(file_path, destination_path)

