require 'spec_helper'

describe UGCLeague::Request do

    it { should respond_to :get }

    before do
        @request = UGCLeague::Request.new
    end

    describe "#parse" do
        it "should return JSON" do
            body = "{\"exists\": true}"
            expect(UGCLeague::Request.parse(body)).to be_a Hash
            expect { UGCLeague::Request.parse("Not JSON") }.to raise_error(UGCLeague::Error::Parsing)
        end
    end

end
