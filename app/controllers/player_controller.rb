class PlayerController < ApplicationController

  require 'rubygems'
  require 'librmpd'


  def pp
    mpd = MPD.new 'localhost', 6601
    mpd.connect
    if mpd.paused?
      mpd.pause=false
    else
      mpd.pause=true
    end
    mpd.disconnect
    
    redirect_to :back
  end

  def forward
    mpd = MPD.new 'localhost', 6601
    mpd.connect
    mpd.next
    mpd.disconnect
    
    redirect_to :back
  end


  def backward
    mpd = MPD.new 'localhost', 6601
    mpd.connect
    mpd.previous
    mpd.disconnect
    
    redirect_to :back
  end

  def add
    mpd = MPD.new 'localhost', 6601
    mpd.connect
    @songs = mpd.find(params[:type], params[:what])
    @songs.each do |song|
      mpd.add(song['file'])
    end
    mpd.disconnect

    redirect_to :back
  end

  def play
    mpd = MPD.new 'localhost', 6601
    mpd.connect
    mpd.play(params[:pos])
    mpd.disconnect
    
    redirect_to :back
  end


end
