# Dark Trader

Dark Trader est un programme Ruby qui récupère les cours des crypto-monnaies depuis le site CoinMarketCap et les enregistre dans un tableau de hachages. Chaque hachage contient le symbole de la crypto-monnaie et son prix actuel.

## Structure du projet

    dark_trader/
    ├── Gemfile
    ├── Gemfile.lock
    ├── README.md
    ├── lib/
    │ └── scraper.rb
    └── spec/
    ├── scraper_spec.rb
    └── spec_helper.rb


## Prérequis

Avant de commencer, assurez-vous d'avoir les éléments suivants installés sur votre machine :

- Ruby
- Bundler

## Installation

1. Clonez le dépôt sur votre machine locale :

    ```bash
    git clone <URL-du-dépôt>
    cd dark_trader
    ```

2. Installez les dépendances :

    ```bash
    bundle install
    ```

## Utilisation
    Pour exécuter le scraper et afficher les cours des crypto-monnaies, utilisez la commande suivante :
    ```bash
    ruby lib/scraper.rb


## Tests
    ```bundle exec rspec
    ```
    
