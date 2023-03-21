# TODO: sync music, check playlist item, maybe can use js, youtube api for that? if private publish don't need use api for 
function sync_music --description 'sync music playlist on Youtube'
    set --local current_dir (pwd)
    set --local music_dir $HOME/Music/

    cd $music_dir
    trash *

    mkdir joji
    cd joji
    download_audio "https://l.thuanowa.com/music-joji"

    cd $music_dir
    mkdir billie_eilish
    cd billie_eilish
    download_audio "https://l.thuanowa.com/music-billie-eilish"

    cd $music_dir
    mkdir b_ray
    cd b_ray
    download_audio "https://l.thuanowa.com/music-b-ray"

    cd $music_dir
    mkdir den_vau
    cd den_vau
    download_audio "https://l.thuanowa.com/music-den-vau"

    cd $music_dir
    mkdir two_feet
    cd two_feet
    download_audio "https://l.thuanowa.com/music-two-feet"

    cd $music_dir
    mkdir English
    cd English
    download_audio "https://l.thuanowa.com/music-en"

    cd $music_dir
    mkdir Vietnamese
    cd Vietnamese
    download_audio "https://l.thuanowa.com/music-vi"

    cd $music_dir
    mkdir Korean
    cd Korean
    download_audio "https://l.thuanowa.com/music-ko"

    cd $music_dir
    mkdir Japanese
    cd Japanese
    download_audio "https://l.thuanowa.com/music-ja"

    cd $music_dir
    mkdir chill_hop
    cd chill_hop
    download_audio "https://l.thuanowa.com/music-chill-hop"

    cd $current_dir
end
