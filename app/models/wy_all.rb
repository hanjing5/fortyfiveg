class WyAll < ActiveRecord::Base
  # attr_accessible :title, :body
    establish_connection(:politify)
    set_table_name 'wy_all'
    #set_primary_key :id

  # Sphinx indecies
  define_index do
    #has fname, :type => :string, :as => :column
    #has lname, :type => :string, :as => :column
    indexes fname
    indexes lname

  end
end
