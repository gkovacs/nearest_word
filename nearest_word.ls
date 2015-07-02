require! {
  fs
}

word_to_pronunciation = fs.readFileSync 'word_to_pronunciations.json', 'utf-8' |> JSON.parse

target_word = 'snake'
target_pronunciation = word_to_pronunciation[target_word][0]
console.log target_pronunciation