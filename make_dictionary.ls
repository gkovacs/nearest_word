require! {
  fs
}

dict_text = fs.readFileSync 'cmudict-en-us.dict.txt', 'utf-8'
word_to_pronunciations = {}
for line in dict_text.split('\n')
  line = line.trim()
  if line.indexOf(';;;') == 0
    continue
  space_idx = line.indexOf(' ')
  if space_idx == -1
    continue
  word = line.substring(0, space_idx)
  word = word.toLowerCase()
  word = word.split('(1)').join('').split('(2)').join('').split('(3)').join('').split('(4)').join('')
  pronunciation = line.substring(space_idx + 1).trim()
  if not word_to_pronunciations[word]? or typeof(word_to_pronunciations[word]) != typeof([])
    word_to_pronunciations[word] = []
  word_to_pronunciations[word].push pronunciation

fs.writeFileSync 'word_to_pronunciations.json', JSON.stringify(word_to_pronunciations)
