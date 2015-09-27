module UGCLeague
    module Error

        class Error < StandardError; end
        class Parsing < Error; end
        class Unauthorized < Error; end

    end
end
