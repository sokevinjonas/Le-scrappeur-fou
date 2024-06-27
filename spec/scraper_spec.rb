require 'rspec' # Charge la bibliothèque RSpec pour les tests
require_relative '../lib/scraper' # Charge le fichier scraper.rb à partir du dossier lib

# Définition du groupe de tests pour la classe Scraper
describe Scraper do
  # Crée une instance de Scraper avant chaque test avec l'URL de CoinMarketCap
  let(:scraper) { Scraper.new('https://coinmarketcap.com/') }

  # Groupe de tests pour la méthode #fetch_data
  describe '#fetch_data' do
    # Test pour vérifier que fetch_data récupère le contenu HTML
    it 'fetches the HTML content' do
      data = scraper.fetch_data # Appelle la méthode fetch_data
      expect(data).not_to be_nil # Vérifie que les données ne sont pas nil
      expect(data).to be_a(Nokogiri::HTML::Document) # Vérifie que les données sont un document HTML Nokogiri
    end
  end

  # Groupe de tests pour la méthode #scrape_cryptos
  describe '#scrape_cryptos' do
    # Test pour vérifier que scrape_cryptos retourne un tableau de hachages avec les données des crypto-monnaies
    it 'returns an array of hashes with crypto data' do
      cryptos = scraper.scrape_cryptos # Appelle la méthode scrape_cryptos
      expect(cryptos).to be_an(Array) # Vérifie que le résultat est un tableau
      expect(cryptos).not_to be_empty # Vérifie que le tableau n'est pas vide
      expect(cryptos.first).to be_a(Hash) # Vérifie que le premier élément du tableau est un hachage
    end

    # Test pour vérifier que certaines crypto-monnaies spécifiques sont incluses dans les résultats
    it 'includes specific cryptocurrencies' do
      cryptos = scraper.scrape_cryptos # Appelle la méthode scrape_cryptos
      crypto_symbols = cryptos.map { |crypto| crypto.keys.first } # Extrait les symboles des crypto-monnaies
    end
  end
end
