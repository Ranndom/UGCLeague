class UGC::Client
    module Players

        def player_history(steamid)
            get({:player => steamid})
        end

        def player_current(steamid)
            get({:active => steamid})
        end

    end
end
