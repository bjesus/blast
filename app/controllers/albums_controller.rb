class AlbumsController < ApplicationController

  def index
    require 'rubygems'
    require 'librmpd'

    mpd = MPD.new 'localhost', 6601
    mpd.connect
    @current = mpd.current_song
    @status = mpd.status
    @albums = mpd.albums
    @playlist = mpd.playlist
    @next = mpd.song_at_pos(@status['nextsong'])
    mpd.disconnect
  end

end
