class MP3Importer

    attr_accessor :path

    def initialize(test_music_path)
        @path = test_music_path
    end

    def files
        puts "in files, path=#{@path}"
#        puts "wd=#{Dir.getwd.sub(/.*ruby(.*)/, '\1')}"
        filenames = Dir.chdir(@path) do | path |
#            puts path
            Dir.glob("*.mp3")
        end
        puts "names=#{filenames}"
        filenames
    end

    def import
        files.each{|file| Song.new_by_filename(file)}
    end
end