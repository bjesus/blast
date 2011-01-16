module ApplicationHelper

  def cover(song)
    p config.encoding
    path = song.file.split("/")
    path.delete_at(-1)
    path = path.join("/")
    base = CONFIG['music_root']
    p base+path
    if File.exists? base+path+"/folder.jpg"
      return path+"/folder.jpg"
    elsif File.exists? base+path+"/cover.jpg"
      return path+"/cover.jpg"
    elsif File.exists? base+path+"/Cover.jpg"
      return path+"/Cover.jpg"
    elsif File.exists? base+path+"/Folder.jpg"
      return path+"/Folder.jpg"
    else
      return false
    end
  end

end
