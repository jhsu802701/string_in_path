require 'string_in_path/version'

module StringInPath
  def self.present (str_to_find, path)
    require 'find'
    require 'string_in_file'
    Find.find(path) do |file|
      if StringInFile.present(str_to_find,file) == true
        return true
      end
    end
    return false
  end
end
