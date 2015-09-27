require 'spec_helper'

describe UGCLeague do
    after { UGCLeague.reset }

    describe "#client" do
        
        it "should be a UGCLeague::Client" do
            expect(UGCLeague.client).to be_a UGCLeague::Client
        end

        it "should not override other clients" do
            client_1 = UGCLeague.client(api_key: '001', user_agent: 'Client 1')
            client_2 = UGCLeague.client(api_key: '002', user_agent: 'Client 2')

            expect(client_1.api_key).to eq('001')
            expect(client_2.api_key).to eq('002')
            
            expect(client_1.user_agent).to eq('Client 1')
            expect(client_2.user_agent).to eq('Client 2')
        end

    end

    describe "#api_key=" do
        it "should set the api key" do
            UGCLeague.api_key = '123'
            expect(UGCLeague.api_key).to eq('123')
        end
    end

    describe "#user_agent=" do
        it "should set the user agent" do
            UGCLeague.user_agent = 'Test'
            expect(UGCLeague.user_agent).to eq('Test')
        end
    end

    describe "#user_agent" do
        it "should return the default user agent" do
            expect(UGCLeague.user_agent).to eq(UGCLeague::Configuration::DEFAULT_USER_AGENT)
        end
    end

    describe "#debug=" do
        it "should set the debug option" do
            UGCLeague.debug = true
            expect(UGCLeague.debug).to eq(true)
        end
    end

    describe "#configure" do
        UGCLeague::Configuration::VALID_OPTIONS_KEYS.each do |key|
            it "should set #{key}" do
                UGCLeague.configure do |config|
                    config.send("#{key}=", key)
                    expect(UGCLeague.send(key)).to eq(key)
                end
            end
        end
    end

end
