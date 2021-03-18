{-# LANGUAGE OverloadedStrings #-}

module LuhnScotty where

import Luhn
import Control.Monad.IO.Class (MonadIO(liftIO))
import Data.Foldable (for_)
import Data.IORef (modifyIORef, newIORef, readIORef)
import Data.Map (Map)
import qualified Data.Map as M
import Text.Blaze.Html.Renderer.Text (renderHtml)
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A
import Web.Scotty

luhnScotty :: IO ()
luhnScotty = do
  creditCardNumbersR <- newIORef (1 :: Int, mempty :: Map String String)
  scotty 3000 $ do
    get "/" $ do
      (_, creditCardNumbers) <- liftIO $ readIORef creditCardNumbersR
      html $ renderHtml $
        H.html $ do
          H.head $ do
            H.title "Scotty - Luhn"
            H.link H.! A.rel "stylesheet" H.! A.href "https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          H.body $ do
            H.div H.! A.class_ "jumbotron text-center" $ do
              H.h1 "Interlude: Scotty (week 6)"
              H.p "Web application using Scotty that uses the solution to the Luhn exercise"
            H.br
            H.div H.! A.class_ "container" $
              H.div H.! A.class_ "row" $ do
                H.div H.! A.class_ "col-sm-4" $ ""
                H.div H.! A.class_ "col-sm-4" $
                  H.form H.! A.method "post" H.! A.action "/" $ do
                    H.div H.! A.class_ "form-group" $ do
                      H.label H.! A.for "creditcardNumber" $ "Credit card number:"
                      H.input H.! A.type_ "text" H.! A.class_ "form-control" H.! A.id "creditCardNumber" H.! A.name "creditCardNumber"
                    H.input H.! A.type_ "submit" H.! A.class_ "btn btn-primary" H.! A.value "Validate credit card!"
                H.div H.! A.class_ "col-sm-4" $ ""
            H.br
            H.div H.! A.class_ "container" $
              H.div H.! A.class_ "row" $ do
                H.div H.! A.class_ "col-sm-3" $ ""
                H.div H.! A.class_ "col-sm-6" $
                  H.table H.! A.class_ "table" $ do
                    H.thead H.! A.class_ "thead-primary" $
                      H.tr $ do
                        H.th "Credit card number"
                        H.th "Valid"
                    H.tbody $
                      for_ (M.toList creditCardNumbers) $ \(creditCardNumber, resultEvaluation) ->
                      H.tr H.! A.class_ (if (read resultEvaluation :: Bool) then "success" else "danger") $ do
                        H.td (H.string creditCardNumber)
                        H.td (H.string resultEvaluation)
                H.div H.! A.class_ "col-sm-3" $ ""
    post "/" $ do
      creditCardNumber <- param "creditCardNumber"
      liftIO $ modifyIORef creditCardNumbersR $
        \(i, creditCardNumbers) ->
          (i + 1, M.insert creditCardNumber (show $ validate (read creditCardNumber :: Integer)) creditCardNumbers)
      redirect "/"