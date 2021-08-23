var base_song_url = document.querySelector('link[rel="canonical"]').getAttribute('href').replace('stations/track/','');
var ytdl_client_id = '2t9loNQH90kzJcsFCODdigxfp325aq4z';
var youtube_dl_cmd = ['youtube-dl'];
// Import jQuery because lazy
var script = document.createElement('script');
script.src = 'https://code.jquery.com/jquery-latest.min.js';
script.type = 'text/javascript';
document.getElementsByTagName('head')[0].appendChild(script);
$.noConflict();
// Get 48-song JSON and process it into console (AJAX triggered function)
function get_station(song_id){
    var api_url = 'https://api-v2.soundcloud.com/stations/soundcloud:track-stations:' + song_id + '/tracks?client_id=' + ytdl_client_id + '&offset=0&linked_partitioning=1&app_version=1500563729';
	jQuery.getJSON(api_url, function(data){
		for (var key in data.collection) {
			var obj = data.collection[key];
			youtube_dl_cmd.push( obj.permalink_url );
        }
		// Print 48-song display page URLs appended to youtube-dl command
		console.log( youtube_dl_cmd.join(' ') );
	});
}
// Resolve song URL to song ID (main trigger)
jQuery.getJSON('https://api.soundcloud.com/resolve.json?url=' + base_song_url + '&client_id=' + ytdl_client_id, function(data){
	get_station(data['id']);
});
