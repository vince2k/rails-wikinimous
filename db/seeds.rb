def generate_article
  paragraphs = []

  # Premier paragraphe
  paragraphs << Faker::Lorem.sentence(word_count: 5)

  # Deuxième bloc avec titre HTML
  paragraphs << "<h3>#{Faker::Marketing.buzzwords.capitalize}</h3>"
  3.times { paragraphs << Faker::Lorem.sentence(word_count: 5) }

  # Troisième bloc avec sous-titre HTML
  paragraphs << "<h3>#{Faker::Marketing.buzzwords.capitalize}</h3>"
  4.times { paragraphs << Faker::Lorem.sentence(word_count: 7) }

  # Quatrième bloc avec titre HTML
  paragraphs << "<h3>#{Faker::Company.buzzword.capitalize}</h3>"
  5.times { paragraphs << Faker::Lorem.sentence(word_count: 6)}

  paragraphs.join("\n")
end

# Supprime les anciens articles pour éviter les doublons
Article.destroy_all

10.times do
  Article.create(
    title: Faker::Marketing.buzzwords.capitalize,
    content: generate_article
  )
end
