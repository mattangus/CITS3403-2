class Files < ActiveRecord::Base
  mount_uploader :userFiles, UserFilesUploader

end
