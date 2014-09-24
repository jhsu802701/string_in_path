require 'string_in_path/version'

module StringInPath
  def self.present (str_to_find, path)
    require 'string_in_file'
    require 'find'
    Find.find(path) do |filename|
      next if filename == ".DS_Store"
      if StringInFile.present(str_to_find,filename) == true
        return true
      end
    end
    return false
  end
  
  def self.replace (str1, str2, path)
    require 'string_in_file'
    require 'find'
    Find.find(path) do |filename|
      file_type = `file -b #{filename}`
      if file_type.include?("directory") == false && filename.include?(".DS_Store") == false
        StringInFile.replace(str1, str2, filename)
        system("rm #{filename}-e")
      end
    end
  end
end
