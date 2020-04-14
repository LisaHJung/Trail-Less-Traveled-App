# We want to store user data in our database.
    # if we want user data that persists, we need to keep that in our database
     # otherwise, as soon as that app ends, info is gone. 
        # anything that you want to keep in database, needs to inherit from active record, to use its methods. 
    # should hook it up to active record and not have the methods seen here
     # user table in database with column name

class User
    attr_reader :name

    def initialize (name)
        @name = name
    end
end 