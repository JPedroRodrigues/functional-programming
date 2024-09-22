seg :: String -> String
seg [] = ""
seg [_] = "" 
seg  (_:y:_) = [y]