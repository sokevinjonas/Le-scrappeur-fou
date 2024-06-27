require 'nokogiri' # Bibliothèque pour parser le HTML
require 'httparty' # Bibliothèque pour effectuer des requêtes HTTP

class Scraper
  # Initialise une nouvelle instance de Scraper avec une URL
  def initialize(url)
    @url = url
  end

  # Méthode pour récupérer le contenu HTML de la page
  def fetch_data
    response = HTTParty.get(@url) # Effectue une requête GET à l'URL spécifiée
    if response.code == 200 # Vérifie si la requête a réussi (code 200)
      Nokogiri::HTML(response.body) # Parse le corps de la réponse en HTML
    else
      puts "Failed to retrieve data" # Affiche un message d'erreur si la requête a échoué
      nil # Retourne nil en cas d'échec
    end
  end

  # Méthode pour extraire les données des crypto-monnaies
  def scrape_cryptos
    data = fetch_data # Récupère le contenu HTML de la page
    return unless data # Quitte la méthode si la récupération des données a échoué

    cryptos = [] # Initialise un tableau vide pour stocker les données des crypto-monnaies
    data.xpath('//table/tbody/tr').each do |row| # Parcourt chaque ligne du tableau HTML
      symbol = row.xpath('td[3]/div').text.strip.split.first # Récupère le symbole de la crypto-monnaie
      price = row.xpath('td[5]//a').text.strip.delete('$,').to_f # Récupère le prix de la crypto-monnaie et le convertit en float
      cryptos << { symbol => price } # Ajoute un hash contenant le symbole et le prix au tableau
    end

    cryptos # Retourne le tableau de hashes
  end
end

# Si ce fichier est exécuté directement, crée une instance de Scraper et affiche les données des crypto-monnaies
if __FILE__ == $0
  scraper = Scraper.new('https://coinmarketcap.com/') # Crée une nouvelle instance de Scraper avec l'URL de CoinMarketCap
  cryptos = scraper.scrape_cryptos # Récupère les données des crypto-monnaies
  puts cryptos # Affiche les données des crypto-monnaies
end
