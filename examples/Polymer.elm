import Html exposing (div, button, text, node, h1, render, insert, widget)
import Html.Attributes exposing (attribute, property, class)
import Html.Events exposing (onClick)
import StartApp


main =
  StartApp.start { model = 0, view = view, update = update }

view model =
  div []
        [ h1 [] [ text "Polymer Counter" ]
        , button address model "Decrement" Decrement
        , div [] [ text (toString n) ]
        , button address model "Increment" Increment
    ]

-- Create a polymer button that allows updating the model
button address model title action =
  let
    modtitle title = String.concat [title, " to ", toString (update action model)]
    renderHtml title =
      insert "paper-material"
        (text (modtitle title))
        (node "paper-button" [attribute "raised" "", class "compose", onClick address action] [])
    changed t t' = t /= t'
  in widget renderHtml changed title

type Action = Increment | Decrement

update action n =
  case action of
    Increment -> n+1
    Decrement -> n-1
