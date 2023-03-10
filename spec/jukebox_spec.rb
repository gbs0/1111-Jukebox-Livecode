require_relative '../lib/jukebox'
require 'sqlite3'

DATABASE_PATH = File.join(File.dirname(__FILE__), '../db/jukebox.sqlite')

describe 'Jukebox' do
  let(:db) { SQLite3::Database.new(DATABASE_PATH) }
  
  describe "#all_artists_names" do
    it 'it return a list' do
      expect(Jukebox.all_artists_names(db)).to be_a Array
    end

    it 'it returns the correct number for all names' do
      expect(Jukebox.all_artists_names(db).size).to eq 275
    end
  end

  describe "#first_ten_albums" do
    it 'should return a list' do
      expect(Jukebox.first_ten_albums(db).class).to eq Array
    end

    it 'should return the correct albums orders' do
      expect(Jukebox.first_ten_albums(db).first).to eq "...And Justice For All"
      expect(Jukebox.first_ten_albums(db).last).to eq "Ace Of Spades"
    end
  end

  describe "#count_short_tracks" do
    it 'should return an Integer' do
      expect(Jukebox.count_short_tracks(db).class).to eq Integer
    end

    it 'should count all short tracks(less than 2 minutes)' do
      expect(Jukebox.count_short_tracks(db)).to eq 93
    end
  end
end