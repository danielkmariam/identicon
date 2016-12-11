# Identicon

**TODO: **
- Take a text and change it to hex
- Change hex to a list
- Create a struct to hold image data and pass it to different functions
- Take the first three elements of the list as the colour for the image, RGB
- build grid with each cell {value, index}



## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `identicon` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:identicon, "~> 0.1.0"}]
    end
    ```

  2. Ensure `identicon` is started before your application:

    ```elixir
    def application do
      [applications: [:identicon]]
    end
    ```
