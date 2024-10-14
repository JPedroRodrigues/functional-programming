--------------------------------------------------------------------------------
-- Paradigmas de Linguagem de Programação
-- Prof: Antonio Luiz Basile
-- Nome: João Pedro Rodrigues Vieira
-- RA: 10403595
-- Turma: 05G
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--                           Huffman Algorithm
--------------------------------------------------------------------------------

-- Huffman Tree Algorithm
-- 1: Create Leaves containing each a character and its frequency in text
-- 2: Place those leaves inside a priority queue
-- 3: Order the queue and take the two least frequent characters (two first)
-- 4: Create a Node containing the sum of the two selected carachters'
-- frequencies
-- 5: Add the recently created node to the queue
-- 6: Repeat the process starting from step 3 until there's only one element 
-- in the queue

-- Encoding
-- 1: Traverse the Huffman Tree, appending "0" when you go towards the left
-- node and "1" otherwise
-- 2: Reaching a Leaf, return a tuple with the char and its resulting encoding
-- 3: Take the original text and, for each character, find its corresponding
-- encoding and append it in a single string

--------------------------------------------------------------------------------
--                                 Main
--------------------------------------------------------------------------------

import System.IO ()
import Control.Monad ()

main :: IO()
main = do
    contents <- readFile "in.txt"

    let priorityQueue = charFrequency contents
    let orderedQueue = mergeSort priorityQueue 

    let huffmanTree = createHuffTree orderedQueue

    let encoding = encodeHuffTree huffmanTree
    let encodedText = generateEncodedText contents encoding

    writeFile "out.txt" encodedText


--------------------------------------------------------------------------------
--                          Auxiliary Functions
--------------------------------------------------------------------------------

-- Algebric data type: HuffmanTree
--------------------------------------------------------------------------------

data HuffmanTree = Leaf Char Integer | Node Integer HuffmanTree HuffmanTree
    deriving (Eq, Show)


-- Functions to create a priority Queue
--------------------------------------------------------------------------------

charFrequency :: [Char] -> [HuffmanTree]
charFrequency [] = []
charFrequency contents = getFrequency contents []

getFrequency :: [Char] -> [HuffmanTree] -> [HuffmanTree]
getFrequency [] freqLst = freqLst
getFrequency (a : xs) freqList = getFrequency xs (checkFreq a freqList)

checkFreq :: Char -> [HuffmanTree] -> [HuffmanTree]
checkFreq a [] = [Leaf a 1]
checkFreq a (Leaf letter freq : xs)
    | a /= letter = Leaf letter freq : checkFreq a xs
    | otherwise = Leaf letter (freq + 1) : xs


-- Function to create a Huffman Tree
--------------------------------------------------------------------------------

createHuffTree :: [HuffmanTree] -> HuffmanTree
createHuffTree [] = Leaf ' ' 0
createHuffTree [a] = a
createHuffTree (a : b : xs) = createHuffTree (mergeSort (xs ++ [Node (freq a + freq b) a b]))


-- Function to get the encoding based on the Huffman Tree
--------------------------------------------------------------------------------

-- Example of an expected return = [('a', "0000"), ('b', "00001"), ...]
encodeHuffTree :: HuffmanTree -> [(Char, String)]
encodeHuffTree tree = createEncoding tree ""

createEncoding :: HuffmanTree -> String -> [(Char, String)]
createEncoding (Leaf letter freq) encoding = [(letter, encoding)]
createEncoding (Node _ left right) encoding = createEncoding left (encoding ++ "0") ++ createEncoding right (encoding ++ "1")


-- Function generate an encoded text
--------------------------------------------------------------------------------

generateEncodedText :: String -> [(Char, String)] -> String
generateEncodedText [] _ = "" 
generateEncodedText (character : xs) encoding = getEncoding character encoding ++ generateEncodedText xs encoding

getEncoding :: Char -> [(Char, String)] -> String
getEncoding _ [] = ""
getEncoding character ((encodedChar, encoding) : xs)
    | character == encodedChar = encoding
    | otherwise = getEncoding character xs


-- Merge Sort Algorithm
--------------------------------------------------------------------------------

-- Get the frequency from a node/leaf
freq :: HuffmanTree -> Integer
freq (Leaf _ freqA) = freqA
freq (Node freqB _ _) = freqB

-- Merge two lists in order
merge :: [HuffmanTree] -> [HuffmanTree] -> [HuffmanTree]
merge list1 [] = list1
merge [] list2 = list2
merge (a : xs) (b : ys) 
    | freq a <= freq b = a : merge xs (b : ys) 
    | otherwise = b : merge (a : xs) ys

-- Split a list in two and return a tuple with both
split :: [a] -> ([a], [a])
split [] = ([], [])
split [a] = ([a], [])
split lst = splitList lst [] []

splitList :: [a] -> [a] -> [a] -> ([a], [a])
splitList [] auxList1 auxList2 = (auxList1, auxList2)
splitList [a] auxList1 auxList2 = (auxList1 ++ [a], auxList2)
splitList (a : b : xs) auxList1 auxList2 = splitList xs (auxList1 ++ [a]) (auxList2 ++ [b])

-- Merge Sort
mergeSort :: [HuffmanTree] -> [HuffmanTree]
mergeSort [] = []
mergeSort [a] = [a]
mergeSort lst = merge (mergeSort lst1) (mergeSort lst2)
    where (lst1, lst2) = split lst 