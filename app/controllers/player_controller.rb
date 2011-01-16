class PlayerController < ApplicationController

  require 'rubygems'
  require 'librmpd'

  def pp
    mpd = MPD.new CONFIG['mpd_server'], CONFIG['mpd_port']
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
    mpd = MPD.new CONFIG['mpd_server'], CONFIG['mpd_port']
    mpd.connect
    mpd.next
    mpd.disconnect
    
    redirect_to :back
  end


  def backward
    mpd = MPD.new CONFIG['mpd_server'], CONFIG['mpd_port']
    mpd.connect
    mpd.previous
    mpd.disconnect
    
    redirect_to :back
  end

  def add
    mpd = MPD.new CONFIG['mpd_server'], CONFIG['mpd_port']
    mpd.connect
    @songs = mpd.find(params[:type], params[:what])
    @songs.each do |song|
      mpd.add(song['file'])
    end
    mpd.disconnect

    redirect_to :back
  end

  def clear
    mpd = MPD.new CONFIG['mpd_server'], CONFIG['mpd_port']
    mpd.connect
    mpd.clear
    mpd.disconnect

    redirect_to :back
  end

  def play
    mpd = MPD.new CONFIG['mpd_server'], CONFIG['mpd_port']
    mpd.connect
    mpd.play(params[:pos])
    mpd.disconnect
    
    redirect_to :back
  end


end
