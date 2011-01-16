class AlbumsController < ApplicationController
  require 'rubygems'
  require 'librmpd'

  def index
    mpd = MPD.new CONFIG['mpd_server'], CONFIG['mpd_port']
    mpd.connect
    @current = mpd.current_song
    @status = mpd.status
    @albums = mpd.albums
    @playlist = mpd.playlist
    @next = mpd.song_at_pos(@status['nextsong'])
    mpd.disconnect
  end

end
