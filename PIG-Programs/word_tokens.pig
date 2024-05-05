-- text_data = LOAD './Data/student_text.txt' 
-- USING PigStorage(',')
-- AS (id:int, name:chararray, age:int, city:chararray);

-- student_name_token = FOREACH text_data GENERATE TOKENIZE(name);

-- Dump student_name_token;

textual_data = LOAD './Data/text_data.txt' 
USING PigStorage('.')
AS (text_col:chararray);

word_tokens = FOREACH textual_data GENERATE FLATTEN (TOKENIZE (text_col)) AS word;
grouped_words = GROUP word_tokens BY word;
-- DESCRIBE grouped_words; -- {group: chararray,word_tokens: {(word: chararray)}}
-- Dump grouped_words;

word_count = FOREACH grouped_words GENERATE group AS word, COUNT(word_tokens) AS count;
Dump word_count;

-- grpd_word_count = FOREACH grouped_words GENERATE COUNT(word_grp);
-- Dump grouped_words;

-- word_count = FOREACH (GROUP word_tokens ALL AS word) GENERATE word, COUNT(word);
-- Dump word_count;

-- total_words_count = FOREACH (GROUP word_tokens ALL) GENERATE COUNT(word_tokens);

-- Dump total_words_count; -- 77
-- DESCRIBE word_tokens;

-- word_count = GROUP(word_tokens) BY word;

-- word_count_results = FOREACH word_count 
-- GENERATE word AS wrd, COUNT(wrd) AS wrd_cnt;
