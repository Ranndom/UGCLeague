require 'spec_helper'

describe UGCLeague::Client do

    describe "#player_has_profile" do
        before do
            stub_get("/api/api.php?exists=123", "player_exists")
            @player = UGCLeague.player_has_profile(123)
        end

        it "should return the correct resource" do
            expect(a_get("/api/api.php?exists=123")).to have_been_made
        end

        it "should return a hash" do
            expect(@player).to be_a Hash
        end
    end

    describe "#player_history" do
        before do
            stub_get("/api/api.php?player=123", "player")
            @player = UGCLeague.player_history(123)
        end

        it "should return the correct resource" do
            expect(a_get("/api/api.php?player=123")).to have_been_made
        end

        it "should return a hash" do
            expect(@player).to be_a Hash
        end
    end

    describe "#player_current" do
        before do
            stub_get("/api/api.php?active=123", "player_active")
            @player = UGCLeague.player_current(123)
        end

        it "should return the correct resource" do
            expect(a_get("/api/api.php?active=123")).to have_been_made
        end
    end

end
